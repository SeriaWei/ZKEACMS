/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses 
 * https://github.com/aspnet/Mvc/blob/dev/src/Microsoft.AspNetCore.Mvc.Core/ModelBinding/Binders/ComplexTypeModelBinder.cs
 */
using Easy;
using Easy.MetaData;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using ZKEACMS.Widget;

namespace ZKEACMS.ModelBinder
{
    public class WidgetTypeModelBinder : IModelBinder
    {
        private IDictionary<Type, Func<object>> _modelCreator;
        private readonly ModelBinderProviderContext _modelBinderProviderContext;
        public WidgetTypeModelBinder(ModelBinderProviderContext modelBinderProviderContext)
        {
            _modelBinderProviderContext = modelBinderProviderContext;
            _modelCreator = new Dictionary<Type, Func<object>>();
        }

        public Task BindModelAsync(ModelBindingContext bindingContext)
        {

            var assembly = bindingContext.ValueProvider.GetValue("AssemblyName");
            var viewModelType = bindingContext.ValueProvider.GetValue("ViewModelTypeName");
            var widgetViewModelType = WidgetBase.KnownWidgetModel[$"{assembly.FirstValue},{viewModelType.FirstValue}"];

            var viewConfig = ServiceLocator.GetViewConfigure(widgetViewModelType);
            var modelMetadataProvider = bindingContext.HttpContext.RequestServices.GetService<IModelMetadataProvider>();
            bindingContext.ModelMetadata = modelMetadataProvider.GetMetadataForType(widgetViewModelType);

            if (!CanCreateModel(bindingContext))
            {
                return Task.CompletedTask;
            }

            return BindModelCoreAsync(bindingContext, viewConfig);
        }

        private async Task BindModelCoreAsync(ModelBindingContext bindingContext, ViewConfigure viewConfigure)
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
                    await _modelBinderProviderContext.CreateBinder(property).BindModelAsync(bindingContext);
                    result = bindingContext.Result;
                }

                if (result.IsModelSet)
                {
                    SetProperty(bindingContext, modelName, property, result, viewConfigure);
                }
                else
                {
                    var descriptor = viewConfigure.GetViewPortDescriptor(modelName);
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

                    else if (property.IsBindingRequired)
                    {
                        var message = property.ModelBindingMessageProvider.MissingBindRequiredValueAccessor(fieldName);
                        bindingContext.ModelState.TryAddModelError(modelName, message);
                    }
                }
            }
            if (bindingContext.ModelState.ErrorCount == 0)
            {
                foreach (var item in bindingContext.ModelState.Keys)
                {
                    bindingContext.ModelState.MarkFieldValid(item);
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

        protected virtual void SetProperty(ModelBindingContext bindingContext, string modelName, ModelMetadata propertyMetadata, ModelBindingResult result, ViewConfigure viewConfigure)
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

                var descriptor = viewConfigure.GetViewPortDescriptor(modelName);
                if (descriptor != null)
                {
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
