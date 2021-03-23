using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.ViewModels
{
    public class CustomerSignInViewModel
    {
        public string Email { get; set; }
        public string PassWord { get; set; }
        public string Captcha { get; set; }
    }
    class CustomerSignInViewModelMetaData : ViewMetaData<CustomerSignInViewModel>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Email).AsTextBox().Email().Required().PlaceHolder("Enter your Email").SetDisplayName("Email");
            ViewConfig(m => m.PassWord).AsPassWord().Required().PlaceHolder("Enter your password").SetDisplayName("Password");
            ViewConfig(m => m.Captcha).AsImageCaptcha();
        }
    }
}
