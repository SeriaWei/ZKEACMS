/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy
{
    public enum DbTypes
    {
        /// <summary>
        /// MsSql 2012 and later
        /// </summary>
        MsSql = 1,
        /// <summary>
        /// Before MsSql 2012
        /// </summary>
        MsSqlEarly = 2,
        /// <summary>
        /// SQLlite
        /// </summary>
        Sqlite = 3,
        /// <summary>
        /// MySql
        /// </summary>
        MySql = 4,
        /// <summary>
        /// Oracle
        /// </summary>
        Oracle = 5
    }
}
