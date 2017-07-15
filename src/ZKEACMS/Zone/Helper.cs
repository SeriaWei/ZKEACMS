/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Extend;
using ZKEACMS.Layout;
using System.Linq;

namespace ZKEACMS.Zone
{
    public static class Helper
    {
        public static LayoutHtmlCollection GenerateHtml(string[] html, ZoneCollection zones)
        {
            int index = 0;
            foreach (var item in zones)
            {
                if (item.HeadingCode.IsNullOrWhiteSpace())
                {
                    string zoneCode = $"ZONE-{index}";
                    while (zones.Any(m => m.HeadingCode == zoneCode))
                    {
                        index++;
                        zoneCode = $"ZONE-{index}";
                    }
                    item.HeadingCode = zoneCode;
                }
            }
            int zoneIndex = 0;
            var result = new LayoutHtmlCollection();
            for (int i = 0; i < html.Length; i++)
            {
                var item = html[i];
                if (item == ZoneEntity.ZoneTag)
                {
                    var zone = zones[zoneIndex];
                    result.Add(new LayoutHtml { Html = ZoneEntity.ZoneTag });
                    result.Add(new LayoutHtml { Html = zone.HeadingCode });
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
