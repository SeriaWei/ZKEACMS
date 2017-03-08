/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Cache;
using Easy.Extend;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.ExtendField;
using ZKEACMS.Common.Service;
using ZKEACMS.Common.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Easy;

namespace ZKEACMS.Widget
{
    public class WidgetBase : EditorEntity, IExtendField
    {
        public static Dictionary<string, Type> KnownWidgetModel { get; } = new Dictionary<string, Type>
        {
           { "ZKEACMS,ZKEACMS.Common.Models.CarouselWidget",typeof(CarouselWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.HtmlWidget",typeof(HtmlWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.ImageWidget",typeof(ImageWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.NavigationWidget",typeof(NavigationWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.ScriptWidget",typeof(ScriptWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.StyleSheetWidget",typeof(StyleSheetWidget)},
           { "ZKEACMS,ZKEACMS.Common.Models.VideoWidget",typeof(VideoWidget)},
        };
        public static Dictionary<string, Type> KnownWidgetService { get; } = new Dictionary<string, Type>
        {
           { "ZKEACMS,ZKEACMS.Common.Service.CarouselWidgetService",typeof(CarouselWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.HtmlWidgetService",typeof(HtmlWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.ImageWidgetService",typeof(ImageWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.NavigationWidgetService",typeof(NavigationWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.ScriptWidgetService",typeof(ScriptWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.StyleSheetWidgetService",typeof(StyleSheetWidgetService)},
           { "ZKEACMS,ZKEACMS.Common.Service.VideoWidgetService",typeof(VideoWidgetService)},
        };
        [Key]
        public virtual string ID { get; set; }
        public virtual string WidgetName { get; set; }
        public virtual int? Position { get; set; }
        public virtual string LayoutID { get; set; }
        public virtual string PageID { get; set; }
        public virtual string ZoneID { get; set; }
        public virtual bool IsTemplate { get; set; }
        public virtual string Thumbnail { get; set; }
        public virtual bool IsSystem { get; set; }
        public virtual string PartialView { get; set; }
        public virtual string AssemblyName { get; set; }
        public virtual string ServiceTypeName { get; set; }
        public virtual string ViewModelTypeName { get; set; }
        public virtual string FormView { get; set; }
        public virtual string ExtendData { get; set; }
        public virtual string StyleClass { get; set; }
        private string _customClass;
        [NotMapped]
        public string CustomClass
        {
            get
            {
                if (_customClass != null)
                {
                    return _customClass;
                }
                InitStyleClass();
                return _customClass;
            }
        }
        private string _customStyle;
        [NotMapped]
        public string CustomStyle
        {
            get
            {
                if (_customStyle != null)
                {
                    return _customStyle;
                }
                InitStyleClass();
                return _customStyle;
            }
        }
        private void InitStyleClass()
        {
            if (StyleClass.IsNullOrWhiteSpace())
            {
                _customClass = _customStyle = string.Empty;
            }
            else
            {
                _customClass = CustomRegex.StyleRegex.Replace(StyleClass, evaluator =>
                {
                    _customStyle = evaluator.Groups[1].Value;
                    return string.Empty;
                });
            }
        }
        public WidgetViewModelPart ToWidgetViewModelPart()
        {
            return new WidgetViewModelPart
            {
                Widget = this,
                ViewModel = this
            };
        }
        public WidgetViewModelPart ToWidgetViewModelPart(object viewModel)
        {
            return new WidgetViewModelPart
            {
                Widget = this,
                ViewModel = viewModel
            };
        }


        private IWidgetPartDriver _partDriver;
        public IWidgetPartDriver CreateServiceInstance(IServiceProvider serviceProvider)
        {
            string key = $"{AssemblyName},{ServiceTypeName}";
            if (_partDriver == null && KnownWidgetService.ContainsKey(key))
            {
                return _partDriver = serviceProvider.GetService(KnownWidgetService[key]) as IWidgetPartDriver;
            }
            return _partDriver;
        }


        private WidgetBase _widgetBase;
        public WidgetBase CreateViewModelInstance(IServiceProvider serviceProvider)
        {
            string key = $"{AssemblyName},{ViewModelTypeName}";
            if (_widgetBase == null && KnownWidgetModel.ContainsKey(key))
            {
                _widgetBase = serviceProvider.GetService(KnownWidgetModel[key]) as WidgetBase;
            }
            return CopyTo(_widgetBase);
        }
        public Type GetViewModelType()
        {
            string key = $"{AssemblyName},{ViewModelTypeName}";
            if (KnownWidgetModel.ContainsKey(key))
            {
                return KnownWidgetModel[key];
            }
            return null;
        }
        [NotMapped]
        public virtual IEnumerable<ExtendFieldEntity> ExtendFields { get; set; }

        public WidgetBase ToWidgetBase()
        {
            return CopyTo(new WidgetBase());
        }
        public WidgetBasePart ToWidgetBasePart()
        {
            return CopyTo(new WidgetBasePart()) as WidgetBasePart;
        }
        public WidgetBase CopyTo(WidgetBase widget)
        {
            widget.AssemblyName = AssemblyName;
            widget.CreateBy = CreateBy;
            widget.CreatebyName = CreatebyName;
            widget.CreateDate = CreateDate;
            widget.Description = Description;
            widget.ID = ID;
            widget.LastUpdateBy = LastUpdateBy;
            widget.LastUpdateByName = LastUpdateByName;
            widget.LastUpdateDate = LastUpdateDate;
            widget.LayoutID = LayoutID;
            widget.PageID = PageID;
            widget.PartialView = PartialView;
            widget.Position = Position;
            widget.ServiceTypeName = ServiceTypeName;
            widget.Status = Status;
            widget.Title = Title;
            widget.ViewModelTypeName = ViewModelTypeName;
            widget.WidgetName = WidgetName;
            widget.ZoneID = ZoneID;
            widget.FormView = FormView;
            widget.StyleClass = StyleClass;
            widget.IsTemplate = IsTemplate;
            widget.Thumbnail = Thumbnail;
            widget.IsSystem = IsSystem;
            widget.ExtendFields = ExtendFields;
            widget.ExtendData = ExtendData;
            return widget;
        }
    }
}
