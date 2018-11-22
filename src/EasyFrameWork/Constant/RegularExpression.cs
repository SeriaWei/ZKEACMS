/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.Constant
{
    public class RegularExpression
    {
        /// <summary>
        /// 邮件
        /// </summary>
        public const string Email = @"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
        /// <summary>
        /// 网址
        /// </summary>
        public const string Url = @"[a-zA-z]+://[^\s]*";
        /// <summary>
        /// 中文
        /// </summary>
        public const string Chinese = @"[\u4e00-\u9fa5]";
        /// <summary>
        /// HTML
        /// </summary>
        public const string Html = @"<(\S*?)[^>]*>.*?</\1>|<.*? />";
        /// <summary>
        /// 用户名
        /// </summary>
        public const string UserName = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
        /// <summary>
        /// 固定电话
        /// </summary>
        public const string ChinesePhone = @"\d{3}-\d{8}|\d{4}-\d{7}";
        /// <summary>
        /// 邮政编码
        /// </summary>
        public const string ZipCode = @"[0-9]\d{5}(?!\d)";
        /// <summary>
        /// 身份证
        /// </summary>
        public const string CardID = @"\d{15}|\d{18}";
        /// <summary>
        /// IP地址
        /// </summary>
        public const string IpAddress = @"\d+\.\d+\.\d+\.\d+";
        /// <summary>
        /// 匹配正整数
        /// </summary>
        public const string PositiveIntegers = @"^[1-9]\d*$";
        /// <summary>
        /// 匹配负整数
        /// </summary>
        public const string NegativeIntegers = @"^-[1-9]\d*$";
        /// <summary>
        ///匹配整数
        /// </summary>
        public const string Integer = @"^-?[0-9]+$";
        /// <summary>
        /// 匹配非负整数（正整数 + 0）
        /// </summary>
        public const string PositiveIntegersAndZero = @"^[0-9]+$";
        /// <summary>
        /// 匹配非正整数（负整数 + 0）
        /// </summary>
        public const string NegativeIntegersAndZero = @"^-[0-9]+$";
        /// <summary>
        /// 匹配正浮点数
        /// </summary>
        public const string Float = @"^(\-|\+)?\d+(\.\d+)?$";
        /// <summary>
        /// 匹配由26个英文字母组成的字符串
        /// </summary>
        public const string Letters = @"^[A-Za-z]+$";
        /// <summary>
        /// 匹配由26个英文字母的大写组成的字符串
        /// </summary>
        public const string UppercaseLetters = @"^[A-Z]+$";
        /// <summary>
        /// 匹配由26个英文字母的小写组成的字符串
        /// </summary>
        public const string LowercaseLetters = @"^[a-z]+$";
        /// <summary>
        /// 匹配由数字和26个英文字母组成的字符串
        /// </summary>
        public const string LettersAndNumber = @"^[A-Za-z0-9]+$";
        /// <summary>
        /// 匹配由数字、26个英文字母或者下划线组成的字符串
        /// </summary>
        public const string LettersAndNumberAndLine = @"^\w+$";
    }
}
