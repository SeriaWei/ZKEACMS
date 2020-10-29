/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace ZKEACMS.Distribution.Service
{
    public class DistributionPersistKeysRepository : IDistributionPersistKeysRepository
    {
        public DistributionPersistKeysRepository()
        {
            //todo: Save PersistKey to database.
            Directory = new DirectoryInfo("PersistKeys");
        }

        public DirectoryInfo Directory { get; }

        public virtual IReadOnlyCollection<XElement> GetAllElements()
        {
            return GetAllElementsCore().ToList().AsReadOnly();
        }

        private IEnumerable<XElement> GetAllElementsCore()
        {
            Directory.Create(); 

            foreach (var fileSystemInfo in Directory.EnumerateFileSystemInfos("*.xml", SearchOption.TopDirectoryOnly))
            {
                yield return ReadElementFromFile(fileSystemInfo.FullName);
            }
        }

        private static bool IsSafeFilename(string filename)
        {
            return (!String.IsNullOrEmpty(filename) && filename.All(c =>
                c == '-'
                || c == '_'
                || ('0' <= c && c <= '9')
                || ('A' <= c && c <= 'Z')
                || ('a' <= c && c <= 'z')));
        }

        private XElement ReadElementFromFile(string fullPath)
        {
            using (var fileStream = File.OpenRead(fullPath))
            {
                return XElement.Load(fileStream);
            }
        }

        public virtual void StoreElement(XElement element, string friendlyName)
        {
            if (element == null)
            {
                throw new ArgumentNullException(nameof(element));
            }

            if (!IsSafeFilename(friendlyName))
            {
                var newFriendlyName = Guid.NewGuid().ToString();
                friendlyName = newFriendlyName;
            }

            StoreElementCore(element, friendlyName);
        }

        private void StoreElementCore(XElement element, string filename)
        {
            Directory.Create(); 
            var tempFilename = Path.Combine(Directory.FullName, Guid.NewGuid().ToString() + ".tmp");
            var finalFilename = Path.Combine(Directory.FullName, filename + ".xml");

            try
            {
                using (var tempFileStream = File.OpenWrite(tempFilename))
                {
                    element.Save(tempFileStream);
                }

                try
                {
                    File.Move(tempFilename, finalFilename);
                }
                catch (IOException)
                {
                    File.Copy(tempFilename, finalFilename);
                }
            }
            finally
            {
                File.Delete(tempFilename);
            }
        }
    }
}