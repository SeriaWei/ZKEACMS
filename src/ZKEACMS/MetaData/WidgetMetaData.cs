/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Easy.Constant;
using Easy.MetaData;
using ZKEACMS.Extend;
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
            ViewConfig(m => m.AssemblyName).AsHidden().Required();
            ViewConfig(m => m.FormView).AsHidden();
            ViewConfig(m => m.IsSystem).AsHidden();
            ViewConfig(m => m.ServiceTypeName).AsHidden().Required();
            ViewConfig(m => m.ViewModelTypeName).AsHidden().Required();
            //update by roc 
            //后台可以修改 PartialView 字段 ,前端可以替换任意 视图页面
            ViewConfig(m => m.PartialView).AsTextBox().Required().ReadOnly();
            //ViewConfig(m => m.PartialView).AsHidden().Required();
            ViewConfig(m => m.LayoutID).AsHidden();
            ViewConfig(m => m.PageID).AsHidden();
            ViewConfig(m => m.RuleID).AsHidden();
            ViewConfig(m => m.ExtendData).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.CustomClass).AsHidden().Ignore();
            ViewConfig(m => m.CustomStyle).AsHidden().Ignore();
            ViewConfig(m => m.DataSourceLink).AsHidden().Ignore();
            ViewConfig(m => m.DataSourceLinkTitle).AsHidden().Ignore();

            ViewConfig(m => m.WidgetName).AsTextBox().Order(NextOrder()).Required();
            ViewConfig(m => m.Title).AsTextBox().Order(NextOrder());
            ViewConfig(m => m.Position).AsTextBox().Order(NextOrder()).RegularExpression(RegularExpression.Integer,"请输入数字").Required();
            ViewConfig(m => m.ZoneID).AsDropDownList().Order(NextOrder()).DataSource(ViewDataKeys.Zones, SourceType.ViewData).Required();            
            ViewConfig(m => m.IsTemplate).AsCheckBox().Order(NextOrder());
            ViewConfig(m => m.Thumbnail).AsTextBox().Order(NextOrder()).MediaSelector();
            ViewConfig(m => m.StyleClass).AsTextBox().Order(NextOrder()).AddClass(StringKeys.StyleEditor).AddProperty("data-url", Urls.StyleEditor).AddProperty("data-width", "1024").MaxLength(1000);
        
            
        }

        protected override void ViewConfigure()
        {
            InitViewBase();
        }
    }
}
