/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.ActionExecutor
{
    public class ExecutorManager : IExecutorManager
    {
        private static Dictionary<string, Type> _executors = new Dictionary<string, Type>();
        private readonly IServiceProvider _serviceProvider;

        public ExecutorManager(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public IActionExecutor CreateExecutor(string name)
        {
            if (!_executors.TryGetValue(name, out var executor)) return null;

            return _serviceProvider.GetService(executor) as IActionExecutor;
        }

        internal static void RegistExecutor(string name, Type type)
        {
            _executors[name] = type;
        }
        internal static bool IsExecutorRegisted(string name)
        {
            return _executors.ContainsKey(name);
        }
    }
}
