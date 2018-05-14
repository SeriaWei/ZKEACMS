using Easy.RuleEngine.Scripting.Compiler;

namespace Easy.RuleEngine.Scripting.Ast {
    public interface IAstNodeWithToken {
        Token Token { get; }
    }
}