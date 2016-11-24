/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;

namespace Easy.Mvc
{
    public static class Common
    {
        /// <summary>
        /// 判断文件是否能上传
        /// </summary>
        /// <param name="ext">文件扩展名</param>
        /// <returns></returns>
        public static bool FileCanUp(string ext)
        {
            ext = ext.ToLower();
            var exts = new List<string> { ".aspx", ".asp", ".exe", ".php", ".jsp", ".htm", ".html", ".xhtml", ".cs", ".bat", ".jar", ".dll", ".com" };
            return !exts.Contains(ext);
        }

        /// <summary>
        /// 判断是否为图片
        /// </summary>
        /// <param name="ext">扩展名</param>
        /// <returns>返回Bool值，是则返回true</returns>
        public static bool IsImage(string ext)
        {
            ext = ext.ToLower();
            if (ext == ".gif" || ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".bmp")
            {
                return true;
            }
            else return false;
        }


    }
}
