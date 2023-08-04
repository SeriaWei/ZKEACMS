using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.IoC
{
    public class Dependency
    {
        public static Type Transient = typeof(ITransient);
        public static Type Scoped = typeof(IScoped);
        public static Type Singleton = typeof(ISingleton);
    }

    public interface ITransient
    {
    }
    public interface IScoped
    {
    }
    public interface ISingleton
    {
    }
    
}
