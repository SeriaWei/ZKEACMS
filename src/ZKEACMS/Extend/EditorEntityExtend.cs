/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ZKEACMS.Extend
{
    public static class EditorEntityExtend
    {
        public static IEnumerable<T> RemoveDeletedItems<T>(this IEnumerable<T> editors) where T : EditorEntity
        {
            return editors.Where(m => m.ActionType != Easy.Constant.ActionType.UnAttach && m.ActionType != Easy.Constant.ActionType.Delete);
        }
    }
}
