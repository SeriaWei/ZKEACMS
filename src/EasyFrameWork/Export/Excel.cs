using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace EasyFrameWork.Export
{
    public class Excel
    {
        public Func<IEnumerable> GetHeaderData { get; set; }
        public Func<object, string> GetHeaderText { get; set; }
        public Func<IEnumerable> GetDataRow { get; set; }
        public Func<object, IEnumerable> GetDataColumn { get; set; }
        public Func<object, string> GetDataText { get; set; }

        public MemoryStream Export(string sheetName = null)
        {
            MemoryStream ms = new MemoryStream();
            SpreadsheetDocument spreadsheetDocument = SpreadsheetDocument.Create(ms, SpreadsheetDocumentType.Workbook);
            WorkbookPart workbookpart = spreadsheetDocument.AddWorkbookPart();
            workbookpart.Workbook = new Workbook();
            WorksheetPart worksheetPart = workbookpart.AddNewPart<WorksheetPart>();
            worksheetPart.Worksheet = new Worksheet(new SheetData());
            Sheets sheets = spreadsheetDocument.WorkbookPart.Workbook.AppendChild(new Sheets());
            Sheet sheet = new Sheet() { Id = spreadsheetDocument.WorkbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = sheetName ?? "sheet" };
            sheets.Append(sheet);
            SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
            Row header = new Row() { RowIndex = 1 };
            sheetData.Append(header);


            foreach (var item in GetHeaderData())
            {
                Cell newCell = new Cell();
                header.InsertBefore(newCell, null);
                newCell.CellValue = new CellValue(GetHeaderText(item));
                newCell.DataType = new EnumValue<CellValues>(CellValues.String);
            }

            foreach (var item in GetDataRow())
            {
                Row rowData = new Row();
                sheetData.Append(rowData);

                foreach (var field in GetDataColumn(item))
                {
                    Cell dataCell = new Cell();
                    rowData.InsertBefore(dataCell, null);
                    dataCell.CellValue = new CellValue(GetDataText(field));
                    dataCell.DataType = new EnumValue<CellValues>(CellValues.String);
                }
            }

            workbookpart.Workbook.Save();
            spreadsheetDocument.Close();
            ms.Position = 0;
            return ms;
        }
    }
}
