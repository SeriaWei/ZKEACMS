/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Reflection;

namespace Easy.StartTask
{
    public class TaskManager
    {
        private readonly List<Type> _tasks;

        public TaskManager()
        {
            _tasks = new List<Type>();
        }

        public TaskManager Include<T>() where T : IStartTask
        {
            var type = typeof(T);
            var typeInfo= type.GetTypeInfo();
            if (typeInfo.IsInterface || typeInfo.IsAbstract)
                throw new Exception(type.FullName + "不是实体类");
            _tasks.Add(type);
            return this;
        }

        public void ExcuteAll()
        {
            foreach (Type task in _tasks)
            {
                ((IStartTask)Activator.CreateInstance(task)).Excute();
            }
        }
    }
}