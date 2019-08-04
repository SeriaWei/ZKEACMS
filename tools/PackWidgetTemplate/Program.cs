using System;
using System.IO;
using System.IO.Compression;

namespace PackWidgetTemplate
{
    class Program
    {
        static void Main(string[] args)
        {
            DirectoryInfo current = new DirectoryInfo(System.IO.Directory.GetCurrentDirectory());
            DirectoryInfo root = current;
            while (true)
            {
                root = root.Parent;
                if (root.Name == "tools")
                {
                    root = root.Parent;
                    break;
                }
            }

            FileInfo[] files = root.GetFiles("Widget.*.cshtml", SearchOption.AllDirectories);

            using (FileStream zipToOpen = new FileStream(Path.Combine(root.FullName, "src", "ZKEACMS.WebHost", "Templates.zip"), FileMode.Create))
            {
                using (ZipArchive archive = new ZipArchive(zipToOpen, ZipArchiveMode.Update))
                {
                    foreach (var item in files)
                    {
                        Console.WriteLine(item.Name);
                        ZipArchiveEntry zipArchive = archive.CreateEntry(item.Name);
                        using (Stream zipEntry = zipArchive.Open())
                        {
                            using (FileStream fileStream = item.OpenRead())
                            {
                                byte[] buff = new byte[4096];
                                int len = 0;
                                while ((len = fileStream.Read(buff, 0, buff.Length)) > 0)
                                {
                                    zipEntry.Write(buff, 0, len);
                                }
                            }
                        }
                    }

                }
            }

        }
    }
}
