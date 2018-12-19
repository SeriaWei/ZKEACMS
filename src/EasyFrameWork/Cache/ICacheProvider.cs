/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
namespace Easy.Cache
{
    public interface ICacheProvider
    {
        ICacheManager<T> Build<T>();
    }
}
