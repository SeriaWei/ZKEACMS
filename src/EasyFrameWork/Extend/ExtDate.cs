/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;

namespace Easy.Extend
{
    public static class ExtDate
    {
        public static string ToEasyString(this DateTime value)
        {
            DateTime now = DateTime.Now;
            if (now < value) return value.ToString("g");
            TimeSpan dep = now - value;
            if (dep.TotalMinutes < 10)
            {
                return "Just Now";
            }
            else if (dep.TotalMinutes >= 10 && dep.TotalMinutes < 60)
            {
                return (int)dep.TotalMinutes + " Minutes Ago";
            }
            else if (dep.TotalHours < 24)
            {
                return (int)dep.TotalHours + " Hours Ago";
            }
            else if (dep.TotalDays < 5)
            {
                return (int)dep.TotalDays + " Days Ago";
            }
            else return value.ToString("g");
        }
        public static string ToEasyString(this DateTime? value)
        {
            if (value.HasValue) return value.Value.ToEasyString();
            else return string.Empty;
        }
    }
}
