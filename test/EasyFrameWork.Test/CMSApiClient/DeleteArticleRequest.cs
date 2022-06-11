using Easy.Net.WebApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class DeleteArticleRequest : HttpRequest, IAuthorizeRequired
    {
        public DeleteArticleRequest(int articleId) : base($"/api/article/delete/{articleId}", HttpMethod.Delete, typeof(void))
        {
        }
    }
}
