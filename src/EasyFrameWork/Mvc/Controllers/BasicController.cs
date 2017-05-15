/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Extend;
using Easy.Constant;
using Easy.LINQ;
using System.Linq;
using System.Linq.Expressions;

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
        protected void UpLoadImage(IImage entity)
        {
            if (entity == null) return;
            if (!string.IsNullOrEmpty(entity.ImageUrl) && string.IsNullOrEmpty(entity.ImageThumbUrl))
            {
                entity.ImageThumbUrl = entity.ImageUrl;
            }
            string filePath = Request.SaveImage();
        }



        public virtual ActionResult Index()
        {
            return View();
        }
        public virtual ActionResult Create()
        {
            var entity = Activator.CreateInstance<TEntity>();
            entity.Status = (int)RecordStatus.Active;
            return View(entity);
        }

        [HttpPost]
        public virtual ActionResult Create(TEntity entity)
        {
            if (ModelState.IsValid)
            {
                UpLoadImage(entity as IImage);
                Service.Add(entity);
                return RedirectToAction("Index");
            }
            return View(entity);
        }
        public virtual ActionResult Edit(TPrimarykey Id)
        {
            TEntity entity = Service.Get(Id);
            return View(entity);
        }

        [HttpPost]
        public virtual ActionResult Edit(TEntity entity)
        {
            if (entity.ActionType == ActionType.Delete)
            {
                Service.Remove(entity);
                return RedirectToAction("Index");
            }

            ViewBag.Title = entity.Title;
            if (ModelState.IsValid)
            {
                UpLoadImage(entity as IImage);
                Service.Update(entity);
                return RedirectToAction("Index");
            }
            return View(entity);
        }

        [HttpPost]
        public virtual JsonResult Delete(TPrimarykey id)
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
        public virtual JsonResult GetList(DataTableOption query)
        {
            var pagin = new Pagination { PageSize = query.Length, PageIndex = query.Start / query.Length };
            var expression = query.AsExpression<TEntity>();
            pagin.RecordCount = Service.Count(expression);
            var entities = Service.Get(expression);
            var order = query.GetOrderBy<TEntity>();
            if (order != null)
            {
                if (query.IsOrderDescending())
                {
                    entities = entities.OrderByDescending(order);
                }
                else
                {
                    entities = entities.OrderBy(order);
                }
            }
            return Json(new TableData(entities.Skip(pagin.PageIndex * pagin.PageSize).Take(pagin.PageSize), pagin.RecordCount, query.Draw));
        }
        protected override void Dispose(bool disposing)
        {
            Service.Dispose();
            base.Dispose(disposing);
        }
    }
}
