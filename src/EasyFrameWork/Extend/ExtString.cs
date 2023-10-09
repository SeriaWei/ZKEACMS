/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace Easy.Extend
{
    public static partial class ExtString
    {
        [GeneratedRegex("<script[\\s\\S]*?</script>", RegexOptions.IgnoreCase)]
        private static partial Regex RegexScripts();
        [GeneratedRegex("<noscript[\\s\\S]*?</noscript>", RegexOptions.IgnoreCase)]
        private static partial Regex RegexNoScript();
        [GeneratedRegex("<style[\\s\\S]*?</style>", RegexOptions.IgnoreCase)]
        private static partial Regex RegexStyle();
        [GeneratedRegex("<.*?>", RegexOptions.IgnoreCase)]
        private static partial Regex RegexTags();
        [GeneratedRegex("<(.[^>]*)>", RegexOptions.IgnoreCase)]
        private static partial Regex RegexTag2();
        [GeneratedRegex("([\\r\\n])[\\s]+", RegexOptions.IgnoreCase)]
        private static partial Regex RegexWhiteSpace();
        [GeneratedRegex("-->", RegexOptions.IgnoreCase)]
        private static partial Regex RegexCommentEnd();
        [GeneratedRegex("<!--.*", RegexOptions.IgnoreCase)]
        private static partial Regex RegexCommentBegin();
        [GeneratedRegex("&(quot|#34);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexQuote();
        [GeneratedRegex("&(amp|#38);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexAMP();
        [GeneratedRegex("&(lt|#60);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexLt();
        [GeneratedRegex("&(gt|#62);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexGt();
        [GeneratedRegex("&(nbsp|#160);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexNbsp();
        [GeneratedRegex("&(iexcl|#161);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexIexcl();
        [GeneratedRegex("&(cent|#162);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexCent();
        [GeneratedRegex("&(pound|#163);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexPound();
        [GeneratedRegex("&(copy|#169);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexCopy();
        [GeneratedRegex("&#(\\d+);", RegexOptions.IgnoreCase)]
        private static partial Regex RegexNumber();
        [GeneratedRegex("^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$",  RegexOptions.Singleline | RegexOptions.CultureInvariant)]
        private static partial Regex RegexEmail();
        [GeneratedRegex("(http|https)://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?", RegexOptions.Singleline | RegexOptions.CultureInvariant)]
        private static partial Regex RegexUrl();

        public static string RemoveHtml(this string Htmlstring)
        {
            const string _singleSpace = " ";

            Htmlstring = RegexScripts().Replace(Htmlstring, string.Empty);
            Htmlstring = RegexNoScript().Replace(Htmlstring, string.Empty);
            Htmlstring = RegexStyle().Replace(Htmlstring, string.Empty);
            Htmlstring = RegexTags().Replace(Htmlstring, string.Empty);
            Htmlstring = RegexTag2().Replace(Htmlstring, _singleSpace);
            Htmlstring = RegexWhiteSpace().Replace(Htmlstring, _singleSpace);
            Htmlstring = RegexCommentEnd().Replace(Htmlstring, _singleSpace);
            Htmlstring = RegexCommentBegin().Replace(Htmlstring, _singleSpace);
            Htmlstring = RegexQuote().Replace(Htmlstring, "\"");
            Htmlstring = RegexAMP().Replace(Htmlstring, "&");
            Htmlstring = RegexLt().Replace(Htmlstring, "<");
            Htmlstring = RegexGt().Replace(Htmlstring, ">");
            Htmlstring = RegexNbsp().Replace(Htmlstring, string.Empty);
            Htmlstring = RegexIexcl().Replace(Htmlstring, "\xa1");
            Htmlstring = RegexCent().Replace(Htmlstring, "\xa2");
            Htmlstring = RegexPound().Replace(Htmlstring, "\xa3");
            Htmlstring = RegexCopy().Replace(Htmlstring, "\xa9");
            Htmlstring = RegexNumber().Replace(Htmlstring, _singleSpace);
            return Htmlstring;
        }


        public static byte[] ToByte(this string value)
        {
            return Encoding.UTF8.GetBytes(value);
        }


        public static string HtmlDecode(this string value)
        {
            return System.Net.WebUtility.HtmlDecode(value);
        }

        public static string HtmlEncode(this string value)
        {
            return System.Net.WebUtility.HtmlEncode(value);
        }

        public static string UrlEncode(this string value)
        {
            StringBuilder sb = new StringBuilder();
            byte[] byStr = Encoding.UTF8.GetBytes(value);
            for (int i = 0; i < byStr.Length; i++)
            {
                sb.Append(@"%" + Convert.ToString(byStr[i], 16));
            }
            return sb.ToString();
        }


        public static string ToUnicode(this string value)
        {
            if (string.IsNullOrEmpty(value)) return value;
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < value.Length; i++)
            {
                builder.Append("\\u" + ((int)value[i]).ToString("x"));
            }
            return builder.ToString();
        }

        public static string FormatWith(this string instance, params object[] args)
        {
            return string.Format(instance, args);
        }



        public static T ToEnum<T>(this string instance, T defaultValue) where T : struct, IComparable, IFormattable
        {
            T convertedValue = defaultValue;

            if (!string.IsNullOrWhiteSpace(instance) && !Enum.TryParse(instance.Trim(), true, out convertedValue))
            {
                convertedValue = defaultValue;
            }

            return convertedValue;
        }

        public static T ToEnum<T>(this int instance, T defaultValue) where T : struct, IComparable, IFormattable
        {
            T convertedValue;

            if (!Enum.TryParse(instance.ToString(), true, out convertedValue))
            {
                convertedValue = defaultValue;
            }

            return convertedValue;
        }


        public static bool IsEmail(this string instance)
        {
            return !string.IsNullOrWhiteSpace(instance) && RegexEmail().IsMatch(instance);
        }

        public static bool IsWebUrl(this string instance)
        {
            return !string.IsNullOrWhiteSpace(instance) && RegexUrl().IsMatch(instance);
        }


        public static bool AsBool(this string instance)
        {
            bool result = false;
            bool.TryParse(instance, out result);
            return result;
        }

        public static DateTime AsDateTime(this string instance)
        {
            DateTime result = DateTime.MinValue;
            DateTime.TryParse(instance, out result);
            return result;
        }

        public static decimal AsDecimal(this string instance)
        {
            var result = (decimal)0.0;
            decimal.TryParse(instance, out result);
            return result;
        }

        public static int AsInt(this string instance)
        {
            var result = 0;
            int.TryParse(instance, out result);
            return result;
        }

        public static bool IsInt(this string instance)
        {
            int result;
            return int.TryParse(instance, out result);
        }

        public static bool IsDateTime(this string instance)
        {
            DateTime result;
            return DateTime.TryParse(instance, out result);
        }

        public static bool IsFloat(this string instance)
        {
            float result;
            return float.TryParse(instance, out result);
        }

        public static bool IsNullOrWhiteSpace(this string instance)
        {
            return string.IsNullOrWhiteSpace(instance);
        }

        public static bool IsNotNullAndWhiteSpace(this string instance)
        {
            return !string.IsNullOrWhiteSpace(instance);
        }


        public static bool IsNullOrEmpty(this string theString)
        {
            return string.IsNullOrEmpty(theString);
        }

        public static string ToCamelCaseNaming(this string instance)
        {
            return System.Text.Json.JsonNamingPolicy.CamelCase.ConvertName(instance);
        }
        public static string ToFilePath(this string path)
        {
            return Path.Combine(path.SplitWithDirectorySeparatorChar());
        }
        public static string CombinePath(this string p, string path)
        {
            return $"{p.TrimEnd(Path.DirectorySeparatorChar)}{Path.DirectorySeparatorChar}{path.ToFilePath()}";
        }
        public static string[] SplitWithDirectorySeparatorChar(this string path)
        {
            return path.Split(new char[] { '/','\\' }, StringSplitOptions.RemoveEmptyEntries);
        }
        public static string ToWebPath(this string path)
        {
            return string.Join('/', path.SplitWithDirectorySeparatorChar());
        }
    }
}
