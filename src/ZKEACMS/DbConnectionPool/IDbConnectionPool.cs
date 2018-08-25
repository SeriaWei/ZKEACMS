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
