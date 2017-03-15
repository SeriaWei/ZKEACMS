using Newtonsoft.Json;
using System;
using System.IO;

namespace PluginPublisher
{
    class Program
    {
        private const string PluginInfoFile = ".info";
        private const string PublishTo = @"D:\Projects\ZKEACMS.Core\src\ZKEACMS.WebHost\bin\Release\PublishOutput\wwwroot\Plugins";
        private string[] CopyFolers = new string[] { "Content", "Scripts" };
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var folder = Path.Combine(new DirectoryInfo(Directory.GetCurrentDirectory()).Parent.FullName, "src");
            var modules = new DirectoryInfo(folder).GetDirectories();
            foreach (var item in modules)
            {
                string pluginInfo = Path.Combine(item.FullName, PluginInfoFile);
                if (File.Exists(pluginInfo))
                {
                    var plugin = JsonConvert.DeserializeObject<PluginInfo>(File.ReadAllText(pluginInfo));
                    plugin.RelativePath = item.FullName;
                    File.Copy(Path.Combine(item.FullName, plugin.DeveloperFileName), Path.Combine(PublishTo, plugin.Name, plugin.FileName));
                }
            }
        }
    }
}