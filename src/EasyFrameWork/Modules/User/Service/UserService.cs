/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.Extend;
using Easy.Modules.User.Models;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;

namespace Easy.Modules.User.Service
{
    public class UserService : ServiceBase<UserEntity>, IUserService
    {
        public UserService(IApplicationContext applicationContext, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
        }
        public override DbSet<UserEntity> CurrentDbSet
        {
            get
            {
                return (DbContext as EasyDbContext).Users;
            }
        }
        public override UserEntity Get(params object[] primaryKey)
        {
            var userEntity = CurrentDbSet.AsNoTracking().Where(m => m.UserID == primaryKey[0].ToString()).FirstOrDefault();
            if (userEntity != null)
            {
                userEntity.Roles = (DbContext as EasyDbContext).UserRoleRelation.AsNoTracking().Where(m => m.UserID == userEntity.UserID).ToList();
            }
            return userEntity;
        }
        public override IQueryable<UserEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
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
        public override ServiceResult<UserEntity> Add(UserEntity item)
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
            if (!item.Status.HasValue)
            {
                item.Status = (int)RecordStatus.Active;
            }
            if (Get(item.UserID) != null)
            {
                throw new Exception($"用户 {item.UserID} 已存在");
            }
            if (item.Email.IsNotNullAndWhiteSpace() && Count(m => m.Email == item.Email && m.UserTypeCD == item.UserTypeCD) > 0)
            {
                throw new Exception($"邮件地址 {item.Email} 已被使用");
            }
            var result = base.Add(item);
            if (!result.HasViolation)
            {
                if (item.Roles != null)
                {
                    item.Roles.Each(m =>
                    {
                        m.UserID = item.UserID;
                        if (m.ActionType == ActionType.Create)
                        {
                            (DbContext as EasyDbContext).UserRoleRelation.Add(m);
                        }
                    });
                }
                DbContext.SaveChanges();
            }
            return result;
        }

        public override ServiceResult<UserEntity> Update(UserEntity item)
        {
            if (item.PassWordNew.IsNotNullAndWhiteSpace())
            {
                item.PassWord = ProtectPassWord(item.PassWordNew);
            }
            if (item.Roles != null)
            {
                item.Roles.Each(m =>
                {
                    m.UserID = item.UserID;
                    if (m.ActionType == ActionType.Create)
                    {
                        (DbContext as EasyDbContext).UserRoleRelation.Add(m);
                    }
                    else if (m.ID > 0 && m.ActionType == ActionType.Delete)
                    {
                        (DbContext as EasyDbContext).UserRoleRelation.Remove(m);
                    }
                    else if (m.ActionType == ActionType.Update)
                    {
                        (DbContext as EasyDbContext).UserRoleRelation.Update(m);
                    }
                });
            }
            if (item.Email.IsNotNullAndWhiteSpace() && Count(m => m.UserID != item.UserID && m.Email == item.Email && m.UserTypeCD == item.UserTypeCD) > 0)
            {
                throw new Exception($"邮件地址 {item.Email} 已被使用");
            }

            var result = base.Update(item);
            return result;
        }

        public UserEntity Login(string userID, string passWord, UserType userType, string ip)
        {
            if (userID.IsNullOrWhiteSpace() || passWord.IsNullOrWhiteSpace()) return null;
            var result = Get(m => (m.UserID == userID || m.Email == userID) && m.UserTypeCD == (int)userType && m.Status == (int)RecordStatus.Active && m.PassWord == ProtectPassWord(passWord)).FirstOrDefault();
            if (result != null)
            {
                result.LastLoginDate = DateTime.Now;
                result.LoginIP = ip;
                Update(result);
                return result;
            }
            return null;
        }

        public UserEntity SetResetToken(string userID, UserType userType)
        {
            var user = Get(m => (m.UserID == userID || m.Email == userID) && m.UserTypeCD == (int)userType).FirstOrDefault();
            if (user != null)
            {
                user.ResetToken = Guid.NewGuid().ToString("N");
                user.ResetTokenDate = DateTime.Now;
                Update(user);
            }
            return user;
        }

        public bool ResetPassWord(string token, string newPassword)
        {
            var user = Get(m => m.ResetToken == token && m.UserTypeCD == (int)UserType.Customer).FirstOrDefault();
            if (user != null)
            {
                if (user.ResetTokenDate.HasValue && (DateTime.Now - user.ResetTokenDate.Value).TotalHours < 24)
                {
                    user.ResetToken = null;
                    user.ResetTokenDate = null;
                    user.PassWordNew = newPassword;
                    Update(user);
                    return true;
                }
            }
            return false;
        }
    }
}
