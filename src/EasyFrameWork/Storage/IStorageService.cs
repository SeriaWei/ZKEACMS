/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.IO;

namespace Easy.Storage
{
    public interface IStorageService
    {
        string SaveFile(Stream stream, string fileName);
        string SaveFile(Stream stream, string directory, string fileName);
        void AppendFile(Stream stream, string filePath);
        void Delete(string filePath);
        void DeleteDirectory(string path);
    }
}
