/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.MetaData;
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
    class ResetViewModelMetaData : ViewMetaData<ResetViewModel>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ResetToken).AsHidden().Required();
            ViewConfig(m => m.Protect).AsHidden().Required();
            ViewConfig(m => m.PassWord).AsPassWord().Required();
            ViewConfig(m => m.PassWordNew).AsPassWord().Required();
        }
    }
}
