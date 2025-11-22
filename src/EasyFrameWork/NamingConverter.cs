using Easy.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy
{
    public class NamingConverter
    {
        public NamingConverter(NameCaseStrategy strategy)
        {
            Strategy = strategy;
        }

        public NameCaseStrategy Strategy { get; set; }

        public string Prefix { get; set; }

        public string Suffix { get; set; }

        public string ConvertName(string name)
        {
            if (string.IsNullOrEmpty(name)) return name;

            var result = name;

            result = Strategy switch
            {
                NameCaseStrategy.LowerCase => result.ToLower(),
                NameCaseStrategy.UpperCase => result.ToUpper(),
                NameCaseStrategy.CamelCase => ToCamelCase(result),
                NameCaseStrategy.PascalCase => ToPascalCase(result),
                NameCaseStrategy.SnakeCase => ToSnakeCase(result),
                NameCaseStrategy.KebabCase => ToKebabCase(result),
                _ => result
            };

            if (!string.IsNullOrEmpty(Prefix)) result = Prefix + result;
            if (!string.IsNullOrEmpty(Suffix)) result = result + Suffix;

            return result;
        }

        private static string ToCamelCase(string name)
        {
            if (string.IsNullOrEmpty(name)) return name;
            return char.ToLower(name[0]) + name.Substring(1);
        }

        private static string ToPascalCase(string name)
        {
            if (string.IsNullOrEmpty(name)) return name;
            return char.ToUpper(name[0]) + name.Substring(1);
        }

        private static string ToSnakeCase(string name)
        {
            var result = new StringBuilder();
            result.Append(char.ToLower(name[0]));

            for (int i = 1; i < name.Length; i++)
            {
                if (char.IsUpper(name[i]))
                {
                    result.Append('_');
                    result.Append(char.ToLower(name[i]));
                }
                else
                {
                    result.Append(name[i]);
                }
            }

            return result.ToString();
        }

        private static string ToKebabCase(string name)
        {
            return ToSnakeCase(name).Replace('_', '-');
        }
    }
}
