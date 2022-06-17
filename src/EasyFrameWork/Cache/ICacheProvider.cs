/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace Easy.Cache
{
    public interface ICacheProvider
    {
        ICacheManager<T> Build<T>();
    }
}
