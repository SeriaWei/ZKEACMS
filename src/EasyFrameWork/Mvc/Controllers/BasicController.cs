/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Models;
using Easy.RepositoryPattern;
using System;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Extend;
using Easy.Constant;
using Easy.LINQ;
using System.Linq;
using System.Linq.Expressions;
using Easy.Extend;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace Easy.Mvc.Controllers
{
    /// <summary>
    /// 基本控制器，增删改查
    /// </summary>
    /// <typeparam name="TEntity">实体类型</typeparam>
    /// <typeparam name="TPrimarykey">主键类型</typeparam>
    /// <typeparam name="TService">Service类型</typeparam>
    public class BasicController<TEntity, TPrimarykey, TService> : Controller
        where TEntity : EditorEntity
        where TService : IService<TEntity>
    {
        public TService Service;
        public BasicController(TService service)
        {
            Service = service;
        }

        public virtual IActionResult Index()
        {
            return View();
        }
        public virtual IActionResult Create()
        {
            var entity = Activator.CreateInstance<TEntity>();
            entity.Status = (int)RecordStatus.Active;
            return View(entity);
        }

        [HttpPost]
        public virtual IActionResult Create(TEntity entity)
        {
            if (ModelState.IsValid)
            {
                var result = Service.Add(entity);
                if (result.HasError)
                {
                    foreach (var item in result.Errors)
                    {
                        ModelState.AddModelError(item.ParameterName, item.Message);
                    }
                    return View(entity);
                }
                if (entity.ActionType.HasFlag(ActionType.Exit))
                {
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Edit", new { Id = GetPrimaryKeyValue(entity) });
            }
            return View(entity);
        }
        public virtual IActionResult Edit(TPrimarykey Id)
        {
            if (Id == null)
            {
                return NotFound();
            }
            TEntity entity = Service.Get(Id);
            if (entity == null)
            {
                return NotFound();
            }
            return View(entity);
        }

        [HttpPost]
        public virtual IActionResult Edit(TEntity entity)
        {
            if (entity.ActionType.HasFlag(ActionType.Delete))
            {
                Service.Remove(entity);
                return RedirectToAction("Index");
            }

            if (ModelState.IsValid)
            {
                var result = Service.Update(entity);
                if (result.HasError)
                {
                    foreach (var item in result.Errors)
                    {
                        ModelState.AddModelError(item.ParameterName, item.Message);
                    }
                    return View(entity);
                }
                if (entity.ActionType.HasFlag(ActionType.Exit))
                {
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Edit", new { Id = GetPrimaryKeyValue(entity) });
            }
            return View(entity);
        }

        [HttpPost]
        public virtual IActionResult Delete(TPrimarykey id)
        {
            try
            {
                Service.Remove(id);
                return Json(new AjaxResult { Status = AjaxStatus.Normal });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Status = AjaxStatus.Error, Message = ex.Message });
            }
        }
        [HttpPost]
        public virtual IActionResult GetList(DataTableOption query)
        {
            var pagin = new Pagination { PageSize = query.Length, PageIndex = query.Start / query.Length };
            var expression = query.AsExpression<TEntity>();
            var order = query.GetOrderBy<TEntity>();
            if (order != null)
            {
                if (query.IsOrderDescending())
                {
                    pagin.OrderByDescending = order;
                }
                else
                {
                    pagin.OrderBy = order;
                }
            }
            var entities = Service.Get(expression, pagin);
            return Json(new TableData(entities, pagin.RecordCount, query.Draw));
        }
        protected override void Dispose(bool disposing)
        {
            Service.Dispose();
            base.Dispose(disposing);
        }

        private TPrimarykey GetPrimaryKeyValue(TEntity entity)
        {
            var myClassType = entity.GetType();
            foreach (var propertyInfo in myClassType.GetProperties())
            {
                var keyAttribute = propertyInfo.GetCustomAttribute<KeyAttribute>();
                if (keyAttribute == null) continue;

                return (TPrimarykey)propertyInfo.GetValue(entity);
            }
            return default;
        }
    }
}
