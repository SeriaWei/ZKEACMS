/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public interface ISectionGroupService:IService<SectionGroup>
    {
        SectionGroup GenerateContentFromConfig(SectionGroup group);
    }
}