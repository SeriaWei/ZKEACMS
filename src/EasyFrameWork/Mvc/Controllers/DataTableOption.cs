using Easy.LINQ;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Easy.Extend;
using System.Reflection;

namespace Easy.Mvc.Controllers
{
    public class DataTableOption
    {
        public int Draw { get; set; }
        public ColumnOption[] Columns { get; set; }
        public OrderOption[] Order { get; set; }
        public int Start { get; set; }
        public int Length { get; set; }
        public SearchOption Search { get; set; }
        public Expression<Func<T, bool>> AsExpression<T>() where T : class
        {
            QueryCollection queryCollection = new QueryCollection();
            var properties = typeof(T).GetTypeInfo().GetProperties();
            if (Search != null && Search.Value.IsNotNullAndWhiteSpace())
            {
                foreach (var item in Columns)
                {
                    var p = properties.FirstOrDefault(m => m.Name.Equals(item.Data, StringComparison.OrdinalIgnoreCase));
                    if (p == null) continue;

                    Query query = new Query();
                    query.Name = p.Name;
                    query.Operator = Query.Operators.Contains;
                    query.Value = Easy.Reflection.ClassAction.ValueConvert(p, Search.Value);
                    queryCollection.Add(query);
                }
            }
            return queryCollection.AsExpression<T>();
        }
        public Func<T, object> GetOrderBy<T>()
        {
            if (Order == null || Order.Length == 0)
            {
                return null;
            }
            Expression exp = null;
            Type targetType = typeof(T);
            TypeInfo typeInfo = targetType.GetTypeInfo();
            var parameter = Expression.Parameter(targetType, "m");
            var property = typeInfo.GetProperties().FirstOrDefault(p => p.Name.Equals(Columns[Order[0].Column].Data, StringComparison.OrdinalIgnoreCase));
            if (property != null)
            {
                exp = Expression.Property(parameter, property.Name);
            }
            if (exp != null)
            {
                return Expression.Lambda<Func<T, object>>(Expression.Convert(exp,typeof(object)), parameter).Compile();
            }
            return null;
        }
        public bool IsOrderDescending()
        {
            if (Order == null || Order.Length == 0)
            {
                return false;
            }
            return Order[0].Dir.Equals("desc", StringComparison.OrdinalIgnoreCase);
        }
    }
    public class ColumnOption
    {
        public string Data { get; set; }
        public string Name { get; set; }
        public bool SearchAble { get; set; }
        public bool OrderAble { get; set; }
        public SearchOption Search { get; set; } = new SearchOption();
    }
    public class SearchOption
    {
        public string Value { get; set; }
        public bool Regex { get; set; }
    }
    public class OrderOption
    {
        public int Column { get; set; }
        public string Dir { get; set; }
    }
}
