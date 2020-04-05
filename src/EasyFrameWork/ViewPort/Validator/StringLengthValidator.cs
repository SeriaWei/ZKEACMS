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
            if (Max > 0 && Min > 0)
            {
                this.BaseErrorMessage = "{0} length should be between {1} to {2}";
            }
            else if (Max > 0)
            {
                this.BaseErrorMessage = "{0} length should be less than {1}";
            }
            else if (Min > 0)
            {
                this.BaseErrorMessage = "{0} length should be greater than {1}";
            }

        }
        public int Max { get; set; }
        public int Min { get; set; }

        public override bool Validate(object value)
        {

            if (value == null) return true;
            string val = value.ToString();

            if (Max > 0 && Min > 0)
            {
                return val.Length >= Min && val.Length <= Max;
            }
            else if (Max > 0)
            {
                return val.Length <= Max;
            }
            else if (Min > 0)
            {
                return val.Length >= Min;
            }
            else
            {
                return false;
            }
        }
        public override string FormatMessage(string key)
        {
            if (Max > 0 && Min > 0)
            {
                return string.Format(key, GetDisplayName(), Min, Max);
            }
            else if (Max > 0)
            {
                return string.Format(key, GetDisplayName(), Max);
            }
            else if (Min > 0)
            {
                return string.Format(key, GetDisplayName(), Min);
            }
            return string.Empty;
        }
    }
}
