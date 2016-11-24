/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
namespace ZKEACMS.Widget
{
    public class WidgetPart
    {
        public WidgetBase Widget { get; set; }
        public object ViewModel { get; set; }

        public override bool Equals(object obj)
        {
            var target = obj as WidgetPart;
            if (target != null && target.Widget != null && Widget != null)
            {
                return target.Widget.ID == Widget.ID;
            }
            return false;
        }
        public override int GetHashCode()
        {
            if (Widget != null)
            {
                return Widget.ID.GetHashCode();
            }
            return base.GetHashCode();
        }
    }
}
