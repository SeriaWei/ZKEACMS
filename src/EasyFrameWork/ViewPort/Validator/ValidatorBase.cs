/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.ViewPort.Validator
{
    public abstract class ValidatorBase
    {
        public string Property { get; set; }
        public string DisplayName { get; set; }
        public string BaseErrorMessage { get; protected set; }
        string _ErrorMessage;
        public string ErrorMessage
        {
            get
            {
                if (string.IsNullOrEmpty(_ErrorMessage))
                {
                    var localize = ServiceLocator.GetService<ILocalize>();
                    return string.Format(localize.Get(BaseErrorMessage), DisplayName ?? Property);
                }
                else
                {
                    return _ErrorMessage;
                }
            }
            set { _ErrorMessage = value; }
        }
        public abstract bool Validate(object value);
    }
}
