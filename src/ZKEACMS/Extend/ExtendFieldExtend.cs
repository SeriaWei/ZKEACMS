/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.ExtendField;

namespace ZKEACMS
{
    public static class ExtendFieldExtend
    {
        public static ExtendFieldEntity Get(this IExtendField entity, string name)
        {
            if (entity != null && entity.ExtendFields != null)
            {
                return entity.ExtendFields.FirstOrDefault(m => m.Title == name);
            }
            return null;
        }
        public static IEnumerable<ExtendFieldEntity> GetFields(this IExtendField entity, string name)
        {
            if (entity != null && entity.ExtendFields != null)
            {
                return entity.ExtendFields.Where(m => m.Title == name);
            }
            return Enumerable.Empty<ExtendFieldEntity>();
        }

        public static string GetFieldValue(this IExtendField entity, string name)
        {
            var field = entity.Get(name);
            if (field != null)
            {
                return field.Value;
            }
            return null;
        }
    }
}
