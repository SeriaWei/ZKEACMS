/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.RepositoryPattern;
using ZKEACMS.Page;

namespace ZKEACMS.Zone
{
    public interface IZoneService : IService<ZoneEntity>
    {
        IEnumerable<ZoneEntity> GetZonesByPage(PageEntity page);
        IEnumerable<ZoneEntity> GetZonesByLayoutId(string layoutId);
    }
}