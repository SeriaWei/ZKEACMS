/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Easy.RepositoryPattern
{
    public class DataTableAttribute : TableAttribute
    {
        public DataTableAttribute(string name) : base(name)
        {

        }
    }
}
