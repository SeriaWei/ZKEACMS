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
        
    }
    class SiteSearchWidgetMetaData : WidgetMetaData<SiteSearchWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
        }
    }
}
