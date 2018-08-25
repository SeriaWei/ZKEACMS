using Easy;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.ObjectPool;
using System;
using System.Data.Common;
using ZKEACMS.Options;

namespace ZKEACMS
{
    /// <summary>
    /// 仅仅对单独一个数据库提供的连接池，对多个数据库的情形不支持
    /// </summary>
    public class SimpleDbConnectionPool : IDisposable
    {
        public interface IDatabaseConfiguring
        {
            void OnConfiguring(DbContextOptionsBuilder optionsBuilder, DbConnection dbConnectionForReusing);
        }
        public class Options
        {
            public Options() { MaximumRetained = Environment.ProcessorCount * 2; }
            public int MaximumRetained { get; set; }
        }

        private class PooledObjectPolicy : PooledObjectPolicy<DbConnection>
        {
            internal PooledObjectPolicy(int maximumRetained, Func<DbConnection> funcCreateConnection)
            {
                _maximumRetained = maximumRetained;
                _createdObjects = new DbConnection[_maximumRetained];
                _funcCreateConnection = funcCreateConnection;
            }
            internal readonly DbConnection[] _createdObjects;
            private readonly int _maximumRetained;
            private readonly Func<DbConnection> _funcCreateConnection;
            private int _numObjectsInPool;

            public override DbConnection Create()
            {
                int cnt = System.Threading.Interlocked.Increment(ref _numObjectsInPool);
                if (cnt > _maximumRetained)
                {
                    System.Threading.Interlocked.Decrement(ref _numObjectsInPool);
                    return null;
                }
                DbConnection dbConnection = _funcCreateConnection();
                _createdObjects[cnt - 1] = dbConnection;
                return dbConnection;
            }
            public override bool Return(DbConnection obj)
            {
                return true;
            }
        }
        public class TransientObjectHolder : IDisposable
        {
            private readonly SimpleDbConnectionPool _pool;
            private DbConnection _object;
            private readonly bool _objectShouldReturnToPool;

            public TransientObjectHolder(SimpleDbConnectionPool pool)
            {
                _pool = pool;
                _object = _pool._inner?.Get();
                if (_object != null)
                {
                    _objectShouldReturnToPool = true;
                }
                else
                {
                    _object = _pool.CreateDbConnection();
                    _objectShouldReturnToPool = false;
                }
                if (_object != null && _object.State == System.Data.ConnectionState.Closed)
                {//预先打开数据库，为的是确保在使用EF的场合（比如ASP.Net）不会频繁打开/关闭数据库而致使性能下降
                    _object.Open();
                }
            }
            public void Dispose()
            {
                if (_object != null)
                {
                    if (_objectShouldReturnToPool)
                    {
                        _pool._inner.Return(_object);
                    }
                    else
                    {
                        _object.Dispose();
                    }

                    _object = null;
                }
            }
            public DbConnection Object => _object;
        }
        public SimpleDbConnectionPool(Options options, DatabaseOption databaseOption)
        {
            DatabaseOption = databaseOption;
            int maximumRetained = Math.Max(options.MaximumRetained, 0);
            if (maximumRetained > 0)
            {
                _pooledObjectPolicy = new PooledObjectPolicy(maximumRetained, CreateDbConnection);
                _inner = new DefaultObjectPool<DbConnection>(_pooledObjectPolicy, maximumRetained);
            }
        }
        public DatabaseOption DatabaseOption { get; set; }
        public virtual DbConnection CreateDbConnection()
        {
            switch (DatabaseOption.DbType)
            {
                case DbTypes.MsSql:
                    return null;
                case DbTypes.MsSqlEarly:
                    return null;
                case DbTypes.Sqlite:
                    {
                        SqliteConnection result = new SqliteConnection(DatabaseOption.ConnectionString);
                        result.Open();
                        using (SqliteCommand cmd = result.CreateCommand())
                        {
                            cmd.CommandText = "pragma journal_mode=wal;";
                            cmd.CommandText += "pragma read_uncommitted=1;";
                            cmd.ExecuteNonQuery();
                        }
                        return result;
                    }
                case DbTypes.MySql:
                    return null;
            }
            return null;
        }
        public void Dispose()
        {
            if (_pooledObjectPolicy != null)
            {
                DbConnection[] objects = _pooledObjectPolicy._createdObjects;
                for (int i = 0; i < objects.Length; ++i)
                {
                    if (objects[i] != null)
                    {
                        objects[i].Dispose();
                        objects[i] = null;
                    }
                }
            }
        }

        private readonly PooledObjectPolicy _pooledObjectPolicy;
        private readonly ObjectPool<DbConnection> _inner;
    }
}
