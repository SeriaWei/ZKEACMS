using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Updater.Service
{
    public interface IDbUpdaterService
    {
        void UpdateDatabase();
    }
}
