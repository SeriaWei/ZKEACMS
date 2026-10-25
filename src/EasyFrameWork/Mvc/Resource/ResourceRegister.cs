/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc.RazorPages;
using Easy.Mvc.Resource.Enums;
using System;
using System.IO;
using Easy.Extend;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Html;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Easy.Options;

namespace Easy.Mvc.Resource
{
    public abstract class ResourceRegister
    {
        protected ResourceRegister(RazorPage page, Action<ResourceCollection> onRegisted)
        {
            Page = page;
            this.OnRegisted = onRegisted;
        }

        protected RazorPage Page { get; }

        public abstract IDisposable AtHead();

        public abstract IDisposable AtFoot();

        public abstract ResourceCapture Reqiured(string name);

        /// <summary>
        /// Renders the source tags in place instead of registering them for the page head/foot.
        /// Useful for isolated contexts such as a shadow root.
        /// </summary>
        public IHtmlContent Render(string name)
        {
            var source = GetSource(name);
            var builder = new HtmlContentBuilder();
            if (source == null)
            {
                return builder;
            }

            var services = Page.ViewContext.HttpContext.RequestServices;
            var urlHelper = services.GetService<IUrlHelperFactory>().GetUrlHelper(Page.ViewContext);
            var hostingEnvironment = services.GetService<IWebHostEnvironment>();
            var options = services.GetService<IOptions<CDNOption>>();

            foreach (var item in source)
            {
                builder.AppendHtml(item.ToSource(urlHelper, hostingEnvironment, options));
            }
            return builder;
        }

        protected abstract ResourceCollection GetSource(string name);

        public Action<ResourceCollection> OnRegisted { get; set; }

    }

    public class Capture : IDisposable
    {
        private RazorPage _page;
        private ResourcePosition _position;
        private Action<ResourceCollection> _onRegisted;

        public Capture(RazorPage page, ResourcePosition position, Action<ResourceCollection> onRegisted)
        {
            this._page = page;
            _position = position;
            this._page.StartTagHelperWritingScope(page.HtmlEncoder);
            _onRegisted = onRegisted;
        }

        public void Dispose()
        {
            var content = this._page.EndTagHelperWritingScope();
            var partResult = new HtmlString(content.GetContent());

            var resource = new ResourceCollection
                {
                    new ResourceEntity { Position = _position, Source = partResult }
                };
            resource.Name = "Capture-" + partResult.Value.GetHashCode();
            resource.Position = _position;
            _onRegisted(resource);
            _page = null;
            _onRegisted = null;
        }
    }

    public class ResourceCapture
    {
        private ResourceCollection _resource;
        private Action<ResourceCollection> _onRegisted;
        public ResourceCapture(ResourceCollection source, Action<ResourceCollection> onRegisted)
        {
            _resource = source;
            _onRegisted = onRegisted;
        }
        public void AtHead()
        {
            var resources = new ResourceCollection();
            resources.Name = _resource.Name;
            resources.Position = ResourcePosition.Head;
            _resource.Each(m =>
            {
                ResourceEntity entity = m.ToNew();
                entity.Position = ResourcePosition.Head;
                resources.Add(entity);
            });
            _onRegisted(resources);
            _onRegisted = null;
        }
        public void AtFoot()
        {
            var resources = new ResourceCollection();
            resources.Name = _resource.Name;
            resources.Position = ResourcePosition.Foot;
            _resource.Each(m =>
            {
                ResourceEntity entity = m.ToNew();
                entity.Position = ResourcePosition.Foot;
                resources.Add(entity);
            });
            _onRegisted(resources);
            _onRegisted = null;
        }
    }


    public class ScriptRegister : ResourceRegister
    {
        public ScriptRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(page, onRegisted)
        {
        }

        public override IDisposable AtHead()
        {
            return new Capture(Page, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(Page, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            return new ResourceCapture(GetSource(name), OnRegisted);
        }

        protected override ResourceCollection GetSource(string name)
        {
            if (!ResourceHelper.ScriptSource.TryGetValue(name, out ResourceCollection source))
                throw new Exception("Can't find source:{0}".FormatWith(name));
            return source;
        }
    }

    public class StyleRegister : ResourceRegister
    {
        public StyleRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(page, onRegisted)
        {
        }

        public override IDisposable AtHead()
        {
            return new Capture(Page, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(Page, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            return new ResourceCapture(GetSource(name), OnRegisted);
        }

        protected override ResourceCollection GetSource(string name)
        {
            if (!ResourceHelper.StyleSource.TryGetValue(name, out ResourceCollection source))
                throw new Exception("Can't find source:{0}".FormatWith(name));
            return source;
        }
    }

}
