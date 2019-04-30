/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Account
{
    public class ResetViewModel
    {
        public string PassWord { get; set; }
        public string PassWordNew { get; set; }
        public string ResetToken { get; set; }
        public string Protect { get; set; }
    }
}
