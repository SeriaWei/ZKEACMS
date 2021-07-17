/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy.ViewPort.Validator;

namespace Easy.ViewPort.Descriptor
{
    public class ObjectDescriptor : BaseDescriptor
    {
        public ObjectDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = HTMLEnumerate.HTMLTagTypes.Object;
            this.TemplateName = "Object";
        }
    }
}
