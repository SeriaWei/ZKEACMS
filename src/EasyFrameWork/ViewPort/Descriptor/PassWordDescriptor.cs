/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy.ViewPort.Validator;

namespace Easy.ViewPort.Descriptor
{
    public class PassWordDescriptor : BaseDescriptor<PassWordDescriptor>
    {
        public PassWordDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = HTMLEnumerate.HTMLTagTypes.PassWord;

            this.TemplateName = "PassWord";
        }
        
    }
}
