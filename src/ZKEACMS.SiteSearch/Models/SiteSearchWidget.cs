using Easy;
using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.SiteSearch.Models
{
    public class SiteSearchWidget : SimpleWidgetBase
    {
        public string SearchEngine { get; set; }
    }
    class SiteSearchWidgetMetaData : WidgetMetaData<SiteSearchWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.SearchEngine).AsDropDownList().DataSource(() =>
            {
                var searchEngines = ServiceLocator.GetService<IEnumerable<SearchEngine>>();
                Dictionary<string, string> dics = new Dictionary<string, string>();
                foreach (var item in searchEngines)
                {
                    if (!dics.ContainsKey(item.SearchQuery))
                    {
                        dics.Add(item.SearchQuery, item.Name);
                    }
                }
                return dics;
            });
        }
    }
}
