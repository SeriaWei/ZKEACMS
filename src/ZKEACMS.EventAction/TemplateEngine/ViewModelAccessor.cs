/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Fluid;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YamlDotNet.Serialization;

namespace ZKEACMS.EventAction.TemplateEngine
{
    public class ViewModelAccessor : IMemberAccessor
    {
        private readonly JToken obj;
        public ViewModelAccessor()
        {

        }
        public ViewModelAccessor(JToken obj)
        {
            this.obj = obj;
        }

        public object Get(object obj, string name, TemplateContext ctx)
        {
            return (obj as ViewModelAccessor).GetMember(name);
        }

        public object GetMember(string name)
        {
            if (obj == null)
            {
                return null;
            }

            JToken val = obj[name];
            return Populate(val);
        }
        private object Populate(JToken token)
        {
            if (token is JValue jval)
            {
                return jval.Value;
            }
            else if (token.Type == JTokenType.Array)
            {
                List<object> objectAccessors = new List<object>();
                foreach (JToken item in token as JArray)
                {
                    objectAccessors.Add(Populate(item));
                }
                return objectAccessors;
            }
            else
            {
                return new ViewModelAccessor(token);
            }
        }
        public override string ToString()
        {
            return (obj ?? string.Empty).ToString();
        }
    }
}
