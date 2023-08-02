/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.Cache
{
    public class Signals : ISignals
    {
        readonly IDictionary<string, SignalChangeToken> _tokens = new Dictionary<string, SignalChangeToken>();
        public const string AllCacheEntryChanged = "AllCacheEntryChanged";

        public void Trigger(string signal)
        {
            lock (_tokens)
            {
                if (_tokens.TryGetValue(signal, out SignalChangeToken token))
                {
                    _tokens.Remove(signal);
                    token.Change();
                }
            }
        }

        public SignalChangeToken When(string signal)
        {
            lock (_tokens)
            {
                if (!_tokens.TryGetValue(signal, out SignalChangeToken token))
                {
                    token = new SignalChangeToken();
                    _tokens[signal] = token;
                }
                return token;
            }
        }
    }
}
