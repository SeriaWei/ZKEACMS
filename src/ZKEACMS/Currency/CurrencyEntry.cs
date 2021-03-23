/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Currency
{
    [DataTable("Currency")]
    public class CurrencyEntry : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Code { get; set; }
        public string Symbol { get; set; }
    }
    class CurrencyEntryMetaData : ViewMetaData<CurrencyEntry>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
        }
    }
}
