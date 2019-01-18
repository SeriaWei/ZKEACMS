/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Mvc.Resource.Enums;
using System.Collections.Generic;

namespace Easy.Mvc.Resource
{
    public class ResourceHelper
    {
        private readonly ResourceCollection _source;
        private readonly ResourceType _resourceType;
        public ResourceHelper(string name, ResourceType resourceType)
        {
            switch (resourceType)
            {
                case ResourceType.Script:
                    {
                        ResourceManager.ScriptSource.Add(name, new ResourceCollection { Name = name });
                        _source = ResourceManager.ScriptSource[name];
                        break;
                    }
                case ResourceType.Style:
                    {
                        ResourceManager.StyleSource.Add(name, new ResourceCollection { Name = name });
                        _source = ResourceManager.StyleSource[name];
                        break;
                    }
            }
            _resourceType = resourceType;
        }
        public ResourceHelper Include(string source)
        {
            _source.Add(new ResourceEntity { SourceType = _resourceType, DebugSource = source, ReleaseSource = source });
            return this;
        }
        public ResourceHelper Include(string debuger, string release)
        {
            _source.Add(new ResourceEntity { SourceType = _resourceType, DebugSource = debuger, ReleaseSource = release });
            return this;
        }
        public ResourceHelper RequiredAtHead()
        {
            _source.Required = true;
            _source.Position = ResourcePosition.Head;
            return this;
        }
        public ResourceHelper RequiredAtFoot()
        {
            _source.Required = true;
            _source.Position = ResourcePosition.Foot;
            return this;
        }
    }
}
