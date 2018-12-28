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
using Newtonsoft.Json;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml;
using System.IO;
using Easy.DataTransfer;
using ZKEACMS.FormGenerator.Service.Validator;
using Easy.Notification;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormDataService : ServiceBase<FormData>, IFormDataService
    {
        private readonly IFormService _formService;
        private readonly IFormDataItemService _formDataItemService;
        private readonly IEnumerable<IFormDataValidator> _formDataValidators;
        private readonly INotificationManager _notificationManager;
        public FormDataService(IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IFormService formService,
            IFormDataItemService formDataItemService,
            IEnumerable<IFormDataValidator> formDataValidators,
            INotificationManager notificationManager) :
            base(applicationContext, dbContext)
        {
            _formService = formService;
            _formDataItemService = formDataItemService;
            _formDataValidators = formDataValidators;
            _notificationManager = notificationManager;
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
            return formData;
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
                    foreach (var validator in _formDataValidators)
                    {
                        string message;
                        if (!validator.Validate(field, dataitem, out message))
                        {
                            result.RuleViolations.Add(new RuleViolation(field.DisplayName, message));
                            return result;
                        }
                    }
                    formData.Datas.Add(dataitem);
                }
            }
            if (formData.Datas.Any())
            {
                formData.Title = formData.Datas.FirstOrDefault().FieldValue;
            }
            result = Add(formData);
            if (!result.HasViolation && form.NotificationReceiver.IsNotNullAndWhiteSpace())
            {
                _notificationManager.Send(new RazorEmailNotice
                {
                    Subject = "新的表单提醒",
                    To = form.NotificationReceiver.Split(new char[] { '\r', '\n', ',', ';' }, StringSplitOptions.RemoveEmptyEntries),
                    Model = Get(formData.ID),
                    TemplatePath = "~/wwwroot/Plugins/ZKEACMS.FormGenerator/EmailTemplates/FormDataNotification.cshtml"
                });
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
