using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.ViewModels
{
    public class AdminSignViewModel
    {
        public string UserID { get; set; }
        public string PassWord { get; set; }
        public string Captcha { get; set; }
    }
    class AdminSignViewModelMetaData : ViewMetaData<AdminSignViewModel>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.UserID).AsTextBox().Required();
            ViewConfig(m => m.PassWord).AsPassWord().Required();
            ViewConfig(m => m.Captcha).AsImageCaptcha();
        }
    }
}
