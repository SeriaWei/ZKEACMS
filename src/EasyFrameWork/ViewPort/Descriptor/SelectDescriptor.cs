/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Modules.DataDictionary;
using System;
using System.Collections.Generic;
using System.Text;
using Easy.ViewPort.Validator;
using System.Reflection;
using Easy.Extend;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;
using Easy.Modules.MutiLanguage;

namespace Easy.ViewPort.Descriptor
{
    public abstract class SelectDescriptor<T> : BaseDescriptor<T> where T : BaseDescriptor
    {
        private Func<Dictionary<string, string>> _souceFunc;
        public SelectDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = GetTagType();
            this.TemplateName = this.TagType.ToString();
        }
        public abstract HTMLEnumerate.HTMLTagTypes GetTagType();
        public IDictionary<string, string> OptionItems
        {
            get
            {
                Dictionary<string, string> data = new Dictionary<string, string>();
                if (_souceFunc == null) return data;

                ILocalize localize = ServiceLocator.GetService<ILocalize>();
                foreach (var item in _souceFunc.Invoke())
                {
                    data[item.Key] = localize.Get(item.Value);
                }
                return data;

            }
        }
        private SourceType _sourceType;
        public SourceType SourceType
        {
            get { return _sourceType; }
            set
            {
                _sourceType = value;

                if (_sourceType == SourceType.Dictionary)
                {
                    _souceFunc = () =>
                    {
                        Dictionary<string, string> data = new Dictionary<string, string>();
                        IDataDictionaryService dicService = ServiceLocator.GetService<IDataDictionaryService>();
                        var dicts = dicService.Get(m => m.DicName == this.SourceKey).OrderBy(m => m.Order);
                        foreach (DataDictionaryEntity item in dicts)
                        {
                            data[item.DicValue] = item.Title;
                        };
                        return data;
                    };

                }
            }
        }
        public string SourceKey { get; set; }
        public string GetOptions()
        {
            var builder = new StringBuilder();
            foreach (var item in OptionItems)
            {
                builder.AppendFormat("<option value='{0}'>{1}</option>", item.Key, item.Value);
            }
            return builder.ToString();
        }

        public T DataSource(IEnumerable<KeyValuePair<string, string>> Data)
        {
            _souceFunc = () =>
            {
                Dictionary<string, string> data = new Dictionary<string, string>();
                foreach (var item in Data)
                {
                    data[item.Key] = item.Value;
                }
                return data;

            };
            return this as T;
        }

        public T DataSource<EnumT>() where EnumT : Enum
        {
            _souceFunc = () =>
            {
                Type dataType = typeof(EnumT);
                Dictionary<string, string> data = new Dictionary<string, string>();
                string[] text = Enum.GetNames(dataType);
                for (int i = 0; i < text.Length; i++)
                {
                    string key = Enum.Format(dataType, Enum.Parse(dataType, text[i], true), "d");
                    data[key] = text[i];
                }
                return data;
            };

            return this as T;
        }
        public T DataSource(string Url)
        {
            this.Properties["DataSource"] = Url;
            return this as T;
        }
        public T DataSource(string dictionaryType, SourceType sourceType)
        {
            this.SourceKey = dictionaryType;
            this.SourceType = sourceType;
            return this as T;
        }

        public T DataSource(SourceType type)
        {
            this.SourceKey = this.ModelType.Name + "@" + this.Name;
            this.SourceType = type;
            return this as T;
        }

        public T DataSource(Func<Dictionary<string, string>> souceFunc)
        {
            _souceFunc = souceFunc;
            return this as T;
        }
    }
}
