/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Event
{
    public interface IOnPageExecuting
    {
        void OnExecuting(HttpContext context);
    }
}