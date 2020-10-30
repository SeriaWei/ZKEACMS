/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */

using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;

namespace ZKEACMS.Distribution.Models
{
    [XmlRoot("key"), DataTable("PersistKey")]
    public class PersistKey
    {
        [XmlAttribute("id"), Key]
        public string ID { get; set; }
        public string XML { get; set; }

        [XmlElement("creationDate")]
        public DateTime CreationDate { get; set; }

        [XmlElement("activationDate")]
        public DateTime ActivationDate { get; set; }

        [XmlElement("expirationDate")]
        public DateTime ExpirationDate { get; set; }
    }
}
