using Easy.Net.WebApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class ArticleRequest : HttpRequest
    {
        public ArticleRequest(int articleId) : base($"/api/article/get/{articleId}", HttpMethod.Get, typeof(ArticleEntity))
        {
        }
    }
}
