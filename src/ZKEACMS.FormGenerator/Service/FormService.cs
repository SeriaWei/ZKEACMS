using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using Newtonsoft.Json;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormService : ServiceBase<Form>, IFormService
    {
        public FormService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
        public override ServiceResult<Form> Add(Form item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            item.FieldsData = JsonConvert.SerializeObject(item.FormFields);
            return base.Add(item);
        }
        public override ServiceResult<Form> Update(Form item)
        {
            item.FieldsData = JsonConvert.SerializeObject(item.FormFields);
            return base.Update(item);
        }
        public override Form Get(params object[] primaryKey)
        {
            var form = base.Get(primaryKey);
            if (form != null)
            {
                form.FormFields = JsonConvert.DeserializeObject<List<FormField>>(form.FieldsData);
            }
            return form;
        }
    }

}
