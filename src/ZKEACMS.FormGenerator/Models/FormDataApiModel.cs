/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    public class FormDataApiModel
    {
        public int ID { get; set; }
        public IEnumerable<FormDataApiFieldValue> FieldValues { get; set; }
    }
}
