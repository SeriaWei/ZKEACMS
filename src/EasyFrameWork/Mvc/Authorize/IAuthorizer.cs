/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;
using Easy.Modules.User.Models;

namespace Easy.Mvc.Authorize
{
    public interface IAuthorizer
    {
        bool Authorize(string permission);
        bool Authorize(string permission, IUser user);
    }
}