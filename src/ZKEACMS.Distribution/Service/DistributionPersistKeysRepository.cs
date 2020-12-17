/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using Microsoft.AspNetCore.DataProtection.Repositories;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using ZKEACMS.Distribution.Models;

namespace ZKEACMS.Distribution.Service
{
    public class DistributionPersistKeysRepository : IXmlRepository
    {
        private readonly IServiceProvider _serviceProvider;
        public DistributionPersistKeysRepository(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public virtual IReadOnlyCollection<XElement> GetAllElements()
        {
            List<PersistKey> persistKeys = GetPersistKeys();
            List<XElement> elements = new List<XElement>();
            foreach (var key in persistKeys)
            {
                using (TextReader reader = new StringReader(key.XML))
                {
                    elements.Add(XElement.Load(reader));
                }
            }
            return elements.AsReadOnly();
        }

        private List<PersistKey> GetPersistKeys()
        {
            List<PersistKey> persistKeys;
            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                var persistKeyService = scope.ServiceProvider.GetService<IPersistKeyService>();
                persistKeys = persistKeyService.GetPersistKeys();

            }

            return persistKeys;
        }

        public virtual void StoreElement(XElement element, string friendlyName)
        {
            if (element == null)
            {
                throw new ArgumentNullException(nameof(element));
            }

            PersistKey persistKey = DeserializePersistKey(element);
            SavePersistKey(persistKey);
        }

        private static PersistKey DeserializePersistKey(XElement element)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(PersistKey));
            PersistKey persistKey;
            using (XmlReader reader = element.CreateReader())
            {
                persistKey = (PersistKey)xmlSerializer.Deserialize(reader);
                StringBuilder xmlBuilder = new StringBuilder();
                using (TextWriter writer = new StringWriter(xmlBuilder))
                {
                    element.Save(writer, SaveOptions.DisableFormatting);
                }
                persistKey.XML = xmlBuilder.ToString();
            }

            return persistKey;
        }

        private void SavePersistKey(PersistKey persistKey)
        {
            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                var persistKeyService = scope.ServiceProvider.GetService<IPersistKeyService>();
                persistKeyService.Save(persistKey);
            }
        }

    }
}