/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;
using Easy.Modules.User.Models;
using Easy.Notification;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Notification.ViewModels;
using Microsoft.AspNetCore.DataProtection;
using Easy;

namespace ZKEACMS.Notification
{
    public class NotifyService : INotifyService
    {
        private readonly INotificationManager _notificationManager;
        private readonly IHostOptionProvider _hostOptionProvider;
        private readonly IDataProtectionProvider _dataProtectionProvider;
        private readonly ILocalize _localize;
        public NotifyService(INotificationManager notificationManager, 
            IHostOptionProvider hostOptionProvider, 
            IDataProtectionProvider dataProtectionProvider,
            ILocalize localize)
        {
            _notificationManager = notificationManager;
            _hostOptionProvider = hostOptionProvider;
            _dataProtectionProvider = dataProtectionProvider;
            _localize = localize;
        }
        public void ResetPassword(UserEntity user)
        {
            var dataProtector = _dataProtectionProvider.CreateProtector("ResetPassword");
            _notificationManager.Send(new RazorEmailNotice
            {
                Subject = _localize.Get("Reset password"),
                To = new string[] { user.Email },
                Model = new ResetPasswordViewModel
                {
                    Link = $"{_hostOptionProvider.GetOrigin()}/Account/Reset?token={user.ResetToken}&pt={dataProtector.Protect(user.ResetToken)}"
                },
                TemplatePath = "~/EmailTemplates/ResetPassword.cshtml"
            });
        }
    }
}
