/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    public class FormDataApiFieldValue
    {
        public string FieldId { get; set; }
        public string FieldName { get; set; }
        public string FieldValue { get; set; }
        public string[] FieldValueArray { get; set; }
    }
}
