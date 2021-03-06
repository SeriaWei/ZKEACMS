/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace Easy.RuleEngine.Scripting.Compiler
{
    public enum TokenKind
    {
        Invalid,
        Eof,
        OpenParen,
        CloseParen,
        StringLiteral,
        SingleQuotedStringLiteral,
        Identifier,
        Integer,
        Comma,
        Plus,
        Minus,
        Mul,
        Div,
        True,
        False,
        And,
        AndSign,
        Or,
        OrSign,
        Not,
        NotSign,
        Equal,
        EqualEqual,
        NotEqual,
        LessThan,
        LessThanEqual,
        GreaterThan,
        GreaterThanEqual,
        NullLiteral,
        SquareBrackets,
        Money
    }
}