/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace Easy.Serializer
{
    public static class YamlConverter
    {
        private static IDeserializer _deserializer;
        private static ISerializer _serializer;
        static YamlConverter()
        {
            _deserializer = new DeserializerBuilder().WithNamingConvention(UnderscoredNamingConvention.Instance).Build();
            _serializer = new SerializerBuilder().WithNamingConvention(UnderscoredNamingConvention.Instance).Build();
        }
        public static string Serialize(object obj)
        {
            return _serializer.Serialize(obj);
        }
        public static T Deserialize<T>(string yaml)
        {
            if (string.IsNullOrEmpty(yaml))
            {
                throw new ArgumentNullException(nameof(yaml));
            }

            return _deserializer.Deserialize<T>(yaml);
        }

        public static object Deserialize(string yaml, Type returnType)
        {
            if (string.IsNullOrEmpty(yaml))
            {
                throw new ArgumentNullException(nameof(yaml));
            }

            if (returnType is null)
            {
                throw new ArgumentNullException(nameof(returnType));
            }

            return _deserializer.Deserialize(yaml, returnType);
        }
    }
}
