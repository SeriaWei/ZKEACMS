using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Widget
{
    public abstract class SimpleWidgetService<T> : WidgetService<T> where T : SimpleWidgetBase, new()
    {
        public SimpleWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext) :
            base(widgetBasePartService, applicationContext, dbContext)
        {
        }

        public override DbSet<T> CurrentDbSet => throw new NotImplementedException();
        public override T Get(params object[] primaryKeys)
        {
            var item = WidgetBasePartService.Get(primaryKeys);
            return item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData ?? "{}")) as T;
        }
        public override ServiceResult<T> Add(T item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            item.ExtendData = JsonConvert.SerializeObject(item);
            WidgetBasePartService.Add(item.ToWidgetBasePart());
            return new ServiceResult<T>();
        }
        public override ServiceResult<T> AddRange(params T[] items)
        {
            foreach (var item in items)
            {
                item.ExtendData = JsonConvert.SerializeObject(item);
            }
            WidgetBasePartService.AddRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
            return new ServiceResult<T>();
        }
        public override ServiceResult<T> Update(T item, bool saveImmediately = true)
        {
            item.ExtendData = JsonConvert.SerializeObject(item);
            WidgetBasePartService.Update(item.ToWidgetBasePart(), saveImmediately);
            return new ServiceResult<T>();
        }
        public override ServiceResult<T> UpdateRange(params T[] items)
        {
            foreach (var item in items)
            {
                item.ExtendData = JsonConvert.SerializeObject(item);
            }
            WidgetBasePartService.UpdateRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
            return new ServiceResult<T>();
        }
        public override IList<T> Get(Expression<Func<T, bool>> filter)
        {
            IEnumerable<WidgetBase> widgetBases = WidgetBasePartService.Get(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters)).Select(m => m.ToWidgetBase());
            List<T> result = new List<T>();
            foreach (var item in widgetBases)
            {
                result.Add(item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData ?? "{}")) as T);
            }
            return result;
        }
        public override IList<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            IEnumerable<WidgetBase> widgetBases = WidgetBasePartService.Get(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters), pagination).Select(m => m.ToWidgetBase());
            List<T> result = new List<T>();
            foreach (var item in widgetBases)
            {
                result.Add(item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData ?? "{}")) as T);
            }
            return result;
        }

        public override T GetSingle(Expression<Func<T, bool>> filter)
        {
            var widgetBase = WidgetBasePartService.GetSingle(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters));
            return widgetBase.CopyTo(JsonConvert.DeserializeObject<T>(widgetBase.ExtendData ?? "{}")) as T;
        }
        public override void Remove(Expression<Func<T, bool>> filter)
        {
            WidgetBasePartService.Remove(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters));
        }
        public override void Remove(T item, bool saveImmediately = true)
        {
            WidgetBasePartService.Remove(item.ID);
        }
        public override void RemoveRange(params T[] items)
        {
            WidgetBasePartService.RemoveRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
        }

        public override WidgetBase GetWidget(WidgetBase widget)
        {
            return widget.CopyTo(JsonConvert.DeserializeObject<T>(widget.ExtendData ?? "{}")) as T;
        }
    }
}
