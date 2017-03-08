using Easy.Cache;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Easy.RepositoryPattern;
using Easy;

namespace ZKEACMS.Widget
{
    public abstract class SimpleWidgetService<T, TDB> : WidgetService<T, TDB> where T : WidgetBase where TDB : CMSDbContext, new()
    {
        public SimpleWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext) :
            base(widgetBasePartService, applicationContext)
        {
        }

        public override void Add(T item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            item.ExtendData = JsonConvert.SerializeObject(item);
            WidgetBasePartService.Add(item.ToWidgetBasePart());
        }
        public override void AddRange(params T[] items)
        {
            foreach (var item in items)
            {
                item.ExtendData = JsonConvert.SerializeObject(item);
            }
            WidgetBasePartService.AddRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
        }
        public override void Update(T item)
        {
            item.ExtendData = JsonConvert.SerializeObject(item);
            WidgetBasePartService.Update(item.ToWidgetBasePart());
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override void UpdateRange(params T[] items)
        {
            foreach (var item in items)
            {
                item.ExtendData = JsonConvert.SerializeObject(item);
            }
            WidgetBasePartService.UpdateRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override IEnumerable<T> Get(Expression<Func<T, bool>> filter)
        {
            IEnumerable<WidgetBase> widgetBases = WidgetBasePartService.Get(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters)).Select(m => m.ToWidgetBase());
            foreach (var item in widgetBases)
            {
                yield return item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData)) as T;
            }
        }
        public override IEnumerable<T> Get(Expression<Func<T, bool>> filter, Pagination pagination)
        {
            IEnumerable<WidgetBase> widgetBases = WidgetBasePartService.Get(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters), pagination).Select(m => m.ToWidgetBase());
            foreach (var item in widgetBases)
            {
                yield return item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData)) as T;
            }
        }
        public override IEnumerable<T> GetAll()
        {
            IEnumerable<WidgetBase> widgetBases = WidgetBasePartService.GetAll().Select(m => m.ToWidgetBase());
            foreach (var item in widgetBases)
            {
                yield return item.CopyTo(JsonConvert.DeserializeObject<T>(item.ExtendData)) as T;
            }
        }
        public override T GetSingle(Expression<Func<T, bool>> filter)
        {
            var widgetBase = WidgetBasePartService.GetSingle(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters));
            return widgetBase.CopyTo(JsonConvert.DeserializeObject<T>(widgetBase.ExtendData)) as T;
        }
        public override void Remove(Expression<Func<T, bool>> filter)
        {
            WidgetBasePartService.Remove(Expression.Lambda<Func<WidgetBasePart, bool>>(filter.Body, filter.Parameters));
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override void Remove(T item)
        {
            WidgetBasePartService.Remove(item.ToWidgetBasePart());
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }
        public override void RemoveRange(params T[] items)
        {
            WidgetBasePartService.RemoveRange(items.Select(m => m.ToWidgetBasePart()).ToArray());
            Signal.Trigger(CacheTrigger.WidgetChanged);
        }

        public override WidgetBase GetWidget(WidgetBase widget)
        {
            var currentWidget = base.GetWidget(widget);
            if (currentWidget != null)
            {
                return currentWidget.CopyTo(JsonConvert.DeserializeObject<T>(currentWidget.ExtendData));
            }
            return null;
        }
    }
}
