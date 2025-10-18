﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Linq;
using System.Text;

namespace ZKEACMS.EventAction.HttpParser.Helps
{
    class HttpBodyParser
    {
        public string Body { get; set; }

        public HttpBodyParser(string[] lines)
        {
            Body = SetBodyFromPost(lines);
        }

        private static string SetBodyFromPost(string[] lines)
        {
            int bodyIndex = DetectBodyRowIndex(lines) + 1;
            if (bodyIndex == 0) return null;

            StringBuilder stringBuilder = new StringBuilder();
            for (int i = bodyIndex; i < lines.Length; i++)
            {
                stringBuilder.AppendLine(lines[i]);
            }
            return stringBuilder.ToString().Trim();
        }
        private static int DetectBodyRowIndex(string[] lines)
        {
            return Array.IndexOf(lines, string.Empty);
        }
    }
}
