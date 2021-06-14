/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.ViewPort.Validator;
using System;

namespace Easy.ViewPort.Descriptor
{
    public class TextAreaDescriptor : BaseDescriptor<TextAreaDescriptor>
    {
        public TextAreaDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = HTMLEnumerate.HTMLTagTypes.MutiLineTextBox;
            this.TemplateName = "TextArea";
        }
        

        public TextAreaDescriptor MaxLength(int max)
        {
            this.Validator.Add(new StringLengthValidator(0, max)
            {
                Property = this.Name
            });
            return this;
        }
        public TextAreaDescriptor MaxLength(int max, string errorMsg)
        {
            this.Validator.Add(new StringLengthValidator(0, max)
            {
                ErrorMessage = errorMsg,
                Property = this.Name
            });
            return this;
        }
        public TextAreaDescriptor MaxLength(int min, int max)
        {
            this.Validator.Add(new StringLengthValidator(min, max)
            {
                Property = this.Name
            });
            return this;
        }
        public TextAreaDescriptor MaxLength(int min, int max, string errorMsg)
        {
            this.Validator.Add(new StringLengthValidator(min, max)
            {
                ErrorMessage = errorMsg,
                Property = this.Name
            });
            return this;
        }
    }
}
