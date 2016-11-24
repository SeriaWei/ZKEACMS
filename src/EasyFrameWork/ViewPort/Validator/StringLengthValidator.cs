/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.ViewPort.Validator
{
    public class StringLengthValidator : ValidatorBase
    {
        public StringLengthValidator(int min, int max)
        {
            if (min > 0)
            {
                this.BaseErrorMessage = "{0}的长度应大于" + min + "且小于" + max;
            }
            else
            {
                this.BaseErrorMessage = "{0}的长度应小于" + max;
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
