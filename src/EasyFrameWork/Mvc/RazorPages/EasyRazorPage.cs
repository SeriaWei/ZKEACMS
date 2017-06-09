using Microsoft.AspNetCore.Mvc.Razor;
using Easy.Mvc.Resource;
using Microsoft.AspNetCore.Html;
using Easy.Mvc.Resource.Enums;
using System.Linq;
using Easy.Extend;
using System.Collections.Generic;
using Easy.Mvc.Authorize;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.RazorPages
{
    public abstract class EasyRazorPage<TModel> : RazorPage<TModel>
    {
        private List<ResourceCollection> _requiredScripts
        {
            get
            {
                const string key = "Requied_Scripts";
                if (ViewContext.HttpContext.Items.ContainsKey(key))
                {
                    return ViewContext.HttpContext.Items[key] as List<ResourceCollection>;
                }
                var scripts = new List<ResourceCollection>();
                ViewContext.HttpContext.Items.Add(key, scripts);
                return scripts;
            }
        }
        private List<ResourceCollection> _requiredStyles
        {
            get
            {
                const string key = "Requied_Styles";
                if (ViewContext.HttpContext.Items.ContainsKey(key))
                {
                    return ViewContext.HttpContext.Items[key] as List<ResourceCollection>;
                }
                var styles = new List<ResourceCollection>();
                ViewContext.HttpContext.Items.Add(key, styles);
                return styles;
            }
        }
        public IHtmlContent ScriptAtHead()
        {
            return GetResource(ResourceType.Script, ResourcePosition.Head);
        }

        public IHtmlContent ScriptAtFoot()
        {
            return GetResource(ResourceType.Script, ResourcePosition.Foot);
        }

        public IHtmlContent StyleAtHead()
        {
            return GetResource(ResourceType.Style, ResourcePosition.Head);
        }

        public IHtmlContent StyleAtFoot()
        {
            return GetResource(ResourceType.Style, ResourcePosition.Foot);
        }

        private IHtmlContent GetResource(ResourceType type, ResourcePosition position)
        {
            var builder = new HtmlContentBuilder();
            switch (type)
            {
                case ResourceType.Script:
                    {
                        ResourceManager.ScriptSource.Where(m => m.Value.Required && m.Value.Position == position)
                        .Each(m => m.Value.Each(r => builder.AppendHtml(r.ToSource(this))));
                        _requiredScripts.Where(m => m.Position == position).Each(m => m.Each(r => builder.AppendHtml(r.ToSource(this))));
                        break;
                    }

                case ResourceType.Style:
                    {
                        ResourceManager.StyleSource.Where(m => m.Value.Required && m.Value.Position == position)
                            .Each(m => m.Value.Each(r => builder.AppendHtml(r.ToSource(this))));
                        _requiredStyles.Where(m => m.Position == position).Each(m => m.Each(r => builder.AppendHtml(r.ToSource(this))));
                        break;
                    }
            }
            return builder;
        }

        private ScriptRegister _script;
        public ScriptRegister Script
        {
            get
            {
                return _script ?? (_script = new ScriptRegister(this, RegistScript));
            }
        }

        private StyleRegister _style;
        public StyleRegister Style
        {
            get
            {
                return _style ?? (_style = new StyleRegister(this, RegistStyle));
            }
        }
        private void RegistStyle(ResourceCollection resource)
        {
            if (_requiredStyles.All(m => m.Name != resource.Name))
            {
                _requiredStyles.Add(resource);
            }            
        }
        private void RegistScript(ResourceCollection resource)
        {
            if (_requiredScripts.All(m => m.Name != resource.Name))
            {
                _requiredScripts.Add(resource);
            }            
        }
        private IApplicationContext _applicationContext;
        public IApplicationContext ApplicationContext
        {
            get
            {
                if (_applicationContext == null)
                {
                    _applicationContext = ViewContext.HttpContext.RequestServices.GetService<IApplicationContext>();
                }
                return _applicationContext;
            }
        }
        private IAuthorizer _authorizer;
        public IAuthorizer Authorizer
        {
            get
            {
                if (_authorizer == null)
                {
                    _authorizer = ViewContext.HttpContext.RequestServices.GetService<IAuthorizer>();
                }
                return _authorizer;
            }
        }
    }
}