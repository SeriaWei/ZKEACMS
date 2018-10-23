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
            BaseErrorMessage = "{0}的输入的值不符合要求";
        }
        public string Expression { get; set; }

        public override bool Validate(object value)
        {
            if (value == null) return true;
            return Regex.IsMatch(value.ToString(), this.Expression);
        }
    }
}
