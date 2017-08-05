using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS
{
    public interface IApplicationContextAccessor
    {
        CMSApplicationContext Current { get; }
    }
}
