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
using Microsoft.Extensions.Logging;
using Easy.Extend;
using Easy.Serializer;
using Fluid;
using System.Collections.Concurrent;

namespace ZKEACMS.EventAction.Service
{
    public sealed class EventActionService : ServiceBase<Models.EventAction>, IEventActionService
    {
        private readonly ICacheManager<Dictionary<string, List<EventActionContent>>> _cacheManager;
        private readonly ILogger<EventActionService> _logger;
        private readonly ILocalize _localize;

        public EventActionService(IApplicationContext applicationContext, CMSDbContext dbContext,
            ICacheManager<Dictionary<string, List<EventActionContent>>> cacheManager, ILogger<EventActionService> logger, ILocalize localize)
            : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
            _logger = logger;
            _localize = localize;
        }
        public override ServiceResult<Models.EventAction> Update(Models.EventAction item)
        {
            var result = ValidateActions(item);
            if (result.HasViolation) return result;

            _cacheManager.Clear();
            return base.Update(item);
        }
        public override ServiceResult<Models.EventAction> Add(Models.EventAction item)
        {
            var result = ValidateActions(item);
            if (result.HasViolation) return result;

            _cacheManager.Clear();
            return base.Add(item);
        }

        public override void Remove(Models.EventAction item)
        {
            _cacheManager.Clear();
            base.Remove(item);
        }
        public Dictionary<string, List<EventActionContent>> GetAllActivedActinosFromCache()
        {
            return _cacheManager.GetOrAdd("AllActivedActinos", key =>
            {
                var result = new Dictionary<string, List<EventActionContent>>();
                var eventGroup = Get(m => m.Status == (int)RecordStatus.Active).GroupBy(m => m.Event);
                foreach (var group in eventGroup)
                {
                    result[group.Key] = group.Select(m =>
                    {
                        try
                        {
                            return YamlConverter.Deserialize<EventActionContent>(m.Actions);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogError($"An error occured while deserialize event action, The record id is: {m.ID}");
                            _logger.LogError(ex, ex.Message);
                        }
                        return null;
                    }).Where(m => m != null).ToList();
                }
                return result;
            });
        }


        private ServiceResult<Models.EventAction> ValidateActions(Models.EventAction item)
        {
            ServiceResult<Models.EventAction> result = new ServiceResult<Models.EventAction>();
            try
            {
                var eventAction = YamlConverter.Deserialize<EventActionContent>(item.Actions);
                if (eventAction.Actions == null) return result;
                foreach (var action in eventAction.Actions)
                {
                    if (!ExecutorManager.IsExecutorRegisted(action.Uses))
                    {
                        result.AddRuleViolation("Actions", _localize.Get("{0} is not available").FormatWith(action.Uses));
                        break;
                    }
                    var validateResult = action.ValidateWith();
                    if (validateResult.HasViolation)
                    {
                        result.AddRuleViolation("Actions", validateResult.ErrorMessage);
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                result.AddRuleViolation("Actions", ex.Message);
            }
            return result;
        }
    }
}
