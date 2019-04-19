/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.RuleEngine.Scripting.Compiler
{
    public class Tokenizer
    {
        private readonly string _expression;
        private readonly StringBuilder _stringBuilder;
        private int _index;
        private int _startTokenIndex;

        public Tokenizer(string expression)
        {
            _expression = expression;
            _stringBuilder = new StringBuilder();
        }

        public Token NextToken()
        {
            while (true)
            {
                if (Eof())
                    return CreateToken(TokenKind.Eof);

                _startTokenIndex = _index;
                char ch = Character();
                switch (ch)
                {
                    case '(':
                        NextCharacter();
                        return CreateToken(TokenKind.OpenParen);
                    case ')':
                        NextCharacter();
                        return CreateToken(TokenKind.CloseParen);
                    case ',':
                        NextCharacter();
                        return CreateToken(TokenKind.Comma);
                    case '+':
                        NextCharacter();
                        return CreateToken(TokenKind.Plus);
                    case '-':
                        NextCharacter();
                        return CreateToken(TokenKind.Minus);
                    case '*':
                        NextCharacter();
                        return CreateToken(TokenKind.Mul);
                    case '/':
                        NextCharacter();
                        return CreateToken(TokenKind.Div);
                    case '"':
                        return LexStringLiteral();
                    case '\'':
                        return LexSingleQuotedStringLiteral();
                    case '!':
                        return LexNotSign();
                    case '|':
                        return LexOrSign();
                    case '&':
                        return LexAndSign();
                    case '=':
                        return LexEqual();
                    case '<':
                        return LexLessThan();
                    case '>':
                        return LexGreaterThan();
                    case '[':
                        return LexArrayLiteral();
                }

                if (IsDigitCharacter(ch))
                {
                    return LexInteger();
                }
                if (IsIdentifierCharacter(ch))
                {
                    return LexIdentifierOrKeyword();
                }
                if (IsWhitespaceCharacter(ch))
                {
                    NextCharacter();
                    continue;
                }

                return InvalidToken();
            }
        }

        private Token InvalidToken()
        {
            return CreateToken(TokenKind.Invalid, "Unrecognized character");
        }

        private Token LexNotSign()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '=')
            {
                NextCharacter();
                return CreateToken(TokenKind.NotEqual);
            }
            return CreateToken(TokenKind.NotSign);
        }

        private Token LexOrSign()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '|')
            {
                NextCharacter();
                return CreateToken(TokenKind.OrSign);
            }
            return InvalidToken();
        }

        private Token LexAndSign()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '&')
            {
                NextCharacter();
                return CreateToken(TokenKind.AndSign);
            }
            return InvalidToken();
        }

        private Token LexGreaterThan()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '=')
            {
                NextCharacter();
                return CreateToken(TokenKind.GreaterThanEqual);
            }
            return CreateToken(TokenKind.GreaterThan);
        }

        private Token LexLessThan()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '=')
            {
                NextCharacter();
                return CreateToken(TokenKind.LessThanEqual);
            }
            return CreateToken(TokenKind.LessThan);
        }

        private Token LexEqual()
        {
            NextCharacter();
            char ch = Character();
            if (ch == '=')
            {
                NextCharacter();
                return CreateToken(TokenKind.EqualEqual);
            }
            return CreateToken(TokenKind.Equal);
        }

        private Token LexIdentifierOrKeyword()
        {
            _stringBuilder.Clear();

            _stringBuilder.Append(Character());
            while (true)
            {
                NextCharacter();

                if (!Eof() && (IsIdentifierCharacter(Character()) || IsDigitCharacter(Character())))
                {
                    _stringBuilder.Append(Character());
                }
                else
                {
                    return CreateIdentiferOrKeyword(_stringBuilder.ToString());
                }
            }
        }

        private Token LexInteger()
        {
            _stringBuilder.Clear();

            _stringBuilder.Append(Character());
            bool isMoney = false;
            while (true)
            {
                NextCharacter();

                if (!Eof() && (IsDigitCharacter(Character()) || Character() == '.'))
                {
                    _stringBuilder.Append(Character());
                    if (Character() == '.')
                    {
                        isMoney = true;
                    }
                }
                else
                {
                    if (isMoney)
                    {
                        return CreateToken(TokenKind.Money, decimal.Parse(_stringBuilder.ToString()));
                    }
                    else
                    {
                        return CreateToken(TokenKind.Integer, Int32.Parse(_stringBuilder.ToString()));
                    }

                }
            }
        }

        private Token CreateIdentiferOrKeyword(string identifier)
        {
            switch (identifier)
            {
                case "true":
                    return CreateToken(TokenKind.True, true);
                case "false":
                    return CreateToken(TokenKind.False, false);
                case "or":
                    return CreateToken(TokenKind.Or, null);
                case "and":
                    return CreateToken(TokenKind.And, null);
                case "not":
                    return CreateToken(TokenKind.Not, null);
                case "null":
                case "nil":
                    return CreateToken(TokenKind.NullLiteral, null);
                default:
                    return CreateToken(TokenKind.Identifier, identifier);
            }
        }

        private static bool IsWhitespaceCharacter(char character)
        {
            return char.IsWhiteSpace(character);
        }

        private static bool IsIdentifierCharacter(char ch)
        {
            return
                (ch >= 'a' && ch <= 'z') ||
                (ch >= 'A' && ch <= 'Z') ||
                (ch == '_');
        }

        private static bool IsDigitCharacter(char ch)
        {
            return ch >= '0' && ch <= '9';
        }

        private Token LexSingleQuotedStringLiteral()
        {
            _stringBuilder.Clear();

            while (true)
            {
                NextCharacter();

                if (Eof())
                    return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                // Termination
                if (Character() == '\'')
                {
                    NextCharacter();
                    return CreateToken(TokenKind.SingleQuotedStringLiteral, _stringBuilder.ToString());
                }
                // backslash notation
                if (Character() == '\\')
                {
                    NextCharacter();

                    if (Eof())
                        return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                    switch (Character())
                    {
                        case '\\':
                            _stringBuilder.Append('\\');
                            break;
                        case '\'':
                            _stringBuilder.Append('\'');
                            break;
                        default:
                            _stringBuilder.Append('\\');
                            _stringBuilder.Append(Character());
                            break;
                    }
                }
                // Regular character in string
                else
                {
                    _stringBuilder.Append(Character());
                }
            }
        }

        private Token LexStringLiteral()
        {
            _stringBuilder.Clear();

            while (true)
            {
                NextCharacter();

                if (Eof())
                    return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                // Termination
                if (Character() == '"')
                {
                    NextCharacter();
                    return CreateToken(TokenKind.StringLiteral, _stringBuilder.ToString());
                }
                // backslash notation
                if (Character() == '\\')
                {
                    NextCharacter();

                    if (Eof())
                        return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                    _stringBuilder.Append(Character());
                }
                // Regular character in string
                else
                {
                    _stringBuilder.Append(Character());
                }
            }
        }

        private Token LexArrayLiteral()
        {
            _stringBuilder.Clear();
            List<object> arguments = new List<object>();
            bool checkDigit = false;
            bool isDigit = false;
            Action addToArguments = () =>
            {
                if (_stringBuilder[0] == '\'' || _stringBuilder[0] == '"')
                {
                    _stringBuilder.Remove(0, 1);
                }
                if (_stringBuilder[_stringBuilder.Length - 1] == '\'' || _stringBuilder[_stringBuilder.Length - 1] == '"')
                {
                    _stringBuilder.Remove(_stringBuilder.Length - 1, 1);
                }

                var arg = _stringBuilder.ToString();

                if (isDigit)
                {
                    if (arg.IndexOf('.') >= 0)
                    {
                        arguments.Add(decimal.Parse(arg));
                    }
                    else
                    {
                        arguments.Add(Int32.Parse(arg));
                    }
                }
                else
                {
                    arguments.Add(arg);
                }
            };
            while (true)
            {
                NextCharacter();
                if (!checkDigit)
                {
                    isDigit = IsDigitCharacter(Character());
                    checkDigit = true;
                }
                if (Eof())
                    return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                // Termination
                if (Character() == ']')
                {
                    NextCharacter();
                    addToArguments();

                    return CreateToken(TokenKind.SquareBrackets, arguments.ToArray());
                }
                if (Character() == ',')
                {
                    NextCharacter();

                    if (Eof())
                        return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                    addToArguments();

                    _stringBuilder.Clear();
                }
                if (Character() == '\\')
                {
                    NextCharacter();

                    if (Eof())
                        return CreateToken(TokenKind.Invalid, "Unterminated string literal");

                    switch (Character())
                    {
                        case '\\':
                            _stringBuilder.Append('\\');
                            break;
                        case '\'':
                            _stringBuilder.Append('\'');
                            break;
                        default:
                            _stringBuilder.Append('\\');
                            _stringBuilder.Append(Character());
                            break;
                    }
                }
                // Regular character in string
                else
                {
                    _stringBuilder.Append(Character());
                }
            }
        }

        private void NextCharacter()
        {
            _index++;
        }

        private char Character()
        {
            return _expression[_index];
        }

        private Token CreateToken(TokenKind kind, object value = null)
        {
            return new Token
            {
                Kind = kind,
                Position = _startTokenIndex,
                Value = value
            };
        }

        private bool Eof()
        {
            return (_index >= _expression.Length);
        }
    }
}