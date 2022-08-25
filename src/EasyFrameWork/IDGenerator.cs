/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using IdGen;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy
{
    public class IDGenerator
    {
        private static IdGenerator idGenerator = new IdGenerator(0);
        public long CreateId()
        {
            return idGenerator.CreateId();
        }
        public string CreateStringId()
        {
            long id = CreateId();
            byte[] bytes = BitConverter.GetBytes(id);
            return Convert.ToBase64String(bytes).TrimEnd('=').Replace("/", "-").Replace("+", "_");
        }
    }
}
