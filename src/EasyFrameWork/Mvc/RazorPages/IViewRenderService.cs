/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.RazorPages
{
    public interface IViewRenderService
    {
        string Render(string viewPath);
        string Render<Model>(string viewPath, Model model);
    }
}
