/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class StringLengthValidator : ValidatorBase
    {
        public StringLengthValidator(int min, int max)
        {
            var localize= ServiceLocator.GetService<ILocalize>();
            if (min > 0)
            {
                this.BaseErrorMessage = localize.Get("{{0}}的长度应大于{0}且小于{1}").FormatWith(min, max);
            }
            else
            {
                this.BaseErrorMessage = localize.Get("{{0}}的长度应小于{0}").FormatWith(max);
            }
            this.Max = max;
            this.Min = min;
        }
        public int Max { get; set; }
        public int Min { get; set; }

        public override bool Validate(object value)
        {
            if (value == null) return true;
            string val = value.ToString();
            if (val.Length <= Max)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
