using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.Linq;
using Easy.MetaData;
using System.Reflection;
using Easy.ViewPort.Descriptor;
using Easy.Reflection;

namespace Easy.DataTransfer
{
    public class ExcelReader<T> where T : new()
    {
        private readonly Stream _excelStream;
        private WorkbookPart _workBookPart;
        private ViewConfigure _viewConfigure;
        private PropertyInfo[] _entryProperites;

        public ExcelReader(Stream stream)
        {
            _excelStream = stream;
        }
        public Type EntryType { get { return typeof(T); } }
        public virtual T CellConvert(T item, string header, Cell cell)
        {
            Type type = typeof(T);

            string propertyName = header;
            string value = ReadCellValue(cell);
            if (_viewConfigure != null)
            {
                var descriptor = _viewConfigure.GetViewPortDescriptors(true).FirstOrDefault(m => m.DisplayName == header);
                if (descriptor != null)
                {
                    propertyName = descriptor.Name;
                    var dropdown = descriptor as DropDownListDescriptor;
                    if (dropdown != null)
                    {
                        foreach (var op in dropdown.OptionItems)
                        {
                            if (op.Value == value)
                            {
                                value = op.Key;
                            }
                        }
                    }
                }
            }
            var property = _entryProperites.FirstOrDefault(m => m.Name == propertyName);
            if (property != null && value != null)
            {
                property.SetValue(item, ClassAction.ValueConvert(property, value));
            }

            return item;
        }
        public virtual string ReadCellValue(Cell cell)
        {
            string cellValue = null;
            if (cell.DataType != null && cell.DataType == CellValues.SharedString)
            {
                var stringItem = _workBookPart.SharedStringTablePart.SharedStringTable.Elements<SharedStringItem>().ElementAt(int.Parse(cell.CellValue.InnerText));
                if (stringItem.Text != null)
                {
                    cellValue = stringItem.Text.Text;
                }
                else if (stringItem.InnerText != null)
                {
                    cellValue = stringItem.InnerText;
                }
                else if (stringItem.InnerXml != null)
                {
                    cellValue = stringItem.InnerXml;
                }
            }
            else if (cell.CellValue != null)
            {
                cellValue = cell.CellValue.InnerText;
            }
            return cellValue;
        }
        public IEnumerable<T> ToList()
        {
            _viewConfigure = ServiceLocator.GetViewConfigure(EntryType);
            _entryProperites = EntryType.GetProperties();
            SpreadsheetDocument doc = null;
            try
            {
                doc = SpreadsheetDocument.Open(_excelStream, false);
            }
            catch { }
            if (doc != null)
            {
                using (doc)
                {
                    _workBookPart = doc.WorkbookPart;
                    Sheet mysheet = (Sheet)doc.WorkbookPart.Workbook.Sheets.ChildElements.FirstOrDefault();
                    Worksheet worksheet = ((WorksheetPart)_workBookPart.GetPartById(mysheet.Id)).Worksheet;
                    SheetData sheetData = null;
                    foreach (var item in worksheet.ChildElements)
                    {
                        if (item is SheetData)
                        {
                            sheetData = (SheetData)item;
                            break;
                        }
                    }
                    if (sheetData != null && sheetData.ChildElements.Any())
                    {
                        List<string> header = new List<string>();
                        var headerRow = sheetData.ChildElements.First() as Row;
                        foreach (var cell in headerRow.ChildElements)
                        {
                            var cellItem = cell as Cell;
                            header.Add(ReadCellValue(cellItem));
                        }
                        for (int i = 1; i < sheetData.ChildElements.Count; i++)
                        {
                            T item = new T();
                            for (int j = 0; j < sheetData.ChildElements[i].ChildElements.Count; j++)
                            {
                                CellConvert(item, header[j], sheetData.ChildElements[i].ChildElements[j] as Cell);
                            }

                            yield return item;
                        }
                    }
                }
            }

        }
    }
}
