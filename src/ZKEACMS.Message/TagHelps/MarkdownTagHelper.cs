using System.Threading.Tasks;
using CommonMark;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Easy.Mvc.TagHelpers;
using System.Net;

namespace ZKEACMS.Message.TagHelps
{
    [HtmlTargetElement("markdown", TagStructure = TagStructure.NormalOrSelfClosing)]
    [HtmlTargetElement(Attributes = "markdown")]
    public class MarkdownTagHelper : TagHelperBase
    {
        public ModelExpression Content { get; set; }
        public async override Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
        {
            if (output.TagName == "markdown")
            {
                output.TagName = null;
            }
            output.Attributes.RemoveAll("markdown");

            var content = await GetContent(output);
            var markdown = WebUtility.HtmlEncode(WebUtility.HtmlDecode(content));
            var html = CommonMarkConverter.Convert(markdown);
            output.Content.SetHtmlContent(html ?? "");
        }

        private async Task<string> GetContent(TagHelperOutput output)
        {
            if (Content == null)
                return (await output.GetChildContentAsync()).GetContent();

            return Content.Model?.ToString();
        }
    }
}
