using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Easy.Extend
{
    public static class ExtFile
    {
        public static bool ExistDirectory(string path)
        {
            return Directory.Exists(path);
        }

        public static bool ExistFile(string path)
        {
            return File.Exists(path);
        }

        public static string ReadFile(string path)
        {
            if (!ExistFile(path)) return string.Empty;

            return File.ReadAllText(path, Encoding.UTF8);
        }

        public static string[] GetFiles(string path, string searchPattern, SearchOption opt = SearchOption.AllDirectories)
        {
            if (!ExistDirectory(path)) return null;
            return Directory.GetFiles(path, searchPattern, opt);
        }

        public static void WriteFile(string path, string content, Encoding encoding = null)
        {
            if (encoding == null) encoding = Encoding.UTF8;
            string dire = Path.GetDirectoryName(path);
            if (!ExistDirectory(dire)) Directory.CreateDirectory(dire);
            File.WriteAllText(path, content, encoding);
        }

        public static void DeleteFile(string path)
        {
            File.Delete(path);
        }
    }
}
