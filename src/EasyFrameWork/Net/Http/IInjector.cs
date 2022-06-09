/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;

namespace Easy.Net.Http
{
	public interface IInjector
    {
        void Inject(HttpRequest request);
    }
}
