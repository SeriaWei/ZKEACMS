/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.LINQ;
using Easy.Modules.MutiLanguage;
using Easy.Options;
using Easy.ViewPort.Validator;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Easy.ViewPort.Descriptor
{
    public abstract class BaseDescriptor
    {

        public BaseDescriptor(Type modelType, string property)
        {
            Validator = new List<ValidatorBase>();
            Classes = new List<string>();
            Properties = new Dictionary<string, string>();
            Styles = new Dictionary<string, string>();
            this.ModelType = modelType;
            this.Name = property;
            this.OrderIndex = 100;
            this.IsShowForEdit = true;
            this.IsShowForDisplay = true;
            SearchOperator = Query.Operators.None;
        }
        #region Private
        protected void SetSearch()
        {
            if (this.DataType == typeof(string))
            {
                this.SearchOperator = Query.Operators.Contains;
            }
            else if (this.DataType == typeof(DateTime))
            {
                this.SearchOperator = Query.Operators.Range;
            }
            else
            {
                this.SearchOperator = Query.Operators.Equal;
            }

        }
        protected string PlaceHolderText;
        #endregion

        #region 公共属性
        /// <summary>
        /// 数据类型
        /// </summary>
        public Type ModelType { get; private set; }
        /// <summary>
        /// 标签类型
        /// </summary>
        public HTMLEnumerate.HTMLTagTypes TagType { get; set; }
        /// <summary>
        /// CSS样式Class集合
        /// </summary>
        public List<string> Classes
        {
            get;
            set;
        }
        /// <summary>
        /// 标签属性集合
        /// </summary>
        public Dictionary<string, string> Properties
        {
            get;
            set;
        }
        /// <summary>
        /// 样式Style
        /// </summary>
        public Dictionary<string, string> Styles
        {
            get;
            set;
        }
        /// <summary>
        /// 名称ID
        /// </summary>
        public string Name { get; private set; }
        /// <summary>
        /// 显示名称
        /// </summary>
        private string _displayName;
        public string DisplayName
        {
            get
            {
                if (_displayName.IsNotNullAndWhiteSpace())
                {
                    return GetLocalize(_displayName);
                }
                return GetLocalize($"{ModelType.Name}@{Name}");
            }
            set { _displayName = value; }
        }


        public object DefaultValue { get; set; }


        /// <summary>
        /// 排序索引
        /// </summary>
        public int OrderIndex { get; set; }
        /// <summary>
        /// 数据类型
        /// </summary>
        public Type DataType { get; set; }
        /// <summary>
        /// 验证信息
        /// </summary>
        public List<ValidatorBase> Validator { get; set; }
        /// <summary>
        /// 只读
        /// </summary>
        public bool IsReadOnly { get; set; }
        /// <summary>
        /// 必填
        /// </summary>
        public bool IsRequired { get; set; }
        /// <summary>
        /// 是否在只读视图中显示
        /// </summary>
        public bool IsShowForDisplay { get; set; }
        public bool IsShowForEdit { get; set; }
        public bool IsIgnore { get; set; }

        public bool IsHidden { get; set; }
        public bool IsHideSurroundingHtml { get; set; }
        public bool IsShowInGrid { get; set; }
        public Query.Operators SearchOperator { get; set; }
        public string GridColumnTemplate { get; set; }
        /// <summary>
        /// 显示模板
        /// </summary>
        public string TemplateName { get; set; }

        public string ValueFormat { get; set; }
        #endregion
        public virtual Dictionary<string, object> ToHtmlProperties()
        {
            Dictionary<string, object> result = new Dictionary<string, object>();
            const string formControl = "form-control";
            const string required = "required";
            if (!Classes.Contains(formControl))
            {
                Classes.Add(formControl);
            }
            if (IsRequired && !Classes.Contains(required))
            {
                Classes.Add(required);
            }
            result.Add("class", string.Join(" ", Classes));
            result.Add("style", string.Join(";", Styles.ToList(m => string.Format("{0}:{1}", m.Key, m.Value))));
            Properties.Each(m =>
            {
                if (!result.ContainsKey(m.Key))
                {
                    result.Add(m.Key, m.Value);
                }
            });
            result.Add("data-opeartor", (int)SearchOperator);
            if (PlaceHolderText.IsNotNullAndWhiteSpace())
            {
                result.Add("placeholder", GetLocalize(PlaceHolderText));
            }
            return result;
        }

        private string GetLocalize(string key)
        {
            var localize = ServiceLocator.GetService<ILocalize>();
            var translated = localize.GetOrNull(key);

            if (translated.IsNotNullAndWhiteSpace()) return translated;
            if (!key.Contains("@")) return key;

            string property = key.Split('@')[1];
            translated = localize.GetOrNull(property);
            if (translated.IsNotNullAndWhiteSpace()) return translated;

            if (property.Length <= 2) return property;

            if (property.EndsWith("ID") || property.EndsWith("Id"))
            {
                property = property.Substring(0, property.Length - 2);
            }
            if (property.Length <= 2) return property;

            StringBuilder lanValueBuilder = new StringBuilder();
            for (int i = 0; i < property.Length; i++)
            {
                char charLan = property[i];
                if (i > 0 && i < (property.Length - 1) && char.IsUpper(charLan) && !char.IsUpper(property[i + 1]))
                {
                    lanValueBuilder.Append(' ');
                }
                lanValueBuilder.Append(charLan);
            }
            return lanValueBuilder.ToString();
        }
    }

    public abstract class BaseDescriptor<T> : BaseDescriptor where T : BaseDescriptor
    {
        public BaseDescriptor(Type modelType, string property) : base(modelType, property)
        {
        }
        #region Regular

        public T Required(string errorMessage)
        {
            this.Validator.Add(new RequiredValidator()
            {
                Property = this.Name,
                ErrorMessage = errorMessage
            });
            this.IsRequired = true;
            return this as T;
        }
        public T Required()
        {
            this.Validator.Add(new RequiredValidator()
            {
                Property = this.Name
            });
            this.IsRequired = true;
            return this as T;
        }

        public T SetDisplayName(string name)
        {
            this.DisplayName = name;
            foreach (ValidatorBase item in this.Validator)
            {
                item.DisplayName = () => this.DisplayName;
            }
            return this as T;
        }
        public T AddProperty(string property, string value)
        {
            this.Properties[property] = value;
            return this as T;
        }
        public T AddClass(string name)
        {
            if (!this.Classes.Contains(name))
                this.Classes.Add(name);
            return this as T;
        }

        public T ReadOnly()
        {
            this.Properties["readonly"] = "readonly";
            this.Properties["unselectable"] = "on";
            this.AddStyle("pointer-events", "none");
            this.IsReadOnly = true;
            return this as T;
        }

        public T AddStyle(string properyt, string value)
        {
            this.Styles[properyt] = value;
            return this as T;
        }
        public T Hide()
        {
            this.IsHidden = true;
            return this as T;
        }
        public T HideSurroundingHtml()
        {
            this.IsHideSurroundingHtml = true;
            return this as T;
        }
        public T Ignore()
        {
            this.IsIgnore = true;
            return this as T;
        }

        public T Order(int index)
        {
            this.OrderIndex = index;
            return this as T;
        }
        public T ShowForDisplay(bool show)
        {
            this.IsShowForDisplay = show;
            return this as T;
        }
        public T ShowForEdit(bool show)
        {
            this.IsShowForEdit = show;
            return this as T;
        }
        public T SetTemplate(string template)
        {
            this.TemplateName = template;
            return this as T;
        }
        public T SetGridColumnTemplate(string template)
        {
            this.GridColumnTemplate = template;
            return this as T;
        }
        public T ShowInGrid(bool show = true)
        {
            this.IsShowInGrid = show;
            if (this.IsShowInGrid)
            {
                SetSearch();
            }

            return this as T;
        }
        public T ShowInGrid(string template)
        {
            this.IsShowInGrid = true;
            this.GridColumnTemplate = template;
            SetSearch();
            return this as T;
        }
        public T Search(Query.Operators searchOperator)
        {
            this.SearchOperator = searchOperator;
            return this as T;
        }

        public T PlaceHolder(string info)
        {
            PlaceHolderText = info;
            return this as T;
        }
        #endregion
    }
}
