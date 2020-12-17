using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Net
{
    public interface IWebClient : IDisposable
    {
        byte[] DownloadData(string address);
        byte[] DownloadData(Uri address);
        Task<byte[]> DownloadDataTaskAsync(string address);
        Task<byte[]> DownloadDataTaskAsync(Uri address);
        string DownloadString(string address);
        string DownloadString(Uri address);
        Task<string> DownloadStringTaskAsync(string address);
        Task<string> DownloadStringTaskAsync(Uri address);
        Stream OpenRead(Uri address);
        Stream OpenRead(string address);
        Task<Stream> OpenReadTaskAsync(string address);
        Task<Stream> OpenReadTaskAsync(Uri address);
        Stream OpenWrite(Uri address, string method);
        Stream OpenWrite(string address, string method);
        Stream OpenWrite(string address);
        Stream OpenWrite(Uri address);
        Task<Stream> OpenWriteTaskAsync(Uri address, string method);
        Task<Stream> OpenWriteTaskAsync(string address);

        Task<Stream> OpenWriteTaskAsync(string address, string method);

        Task<Stream> OpenWriteTaskAsync(Uri address);
        byte[] UploadData(string address, byte[] data);
        byte[] UploadData(string address, string method, byte[] data);
        byte[] UploadData(Uri address, byte[] data);
        byte[] UploadData(Uri address, string method, byte[] data);
        Task<byte[]> UploadDataTaskAsync(string address, byte[] data);
        Task<byte[]> UploadDataTaskAsync(Uri address, string method, byte[] data);
        Task<byte[]> UploadDataTaskAsync(Uri address, byte[] data);
        Task<byte[]> UploadDataTaskAsync(string address, string method, byte[] data);
    }
}
