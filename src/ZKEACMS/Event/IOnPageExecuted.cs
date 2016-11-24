/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.Page;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Event
{
    public interface IOnPageExecuted 
    {
        void OnExecuted(PageEntity currentPage, HttpContext context);
    }
}