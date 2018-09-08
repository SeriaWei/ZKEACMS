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
                            v.DisplayName = descriptor.DisplayName;
                            if (v is RangeValidator)
                            {
                                RangeValidator valid = (RangeValidator)v;
                                RangeAttribute range = new RangeAttribute(valid.Min, valid.Max);
                                range.ErrorMessage = valid.ErrorMessage;

                                context.ValidationMetadata.ValidatorMetadata.Add(range);
                            }
                            else if (v is RegularValidator)
                            {
                                RegularValidator valid = (RegularValidator)v;
                                RegularExpressionAttribute regular = new RegularExpressionAttribute(valid.Expression);
                                regular.ErrorMessage = valid.ErrorMessage;
                                context.ValidationMetadata.ValidatorMetadata.Add(regular);
                            }
                            else if (v is RemoteValidator)
                            {
                                RemoteValidator valid = (RemoteValidator)v;
                                RemoteAttribute remote = new RemoteAttribute(valid.Action, valid.Controller, valid.Area);
                                remote.ErrorMessage = valid.ErrorMessage;
                                context.ValidationMetadata.ValidatorMetadata.Add(remote);
                            }
                            else if (v is RequiredValidator)
                            {
                                RequiredValidator valid = (RequiredValidator)v;
                                RequiredAttribute required = new RequiredAttribute();
                                required.ErrorMessage = valid.ErrorMessage;
                                context.ValidationMetadata.ValidatorMetadata.Add(required);
                            }
                            else if (v is StringLengthValidator)
                            {
                                StringLengthValidator valid = (StringLengthValidator)v;
                                StringLengthAttribute stringLength = new StringLengthAttribute(valid.Max);
                                stringLength.ErrorMessage = valid.ErrorMessage;
                                context.ValidationMetadata.ValidatorMetadata.Add(stringLength);
                            }
                        });

                    }
                }
            }
        }
    }
}