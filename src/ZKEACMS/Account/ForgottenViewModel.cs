/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Account
{
    public class ForgottenViewModel
    {
        public string Email { get; set; }
        public UserType UserType { get; set; }
    }
    class ForgottenViewModelMetaData : ViewMetaData<ForgottenViewModel>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Email).AsTextBox().Required().Email();
            ViewConfig(m => m.UserType).AsHidden().Required();
        }
    }
}
