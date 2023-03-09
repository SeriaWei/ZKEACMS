using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.PendingTask
{
    [DataTable("EA_PendingTask")]
    public class TaskEntity : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string HandlerName { get; set; }
        public string Data { get; set; }
        public string Log { get; set; }
        public string Error { get; set; }
        public int RetryCount { get; set; }
    }
}
