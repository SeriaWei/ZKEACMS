using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Sitemap.Models
{
    public class SiteUrl
    {
        public string Url { get; set; }
        public DateTime ModifyDate { get; set; }
        /// <summary>
        /// "always", "hourly", "daily", "weekly", "monthly", "yearly"
        /// </summary>
        public string Changefreq { get; set; }
        public float Priority { get; set; }
    }
}
