using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.GlobalScripts.Models
{
    public class GlobalScript
    {
        public int Location { get; set; }
        public string Script { get; set; }
    }
    public enum ScriptLocation
    {
        Header = 1,
        Footer = 2
    }
}
