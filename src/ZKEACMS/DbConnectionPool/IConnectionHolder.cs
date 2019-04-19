/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System.Data.Common;

namespace ZKEACMS.DbConnectionPool
{
    public interface IConnectionHolder
    {
        DbConnection DbConnection { get; }
    }
}
