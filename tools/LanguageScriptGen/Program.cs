using Fluid;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;

namespace LanguageScriptGen
{
    class Program
    {
        static void Main(string[] args)
        {
            var parser = new FluidParser();
            Dictionary<string, IFluidTemplate> templates = new Dictionary<string, IFluidTemplate>();
            var templateFiles = Directory.GetFiles(Directory.GetCurrentDirectory(), "*.tpl");

            foreach (var item in templateFiles)
            {
                var fluidTemplate = parser.Parse(File.ReadAllText(item, Encoding.UTF8));
                templates.Add(Path.GetFileName(item), fluidTemplate);
            }
            Dictionary<string, Language[]> languages = JsonSerializer.Deserialize<Dictionary<string, Language[]>>(File.ReadAllText("Languages.json", Encoding.UTF8));
            foreach (var item in templates)
            {
                StringBuilder sqlBuilder = new StringBuilder();
                foreach (var lan in languages.SelectMany(m =>
                {
                    foreach (var item in m.Value)
                    {
                        item.LanKey = m.Key;
                    }
                    return m.Value;
                }))
                {
                    Console.WriteLine("{0}: {1}", item.Key, lan.LanKey);
                    lan.LanValue = lan.LanValue.Replace("'", "''");
                    var context = new TemplateContext(lan);
                    string sql = item.Value.Render(context);
                    sqlBuilder.AppendLine(sql);
                    sqlBuilder.AppendLine();
                }
                if (!Directory.Exists("Script"))
                {
                    Directory.CreateDirectory("Script");
                }
                File.WriteAllText(Path.Combine("Script", item.Key.Replace(".tpl", ".sql")), sqlBuilder.ToString(), Encoding.UTF8);
            }
        }
    }
}
