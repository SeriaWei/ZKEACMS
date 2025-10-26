/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Distribution.Models;

namespace ZKEACMS.Distribution.Service
{
    public interface IPersistKeyService
    {
        List<PersistKey> GetPersistKeys();
        void Save(PersistKey persistKey);
    }
}
