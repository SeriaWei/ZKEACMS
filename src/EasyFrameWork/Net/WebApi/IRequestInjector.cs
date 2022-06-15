/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;

namespace Easy.Net.WebApi
{
	public interface IRequestInjector
    {
        void Inject(HttpRequest request);
    }
}
