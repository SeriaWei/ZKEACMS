/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ZKEACMS.Extend;

namespace ZKEACMS.Article.Models
{
    [DataTable("ArticleGallery")]
    public class ArticleGallery : EditorEntity
    {
        public ArticleGallery()
        {
            Articles = new List<ArticleGalleryItem>();
        }
        [Key]
        public int ID { get; set; }

        [NotMapped]
        public List<ArticleGalleryItem> Articles { get; set; }
        public string RawData
        {
            get { return JsonSerializer.Serialize(Articles.RemoveDeletedItems()); }
            set { Articles = JsonSerializer.Deserialize<List<ArticleGalleryItem>>(value); }
        }
    }
    class ArticleGalleryMetaData : ViewMetaData<ArticleGallery>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.RawData).AsHidden().Ignore();

            ViewConfig(m => m.Title).AsTextBox().Required().Order(1).MaxLength(200).ShowInGrid();
            ViewConfig(m => m.Articles).AsListEditor().Order(2).Sortable();
        }
    }
}
