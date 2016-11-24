using Microsoft.AspNetCore.Http;
using System.IO;

namespace Easy.Mvc.Extend
{
    public static class ExtFormFile
    {
        public static void SaveAs(this IFormFile file, string path)
        {
            if (file.Length > 0)
            {
                using (var fileStream = new FileStream(Path.Combine(path, file.FileName), FileMode.Create))
                {
                    file.CopyTo(fileStream);
                }
            }
        }
    }
}