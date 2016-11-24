///* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
//using Easy.Extend;
//using ZKEACMS.Widget;

//namespace ZKEACMS.ModelBinder
//{
//    public class WidgetBinder : DefaultModelBinder
//    {
//        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
//        {
//            object model = base.BindModel(controllerContext, bindingContext);
//            var widgetBase = model as WidgetBase;
//            if (!widgetBase.ViewModelTypeName.IsNullOrEmpty())
//            {
//                bindingContext.ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(() => widgetBase.CreateViewModelInstance(), widgetBase.GetViewModelType());
//                model = base.BindModel(controllerContext, bindingContext);
//            }
//            return model;
//        }
//    }
//}
