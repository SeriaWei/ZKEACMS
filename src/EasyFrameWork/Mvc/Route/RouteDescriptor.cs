/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.Mvc.Route
{
    public class RouteDescriptor
    {
        public RouteDescriptor()
        {

        }
        public RouteDescriptor(string routeName, string template)
        {
            this.Priority = 1;
            this.RouteName = RouteName;
            this.Template = template;
        }
        public RouteDescriptor(string routeName, string template, object defaults)
        {
            this.Priority = 1;
            this.RouteName = RouteName;
            this.Template = template;
            this.Defaults = defaults;
        }
        public RouteDescriptor(string routeName, string template, object defaults,object constraints)
        {
            this.Priority = 1;
            this.RouteName = RouteName;
            this.Template = template;
            this.Defaults = defaults;
            this.Constraints = constraints;
        }
        public RouteDescriptor(string routeName, string template, object defaults, object constraints, object dataTokens)
        {
            this.Priority = 1;
            this.RouteName = RouteName;
            this.Template = template;
            this.Defaults = defaults;
            this.Constraints = constraints;
            this.DataTokens = dataTokens;
        }
        public RouteDescriptor(string routeName, string template, object defaults, object constraints, object dataTokens, int priority)
        {
            this.Priority = priority;
            this.RouteName = RouteName;
            this.Template = template;
            this.Defaults = defaults;
            this.Constraints = constraints;
            this.DataTokens = dataTokens;
        }
        /// <summary>
        /// 优先级，数值越大，优先级越高。
        /// </summary>
        public int Priority { get; set; }
        public string RouteName { get; set; }
        public string Template { get; set; }
        public object Defaults { get; set; }
        public object Constraints { get; set; }
        public object DataTokens { get; set; }
        public bool RequiredAuthorization { get; set; }
    }


}
