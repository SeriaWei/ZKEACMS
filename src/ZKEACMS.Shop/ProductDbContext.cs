/* http://www.zkea.net/ Copyright 2017
 * ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.Shop
{
    public class OrderDbContext : CMSDbContext
    {
        public OrderDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }
    }
}
