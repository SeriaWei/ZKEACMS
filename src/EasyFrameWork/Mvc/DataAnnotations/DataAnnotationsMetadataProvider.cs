/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Metadata;
using Microsoft.AspNetCore.Mvc;
using Easy.MetaData;
using Easy.Extend;
using Easy.ViewPort.Validator;
using Newtonsoft.Json;

namespace Easy.Mvc.DataAnnotations
{
    public class DataAnnotationsMetadataProvider :
        IDisplayMetadataProvider,
        IValidationMetadataProvider
    {
        public void CreateDisplayMetadata(DisplayMetadataProviderContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            if (context.Key.ContainerType != null && !context.Key.ContainerType.IsValueType)
            {
                var viewConfig = ServiceLocator.GetViewConfigure(context.Key.ContainerType);

                var displayMetadata = context.DisplayMetadata;
                if (viewConfig != null && context.Key.Name.IsNotNullAndWhiteSpace())
                {
                    var descriptor = viewConfig.GetViewPortDescriptor(context.Key.Name);
                    if (descriptor != null)
                    {
                        displayMetadata.AdditionalValues.Add("ViewPortDescriptor", descriptor);
                        if (displayMetadata.DisplayName == null)
                        {
                            displayMetadata.DisplayName = () => descriptor.DisplayName;
                        }

                        displayMetadata.Order = descriptor.OrderIndex;
                        displayMetadata.TemplateHint = descriptor.TemplateName;
                        displayMetadata.ShowForDisplay = descriptor.IsShowForDisplay;
                        displayMetadata.ShowForEdit = descriptor.IsShowForEdit;
                        if (descriptor.IsHidden)
                        {
                            displayMetadata.TemplateHint = "HiddenInput";
                            displayMetadata.ShowForDisplay = false;
                            displayMetadata.ShowForEdit = false;
                        }
                        if (descriptor.IsIgnore)
                        {
                            displayMetadata.ShowForDisplay = false;
                            displayMetadata.ShowForEdit = false;
                            displayMetadata.TemplateHint = "Ignore";
                        }
                        if (descriptor.IsHideSurroundingHtml)
                        {
                            displayMetadata.HideSurroundingHtml = true;
                        }
                    }
                }
            }


        }

        public void CreateValidationMetadata(ValidationMetadataProviderContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            if (context.Key.ContainerType != null && !context.Key.ContainerType.IsValueType)
            {
                var viewConfig = ServiceLocator.GetViewConfigure(context.Key.ContainerType);

                if (viewConfig != null && context.Key.Name.IsNotNullAndWhiteSpace())
                {
                    var descriptor = viewConfig.GetViewPortDescriptor(context.Key.Name);
                    if (descriptor != null)
                    {
                        descriptor.Validator.Each(v =>
                        {
                            if (v.DisplayName == null)
                            {
                                v.DisplayName = () => descriptor.DisplayName;
                            }
                            string encodeError = Convert.ToBase64String(JsonConvert.SerializeObject(new Mapping(v.Name, v.Property)).ToByte());
                            if (v is RangeValidator rangeValid)
                            {
                                RangeAttribute range = new RangeAttribute(rangeValid.Min, rangeValid.Max);
                                range.ErrorMessage = encodeError;

                                context.ValidationMetadata.ValidatorMetadata.Add(range);
                            }
                            else if (v is RegularValidator regularValid)
                            {
                                RegularExpressionAttribute regular = new RegularExpressionAttribute(regularValid.Expression);
                                regular.ErrorMessage = encodeError;
                                context.ValidationMetadata.ValidatorMetadata.Add(regular);
                            }
                            else if (v is RemoteValidator remoteValid)
                            {
                                RemoteAttribute remote = new RemoteAttribute(remoteValid.Action, remoteValid.Controller, remoteValid.Area);
                                remote.ErrorMessage = encodeError;
                                context.ValidationMetadata.ValidatorMetadata.Add(remote);
                            }
                            else if (v is RequiredValidator)
                            {
                                RequiredAttribute required = new RequiredAttribute();
                                required.ErrorMessage = encodeError;
                                context.ValidationMetadata.ValidatorMetadata.Add(required);
                            }
                            else if (v is StringLengthValidator stringLengthValid)
                            {
                                StringLengthAttribute stringLength = new StringLengthAttribute(stringLengthValid.Max);
                                stringLength.ErrorMessage = encodeError;
                                context.ValidationMetadata.ValidatorMetadata.Add(stringLength);
                            }
                            else
                            {
                                CustomValidationHandler customValidationHandler = new CustomValidationHandler(v.Validate);
                                customValidationHandler.ErrorMessage = encodeError;
                                context.ValidationMetadata.ValidatorMetadata.Add(customValidationHandler);
                            }
                            //todo: CompareAttribute
                        });

                    }
                }
            }
        }
    }
}