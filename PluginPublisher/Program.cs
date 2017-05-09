/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;

namespace PluginPublisher
{
    class Program
    {
        private const string PluginInfoFile = "zkea.plugin";
        private const string PublishTo = @"src\ZKEACMS.WebHost\bin\Release\PublishOutput\";
        private static string[] IgnoreFiles = new string[] { ".cs", ".pdb", ".csproj", ".user" };
        private static string[] IgnoreFoders = new string[] { "obj" };
        static void Main(string[] args)
        {
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
                Console.WriteLine("{0} -> {1}", item.FullName, target);
                if (File.Exists(target))
                {
                    File.Delete(target);
                }
                File.Copy(item.FullName, target);
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