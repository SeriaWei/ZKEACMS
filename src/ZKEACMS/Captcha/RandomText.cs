/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
    public class RandomText
    {
        private const string chars = "QWERTYUPASDFGHJKLZXCVBNM74852963";
        public string Generate(int length)
        {
            StringBuilder output = new StringBuilder(length);
            Random r = new Random(DateTime.Now.Millisecond);
            for (int i = 0; i < length; i++)
            {
                output.Append(chars[r.Next(chars.Length)]);
            }
            return output.ToString();
        }
    }
}
