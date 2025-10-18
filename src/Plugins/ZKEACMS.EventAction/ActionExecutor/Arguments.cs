/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Serializer;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public struct Arguments : IEnumerable<KeyValuePair<string, string>>
    {
        private readonly Dictionary<string, string> _arguments;

        public Arguments(Dictionary<string, string> arguments)
        {
            _arguments = arguments ?? new Dictionary<string, string>();
        }

        public ICollection<string> Keys => _arguments.Keys;

        public string Named(string name)
        {
            if (_arguments == null)
            {
                return null;
            }

            if (_arguments.TryGetValue(name, out string result))
            {
                return result;
            }

            return null;
        }

        public bool TryGetValue(string name, out string value)
        {
            return _arguments.TryGetValue(name, out value);
        }

        public int Count => _arguments.Count;

        public bool Any()
        {
            return _arguments != null && _arguments.Count > 0;
        }

        public T As<T>()
        {
            return JsonConverter.Deserialize<T>(JsonConverter.Serialize(_arguments));
        }

        public IEnumerator<KeyValuePair<string, string>> GetEnumerator()
        {
            if (_arguments == null)
            {
                return Enumerable.Empty<KeyValuePair<string, string>>().GetEnumerator();
            }

            return ((IEnumerable<KeyValuePair<string, string>>)_arguments).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            if (_arguments == null)
            {
                return Enumerable.Empty<KeyValuePair<string, string>>().GetEnumerator();
            }

            return ((IEnumerable<KeyValuePair<string, string>>)_arguments).GetEnumerator();
        }
    }
}
