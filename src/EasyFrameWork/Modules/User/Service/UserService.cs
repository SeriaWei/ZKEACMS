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

namespace Easy.Modules.User.Service
{
    public class UserService : ServiceBase<UserEntity, EasyDbContext>, IUserService
    {
        public UserService(IApplicationContext applicationContext) : base(applicationContext)
        {
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
                item.PassWord = EncryptionTool.Encryption(item.PassWordNew);
            }
            base.Add(item);
        }

        public override void Update(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = EncryptionTool.Encryption(item.PassWordNew);
            }
            base.Update(item);
        }

        public UserEntity Login(string userID, string passWord, string ip)
        {
            passWord = EncryptionTool.Encryption(passWord);
            var result = Get(m => m.UserID == userID && m.PassWord == passWord).FirstOrDefault();
            if (result != null)
            {

                result.LastLoginDate = DateTime.Now;
                result.LoginIP = ip;
                Update(result);
            }
            return result;
        }
    }
}
