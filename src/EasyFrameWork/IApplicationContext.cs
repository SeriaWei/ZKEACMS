/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;

namespace Easy
{
    public interface IApplicationContext
    {
        IUser CurrentUser { get; }
    }
}
