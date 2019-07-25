/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using Easy.ViewPort;
using Easy.ViewPort.Descriptor;
using Easy.Constant;
using Easy.Models;
using System.Reflection;
using Easy.Extend;

namespace Easy.MetaData
{
    /// <summary>
    /// 数据元数据特性
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class ViewMetaData<T> : IViewMetaData where T : class
    {
        public ViewMetaData()
        {
            ViewPortDescriptors = new Dictionary<string, BaseDescriptor>();

            TargetType = typeof(T);
            foreach (var item in TargetType.GetProperties())
            {
                Type propertyType= Nullable.GetUnderlyingType(item.PropertyType) ?? item.PropertyType;                
                TypeCode code = Type.GetTypeCode(propertyType);
                switch (code)
                {
                    case TypeCode.Boolean:
                        ViewConfig(item.Name).AsCheckBox();
                        break;

                    case TypeCode.Char:
                        ViewConfig(item.Name).AsTextBox().MaxLength(1).RegularExpression(RegularExpression.Letters).Search(LINQ.Query.Operators.Contains);
                        break;

                    case TypeCode.DateTime:
                        ViewConfig(item.Name).AsTextBox().FormatAsDate().Search(LINQ.Query.Operators.Range);
                        break;
                        
                    case TypeCode.Byte:
                    case TypeCode.UInt16:
                    case TypeCode.UInt32:
                    case TypeCode.UInt64:
                        ViewConfig(item.Name).AsTextBox().RegularExpression(RegularExpression.PositiveIntegersAndZero).Search(LINQ.Query.Operators.Range);
                        break;

                    case TypeCode.SByte:
                    case TypeCode.Int16:
                    case TypeCode.Int32:
                    case TypeCode.Int64:
                        ViewConfig(item.Name).AsTextBox().RegularExpression(RegularExpression.Integer).Search(LINQ.Query.Operators.Range);
                        break;

                    case TypeCode.Single:
                    case TypeCode.Double:
                    case TypeCode.Decimal:
                        ViewConfig(item.Name).AsTextBox().RegularExpression(RegularExpression.Float).Search(LINQ.Query.Operators.Range);
                        break;
                        
                    case TypeCode.Empty:
                    case TypeCode.String:
                        ViewConfig(item.Name).AsTextBox().MaxLength(200).Search(LINQ.Query.Operators.Contains);
                        break;
                        
                    case TypeCode.Object:
                    default:
                        ViewConfig(item.Name).AsObject();
                        break;
                }

            }
            if (typeof(EditorEntity).IsAssignableFrom(TargetType))
            {
                ViewConfig("CreateBy").AsHidden();
                ViewConfig("CreatebyName").AsTextBox().Hide().ShowInGrid();
                ViewConfig("CreateDate").AsTextBox().Hide().FormatAsDateTime().ShowInGrid().Search(LINQ.Query.Operators.Range);

                ViewConfig("LastUpdateBy").AsHidden();
                ViewConfig("LastUpdateByName").AsTextBox().Hide().ShowInGrid();
                ViewConfig("LastUpdateDate").AsTextBox().Hide().FormatAsDateTime().ShowInGrid().Search(LINQ.Query.Operators.Range);
                ViewConfig("ActionType").AsHidden().AddClass("ActionType");
                ViewConfig("Title").AsTextBox().Order(1).ShowInGrid().Search(LINQ.Query.Operators.Contains).MaxLength(200);
                ViewConfig("Description").AsTextArea().Order(101).MaxLength(500);
                ViewConfig("Status").AsDropDownList().DataSource(DicKeys.RecordStatus, SourceType.Dictionary).ShowInGrid();
            }
            if (typeof(IImage).IsAssignableFrom(TargetType))
            {
                ViewConfig("ImageUrl").AsTextBox();
                ViewConfig("ImageThumbUrl").AsTextBox();
            }

            ViewConfigure();
        }

        public Dictionary<string, BaseDescriptor> ViewPortDescriptors
        {
            get;
            set;
        }

        public Type TargetType
        {
            get;
            private set;
        }
        public Dictionary<string, PropertyInfo> Properties
        {
            get
            {
                var properties = new Dictionary<string, PropertyInfo>();
                TargetType.GetProperties().Each(m => properties.Add(m.Name, m));
                return properties;
            }
        }

        
        protected abstract void ViewConfigure();
      
      
        protected TagsHelper ViewConfig(Expression<Func<T, object>> expression)
        {
            string key = Reflection.LinqExpression.GetPropertyName(expression.Body);
            return ViewConfig(key);
        }
       
        protected TagsHelper ViewConfig(string properyt)
        {
            return new TagsHelper(properyt, ViewPortDescriptors, TargetType, TargetType.GetProperty(properyt));
        }      
       
    }

}
