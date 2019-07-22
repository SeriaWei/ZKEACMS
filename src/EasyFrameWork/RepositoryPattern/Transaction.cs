/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy.RepositoryPattern
{
    public class Transaction : IDisposable
    {
        private readonly IDbContextTransaction _transation = null;
        public Transaction(params DbContext[] dbContexts)
        {
            for (int i = 0; i < dbContexts.Length; i++)
            {
                if (i == 0)
                {
                    _transation = dbContexts[i].Database.BeginTransaction();
                }
                else
                {
                    dbContexts[i].Database.UseTransaction(_transation.GetDbTransaction());
                }
            }
        }
        public Action Invoke { get; set; }
        public void Dispose()
        {
            try
            {
                if (Invoke == null) throw new Exception("Please set Transaction.Invoke!");
                Invoke?.Invoke();
                _transation.Commit();
            }
            catch (Exception ex)
            {
                _transation.Rollback();
                throw ex;
            }
            finally
            {
                _transation.Dispose();
            }
        }
    }
}
