/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.MetaData
{
    public abstract class WidgetMetaData<T> : ViewMetaData<T> where T : WidgetBase
    {
        int orderStart;
       
        protected int NextOrder()
        {
            return ++orderStart;
        }
        private void InitViewBase()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.WidgetName).AsTextBox().Order(NextOrder()).Required();
            ViewConfig(m => m.Title).AsTextBox().Order(NextOrder());
            ViewConfig(m => m.ZoneID).AsDropDownList().Order(NextOrder()).DataSource(ViewDataKeys.Zones, SourceType.ViewData).Required();
            ViewConfig(m => m.Position).AsTextBox().Order(NextOrder()).RegularExpression(RegularExpression.Integer);
            ViewConfig(m => m.IsTemplate).AsCheckBox().Order(NextOrder());
            ViewConfig(m => m.Thumbnail).AsTextBox().Order(NextOrder()).AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.StyleClass).AsTextBox().Order(NextOrder()).AddClass(StringKeys.StyleEditor).AddProperty("data-url", Urls.StyleEditor).AddProperty("data-width", "1024").MaxLength(1000);
            ViewConfig(m => m.CustomClass).AsHidden().Ignore();
            ViewConfig(m => m.CustomStyle).AsHidden().Ignore();
            ViewConfig(m => m.ExtendFields).AsListEditor();
            ViewConfig(m => m.AssemblyName).AsHidden();
            ViewConfig(m => m.FormView).AsHidden();
            ViewConfig(m => m.IsSystem).AsHidden();
            ViewConfig(m => m.ServiceTypeName).AsHidden();
            ViewConfig(m => m.ViewModelTypeName).AsHidden();

        }

        protected override void ViewConfigure()
        {
            InitViewBase();
        }
    }
}
