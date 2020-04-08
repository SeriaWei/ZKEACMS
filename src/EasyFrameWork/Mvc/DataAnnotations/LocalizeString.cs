using Easy.Extend;
using Microsoft.Extensions.Localization;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Easy.Mvc.DataAnnotations
{
    public class LocalizeString : IStringLocalizer
    {
        private readonly MetaData.ViewConfigure _viewConfigure;
        public LocalizeString(Type modelType)
        {
            if (modelType.IsClass)
            {
                _viewConfigure = ServiceLocator.GetViewConfigure(modelType);
            }
        }
        public LocalizedString this[string name] => throw new NotImplementedException();

        public LocalizedString this[string name, params object[] arguments]
        {
            get
            {
                if (_viewConfigure != null)
                {
                    var mapping = JsonConvert.DeserializeObject<Mapping>(Encoding.UTF8.GetString(Convert.FromBase64String(name)));
                    var descriptor = _viewConfigure.GetViewPortDescriptor(mapping.Property);
                    if (descriptor != null)
                    {
                        foreach (var item in descriptor.Validator)
                        {
                            if (item.Name == mapping.ValidatorName)
                            {
                                return new LocalizedString(name, item.ErrorMessage);
                            }
                        }
                    }
                }

                return new LocalizedString(name, name);
            }
        }

        public IEnumerable<LocalizedString> GetAllStrings(bool includeParentCultures)
        {
            throw new NotImplementedException();
        }

        public IStringLocalizer WithCulture(CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
