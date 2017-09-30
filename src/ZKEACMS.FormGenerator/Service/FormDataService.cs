using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using Microsoft.AspNetCore.Http;
using System.Text.RegularExpressions;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormDataService : ServiceBase<FormData>, IFormDataService
    {
        private readonly IFormService _formService;
        private readonly IFormDataItemService _formDataItemService;
        public FormDataService(IApplicationContext applicationContext, FormGeneratorDbContext dbContext, IFormService formService, IFormDataItemService formDataItemService) : base(applicationContext, dbContext)
        {
            _formService = formService;
            _formDataItemService = formDataItemService;
        }

        public override DbSet<FormData> CurrentDbSet => (DbContext as FormGeneratorDbContext).FormData;
        public override void Add(FormData item)
        {
            base.Add(item);
            if (item.Datas != null)
            {
                foreach (var data in item.Datas)
                {
                    data.FormDataId = item.ID;
                    _formDataItemService.Add(data);
                }
            }
        }
        public override FormData Get(params object[] primaryKey)
        {
            var formData = base.Get(primaryKey);
            formData.Form = _formService.Get(formData.FormId);
            formData.Datas = _formDataItemService.Get(m => m.FormDataId == formData.ID).ToList();
            foreach (var item in formData.Form.FormFields)
            {
                foreach (var value in formData.Datas.Where(m => m.FieldId == item.ID))
                {
                    if (value.OptionValue.IsNotNullAndWhiteSpace() && item.FieldOptions != null && item.FieldOptions.Any())
                    {
                        var option = item.FieldOptions.FirstOrDefault(o => o.Value == value.OptionValue);
                        if (option != null)
                        {
                            option.Selected = true;
                        }
                    }
                    else
                    {
                        item.Value = value.FieldValue;
                    }
                }
            }


            return formData;
        }
        public void SaveForm(IFormCollection formCollection, string formId)
        {
            var form = _formService.Get(formId);
            var formData = new FormData { FormId = formId, Datas = new List<FormDataItem>() };
            Regex regex = new Regex(@"(\w+)\[(\d+)\]");

            foreach (var item in formCollection.Keys)
            {
                string id = regex.Replace(item, evaluator =>
                {
                    return evaluator.Groups[1].Value;
                });
                var field = form.FormFields.FirstOrDefault(m => m.ID == id);
                if (field != null)
                {
                    string value = formCollection[item];
                    FormDataItem dataitem = new FormDataItem { FieldId = field.ID, FieldValue = value, FieldText = field.DisplayName };
                    if (field.FieldOptions != null)
                    {
                        var option = field.FieldOptions.FirstOrDefault(o => o.Value == value);
                        if (option != null)
                        {
                            dataitem.OptionValue = option.Value;
                            dataitem.FieldValue = option.DisplayText;
                        }
                    }
                    formData.Datas.Add(dataitem);
                }
            }
            if (formData.Datas.Any())
            {
                formData.Title = formData.Datas.First().FieldValue;
            }
            
            Add(formData);
        }
        public override void Remove(FormData item, bool saveImmediately = true)
        {
            _formDataItemService.Remove(m => m.FormDataId == item.ID);
            base.Remove(item, saveImmediately);
        }
    }
}
