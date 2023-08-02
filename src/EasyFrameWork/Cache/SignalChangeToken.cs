/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Cache
{
    public class SignalChangeToken : IChangeToken
    {
        public SignalChangeToken()
        {
            HasChanged = false;
        }
        public bool ActiveChangeCallbacks => false;

        public bool HasChanged { get; private set; }

        public IDisposable RegisterChangeCallback(Action<object> callback, object state)
        {
            throw new NotImplementedException();
        }
        public void Change()
        {
            HasChanged = true;
        }
    }
}
