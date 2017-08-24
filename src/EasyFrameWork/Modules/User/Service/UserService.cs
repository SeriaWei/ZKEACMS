/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
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
        public override UserEntity Get(params object[] primaryKey)
        {
            var userEntity = base.Get(primaryKey);
            if (userEntity != null)
            {
                userEntity.Roles = DbContext.UserRoleRelation.Where(m => m.UserID == userEntity.UserID).ToList();
            }
            return userEntity;
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
            if (item.UserID.IsNullOrEmpty() && item.Email.IsNotNullAndWhiteSpace())
            {
                item.UserID = item.Email;
            }
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = item.PassWordNew;
            }
            if (item.PassWord.IsNotNullAndWhiteSpace())
            {
                item.PassWord = ProtectPassWord(item.PassWord);
            }            
            if (Get(item.UserID) != null)
            {
                throw new Exception($"用户 {item.UserID} 已存在");
            }
            base.Add(item);
        }

        public override void Update(UserEntity item, bool saveImmediately = true)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = ProtectPassWord(item.PassWordNew);
            }
            if (item.Roles != null)
            {
                item.Roles.Where(m => m.ActionType == Constant.ActionType.Delete).Each(m => DbContext.UserRoleRelation.Remove(m));
            }
            base.Update(item, saveImmediately);
        }

        public UserEntity Login(string userID, string passWord, UserType userType, string ip)
        {
            if (userID.IsNullOrWhiteSpace() || passWord.IsNullOrWhiteSpace()) return null;
            var result = Get(m => m.UserID == userID && m.UserTypeCD == (int)userType && m.PassWord == ProtectPassWord(passWord)).FirstOrDefault();
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
