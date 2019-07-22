/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.MetaData;
using Easy.Models;
using Easy.Constant;
using Easy.Modules.Role;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Security.Principal;
using Easy.RepositoryPattern;

namespace Easy.Modules.User.Models
{
    [DataTable("Users")]
    public class UserEntity : HumanBase, IUser, IIdentity
    {
        [Key]
        public string UserID { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string PassWord { get; set; }
        [NotMapped]
        public string PassWordNew { get; set; }
        /// <summary>
        /// 时间戳
        /// </summary>
        public long Timestamp { get; set; }
        /// <summary>
        /// 登陆IP
        /// </summary>
        public string LoginIP { get; set; }
        public string PhotoUrl { get; set; }
        public int? UserTypeCD { get; set; }
        /// <summary>
        /// 最后登陆时间
        /// </summary>
        public DateTime? LastLoginDate { get; set; }

        public string UserName { get; set; }

        public string ApiLoginToken { get; set; }

        [NotMapped]        
        public virtual List<UserRoleRelation> Roles { get; set; }
        [NotMapped]
        public override string Title
        {
            get;set;
        }
        [NotMapped]
        public string AuthenticationType { get; set; }
        [NotMapped]
        public bool IsAuthenticated { get; set; }
        [NotMapped]
        public string Name { get { return UserID; } }
        public string ResetToken { get; set; }
        public DateTime? ResetTokenDate { get; set; }
    }
    class UserMetaData : ViewMetaData<UserEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(p => p.PassWord).AsHidden();
            ViewConfig(p => p.PassWordNew).AsTextBox();
            ViewConfig(p => p.UserID).AsTextBox().Required().Order(1).ShowInGrid();
            ViewConfig(p => p.UserName).AsTextBox().Required().Order(2).ShowInGrid();
            ViewConfig(p => p.Email).AsTextBox().Email();
            ViewConfig(p => p.Age).AsTextBox().RegularExpression(RegularExpression.Integer);
            ViewConfig(p => p.LastName).AsTextBox();
            ViewConfig(p => p.FirstName).AsTextBox();
            ViewConfig(p => p.Birthday).AsTextBox().FormatAsDate();
            ViewConfig(p => p.Birthplace).AsTextBox().MaxLength(200);
            ViewConfig(p => p.Address).AsTextBox().MaxLength(200);
            ViewConfig(p => p.ZipCode).AsTextBox().RegularExpression(RegularExpression.ZipCode);
            ViewConfig(p => p.School).AsTextBox().MaxLength(100);
            ViewConfig(p => p.LoginIP).AsTextBox().Hide();
            ViewConfig(p => p.Timestamp).AsHidden();
            ViewConfig(p => p.LastLoginDate).AsTextBox().Hide().FormatAsDate();
            ViewConfig(p => p.Sex).AsDropDownList().DataSource(SourceType.Dictionary);
            ViewConfig(p => p.MaritalStatus).AsDropDownList().DataSource(SourceType.Dictionary);
            ViewConfig(p => p.Roles).AsListEditor();
            ViewConfig(p => p.Description).AsTextArea();
            ViewConfig(p => p.PhotoUrl).AsFileInput();
            ViewConfig(p => p.UserTypeCD).AsDropDownList().DataSource(SourceType.Dictionary);
            ViewConfig(p => p.Title).AsHidden();
            ViewConfig(m => m.ApiLoginToken).AsTextBox().ReadOnly().Hide();


            ViewConfig(p => p.AuthenticationType).AsHidden().Ignore();
            ViewConfig(p => p.IsAuthenticated).AsHidden().Ignore();
            ViewConfig(p => p.Name).AsHidden().Ignore();
            ViewConfig(p => p.ResetToken).AsHidden().Ignore();
            ViewConfig(p => p.ResetTokenDate).AsHidden().Ignore();
        }
    }
}
