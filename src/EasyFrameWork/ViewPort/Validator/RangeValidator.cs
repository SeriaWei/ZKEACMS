/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Extend;

namespace Easy.ViewPort.Validator
{
    public class RangeValidator : ValidatorBase
    {
        public RangeValidator(double min, double max)
        {
            this.Min = min;
            this.Max = max;
            BaseErrorMessage = "{{0}}的值范围应在{0}-{1}之间".FormatWith(Min, Max);
        }
        public double Min { get; set; }
        public double Max { get; set; }

        public override bool Validate(object value)
        {
            if (value == null) return true;
            double val = Convert.ToDouble(value);
            if (val >= Min && val <= Max) return true;
            else return false;
        }
    }
}
