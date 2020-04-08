/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using System;

namespace Easy.ViewPort.Validator
{
    public abstract class ValidatorBase
    {
        public string Property { get; set; }
        public Func<string> DisplayName { get; set; }
        public string BaseErrorMessage { get; protected set; }
        string _ErrorMessage;
        public string ErrorMessage
        {
            get
            {
                var localize = ServiceLocator.GetService<ILocalize>();
                if (string.IsNullOrEmpty(_ErrorMessage))
                {
                    return FormatMessage(localize.Get(BaseErrorMessage));
                }
                else
                {
                    return localize.Get(_ErrorMessage);
                }
            }
            set { _ErrorMessage = value; }
        }
        public virtual string Name { get { return this.GetType().FullName; } }
        protected virtual string GetDisplayName()
        {
            string name = null;
            if (DisplayName != null)
            {
                name = DisplayName();
            }
            if (string.IsNullOrWhiteSpace(name))
            {
                name = Property;
            }
            return name;
        }
        public virtual string FormatMessage(string key)
        {
            return string.Format(key, GetDisplayName());
        }
        public abstract bool Validate(object value);
    }
}
