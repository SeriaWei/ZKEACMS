/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Easy.Reflection
{
    public class ClassAction
    {
        /// <summary>
        /// 取出类的属性值
        /// </summary>
        /// <typeparam name="T">类别</typeparam>
        /// <param name="obj">对象</param>
        /// <returns>返回字典</returns>
        public static Dictionary<string, object> GetPropertieValues<T>(T obj)
        {
            Type objType = typeof(T);
            var properties = objType.GetProperties();
            return properties.Where(item => item.GetValue(obj, null) != null).ToDictionary(item => item.Name, item => item.GetValue(obj, null));
        }
        /// <summary>
        /// 获取属性值
        /// </summary>
        /// <typeparam name="T">类型</typeparam>
        /// <param name="item">类型实例</param>
        /// <param name="property">属性名称</param>
        /// <returns>属性值</returns>
        public static object GetPropertyValue<T>(T item, string property)
        {
            Type entityType = typeof(T);
            PropertyInfo proper = entityType.GetProperty(property);
            if (proper != null && proper.CanRead)
            {
                return proper.GetValue(item, null);
            }
            else return null;
        }

        public static object GetObjPropertyValue(object item, string property)
        {
            Type entityType = item.GetType();
            PropertyInfo proper = entityType.GetProperty(property);
            if (proper != null && proper.CanRead)
            {
                return proper.GetValue(item, null);
            }
            else return null;
        }

        /// <summary>
        /// 设置属性值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="item"></param>
        /// <param name="property"></param>
        /// <param name="value"></param>
        public static void SetPropertyValue<T>(T item, string property, object value)
        {
            Type entityType = typeof(T);
            PropertyInfo proper = entityType.GetProperty(property);
            if (proper != null && proper.CanWrite)
            {
                proper.SetValue(item, ValueConvert(proper, value), null);
            }
        }

        public static void SetObjPropertyValue(object obj, string property, object value)
        {
            Type entityType = obj.GetType();
            PropertyInfo proper = entityType.GetProperty(property);
            if (proper != null && proper.CanWrite)
            {
                proper.SetValue(obj, ValueConvert(proper, value), null);
            }
        }


        public static object ValueConvert(PropertyInfo property, object obj)
        {
            return ValueConvert(property.PropertyType, obj);
        }
        public static object ValueConvert(Type type, object obj)
        {
            if (obj == null) return null;
            var realType = Nullable.GetUnderlyingType(type) ?? type;
            return Convert.ChangeType(obj, realType);

            //TypeCode code = Type.GetTypeCode(realType);
            //switch (code)
            //{
            //    case TypeCode.Boolean:
            //        {
            //            if (obj != null)
            //            {
            //                string result = obj.ToString().ToLower();
            //                if (result == "true" || result == "1")
            //                    return true;
            //                else return false;
            //            }
            //            else return false;
            //        }
            //    case TypeCode.Byte: return Convert.ToByte(obj);
            //    case TypeCode.Char: return Convert.ToChar(obj);

            //    case TypeCode.DateTime: return Convert.ToDateTime(obj);
            //    case TypeCode.Decimal: return Convert.ToDecimal(obj);
            //    case TypeCode.Double: return Convert.ToDouble(obj);
            //    case TypeCode.Empty: return null;
            //    case TypeCode.Int16: return Convert.ToInt16(obj);
            //    case TypeCode.Int32: return Convert.ToInt32(obj);
            //    case TypeCode.Int64: return Convert.ToInt64(obj);
            //    case TypeCode.Object: return obj;
            //    case TypeCode.SByte: return Convert.ToSByte(obj);
            //    case TypeCode.Single: return Convert.ToSingle(obj);
            //    case TypeCode.String: return Convert.ToString(obj);
            //    case TypeCode.UInt16: return Convert.ToUInt16(obj);
            //    case TypeCode.UInt32: return Convert.ToUInt32(obj);
            //    case TypeCode.UInt64: return Convert.ToUInt64(obj);
            //    default: return obj;
            //}
        }
    }
}
