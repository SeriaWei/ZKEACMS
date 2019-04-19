/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Extend;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.ViewPort.Validator
{
    public class RemoteValidator : ValidatorBase
    {
        public RemoteValidator()
        {
            BaseErrorMessage = "{0}验证失败";
        }
        public string Url
        {
            get
            {
                string url = string.Format("/{0}/{1}", Controller, Action);
                if (!string.IsNullOrEmpty(Area))
                {
                    url = string.Format("/{0}/{1}", Area, url);
                }
                var app = ServiceLocator.GetService<IApplicationContext>();
                if (app != null)
                {
                    url = string.Format("{0}{1}", "", url);
                }
                return url;
            }
        }
        public string Action { get; set; }
        public string Controller { get; set; }
        public string Area { get; set; }

        public string AdditionalFields { get; set; }

        public override bool Validate(object value)
        {
            return false;
        }
    }
}
