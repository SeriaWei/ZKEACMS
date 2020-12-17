/*!
 * http://www.zkea.net/
 * Copyright 2020 ZKEASOFT
 * http://www.zkea.net/licenses
 */


using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Updater.Models
{
    [DataTable("DBVersion")]
    public class DBVersion : Easy.Version
    {
        [Key]
        public int ID { get; set; }
    }
}
