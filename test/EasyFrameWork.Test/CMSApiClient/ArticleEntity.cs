using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyFrameWork.Test.CMSApiClient
{
    public class ArticleEntity
    {
        public int id { get; set; }
        public string url { get; set; }
        public string summary { get; set; }
        public string metaKeyWords { get; set; }
        public string metaDescription { get; set; }
        public int? counter { get; set; }
        public string articleContent { get; set; }
        public string imageThumbUrl { get; set; }
        public string imageUrl { get; set; }
        public int? articleTypeID { get; set; }
        public DateTime? publishDate { get; set; }
        public bool isPublish { get; set; }
    }
}
