/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;

namespace Easy.Mvc
{
    public static class Common
    {
        static HashSet<string> _imageFiles = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".gif", ".jpg", ".png", ".jpeg", ".bmp", ".svg", ".jpe", ".webp" };
        static HashSet<string> _dangerFiles = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { ".aspx", ".asp", ".exe", ".php", ".jsp", ".htm", ".html", ".xhtml", ".cs", ".bat", ".jar", ".dll", ".com" };
        
        /// <summary>
        /// 判断文件是否能上传
        /// </summary>
        /// <param name="ext">文件扩展名</param>
        /// <returns></returns>
        public static bool IsExecuteableFile(string ext)
        {
            return _dangerFiles.Contains(ext);
        }

        /// <summary>
        /// 判断是否为图片
        /// </summary>
        /// <param name="ext">扩展名</param>
        /// <returns>返回Bool值，是则返回true</returns>
        public static bool IsImage(string ext)
        {
            return _imageFiles.Contains(ext);
        }
    }
}
