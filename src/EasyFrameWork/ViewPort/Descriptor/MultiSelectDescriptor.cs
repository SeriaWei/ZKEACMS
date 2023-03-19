/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy.ViewPort.Validator;
using System.Collections.Generic;
using Easy.Constant;
using System.Text;
using Easy.Modules.DataDictionary;
using Easy.Extend;
using System.Linq;
using System.Reflection;

namespace Easy.ViewPort.Descriptor
{
    public class MultiSelectDescriptor : SelectDescriptor<MultiSelectDescriptor>
    {
        public MultiSelectDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
        }

        public override HTMLEnumerate.HTMLTagTypes GetTagType()
        {
            return HTMLEnumerate.HTMLTagTypes.MultiSelect;
        }
    }
}
