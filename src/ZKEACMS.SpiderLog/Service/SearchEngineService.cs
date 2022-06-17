/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Concurrent;
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
        private IEnumerable<SearchEngine> searchEngines;
        private readonly ConcurrentDictionary<string, SearchEngine> _searchEnginesDic;
        public SearchEngineService()
        {
            _searchEnginesDic = new ConcurrentDictionary<string, SearchEngine>(StringComparer.OrdinalIgnoreCase);
        }
        public IEnumerable<SearchEngine> Get()
        {
            if (searchEngines != null) return searchEngines;

            string filePath = Path.Combine(PluginBase.GetPath<SpiderLogPlug>(), "SearchEngines.json");
            string json = File.ReadAllText(filePath, Encoding.UTF8);
            return searchEngines = JsonSerializer.Deserialize<List<SearchEngine>>(json);
        }

        public SearchEngine Get(string name)
        {
            try
            {
                return _searchEnginesDic.GetOrAdd(name, GetByName);
            }
            catch
            {
                return null;
            }

        }
        private SearchEngine GetByName(string name)
        {
            var engine = Get().FirstOrDefault(m => m.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
            if (engine == null) throw new Exception($"{name} does not exist.");
            return engine;
        }
    }
}
