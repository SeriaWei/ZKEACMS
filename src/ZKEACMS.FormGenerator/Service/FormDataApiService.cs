using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;

namespace ZKEACMS.FormGenerator.Service
{
    public class FormDataApiService : IFormDataApiService
    {
        private readonly IFormDataService _formDataService;
        private readonly IFormDataItemService _formDataItemService;

        public FormDataApiService(IFormDataService formDataService, IFormDataItemService formDataItemService)
        {
            _formDataService = formDataService;
            _formDataItemService = formDataItemService;
        }

        public IEnumerable<FormDataApiModel> GetByForm(string formId, int top)
        {
            List<FormDataApiModel> output = new List<FormDataApiModel>();
            var formDatas = _formDataService.Get()
                .Where(m => m.FormId == formId)
                .OrderByDescending(m => m.ID)
                .Take(top)
                .ToList();

            foreach (var item in formDatas)
            {
                item.Datas = _formDataItemService.Get(m => m.FormDataId == item.ID).ToList();
                List<FormDataApiFieldValue> fieldValues = new List<FormDataApiFieldValue>();
                foreach (var dataItem in item.Datas.GroupBy(m => m.FieldId))
                {
                    string[] valueArray = dataItem.Select(m => m.FieldValue).ToArray();
                    FormDataApiFieldValue fieldValue = new FormDataApiFieldValue
                    {
                        FieldId = dataItem.Key,
                        FieldName = dataItem.First().FieldText,
                        FieldValueArray = valueArray,
                        FieldValue = string.Join(',', valueArray)
                    };
                    fieldValues.Add(fieldValue);
                }
                output.Add(new FormDataApiModel
                {
                    ID = item.ID,
                    FieldValues = fieldValues
                });
            }
            return output;
        }
    }
}
