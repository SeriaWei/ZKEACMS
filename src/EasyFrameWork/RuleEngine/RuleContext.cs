/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

namespace Easy.RuleEngine
{
    public class RuleContext
    {
        public string FunctionName { get; set; }
        public object[] Arguments { get; set; }
        public object Result { get; set; }
    }
}