/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Modules.User.Models;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Security.Cryptography;

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
        private string ProtectPassWord(string passWord)
        {
            if (passWord.IsNotNullAndWhiteSpace())
            {
                using (var sha256 = SHA256.Create())
                {
                    var hashedBytes = sha256.ComputeHash(passWord.ToByte());
                    return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
                }
            }
            return passWord;
        }
        public override void Add(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = ProtectPassWord(item.PassWordNew);
            }
            base.Add(item);
        }

        public override void Update(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = ProtectPassWord(item.PassWordNew);
            }
            base.Update(item);
        }

        public UserEntity Login(string userID, string passWord, string ip)
        {
            if (userID.IsNullOrWhiteSpace() || passWord.IsNullOrWhiteSpace()) return null;
            var result = Get(m => m.UserID == userID && m.PassWord == ProtectPassWord(passWord)).FirstOrDefault();
            if (result != null)
            {
                result.LastLoginDate = DateTime.Now;
                result.LoginIP = ip;
                Update(result);
                return result;
            }
            return null;
        }
    }
}
