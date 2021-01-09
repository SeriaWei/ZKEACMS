/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using DocumentFormat.OpenXml;
using Easy;
using Easy.DataTransfer;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using ZKEACMS.Event;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.FormGenerator.Service.Validator;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormDataService : ServiceBase<FormData, CMSDbContext>, IFormDataService
    {
        private readonly IFormService _formService;
        private readonly IFormDataItemService _formDataItemService;
        private readonly IEnumerable<IFormDataValidator> _formDataValidators;
        private readonly IEventManager _eventManager;
        private static Regex _nameRegex = new Regex(@"(\w+)\[(\d+)\]", RegexOptions.Compiled);

        public FormDataService(IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IFormService formService,
            IFormDataItemService formDataItemService,
            IEnumerable<IFormDataValidator> formDataValidators,
            ILocalize localize, IEventManager eventManager) :
            base(applicationContext, dbContext)
        {
            _formService = formService;
            _formDataItemService = formDataItemService;
            _formDataValidators = formDataValidators;
            _eventManager = eventManager;
        }

        public override ServiceResult<FormData> Add(FormData item)
        {
            var result = base.Add(item);
            if (result.HasViolation)
            {
                return result;
            }
            if (item.Datas != null)
            {
                foreach (var data in item.Datas)
                {
                    data.FormDataId = item.ID;
                    _formDataItemService.Add(data);
                }
            }
            return result;
        }
        public override FormData Get(params object[] primaryKey)
        {
            var formData = base.Get(primaryKey);
            formData.Form = _formService.Get(formData.FormId);
            formData.Datas = _formDataItemService.Get(m => m.FormDataId == formData.ID).ToList();
            MergeDataToForm(formData);
            return formData;
        }

        private void MergeDataToForm(FormData formData)
        {
            if (formData.Form != null)
            {
                foreach (var item in formData.Form.FormFields)
                {
                    List<string> values = new List<string>();
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
                            values.Add(value.FieldValue);
                        }
                    }
                    if (values.Count == 1)
                    {
                        item.Value = values[0];
                    }
                    else if (values.Count > 1)
                    {
                        item.Value = JsonConvert.SerializeObject(values);
                    }

                }
            }
        }

        public ServiceResult<FormData> SaveForm(IFormCollection formCollection, string formId)
        {
            var result = new ServiceResult<FormData>();
            var form = _formService.Get(formId);
            if (form == null)
            {
                result.RuleViolations.Add(new RuleViolation("Form", "Form not found!"));
                return result;
            }
            var formData = new FormData { FormId = formId, Datas = new List<FormDataItem>(), Form = form };

            foreach (var item in formCollection.Keys)
            {
                string id = _nameRegex.Replace(item, evaluator =>
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
                    foreach (var validator in _formDataValidators)
                    {
                        if (!validator.Validate(field, dataitem, out string message))
                        {
                            result.RuleViolations.Add(new RuleViolation(item, message));
                        }
                    }
                    formData.Datas.Add(dataitem);
                }
            }
            MergeDataToForm(formData);
            result.Result = formData;
            if (result.HasViolation)
            {
                return result;
            }
            if (formData.Datas.Any())
            {
                formData.Title = formData.Datas.FirstOrDefault().FieldValue;
            }
            result = Add(formData);
            if (!result.HasViolation)
            {
                FormData data = Get(formData.ID);
                _eventManager.Trigger(Events.OnFormDataSubmitted, data);
            }
            return result;
        }
        public override void Remove(FormData item)
        {
            _formDataItemService.Remove(m => m.FormDataId == item.ID);
            base.Remove(item);
        }

        public MemoryStream Export(int id)
        {
            using (ExcelGenerator excel = new ExcelGenerator())
            {
                FormData formData = Get(id);
                excel.AddRow(row =>
                {
                    foreach (var item in formData.Form.FormFields)
                    {
                        row.AppendCell(item.DisplayName);
                    }
                });
                excel.AddRow(row =>
                {
                    foreach (var item in formData.Form.FormFields)
                    {
                        row.AppendCell(item.DisplayValue());
                    }
                });
                return excel.ToMemoryStream();
            }
        }

        public MemoryStream ExportByForm(string formId)
        {
            using (ExcelGenerator excel = new ExcelGenerator())
            {
                var form = _formService.Get(formId);
                var formDatas = Get(m => m.FormId == formId);
                excel.AddRow(row =>
                {
                    foreach (var item in form.FormFields)
                    {
                        row.AppendCell(item.DisplayName);
                    }
                });
                foreach (var data in formDatas)
                {
                    excel.AddRow(row =>
                    {
                        foreach (var item in Get(data.ID).Form.FormFields)
                        {
                            row.AppendCell(item.DisplayValue());
                        }
                    });
                }
                return excel.ToMemoryStream();
            }
        }
    }
}
