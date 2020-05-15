/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class RequiredValidator : ValidatorBase
    {
        public RequiredValidator()
        {
            BaseErrorMessage = "{0} is required";
        }
        public override bool Validate(object value)
        {
            if (value == null || value.ToString().IsNullOrEmpty()) return false;
            else return true;
        }
    }
}
