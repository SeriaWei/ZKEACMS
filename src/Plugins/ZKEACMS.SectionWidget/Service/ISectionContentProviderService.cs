/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.SectionWidget.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.SectionWidget.Service
{
    public interface ISectionContentProviderService : IService<SectionContentBasePart>
    {
        void Add(SectionContent content);
        void Update(SectionContent content);
        SectionContent GetContent(string contentId);
        SectionContent FillContent(SectionContent content);
        void SaveSort(SectionContent content);
    }
}