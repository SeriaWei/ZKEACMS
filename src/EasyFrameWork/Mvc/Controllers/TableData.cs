/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.Mvc.Controllers
{
    public class TableData
    {
        public TableData(IEnumerable data, int recordsTotal, int draw)
        {
            Draw = draw;
            RecordsTotal = recordsTotal;
            RecordsFiltered = recordsTotal;
            Data = data;
        }
        public int Draw { get; set; }
        public int RecordsTotal { get; set; }
        public int RecordsFiltered { get; set; }
        public IEnumerable Data { get; set; }
    }
}
