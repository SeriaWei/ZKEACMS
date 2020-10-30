/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using ZKEACMS.DataArchived;
using ZKEACMS.Distribution.Models;

namespace ZKEACMS.Distribution.Service
{
    public class DistributionPersistKeysRepository : IDistributionPersistKeysRepository
    {
        private string DistributionPersistKeys = "DistributionPersistKeys";
        private readonly IServiceProvider _serviceProvider;
        public DistributionPersistKeysRepository(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public virtual IReadOnlyCollection<XElement> GetAllElements()
        {
            List<XElement> elements = new List<XElement>();
            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                var dataArchiveService = scope.ServiceProvider.GetService<IDataArchivedService>();
                var keys = dataArchiveService.Get<List<PersistKey>>(DistributionPersistKeys);
                if (keys != null)
                {
                    foreach (var item in keys)
                    {
                        using (TextReader reader = new StringReader(item.XML))
                        {
                            elements.Add(XElement.Load(reader));
                        }
                    }
                }
            }
            return elements.AsReadOnly();
        }

        public virtual void StoreElement(XElement element, string friendlyName)
        {
            if (element == null)
            {
                throw new ArgumentNullException(nameof(element));
            }

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
            List<PersistKey> persistKeys = new List<PersistKey>();
            persistKeys.Add(persistKey);
            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                var dataArchiveService = scope.ServiceProvider.GetService<IDataArchivedService>();
                var keys = dataArchiveService.Get(DistributionPersistKeys, () => new List<PersistKey>());
                foreach (var item in keys)
                {
                    if (item.ExpirationDate > DateTime.Now)
                    {
                        persistKeys.Add(item);
                    }
                }
                dataArchiveService.Archive(DistributionPersistKeys, persistKeys);
            }
        }


    }
}