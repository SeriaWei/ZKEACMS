using Newtonsoft.Json;
using System;

namespace Easy.Serializer
{
    public static class JsonConverter
    {
        public static string Serialize(object obj)
        {
            if (obj is null)
            {
                throw new ArgumentNullException(nameof(obj));
            }

            return JsonConvert.SerializeObject(obj);
        }
        public static T Deserialize<T>(string json)
        {
            if (string.IsNullOrEmpty(json))
            {
                throw new ArgumentNullException(nameof(json));
            }

            return JsonConvert.DeserializeObject<T>(json);
        }

        public static object Deserialize(string json, Type returnType)
        {
            if (string.IsNullOrEmpty(json))
            {
                throw new ArgumentNullException(nameof(json));
            }

            if (returnType is null)
            {
                throw new ArgumentNullException(nameof(returnType));
            }

            return JsonConvert.DeserializeObject(json, returnType);
        }
    }
}
