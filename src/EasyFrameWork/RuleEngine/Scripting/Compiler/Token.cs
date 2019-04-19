/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;

namespace Easy.RuleEngine.Scripting.Compiler
{
    public class Token
    {
        public TokenKind Kind { get; set; }
        public int Position { get; set; }
        public object Value { get; set; }

        public override string ToString()
        {
            return Value == null ? String.Format("Token '{0}' at position {1}", Kind, Position) : String.Format("Token '{0}' ({1}) at position {2}", Kind, Value, Position);
        }
    }
}