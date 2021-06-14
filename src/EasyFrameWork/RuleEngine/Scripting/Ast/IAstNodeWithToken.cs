/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting.Ast
{
    public interface IAstNodeWithToken
    {
        Token Token { get; }
    }
}