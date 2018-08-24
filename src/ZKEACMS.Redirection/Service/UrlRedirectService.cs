using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public class UrlRedirectService : ServiceBase<UrlRedirect>, IUrlRedirectService
    {
        public UrlRedirectService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        static List<UrlRedirect> _cachedItems;
        static object _syncObject = new object();
        public static void InvalidateCachedItems()
        {
            lock(_syncObject)
            {
                _cachedItems = null;
            }
        }
        public static List<UrlRedirect> GetItems(Func<IUrlRedirectService> serviceGetter)
        {
            lock(_syncObject)
            {
                if (_cachedItems == null)
                {
                    var service = serviceGetter();
                    _cachedItems = service.Get().ToList();
                }
                return _cachedItems;
            }
        }
    }
}
