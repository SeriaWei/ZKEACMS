/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class StringLengthValidator : ValidatorBase
    {
        public StringLengthValidator(int min, int max)
        {
            this.Max = max;
            this.Min = min;
            if (Max > 0)
            {
                this.BaseErrorMessage = "{{0}}的长度应大于{0}且小于{1}".FormatWith(Min, Max);
            }
            else
            {
                this.BaseErrorMessage = "{{0}}的长度应小于{0}".FormatWith(Max);
            }
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
