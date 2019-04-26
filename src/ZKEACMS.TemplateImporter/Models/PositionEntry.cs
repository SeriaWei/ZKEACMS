using Easy.MetaData;
using Easy.RepositoryPattern;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.TemplateImporter.Models
{
    public class PositionEntry
    {
        public int Position { get; set; }
        public string Entry { get; set; }
    }

}
