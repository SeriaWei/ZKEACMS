﻿using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Common.Models;

namespace ZKEACMS.Common.Service
{
    public interface ITemplateService
    {
        List<string> GetThemeNames();
        TemplateFile Get(int id);
        TemplateFile GetDefaultTemplateFile();
        List<TemplateFile> GetTemplateFiles(Pagination p, string theme = "", string fileName = "");
        string CreateOrUpdate(TemplateFile model);
        void Delete(int id);
    }
}
