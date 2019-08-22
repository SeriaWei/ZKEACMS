using IdGen;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy
{
    public class IDGenerator
    {
        public long CreateId()
        {
            return new IdGenerator(0).CreateId();
        }
        public string CreateStringId()
        {
            long id = CreateId();
            byte[] bytes = BitConverter.GetBytes(id);
            return Convert.ToBase64String(bytes).TrimEnd('=').Replace("/", "-").Replace("+", "_");
        }
    }
}
