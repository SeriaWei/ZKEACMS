/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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

namespace Easy.Mvc.Resource
{
    public abstract class ResourceRegister
    {
        public RazorPage CurrentPage { get; private set; }
        protected ResourceRegister(RazorPage page, Action<ResourceCollection> onRegisted)
        {
            this.CurrentPage = page;
            this.OnRegisted = onRegisted;
        }

        public abstract IDisposable AtHead();

        public abstract IDisposable AtFoot();

        public abstract ResourceCapture Reqiured(string name);

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
            this._page.StartTagHelperWritingScope(HtmlEncoder.Default);
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
        }
    }

    public class ResourceCapture
    {
        private RazorPage _page;
        private ResourceCollection _resource;
        private Action<ResourceCollection> _onRegisted;
        public ResourceCapture(RazorPage page, ResourceCollection source, Action<ResourceCollection> onRegisted)
        {
            _page = page;
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
        }
    }


    public class ScriptRegister : ResourceRegister
    {
        public ScriptRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(page, onRegisted)
        {
        }

        public override IDisposable AtHead()
        {
            return new Capture(this.CurrentPage, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(this.CurrentPage, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            if (!Resource.ResourceManager.ScriptSource.ContainsKey(name))
                throw new Exception("找不到名称为“{0}”的相关资源".FormatWith(name));
            return new ResourceCapture(CurrentPage, Resource.ResourceManager.ScriptSource[name], OnRegisted);
        }


    }

    public class StyleRegister : ResourceRegister
    {
        public StyleRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(page, onRegisted)
        {
        }

        public override IDisposable AtHead()
        {
            return new Capture(this.CurrentPage, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(this.CurrentPage, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            return new ResourceCapture(this.CurrentPage, Resource.ResourceManager.StyleSource[name], OnRegisted);
        }
    }

}
