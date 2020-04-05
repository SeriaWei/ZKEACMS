/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.Mvc.Resource
{
    public static class ExtApplicationBuilder
    {
        public static void ConfigureResource(this IApplicationBuilder applicationBuilder)
        {
            foreach (var item in applicationBuilder.ApplicationServices.GetServices<ResourceManager>())
            {
                item.SetupResource();
            }
            FileInfo file = new FileInfo("assets.json");
            if (file.Exists)
            {
                using (StreamReader reader = file.OpenText())
                {
                    var replacement = Newtonsoft.Json.JsonConvert.DeserializeObject<Replacement>(reader.ReadToEnd());
                    if (replacement.Scripts != null)
                    {
                        foreach (var item in ResourceHelper.ScriptSource)
                        {
                            if (replacement.Scripts.ContainsKey(item.Key))
                            {
                                int count = Math.Min(item.Value.Count, replacement.Scripts[item.Key].Count);
                                for (int i = 0; i < count; i++)
                                {
                                    string newSource = replacement.Scripts[item.Key][i];
                                    ResourceEntity resource = item.Value[i];
                                    resource.DebugSource = newSource;
                                    resource.ReleaseSource = newSource;
                                    if (resource.CDN != null)
                                    {
                                        resource.CDN.Enable = false;
                                    }
                                }
                            }
                        }
                    }
                    if (replacement.Styles != null)
                    {
                        foreach (var item in ResourceHelper.StyleSource)
                        {
                            if (replacement.Styles.ContainsKey(item.Key))
                            {
                                int count = Math.Min(item.Value.Count, replacement.Styles[item.Key].Count);
                                for (int i = 0; i < count; i++)
                                {
                                    string newSource = replacement.Styles[item.Key][i];
                                    ResourceEntity resource = item.Value[i];
                                    resource.DebugSource = newSource;
                                    resource.ReleaseSource = newSource;
                                    if (resource.CDN != null)
                                    {
                                        resource.CDN.Enable = false;
                                    }
                                }
                            }
                        }
                    }
                }

            }

        }
    }
}
