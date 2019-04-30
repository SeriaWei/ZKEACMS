/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
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
    public class ExcelGenerator : IDisposable
    {
        private MemoryStream memoryStream;
        private SheetData sheetData;
        private WorkbookPart workbookpart;
        private SpreadsheetDocument spreadsheetDocument;
        public ExcelGenerator()
        {
            memoryStream = new MemoryStream();
            spreadsheetDocument = SpreadsheetDocument.Create(memoryStream, SpreadsheetDocumentType.Workbook);
            workbookpart = spreadsheetDocument.AddWorkbookPart();
            workbookpart.Workbook = new Workbook();
            WorksheetPart worksheetPart = workbookpart.AddNewPart<WorksheetPart>();
            worksheetPart.Worksheet = new Worksheet(new SheetData());
            Sheets sheets = spreadsheetDocument.WorkbookPart.Workbook.AppendChild(new Sheets());
            Sheet sheet = new Sheet() { Id = spreadsheetDocument.WorkbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = "Sheet1" };
            sheets.Append(sheet);
            sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
        }

        public void Dispose()
        {
            spreadsheetDocument.Dispose();
            memoryStream.Close();
            memoryStream.Dispose();
        }
        public void AddRow(Action<Row> newrow)
        {
            Row row = new Row();
            sheetData.Append(row);
            newrow(row);
        }
        public MemoryStream ToMemoryStream()
        {
            workbookpart.Workbook.Save();
            spreadsheetDocument.Close();
            memoryStream.Position = 0;
            return new MemoryStream(memoryStream.ToArray());
        }
    }
    public static class OpenXmlExt
    {
        public static void AppendCell(this Row row, string value)
        {
            Cell dataCell = new Cell();
            row.AppendChild(dataCell);
            dataCell.CellValue = new CellValue(value);
            dataCell.DataType = new EnumValue<CellValues>(CellValues.String);
        }
    }
}
