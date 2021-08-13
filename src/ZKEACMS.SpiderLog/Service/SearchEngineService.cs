/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ZKEACMS.SpiderLog.Models;

namespace ZKEACMS.SpiderLog.Service
{
    public class SearchEngineService : ISearchEngineService
    {
        IEnumerable<SearchEngine> searchEngines;
        public IEnumerable<SearchEngine> Get()
        {
            if (searchEngines != null) return searchEngines;

            string filePath = Path.Combine(PluginBase.GetPath<SpiderLogPlug>(), "SearchEngines.json");
            string json = File.ReadAllText(filePath, Encoding.UTF8);
            return searchEngines = JsonSerializer.Deserialize<List<SearchEngine>>(json);
        }
    }
}
