/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using Easy.Serializer;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormService : ServiceBase<Form, CMSDbContext>, IFormService
    {
        public FormService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
        public override ErrorOr<Form> Add(Form item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            item.FieldsData = JsonConverter.Serialize(item.FormFields);
            return base.Add(item);
        }
        public override ErrorOr<Form> Update(Form item)
        {
            item.FieldsData = JsonConverter.Serialize(item.FormFields);
            return base.Update(item);
        }
        public override Form Get(params object[] primaryKey)
        {
            var form = base.Get(primaryKey);
            if (form != null)
            {
                form.FormFields = JsonConverter.Deserialize<List<FormField>>(form.FieldsData);
            }
            return form;
        }
    }

}
