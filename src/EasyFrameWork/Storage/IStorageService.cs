/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.Storage
{
    public interface IStorageService
    {
        string CreateFolder(string folder);
        string DeleteFolder(string folder);
        string SaveFile(string file);
        string DeleteFile(string file);
    }
}
