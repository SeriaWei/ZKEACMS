/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;

namespace Easy.Extend
{
    public static class ExtDate
    {
        public static string ToEasyString(this DateTime value)
        {
            DateTime now = DateTime.Now;
            if (now < value) return value.ToString("yyyy/MM/dd");
            TimeSpan dep = now - value;
            if (dep.TotalMinutes < 10)
            {
                return "刚刚";
            }
            else if (dep.TotalMinutes >= 10 && dep.TotalMinutes < 60)
            {
                return (int)dep.TotalMinutes + " 分钟前";
            }
            else if (dep.TotalHours < 24)
            {
                return (int)dep.TotalHours + " 小时前";
            }
            else if (dep.TotalDays < 5)
            {
                return (int)dep.TotalDays + " 天前";
            }
            else return value.ToString("yyyy/MM/dd");
        }
        public static string ToEasyString(this DateTime? value)
        {
            if (value.HasValue) return value.Value.ToEasyString();
            else return string.Empty;
        }
    }
}
