/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class RequiredValidator : ValidatorBase
    {
        public RequiredValidator()
        {
            
        }
        public override bool Validate(object value)
        {
            if (BaseErrorMessage.IsNotNullAndWhiteSpace())
            {
                BaseErrorMessage = ServiceLocator.GetService<ILocalize>().Get("请输入{0}");
            }
            if (value == null || value.ToString().IsNullOrEmpty()) return false;
            else return true;
        }
    }
}
