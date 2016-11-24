/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Extend;
using ZKEACMS.Layout;

namespace ZKEACMS.Zone
{
    public static class Helper
    {
        public static LayoutHtmlCollection GenerateHtml(string[] html, ZoneCollection zones)
        {
            int zoneIndex = 0;
            var result = new LayoutHtmlCollection();
            for (int i = 0; i < html.Length; i++)
            {
                var item = html[i];
                if (item == ZoneEntity.ZoneTag)
                {
                    var zone = zones[zoneIndex];
                    if (zone.ID.IsNullOrWhiteSpace())
                    {
                        zone.ID = Guid.NewGuid().ToString("N");
                    }
                    result.Add(new LayoutHtml { Html = ZoneEntity.ZoneTag });
                    result.Add(new LayoutHtml { Html = zone.ID });
                    result.Add(new LayoutHtml { Html = ZoneEntity.ZoneEndTag });
                    i += 1;
                    zoneIndex++;
                }
                else
                {
                    result.Add(new LayoutHtml { Html = item });
                }
            }
            return result;
        }
    }
}
