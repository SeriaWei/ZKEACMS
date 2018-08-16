using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.Models
{
    public class Robots
    {
        public string Content { get; set; }
    }
    class RobotsMetaData : ViewMetaData<Robots>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Content).AsTextArea();
        }
    }
}
