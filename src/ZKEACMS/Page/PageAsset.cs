using System;
using System.Collections.Generic;
using System.Text;
using Easy.MetaData;
using Easy.Models;

namespace ZKEACMS.Page
{
    public class PageAsset : EditorEntity
    {
        public string Url { get; set; }
    }
    class PageAssetMetaData : ViewMetaData<PageAsset>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.Url).AsTextBox().AddClass(StringKeys.SelectMediaClass).AddProperty("data-url", Urls.SelectMedia);
        }
    }
}
