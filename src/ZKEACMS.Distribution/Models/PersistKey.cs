/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.Distribution.Models
{
    [DataTable("PersistKey")]
    public class PersistKey : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string Value { get; set; }
    }
    class PersistKeyMetaData : ViewMetaData<PersistKey>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
        }
    }
}
