/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Easy.Models
{
    public class EditorEntity
    {

        public virtual string Title { get; set; }
        /// <summary>
        /// 说明
        /// </summary>
        public virtual string Description { get; set; }
        /// <summary>
        /// 是否通过
        /// </summary>
        public virtual int? Status { get; set; }
        /// <summary>
        /// 创建人ID
        /// </summary>
        public virtual string CreateBy { get; set; }
        /// <summary>
        /// 创建人
        /// </summary>
        public virtual string CreatebyName { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        public virtual DateTime? CreateDate { get; set; }
        /// <summary>
        /// 修改人ID
        /// </summary>
        public virtual string LastUpdateBy { get; set; }
        /// <summary>
        /// 最后修改人
        /// </summary>
        public virtual string LastUpdateByName { get; set; }
        /// <summary>
        /// 最后更新日期
        /// </summary>
        public virtual DateTime? LastUpdateDate { get; set; }
        [NotMapped]
        public virtual Constant.ActionType? ActionType { get; set; }
    }

}
