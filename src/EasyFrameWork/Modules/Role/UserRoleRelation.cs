/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using Easy.MetaData;
using Easy.Models;
using Easy.Modules.User.Models;
using Easy.Extend;
using Microsoft.Extensions.DependencyInjection;
using Easy.RepositoryPattern;

namespace Easy.Modules.Role
{
    [DataTable("UserRoleRelation")]
    public class UserRoleRelation : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public int RoleID { get; set; }
        public string UserID { get; set; }
        [NotMapped]
        public override string CreateBy { get; set; }
        [NotMapped]
        public override DateTime? CreateDate { get; set; }
        [NotMapped]
        public override string CreatebyName { get; set; }
        [NotMapped]
        public override string Description { get; set; }
        [NotMapped]
        public override int? Status { get; set; }
        [NotMapped]
        public override string Title { get; set; }
        [NotMapped]
        public override string LastUpdateBy { get; set; }
        [NotMapped]
        public override string LastUpdateByName { get; set; }
        [NotMapped]
        public override DateTime? LastUpdateDate { get; set; }
    }

    class UserRoleRelationMetaData : ViewMetaData<UserRoleRelation>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.RoleID).AsDropDownList().DataSource(() =>
            {
                using (var roleService = ServiceLocator.GetService<IRoleService>())
                {
                    return roleService
                    .Get(m => m.ID > 0)
                    .ToDictionary(m => m.ID.ToString(), n => n.Title);
                }
            });
            ViewConfig(m => m.UserID).AsHidden();
        }
    }
}