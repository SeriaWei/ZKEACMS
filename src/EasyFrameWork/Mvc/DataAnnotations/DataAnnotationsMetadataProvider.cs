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
            var viewConfig = ViewConfigureAttribute.GetAttribute(context.Key.ContainerType);


            var displayMetadata = context.DisplayMetadata;
            if (viewConfig != null && context.Key.Name.IsNotNullAndWhiteSpace())
            {
                var descriptor = viewConfig.GetViewPortDescriptor(context.Key.Name);
                if (descriptor != null)
                {
                    displayMetadata.AdditionalValues.Add("ViewPortDescriptor", descriptor);
                    if (displayMetadata.DisplayName == null)
                    {
                        displayMetadata.DisplayName = () =>
                        {
                            var attr = ViewConfigureAttribute.GetAttribute(context.Key.ContainerType);
                            attr.InitDisplayName();
                            var descriptop = attr.GetViewPortDescriptor(context.Key.Name);
                            return descriptop.DisplayName;
                        };
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
                }
            }

        }

        public void CreateValidationMetadata(ValidationMetadataProviderContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            var viewConfig = ViewConfigureAttribute.GetAttribute(context.Key.ContainerType);
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
                            RequiredAttribute remote = new RequiredAttribute();
                            remote.ErrorMessage = valid.ErrorMessage;
                            context.ValidationMetadata.ValidatorMetadata.Add(remote);
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