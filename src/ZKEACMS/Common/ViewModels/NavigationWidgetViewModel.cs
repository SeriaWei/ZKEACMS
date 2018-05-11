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
            _navs = navigation;
            Widget = widget;
        }
        private IEnumerable<NavigationEntity> _navs;

        public IEnumerable<NavigationViewModel> Navigations
        {
            get
            {
                foreach (var item in _navs.Where(m => m.ParentId == Widget.RootID))
                {
                    yield return new NavigationViewModel(_navs, item);
                }
            }
        }

        public NavigationWidget Widget { get; set; }

        public IEnumerable<NavigationEntity> Mobiles
        {
            get { return LoadMobiles(_navs.Where(m => m.ParentId == Widget.RootID).ToList()); }

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
                mobileNavs.AddRange(LoadMobiles(_navs.Where(m => m.ParentId == item.ID).ToList()));
            }
            return mobileNavs;
        }
    }
}