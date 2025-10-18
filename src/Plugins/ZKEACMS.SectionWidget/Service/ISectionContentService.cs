/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.SectionWidget.Models;

namespace ZKEACMS.SectionWidget.Service
{
    public interface ISectionContentService
    {
        SectionContentBase.Types ContentType { get; }
        void AddContent(SectionContent content);
        void UpdateContent(SectionContent content);
        SectionContent GetContent(string contentId);
        void DeleteContent(string contentId);
    }
}
