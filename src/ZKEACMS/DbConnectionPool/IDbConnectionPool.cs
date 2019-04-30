/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.Extensions.ObjectPool;
using System.Data.Common;

namespace ZKEACMS.DbConnectionPool
{
    public interface IDbConnectionPool
    {
        ObjectPool<DbConnection> ConnectionPool { get; set; }
        DbConnection CreateDbConnection();
    }
}
