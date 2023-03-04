/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.EventAction.Models;
using Easy;
using Easy.Cache;
using Easy.Constant;
using ZKEACMS.EventAction.ActionExecutor;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization;

namespace ZKEACMS.EventAction.Service
{
    public class EventActionService : ServiceBase<Models.EventAction>, IEventActionService
    {
        private readonly ICacheManager<Dictionary<string, List<EventActionContent>>> _cacheManager;
        public EventActionService(IApplicationContext applicationContext, CMSDbContext dbContext,
            ICacheManager<Dictionary<string, List<EventActionContent>>> cacheManager) : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
        }

        public Dictionary<string, List<EventActionContent>> GetAllActivedActinosFromCache()
        {
            return _cacheManager.GetOrAdd("AllActivedActinos", key =>
            {
                var result = new Dictionary<string, List<EventActionContent>>();
                var deserializer = new DeserializerBuilder().WithNamingConvention(UnderscoredNamingConvention.Instance).Build();
                var eventGroup = Get(m => m.Status == (int)RecordStatus.Active).GroupBy(m => m.Event);
                foreach (var group in eventGroup)
                {
                    result[group.Key] = group.Select(m => deserializer.Deserialize<EventActionContent>(m.Actions)).ToList();
                }
                return result;
            });
        }
    }
}
