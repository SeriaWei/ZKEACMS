/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


namespace Easy.Cache
{
    public interface ISignals
    {
        void Trigger(string signal);
        SignalChangeToken When(string signal);
    }
}
