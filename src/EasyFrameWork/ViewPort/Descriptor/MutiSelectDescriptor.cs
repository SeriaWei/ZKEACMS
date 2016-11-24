/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.ViewPort.Validator;
using System.Collections.Generic;
using Easy.Constant;
using System.Text;
using Easy.Modules.DataDictionary;
using Easy.Extend;
using System.Linq;
using System.Reflection;

namespace Easy.ViewPort.Descriptor
{
    public class MutiSelectDescriptor : BaseDescriptor<MutiSelectDescriptor>
    {
        private IDictionary<string, string> _data;
        private Func<Dictionary<string, string>> _souceFunc;
        public MutiSelectDescriptor(Type modelType, string property)
            : base(modelType, property)
        {
            this.TagType = HTMLEnumerate.HTMLTagTypes.MutiSelect;
            this.TemplateName = "MutiSelect";
        }
        public IDictionary<string, string> OptionItems
        {
            get
            {
                if (_souceFunc != null)
                {
                    _data = _souceFunc.Invoke();
                }
                return _data ?? (_data = new Dictionary<string, string>());
            }
        }
        public SourceType SourceType { get; set; }
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

        public MutiSelectDescriptor DataSource(string Url)
        {
            if (this.Properties.ContainsKey("DataSource"))
            {
                this.Properties["DataSource"] = Url;
            }
            else
            {
                this.Properties.Add("DataSource", Url);
            }
            return this;
        }

        public MutiSelectDescriptor DataSource(IDictionary<string, string> Data)
        {
            this._data = Data;
            return this;
        }

        public MutiSelectDescriptor DataSource<T>()
        {
            Type dataType = typeof(T);
            if (!dataType.GetTypeInfo().IsEnum)
            {
                throw new Exception(dataType.FullName + ",不是枚举类型。");
            }
            string[] text = Enum.GetNames(dataType);

            for (int i = 0; i < text.Length; i++)
            {
                this._data.Add(Enum.Format(dataType, Enum.Parse(dataType, text[i], true), "d"), text[i]);

            }

            return this;
        }

        public MutiSelectDescriptor DataSource(string dictionaryType, SourceType sourceType)
        {
            this.SourceKey = dictionaryType;
            this.SourceType = sourceType;
            if (sourceType == SourceType.Dictionary)
            {

                IDataDictionaryService dicService = new ServiceLocator().GetService<IDataDictionaryService>();
                if (dicService != null)
                {
                    if (this._data == null)
                    {
                        _data = new Dictionary<string, string>();
                    }
                    var dicts = dicService.Get(m => m.DicName == dictionaryType).ToList();
                    foreach (DataDictionaryEntity item in dicts)
                    {
                        this._data.Add(item.ID.ToString(), item.Title);
                    }
                }

            }
            return this;
        }

        public MutiSelectDescriptor DataSource(SourceType type)
        {
            string dictionaryType = this.ModelType.Name + "@" + this.Name;
            if (type == SourceType.Dictionary)
            {
                var dicService = new ServiceLocator().GetService<IDataDictionaryService>();
                if (dicService != null)
                {
                    if (this._data == null)
                    {
                        _data = new Dictionary<string, string>();
                    }
                    foreach (DataDictionaryEntity item in dicService.Get(m => m.DicName == type.ToString()))
                    {
                        this._data.Add(item.DicValue, item.Title);
                    }
                }
            }
            return this;
        }

        public MutiSelectDescriptor DataSource(Func<Dictionary<string, string>> souceFunc)
        {
            _souceFunc = souceFunc;
            return this;
        }
    }
}
