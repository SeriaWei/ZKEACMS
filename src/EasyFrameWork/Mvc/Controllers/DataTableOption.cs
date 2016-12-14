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

            foreach (var item in Columns)
            {
                var p = properties.FirstOrDefault(m => m.Name.Equals(item.Data, StringComparison.OrdinalIgnoreCase));
                if (p == null) continue;
                var realType = Nullable.GetUnderlyingType(p.PropertyType) ?? p.PropertyType;
                string value = null;
                if (item.Search != null && item.Search.Value.IsNotNullAndWhiteSpace())
                {
                    value = item.Search.Value;
                }
                else if (Search != null && Search.Value.IsNotNullAndWhiteSpace() && realType == typeof(string))
                {
                    value = Search.Value;
                }
                if ((item.Search.Opeartor == Query.Operators.Range && item.Search.ValueMin.IsNullOrWhiteSpace() && item.Search.ValueMax.IsNullOrWhiteSpace()) ||
                    (item.Search.Opeartor != Query.Operators.Range && value.IsNullOrWhiteSpace())) continue;

                Query query = new Query();
                query.Name = p.Name;
                try
                {
                    query.Value = Easy.Reflection.ClassAction.ValueConvert(p, value);
                    query.ValueMin = Easy.Reflection.ClassAction.ValueConvert(p, item.Search.ValueMin);
                    query.ValueMax = Easy.Reflection.ClassAction.ValueConvert(p, item.Search.ValueMax);
                }
                catch
                {
                    continue;
                }

                query.Operator = item.Search.Opeartor;
                queryCollection.Add(query);
            }
            return queryCollection.AsExpression<T>(Query.Condition.AndAlso);
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
                return Expression.Lambda<Func<T, object>>(Expression.Convert(exp, typeof(object)), parameter).Compile();
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
        public string ValueMin { get; set; }
        public string ValueMax { get; set; }
        public bool Regex { get; set; }
        public Query.Operators Opeartor { get; set; }
    }
    public class OrderOption
    {
        public int Column { get; set; }
        public string Dir { get; set; }
    }
}
