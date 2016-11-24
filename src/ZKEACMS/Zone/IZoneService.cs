/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.RepositoryPattern;

namespace ZKEACMS.Zone
{
    public interface IZoneService : IService<ZoneEntity>
    {
        IEnumerable<ZoneEntity> GetZonesByPageId(string pageId);
        IEnumerable<ZoneEntity> GetZonesByLayoutId(string layoutId);
    }
}