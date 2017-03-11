/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Easy.Modules.User.Models;
using Easy.Extend;
using System.Linq.Expressions;
using Easy.Modules.Role;
using System.Collections;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.DataProtection;

namespace Easy.Modules.User.Service
{
    public class UserService : ServiceBase<UserEntity, EasyDbContext>, IUserService
    {
        private readonly IDataProtectionProvider _dataProtectionProvider;
        private readonly IDataProtector _dataProtector;
        private const string Purpose = "ZKEACMS-User-PassWord";
        public UserService(IApplicationContext applicationContext, IDataProtectionProvider dataProtectionProvider) : base(applicationContext)
        {
            _dataProtectionProvider = dataProtectionProvider;
            _dataProtector = dataProtectionProvider.CreateProtector(Purpose);
        }
        public override DbSet<UserEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Users;
            }
        }
        public override void Add(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = _dataProtector.Protect(item.PassWordNew);
            }
            base.Add(item);
        }

        public override void Update(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = _dataProtector.Protect(item.PassWordNew);
            }
            base.Update(item);
        }

        public UserEntity Login(string userID, string passWord, string ip)
        {
            var result = Get(m => m.UserID == userID).FirstOrDefault();
            if (result != null)
            {
                var pass = _dataProtector.Protect(result.PassWord);
                if (passWord == _dataProtector.Unprotect(result.PassWord))
                {
                    result.LastLoginDate = DateTime.Now;
                    result.LoginIP = ip;
                    Update(result);
                    return result;
                }
            }
            return null;
        }
    }
}
