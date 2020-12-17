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
        protected ResourceRegister(Action<ResourceCollection> onRegisted)
        {
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
        private readonly RazorPage _page;
        public ScriptRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(onRegisted)
        {
            _page = page;
        }

        public override IDisposable AtHead()
        {
            return new Capture(_page, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(_page, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            if (!ResourceHelper.ScriptSource.ContainsKey(name))
                throw new Exception("Can't find source:{0}".FormatWith(name));
            return new ResourceCapture(ResourceHelper.ScriptSource[name], OnRegisted);
        }


    }

    public class StyleRegister : ResourceRegister
    {
        private readonly RazorPage _page;
        public StyleRegister(RazorPage page, Action<ResourceCollection> onRegisted) : base(onRegisted)
        {
            _page = page;
        }

        public override IDisposable AtHead()
        {
            return new Capture(_page, ResourcePosition.Head, OnRegisted);
        }

        public override IDisposable AtFoot()
        {
            return new Capture(_page, ResourcePosition.Foot, OnRegisted);
        }

        public override ResourceCapture Reqiured(string name)
        {
            if (!ResourceHelper.StyleSource.ContainsKey(name))
                throw new Exception("Can't find source:{0}".FormatWith(name));
            return new ResourceCapture(ResourceHelper.StyleSource[name], OnRegisted);
        }
    }

}
