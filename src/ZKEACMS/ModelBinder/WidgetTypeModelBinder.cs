/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses 
 * https://github.com/aspnet/Mvc/blob/dev/src/Microsoft.AspNetCore.Mvc.Core/ModelBinding/Binders/ComplexTypeModelBinder.cs
 */
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using Easy.MetaData;
using Microsoft.AspNetCore.Mvc.Core;
using Microsoft.AspNetCore.Mvc.Internal;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Metadata;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using ZKEACMS.Widget;
using Microsoft.Extensions.DependencyInjection;
using Easy;
using System.Linq;

namespace ZKEACMS.ModelBinder
{
    public class WidgetTypeModelBinder : IModelBinder
    {
        private IDictionary<ModelMetadata, IModelBinder> _propertyBinders;
        private static IDictionary<Type, Func<object>> _modelCreator;
        private ViewConfigure _viewConfig;

        private readonly ModelBinderProviderContext _modelBinderProviderContext;
        static WidgetTypeModelBinder()
        {
            _modelCreator = new Dictionary<Type, Func<object>>();
        }
        public WidgetTypeModelBinder(ModelBinderProviderContext modelBinderProviderContext)
        {
            _modelBinderProviderContext = modelBinderProviderContext;

        }

        public Task BindModelAsync(ModelBindingContext bindingContext)
        {

            var assembly = bindingContext.ValueProvider.GetValue("AssemblyName");
            var viewModelType = bindingContext.ValueProvider.GetValue("ViewModelTypeName");
            var widgetViewModelType = WidgetBase.KnownWidgetModel[$"{assembly.FirstValue},{viewModelType.FirstValue}"];

            _viewConfig = ServiceLocator.GetViewConfigure(widgetViewModelType);
            _propertyBinders = new Dictionary<ModelMetadata, IModelBinder>();
            var modelMetadataProvider = bindingContext.HttpContext.RequestServices.GetService<IModelMetadataProvider>();
            bindingContext.ModelMetadata = modelMetadataProvider.GetMetadataForType(widgetViewModelType);
            foreach (var property in modelMetadataProvider.GetMetadataForProperties(widgetViewModelType))
            {
                _propertyBinders.Add(property, _modelBinderProviderContext.CreateBinder(property));
            }

            if (!CanCreateModel(bindingContext))
            {
                return Task.CompletedTask;
            }

            return BindModelCoreAsync(bindingContext);
        }

        private async Task BindModelCoreAsync(ModelBindingContext bindingContext)
        {
            if (bindingContext.Model == null)
            {
                bindingContext.Model = CreateModel(bindingContext);
            }

            for (var i = 0; i < bindingContext.ModelMetadata.Properties.Count; i++)
            {
                var property = bindingContext.ModelMetadata.Properties[i];
                if (!CanBindProperty(bindingContext, property))
                {
                    continue;
                }

                object propertyModel = null;
                if (property.PropertyGetter != null &&
                    property.IsComplexType &&
                    !property.ModelType.IsArray)
                {
                    propertyModel = property.PropertyGetter(bindingContext.Model);
                }

                var fieldName = property.BinderModelName ?? property.PropertyName;
                var modelName = ModelNames.CreatePropertyModelName(bindingContext.ModelName, fieldName);

                ModelBindingResult result;
                using (bindingContext.EnterNestedScope(
                    modelMetadata: property,
                    fieldName: fieldName,
                    modelName: modelName,
                    model: propertyModel))
                {
                    await BindProperty(bindingContext);
                    result = bindingContext.Result;
                }

                if (result.IsModelSet)
                {
                    SetProperty(bindingContext, modelName, property, result);
                }
                else
                {
                    if (_viewConfig != null)
                    {
                        var descriptor = _viewConfig.GetViewPortDescriptor(modelName);
                        if (descriptor != null && bindingContext.ModelState.ContainsKey(modelName))
                        {
                            foreach (var valid in descriptor.Validator)
                            {
                                if (!valid.Validate(bindingContext.ModelState[modelName].RawValue))
                                {
                                    valid.DisplayName = descriptor.DisplayName;
                                    bindingContext.ModelState[modelName].Errors.Clear();
                                    bindingContext.ModelState.TryAddModelError(modelName, valid.ErrorMessage);
                                    break;
                                }
                            }
                        }
                    }
                    else if (property.IsBindingRequired)
                    {
                        var message = property.ModelBindingMessageProvider.MissingBindRequiredValueAccessor(fieldName);
                        bindingContext.ModelState.TryAddModelError(modelName, message);
                    }
                }
            }

            bindingContext.Result = ModelBindingResult.Success(bindingContext.Model);
        }

        protected virtual bool CanBindProperty(ModelBindingContext bindingContext, ModelMetadata propertyMetadata)
        {
            var metadataProviderFilter = bindingContext.ModelMetadata.PropertyFilterProvider?.PropertyFilter;
            if (metadataProviderFilter?.Invoke(propertyMetadata) == false)
            {
                return false;
            }

            if (bindingContext.PropertyFilter?.Invoke(propertyMetadata) == false)
            {
                return false;
            }

            if (!propertyMetadata.IsBindingAllowed)
            {
                return false;
            }

            if (!CanUpdatePropertyInternal(propertyMetadata))
            {
                return false;
            }

            return true;
        }

