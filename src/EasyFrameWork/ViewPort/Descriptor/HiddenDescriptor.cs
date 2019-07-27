/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.ViewPort.Validator;

namespace Easy.ViewPort.Descriptor
{
    public class HiddenDescriptor : BaseDescriptor<HiddenDescriptor>
    {
        public HiddenDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = HTMLEnumerate.HTMLTagTypes.Hidden;
            this.TemplateName = "Hidden";
            this.IsShowForDisplay = false;
            this.IsShowForEdit = false;
            this.IsShowInGrid = false;
        }
        
    }
}
