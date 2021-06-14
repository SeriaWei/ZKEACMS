/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Theme;

namespace ZKEACMS.TemplateImporter.Service
{
    public interface ITemplateImporterService
    {
        ThemeEntity Import(string zipFile);
    }
}
