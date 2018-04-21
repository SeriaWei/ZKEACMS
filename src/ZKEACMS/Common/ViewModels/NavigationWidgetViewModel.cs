/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using ZKEACMS.Common.Models;
using System.Linq;

namespace ZKEACMS.Common.ViewModels
{
    public class NavigationWidgetViewModel
    {
        public NavigationWidgetViewModel(IEnumerable<NavigationEntity> navigation, NavigationWidget widget)
        {
            Navigations = navigation;
            Widget = widget;
        }
        public IEnumerable<NavigationEntity> Navigations { get; set; }
        public NavigationWidget Widget { get; set; }

        public IEnumerable<NavigationEntity> Mobiles(string root)
        {
            return LoadMobiles(Navigations.Where(m => m.ParentId == root).ToList());
        }
        private IList<NavigationEntity> LoadMobiles(IEnumerable<NavigationEntity> navs)
        {
            List<NavigationEntity> mobileNavs = new List<NavigationEntity>();
            if (!navs.Any())
            {
                return mobileNavs;
            }
            mobileNavs.AddRange(navs.Where(m => m.IsMobile ?? false).ToList());
            foreach (var item in navs)
            {
                mobileNavs.AddRange(LoadMobiles(Navigations.Where(m => m.ParentId == item.ID).ToList()));
            }
            return mobileNavs;
        }
    }
}