/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Currency
{
    public class CurrencyOption
    {
        public int CurrencyID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Symbol { get; set; }
    }
    class CurrencyOptionMetaData : ViewMetaData<CurrencyOption>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Name).AsHidden();
            ViewConfig(m => m.Code).AsHidden();
            ViewConfig(m => m.Symbol).AsHidden();
            ViewConfig(m => m.CurrencyID).AsDropDownList().DataSource(ViewDataKeys.Currency, SourceType.ViewData).Required();
        }
    }
}
