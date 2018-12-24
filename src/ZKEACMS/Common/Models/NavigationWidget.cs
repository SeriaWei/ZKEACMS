/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.MetaData;
using ZKEACMS;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using System.ComponentModel.DataAnnotations.Schema;
using Easy;
using ZKEACMS.Common.Service;
using Easy.Extend;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Common.Models
{
    [DataTable("NavigationWidget")]
    public class NavigationWidget : BasicWidget
    {
        public string Logo { get; set; }
        public string CustomerClass { get; set; }
        public string AlignClass { get; set; }
        public bool? IsTopFix { get; set; }
        public string RootID { get; set; }
        public bool? ShowBasket { get; set; }
    }
    class NavigationWidgetMetaData : WidgetMetaData<NavigationWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.CustomerClass).AsDropDownList().DataSource(() =>
            {
                return new Dictionary<string, string>
                {
                     {"container","居中"},
                     {"container-fluid","自适应"}
                };
            }).Order(NextOrder());
            ViewConfig(m => m.AlignClass).AsDropDownList().DataSource(() =>
            {
                return new Dictionary<string, string>
                {
                     {"navbar-left","左对齐"},
                     {"navbar-right","右对齐"}
                };
            }).Order(NextOrder());
            ViewConfig(m => m.IsTopFix).AsHidden();
            ViewConfig(m => m.Logo).AsTextBox().Order(NextOrder()).MediaSelector();
            ViewConfig(m => m.RootID).AsDropDownList().Order(NextOrder()).AddClass("select").AddProperty("data-url", "/admin/Navigation/Select").DataSource(() =>
            {
                Dictionary<string, string> navigations = new Dictionary<string, string>();
                navigations.Add("root", "导航");
                ServiceLocator.GetService<INavigationService>().Get().Each(navigation => {
                    navigations.Add(navigation.ID, navigation.Title);
                });
                return navigations;
            });
        }
    }

}