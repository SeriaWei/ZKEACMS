/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.ViewPort.Validator;

namespace Easy.ViewPort.Descriptor
{
    public class ListEditorDescriptor : BaseDescriptor<ListEditorDescriptor>
    {
        public ListEditorDescriptor(Type modelType, string property)
            : base(modelType, property)
        {

            this.TagType = HTMLEnumerate.HTMLTagTypes.ListEditor;
            this.TemplateName = "ListEditor";
        }
        public ListEditorDescriptor Sortable()
        {
            this.AddClass("sortable");
            return this;
        }
    }
}
