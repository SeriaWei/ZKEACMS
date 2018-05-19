/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.LINQ;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Setting;
using System.Linq;
using Easy.RepositoryPattern;
using ZKEACMS.Rule;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
    public class RuleController : BasicController<Rule.Rule, int, IRuleService>
    {
        public RuleController(IRuleService service)
            : base(service)
        {

        }
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Create(Rule.Rule entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(Rule.Rule entity)
        {
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
