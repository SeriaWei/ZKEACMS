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
