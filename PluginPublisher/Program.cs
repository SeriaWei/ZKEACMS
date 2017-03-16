using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;

namespace PluginPublisher
{
    class Program
    {
        private const string PluginInfoFile = ".info";
        private const string PublishTo = @"src\ZKEACMS.WebHost\bin\Release\PublishOutput\";
        private static string[] IgnoreFiles = new string[] { ".cs", ".pdb", ".csproj", ".user" };
        private static string[] IgnoreFoders = new string[] { "obj" };
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to use ZKEACMS!");
            Console.WriteLine("This tool will help you publish your plugins.");
            Console.WriteLine("If ZKEACMS.WebHost have publish to ");
            Console.WriteLine(PublishTo);
            Console.WriteLine("Press any key to start...");
            Console.ReadKey();
            var projectFolder = new DirectoryInfo(Directory.GetCurrentDirectory()).Parent.FullName;
            var modules = new DirectoryInfo(Path.Combine(projectFolder, "src")).GetDirectories();
            foreach (var item in modules)
            {
                string pluginInfo = Path.Combine(item.FullName, PluginInfoFile);
                if (File.Exists(pluginInfo))
                {
                    Console.WriteLine(item.Name);
                    RecurrenceDirectory(item.FullName, Path.Combine(projectFolder, PublishTo, "wwwroot\\Plugins", item.Name));
                }
            }
            Console.WriteLine("Complete!");
            Console.ReadKey();
        }
        static void RecurrenceDirectory(string path, string pluginFolder)
        {
            var currentDirectory = new DirectoryInfo(path);
            foreach (var item in currentDirectory.GetFiles())
            {
                var exten = Path.GetExtension(item.FullName);
                if (IgnoreFiles.Any(m => m == exten))
                {
                    continue;
                }
                var target = Path.Combine(pluginFolder, Path.GetFileName(item.Name));
                var dir = Path.GetDirectoryName(target);
                if (!Directory.Exists(dir))
                {
                    Directory.CreateDirectory(dir);
                }
                if (item.FullName.IndexOf("\\bin\\") > 0)
                {
                    var splitPath = target.Split(new string[] { "\\bin\\" }, StringSplitOptions.RemoveEmptyEntries);
                    target = Path.Combine(splitPath[0], "bin", splitPath[1], "bin", item.Name);
                }
                File.Copy(item.FullName, target, true);
            }

            foreach (var item in currentDirectory.GetDirectories())
            {
                if (IgnoreFoders.Any(m => m == item.Name))
                {
                    continue;
                }
                RecurrenceDirectory(item.FullName, Path.Combine(pluginFolder, item.Name));
            }
        }
    }
}