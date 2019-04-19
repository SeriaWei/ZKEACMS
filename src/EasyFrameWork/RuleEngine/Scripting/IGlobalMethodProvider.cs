/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.RuleEngine.Scripting
{
    public interface IGlobalMethodProvider
    {
        void Process(GlobalMethodContext context);
    }

    public class GlobalMethodContext
    {
        public string FunctionName { get; set; }
        public IList<object> Arguments { get; set; }
        public object Result { get; set; }
    }
}