/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Fluid;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Concurrent;
using System.Text.Encodings.Web;
using ZKEACMS.EventAction.Models;
using ZKEACMS.EventAction.TemplateEngine;

namespace ZKEACMS.EventAction.Service
{
    public sealed class ActionBodyService : ServiceBase<ActionBody>, IActionBodyService
    {
        private static ConcurrentDictionary<int, IFluidTemplate> _templates = new ConcurrentDictionary<int, IFluidTemplate>();

        class RecordNotFoundException : Exception
        {

        }

        public ActionBodyService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override ServiceResult<ActionBody> Add(ActionBody item)
        {
            IFluidTemplate templateResult = null;
            if (item.Body.IsNotNullAndWhiteSpace() && !FluidTemplateHelper.TryParse(item.Body, out templateResult, out var error))
            {
                var result = new ServiceResult<ActionBody>();
                result.AddRuleViolation("Body", error);
                return result;
            }
            var addResult = base.Add(item);
            if (templateResult != null)
            {
                _templates.AddOrUpdate(item.ID, templateResult, (id, old) => templateResult);
            }
            return addResult;
        }

        public override ServiceResult<ActionBody> Update(ActionBody item)
        {
            IFluidTemplate templateResult = null;
            if (item.Body.IsNotNullAndWhiteSpace() && !FluidTemplateHelper.TryParse(item.Body, out templateResult, out var error))
            {
                var result = new ServiceResult<ActionBody>();
                result.AddRuleViolation("Body", error);
                return result;
            }
            if (templateResult != null)
            {
                _templates.AddOrUpdate(item.ID, templateResult, (id, old) => templateResult);
            }
            return base.Update(item);
        }

        public string RenderBody(int ID, object model)
        {
            var template = ParseTemplate(ID).Result;
            if (template == null) return string.Empty;

            return template.Render(model);
        }
        private ServiceResult<IFluidTemplate> ParseTemplate(int ID)
        {
            var result = new ServiceResult<IFluidTemplate>();
            try
            {
                var template = _templates.GetOrAdd(ID, key =>
                {
                    var actionBody = Get(key);
                    if (actionBody == null || actionBody.Status == (int)RecordStatus.InActive) throw new RecordNotFoundException();

                    if (!FluidTemplateHelper.TryParse(actionBody.Body, out var result, out var error)) throw new Exception(error);
                    return result;
                });
                result.Result = template;
            }
            catch (RecordNotFoundException) { }
            catch (Exception ex)
            {
                result.AddRuleViolation(ex.Message);
            }

            return result;
        }
    }
}
