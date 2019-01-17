using Easy.Extend;
using Easy.Image;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Storage
{
    public class WebStorage : IStorage
    {
        const string WebRoot = "wwwroot";
        const string UploadFolder = "UpLoad";
        const string ImageFolder = "Images";
        const string FileFolder = "Files";

        protected virtual string MapPath(string path)
        {
            return Path.Combine(Directory.GetCurrentDirectory(), WebRoot, path.TrimStart('~').ToFilePath());
        }
        protected virtual string GenerateDictionary(string fileName)
        {
            string folder = ImageHelper.IsImage(Path.GetExtension(fileName)) ? ImageFolder : FileFolder;
            return Path.Combine(new string[] { UploadFolder, folder, DateTime.Now.ToString("yyyyMM") });
        }
        public virtual void AppendFile(Stream stream, string filePath)
        {
            using (FileStream fileStream = new FileStream(MapPath(filePath), FileMode.Append))
            {
                stream.CopyTo(fileStream);
            }
        }

        public virtual async Task AppendFileAsync(Stream stream, string filePath)
        {
            using (FileStream fileStream = new FileStream(MapPath(filePath), FileMode.Append))
            {
                await stream.CopyToAsync(fileStream);
            }
        }

        public virtual void Delete(string filePath)
        {
            FileInfo file = new FileInfo(MapPath(filePath));
            if (file.Exists)
            {
                file.Delete();
            }
        }

        public virtual string SaveFile(Stream stream, string fileName)
        {
            return SaveFile(stream, GenerateDictionary(fileName), fileName);
        }

        public virtual Task<string> SaveFileAsync(Stream stream, string fileName)
        {
            return SaveFileAsync(stream, GenerateDictionary(fileName), fileName);
        }

        public virtual string SaveFile(Stream stream, string directory, string fileName)
        {
            string filePath = Path.Combine(MapPath(directory), fileName);
            DirectoryInfo dir = new DirectoryInfo(Path.GetDirectoryName(filePath));
            if (!dir.Exists)
            {
                dir.Create();
            }
            using (FileStream fileStream = new FileStream(filePath, FileMode.Create))
            {
                stream.CopyTo(fileStream);
            }
            string webPath = string.Join("/", directory.Split(new char[] { Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar }, StringSplitOptions.RemoveEmptyEntries));

            return $"~/{webPath}/{fileName}";
        }

        public virtual async Task<string> SaveFileAsync(Stream stream, string directory, string fileName)
        {
            string filePath = Path.Combine(MapPath(directory), fileName);
            DirectoryInfo dir = new DirectoryInfo(Path.GetDirectoryName(filePath));
            if (!dir.Exists)
            {
                dir.Create();
            }
            using (FileStream fileStream = new FileStream(filePath, FileMode.Create))
            {
                await stream.CopyToAsync(fileStream);
            }
            string webPath = string.Join("/", directory.Split(new char[] { Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar }, StringSplitOptions.RemoveEmptyEntries));

            return $"~/{webPath}/{fileName}";
        }
        public virtual void DeleteDirectory(string path)
        {
            Directory.Delete(MapPath(path), true);
        }

    }
}