        protected virtual Task BindProperty(ModelBindingContext bindingContext)
        {
            var binder = _propertyBinders[bindingContext.ModelMetadata];
            return binder.BindModelAsync(bindingContext);
        }

        internal bool CanCreateModel(ModelBindingContext bindingContext)
        {
            var isTopLevelObject = bindingContext.IsTopLevelObject;
            var bindingSource = bindingContext.BindingSource;
            if (!isTopLevelObject && bindingSource != null && bindingSource.IsGreedy)
            {
                return false;
            }
            if (isTopLevelObject)
            {
                return true;
            }

            if (CanValueBindAnyModelProperties(bindingContext))
            {
                return true;
            }

            return false;
        }

        private bool CanValueBindAnyModelProperties(ModelBindingContext bindingContext)
        {
            if (bindingContext.ModelMetadata.Properties.Count == 0)
            {
                return false;
            }

            var hasBindableProperty = false;
            var isAnyPropertyEnabledForValueProviderBasedBinding = false;
            for (var i = 0; i < bindingContext.ModelMetadata.Properties.Count; i++)
            {
                var propertyMetadata = bindingContext.ModelMetadata.Properties[i];
                if (!CanBindProperty(bindingContext, propertyMetadata))
                {
                    continue;
                }

                hasBindableProperty = true;

                var bindingSource = propertyMetadata.BindingSource;
                if (bindingSource == null || !bindingSource.IsGreedy)
                {
                    isAnyPropertyEnabledForValueProviderBasedBinding = true;

                    var fieldName = propertyMetadata.BinderModelName ?? propertyMetadata.PropertyName;
                    var modelName = ModelNames.CreatePropertyModelName(
                        bindingContext.ModelName,
                        fieldName);

                    using (bindingContext.EnterNestedScope(
                        modelMetadata: propertyMetadata,
                        fieldName: fieldName,
                        modelName: modelName,
                        model: null))
                    {
                        if (bindingContext.ValueProvider.ContainsPrefix(bindingContext.ModelName))
                        {
                            return true;
                        }
                    }
                }
            }

            if (hasBindableProperty && !isAnyPropertyEnabledForValueProviderBasedBinding)
            {
                return true;
            }

            return false;
        }

        internal static bool CanUpdatePropertyInternal(ModelMetadata propertyMetadata)
        {
            return !propertyMetadata.IsReadOnly || CanUpdateReadOnlyProperty(propertyMetadata.ModelType);
        }

        private static bool CanUpdateReadOnlyProperty(Type propertyType)
        {
            if (propertyType.GetTypeInfo().IsValueType)
            {
                return false;
            }
            if (propertyType.IsArray)
            {
                return false;
            }

            if (propertyType == typeof(string))
            {
                return false;
            }

            return true;
        }

        protected virtual object CreateModel(ModelBindingContext bindingContext)
        {
            if (bindingContext == null)
            {
                throw new ArgumentNullException(nameof(bindingContext));
            }

            if (!_modelCreator.ContainsKey(bindingContext.ModelType))
            {
                _modelCreator.Add(bindingContext.ModelType, Expression.Lambda<Func<object>>(Expression.New(bindingContext.ModelType)).Compile());
            }

            return _modelCreator[bindingContext.ModelType]();
        }

        protected virtual void SetProperty(
            ModelBindingContext bindingContext,
            string modelName,
            ModelMetadata propertyMetadata,
            ModelBindingResult result)
        {
            if (bindingContext == null)
            {
                throw new ArgumentNullException(nameof(bindingContext));
            }

            if (modelName == null)
            {
                throw new ArgumentNullException(nameof(modelName));
            }

            if (propertyMetadata == null)
            {
                throw new ArgumentNullException(nameof(propertyMetadata));
            }

            if (!result.IsModelSet)
            {
                return;
            }

            if (propertyMetadata.IsReadOnly)
            {
                return;
            }

            var value = result.Model;
            try
            {
                propertyMetadata.PropertySetter(bindingContext.Model, value);
                if (_viewConfig != null)
                {
                    var descriptor = _viewConfig.GetViewPortDescriptor(modelName);
                    if (descriptor != null)
                    {
                        bool isAllValid = true;
                        foreach (var valid in descriptor.Validator)
                        {
                            if (!valid.Validate(value))
                            {
                                valid.DisplayName = descriptor.DisplayName;
                                if (bindingContext.ModelState.ContainsKey(modelName))
                                {
                                    bindingContext.ModelState[modelName].Errors.Clear();
                                }
                                bindingContext.ModelState.TryAddModelError(modelName, valid.ErrorMessage);
                                isAllValid = false;
                            }
                        }
                        if (isAllValid)
                        {
                            bindingContext.ModelState.MarkFieldValid(modelName);
                        }
                    }
                }
            }
            catch (Exception exception)
            {
                AddModelError(exception, modelName, bindingContext);
            }
        }

        private static void AddModelError(
            Exception exception,
            string modelName,
            ModelBindingContext bindingContext)
        {
            var targetInvocationException = exception as TargetInvocationException;
            if (targetInvocationException?.InnerException != null)
            {
                exception = targetInvocationException.InnerException;
            }

            var modelState = bindingContext.ModelState;
            var validationState = modelState.GetFieldValidationState(modelName);
            if (validationState == ModelValidationState.Unvalidated)
            {
                modelState.AddModelError(modelName, exception, bindingContext.ModelMetadata);
            }
        }
    }
}
