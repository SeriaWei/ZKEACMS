using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.ViewModels
{
    public class SignInViewModel
    {
        public string UserID { get; set; }
        public string PassWord { get; set; }
    }
    class SignInViewModelMetaData : ViewMetaData<SignInViewModel>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.UserID).AsTextBox().Required().SetDisplayName("AdminSignViewModel@UserID");
            ViewConfig(m => m.PassWord).AsPassWord().Required().SetDisplayName("AdminSignViewModel@PassWord");
        }
    }
}
