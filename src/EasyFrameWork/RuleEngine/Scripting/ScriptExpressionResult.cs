/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RuleEngine.Scripting.Ast;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RuleEngine.Scripting
{
    public class ScriptExpressionResult
    {
        public AbstractSyntaxTree Tree { get; set; }
        public List<ErrorAstNode> Errors { get; set; }
    }
}
