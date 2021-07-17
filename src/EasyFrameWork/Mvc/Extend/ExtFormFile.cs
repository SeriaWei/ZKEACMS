/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Http;
using System.IO;
using Easy.Extend;

namespace Easy.Mvc.Extend
{
    public static class ExtFormFile
    {
        public static void SaveAs(this IFormFile file, string path)
        {
            if (file.Length > 0)
            {
                path = Path.GetExtension(path).IsNullOrWhiteSpace() ? Path.Combine(path, file.FileName) : path;
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    file.CopyTo(fileStream);
                }
            }
        }
    }
}