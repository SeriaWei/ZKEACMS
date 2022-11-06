/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Image
{
    public class ImageHelper
    {
        public static bool IsImage(string extension)
        {
            return Mvc.Common.IsImage(extension);
        }
    }
}
