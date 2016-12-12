using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.AspNetCore.Mvc;
using Easy.Extend;
using Easy.MetaData;
using System.Text;
using System.Reflection;
using System.ComponentModel.DataAnnotations;
using System.Net;

namespace Easy.Mvc.TagHelpers
{
    public class GridTagHelper : TagHelperBase
    {
        private const string DefaultClass = "dataTable table table-striped table-bordered";
        private const string DefaultSourceAction = "GetList";
        public const string DefaultEditAction = "Edit";
        private const string TableStructure = "<table class=\"{0}\" cellspacing=\"0\" width=\"100%\" data-source=\"{1}\"><thead><tr>{2}</tr></thead></table>";
        private const string TableHeadStructure = "<th data-key=\"{0}\" data-template=\"{1}\" data-order=\"{2}\" data-option=\"{4}\">{3}</th>";
        public const string EditLinkTemplate = "<a href=\"{0}\">编辑</a>";
        public string Source { get; set; }
        public string Edit { get; set; }
        public string GridClass { get; set; }
        public bool? EditAble { get; set; }
        public string OrderAsc { get; set; }
        public string OrderDesc { get; set; }

        public Type ModelType { get; set; }

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            if (Source.IsNullOrWhiteSpace())
            {
                Source = Url.Action(DefaultSourceAction);
            }
            if (GridClass.IsNullOrWhiteSpace())
            {
                GridClass = DefaultClass;
            }
            if (Edit.IsNullOrWhiteSpace())
            {
                Edit = Url.Action(DefaultEditAction);
            }
            if (ModelType == null)
            {
                ModelType = ViewContext.ViewData.ModelMetadata.ModelType;
            }
            var viewConfig = ViewConfigureAttribute.GetAttribute(ModelType);
            StringBuilder tableHeaderBuilder = new StringBuilder();

            if (viewConfig != null)
            {
                var primaryKey = viewConfig.MetaData.Properties.Select(m => m.Value).FirstOrDefault(m => m.CustomAttributes.Any(attr => attr.AttributeType == typeof(KeyAttribute)));
                viewConfig.InitDisplayName();
                if ((EditAble ?? true) && primaryKey != null)
                {
                    string name = primaryKey.Name.FirstCharToLowerCase();
                    if (name.Length == 2)
                    {
                        name = name.ToLower();
                    }
                    string placeholder = "{" + name + "}";
                    tableHeaderBuilder.AppendFormat(TableHeadStructure,
                        string.Empty,
                        WebUtility.HtmlEncode(EditLinkTemplate.FormatWith(Edit + "?Id=" + placeholder)),
                        string.Empty,
                        "操作",
                        string.Empty);
                }

                var columns = viewConfig.GetViewPortDescriptors(true)
                    .Where(m => m.IsShowInGrid)
                    .Each(m =>
                    {
                        var dropDown = m as ViewPort.Descriptor.DropDownListDescriptor;
                        StringBuilder optionBuilder = new StringBuilder();
                        if (dropDown != null)
                        {
                            foreach (var item in dropDown.OptionItems)
                            {
                                optionBuilder.AppendFormat("{{\"name\":\"{0}\",\"value\":\"{1}\"}},", item.Value, item.Key);
                            }
                        }

                        tableHeaderBuilder.AppendFormat(TableHeadStructure,
                            m.Name.FirstCharToLowerCase(),
                            WebUtility.HtmlEncode(m.GridColumnTemplate),
                            OrderAsc == m.Name ? "asc" : OrderDesc == m.Name ? "desc" : "",
                            m.DisplayName,
                            optionBuilder.Length == 0 ? string.Empty : WebUtility.HtmlEncode($"[{optionBuilder.ToString().Trim(',')}]"));
                    });
            }
            output.TagName = "div";
            output.Attributes.Add("class", "container-fluid");
            output.Content.SetHtmlContent(TableStructure.FormatWith(GridClass, Source, tableHeaderBuilder));
        }
    }
}
