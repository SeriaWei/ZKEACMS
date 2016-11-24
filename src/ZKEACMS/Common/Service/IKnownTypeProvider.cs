using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Common.Service
{
    public interface IKnownTypeProvider
    {
        IEnumerable<Type> GetTypes();
    }
}
