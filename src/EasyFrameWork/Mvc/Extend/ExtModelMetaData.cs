/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Http;
using System.IO;
using Easy.Extend;
using Easy.ViewPort.Descriptor;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace Easy.Mvc.Extend
{
    public static class ExtModelMetadata
    {
        public static BaseDescriptor GetViewDescriptor(this ModelMetadata metadata)
        {
            const string key = "ViewPortDescriptor";
            if (metadata.AdditionalValues.ContainsKey(key))
            {
                return metadata.AdditionalValues[key] as BaseDescriptor;
            }
            return null;
        }
    }
}