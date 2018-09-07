/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Text.RegularExpressions;

namespace Easy.ViewPort.Validator
{
    public class RegularValidator : ValidatorBase
    {
        public RegularValidator(string expression)
        {
            var messageFormat = ServiceLocator.GetService<ILocalize>().Get("{0}的输入的值不舒合要求");
            this.Expression = expression;
            this.BaseErrorMessage = messageFormat;
        }
        public string Expression { get; set; }

        public override bool Validate(object value)
        {
            if (value == null) return true;
           return Regex.IsMatch(value.ToString(), this.Expression);
        }
    }
}
