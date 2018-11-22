/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.EntityFrameworkCore;
namespace Easy.RepositoryPattern
{
    public interface IOnModelCreating
    {
        void OnModelCreating(ModelBuilder modelBuilder);
    }
}