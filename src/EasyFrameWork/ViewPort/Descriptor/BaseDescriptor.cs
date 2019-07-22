/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.Extend;
using Easy.LINQ;
using Easy.Modules.MutiLanguage;
using Easy.Options;
using Easy.ViewPort.Validator;
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
            SearchOperator = Query.Operators.Equal;
        }
        #region Private

        /// <summary>
        /// 数据类型
        /// </summary>
        public Type ModelType { get; private set; }
        #endregion

        #region 公共属性
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
                    return _displayName;
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

            if (!Classes.Contains("form-control"))
            {
                Classes.Add("form-control");
                if (IsRequired)
                {
                    Classes.Add("required");
                }
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
            return result;
        }

        private string GetLocalize(string key)
        {
            var languageService = ServiceLocator.GetService<ILanguageService>();
            var cultureOption = ServiceLocator.GetService<IOptions<CultureOption>>();
            string culture = CultureInfo.CurrentUICulture.Name;
            if (cultureOption != null && cultureOption.Value.Code.IsNotNullAndWhiteSpace())
            {
                culture = cultureOption.Value.Code;
            }
            var language = languageService.Get(key, culture);
            if (language == null)
            {
                string lanValue = key;
                string lanType = "UnKnown";
                string module = "Unknown";
                if (key.Contains("@"))
                {
                    lanValue = key.Split('@')[1];
                    var translated = languageService.Get(n => n.LanKey.EndsWith("@" + lanValue) && n.CultureName == culture).FirstOrDefault();
                    if (translated != null)
                    {
                        lanValue = translated.LanValue;
                    }
                    else
                    {
                        StringBuilder lanValueBuilder = new StringBuilder();
                        if (lanValue.Length > 2 && (lanValue.EndsWith("ID") || lanValue.EndsWith("Id")))
                        {
                            lanValue = lanValue.Substring(0, lanValue.Length - 2);
                        }
                        if (lanValue.Length > 2)
                        {
                            for (int i = 0; i < lanValue.Length; i++)
                            {
                                char charLan = lanValue[i];
                                if (i > 0 && char.IsUpper(charLan))
                                {
                                    lanValueBuilder.Append(' ');
                                }
                                lanValueBuilder.Append(charLan);
                            }
                            lanValue = lanValueBuilder.ToString();
                        }
                    }
                    lanType = "EntityProperty";
                    module = key.Split('@')[0];
                    language = new LanguageEntity
                    {
                        CultureName = culture,
                        LanValue = lanValue,
                        LanKey = key,
                        LanType = lanType,
                        Module = module
                    };
                    languageService.Add(language);
                    return language.LanValue;
                }
                return key;
            }
            return language.LanValue;
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
                item.DisplayName = name;
            }
            return this as T;
        }
        public T AddProperty(string property, string value)
        {
            if (this.Properties.ContainsKey(property))
                this.Properties[property] = value;
            else this.Properties.Add(property, value);
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
            if (!this.Properties.ContainsKey("readonly"))
            {
                this.Properties.Add("readonly", "readonly");
            }
            else
            {
                this.Properties["readonly"] = "readonly";
            }
            if (!this.Properties.ContainsKey("unselectable"))
            {
                this.Properties.Add("unselectable", "on");
            }
            else
            {
                this.Properties["unselectable"] = "on";
            }
            this.IsReadOnly = true;
            return this as T;
        }

        public T AddStyle(string properyt, string value)
        {
            if (this.Styles.ContainsKey(properyt))
            {
                this.Styles[properyt] = value;
            }
            else
            {
                this.Styles.Add(properyt, value);
            }
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
            return this as T;
        }
        public T ShowInGrid(string template)
        {
            this.IsShowInGrid = true;
            this.GridColumnTemplate = template;
            return this as T;
        }
        public T Search(Query.Operators searchOperator)
        {
            this.SearchOperator = searchOperator;
            return this as T;
        }
        #endregion
    }
}
