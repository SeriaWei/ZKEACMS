/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.MetaData;
using Easy.Models;

namespace Easy.Modules.Role
{
    [ViewConfigure(typeof(PermissionMetaData)),Table("Permission")]
    public class Permission : EditorEntity
    {
        public string PermissionKey { get; set; }        
        public int RoleId { get; set; }
        public string Module { get; set; }
    }

    class PermissionMetaData : ViewMetaData<Permission>
    {

        

        protected override void ViewConfigure()
        {

        }
    }
}