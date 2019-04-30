using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Account
{
    public class UserCenterLinkService : IUserCenterLinkService
    {
        private readonly IEnumerable<IUserCenterLinksProvider> _userCenterLinksProviders;
        public UserCenterLinkService(IEnumerable<IUserCenterLinksProvider> userCenterLinksProviders)
        {
            _userCenterLinksProviders = userCenterLinksProviders;
        }
        public IEnumerable<AdminMenu> GetLinks()
        {
            List<AdminMenu> menu = new List<AdminMenu>();
            _userCenterLinksProviders.Each(p => menu.AddRange(p.GetLinks()));
            return menu;
        }
    }
}
