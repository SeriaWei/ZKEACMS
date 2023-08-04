/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.DataTransfer
{
    public sealed class ExcelGenerator : IDisposable
    {
        private readonly MemoryStream _memoryStream;
        private readonly SheetData _sheetData;
        private readonly WorkbookPart _workbookpart;
        private readonly SpreadsheetDocument _spreadsheetDocument;
        public ExcelGenerator()
        {
            _memoryStream = new MemoryStream();
            _spreadsheetDocument = SpreadsheetDocument.Create(_memoryStream, SpreadsheetDocumentType.Workbook);
            _workbookpart = _spreadsheetDocument.AddWorkbookPart();
            _workbookpart.Workbook = new Workbook();
            var worksheetPart = _workbookpart.AddNewPart<WorksheetPart>();
            worksheetPart.Worksheet = new Worksheet(new SheetData());
            var sheets = _spreadsheetDocument.WorkbookPart.Workbook.AppendChild(new Sheets());
            var sheet = new Sheet() { Id = _spreadsheetDocument.WorkbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = "Sheet1" };
            sheets.Append(sheet);
            _sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
        }

        public void Dispose()
        {
            _spreadsheetDocument.Dispose();
            _memoryStream.Close();
            _memoryStream.Dispose();
        }
        public void AddRow(Action<Row> newrow)
        {
            var row = new Row();
            _sheetData.Append(row);
            newrow(row);
        }
        public MemoryStream ToMemoryStream()
        {
            _workbookpart.Workbook.Save();
            _spreadsheetDocument.Dispose();
            _memoryStream.Position = 0;
            return new MemoryStream(_memoryStream.ToArray());
        }
    }
    public static class OpenXmlExt
    {
        public static void AppendCell(this Row row, string value)
        {
            var dataCell = new Cell();
            row.AppendChild(dataCell);
            dataCell.CellValue = new CellValue(value);
            dataCell.DataType = new EnumValue<CellValues>(CellValues.String);
        }
    }
}
