/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Text.RegularExpressions;
using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class RegularValidator : ValidatorBase
    {
        public RegularValidator(string expression)
        {
            this.Expression = expression;
        }
        public string Expression { get; set; }

        public override bool Validate(object value)
        {
            if (BaseErrorMessage.IsNotNullAndWhiteSpace())
            {
                BaseErrorMessage = ServiceLocator.GetService<ILocalize>().Get("{0}的输入的值不舒合要求");
            }
            if (value == null) return true;
            return Regex.IsMatch(value.ToString(), this.Expression);
        }
    }
}
