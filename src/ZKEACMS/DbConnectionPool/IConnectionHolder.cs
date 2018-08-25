using System.Data.Common;

namespace ZKEACMS.DbConnectionPool
{
    public interface IConnectionHolder
    {
        DbConnection DbConnection { get; }
    }
}
