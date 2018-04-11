/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Easy.Extend;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;

namespace Easy.ViewPort.jsTree
{

    public class Tree<T> where T : class
    {
        IEnumerable<T> DataSource;
        string _sourceUrl = "";
        Func<T, string> valueProperty;
        Func<T, string> parentProperty;
        Func<T, string> textProperty;
        bool _expandAll;
        Dictionary<string, string> _events = new Dictionary<string, string>();
        List<string> _plugins = new List<string>();
        Contextmenu contextMenu = new Contextmenu();
        List<Node> nodes;
        string _rootId;
        string _name;
        string _check_callback;
        private readonly ViewContext _viewContext;
        private IUrlHelper _urlHelper;

        public Tree()
        {
            this._name = Guid.NewGuid().ToString("N");
        }
        public Tree(ViewContext viewContex)
        {
            this._name = Guid.NewGuid().ToString("N");
            _viewContext = viewContex;
            IUrlHelperFactory _urlHelperFactory = viewContex.HttpContext.RequestServices.GetService(typeof(IUrlHelperFactory)) as IUrlHelperFactory;
            _urlHelper = _urlHelperFactory.GetUrlHelper(viewContex);
        }
        public Tree<T> Name(string name)
        {
            this._name = name;
            return this;
        }
        #region 公用方法

        public Tree<T> Source(IEnumerable<T> source)
        {
            this.DataSource = source;
            return this;
        }

        public virtual Tree<T> Source(string url)
        {
            _sourceUrl = url;
            if (_urlHelper != null)
            {
                _sourceUrl = _urlHelper.Content(_sourceUrl);
            }
            return this;
        }
        public virtual Tree<T> Source(string action, string controller)
        {
            _sourceUrl = _urlHelper.Action(action, controller);
            return this;
        }

        public virtual Tree<T> Source(string action, string controller, object routeValues)
        {
            _sourceUrl = _urlHelper.Action(action, controller, routeValues);
            return this;
        }

        #endregion
        public Tree<T> On(string events, string fun)
        {
            if (_events.ContainsKey(events))
            {
                _events[events] = fun;
            }
            else
            {
                _events.Add(events, fun);
            }
            return this;
        }
        public Tree<T> Id(Func<T, string> value)
        {
            valueProperty = value;
            return this;
        }
        public Tree<T> Text(Func<T, string> text)
        {
            textProperty = text;
            return this;
        }
        public Tree<T> Parent(Func<T, string> parent)
        {
            parentProperty = parent;
            return this;
        }

        public Tree<T> AddPlugin(string plugin)
        {
            if (!_plugins.Contains(plugin))
            {
                _plugins.Add(plugin);
            }
            return this;
        }
        public Tree<T> AddContextMenuItem(ContextmenuItem item)
        {
            if (!_plugins.Contains(Plugins.ContextMenu))
            {
                AddPlugin(Plugins.ContextMenu);
            }
            contextMenu.Add(item);
            return this;
        }
        public Tree<T> RootId(string rootId)
        {
            _rootId = rootId;
            return this;
        }
        public Tree<T> CheckCallBack(string fun)
        {
            _check_callback = fun;
            return this;
        }
        public List<Node> ToNode(Func<T, string> value, Func<T, string> text, Func<T, string> parent, string rootId)
        {
            return ToNode(value, text, parent, rootId, true);
        }
        public List<Node> ToNode(Func<T, string> value, Func<T, string> text, Func<T, string> parent, string rootId, bool expandAll)
        {
            valueProperty = value;
            parentProperty = parent;
            textProperty = text;
            _rootId = rootId;
            _expandAll = expandAll;
            InitDode();
            return nodes;
        }
        public override string ToString()
        {
            InitDode();
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat("<div id=\"{0}\"></div><script type='text/javascript'>$(function(){{ $('#{0}')", this._name);
            foreach (var item in _events)
            {
                builder.AppendFormat(".on('{0}',{1})", item.Key, item.Value);
            }
            string source = "{'url' : '" + _sourceUrl + "','data' : function (node) {return { 'id' : node.id };}}";
            if (nodes != null && nodes.Count > 0)
            {
                source = Newtonsoft.Json.JsonConvert.SerializeObject(nodes);
            }
            builder.AppendFormat(".jstree({{'core':{{data:{0},'check_callback':{1}}}", source, _check_callback.IsNullOrEmpty() ? "false" : _check_callback);
            if (_plugins.Count > 0)
            {
                builder.AppendFormat(",'plugins':{0}", Newtonsoft.Json.JsonConvert.SerializeObject(_plugins));
            }
            if (contextMenu.Count > 0)
            {
                StringBuilder menuBuilder = new StringBuilder();
                int index = 0;
                contextMenu.Each(m =>
                {
                    menuBuilder.AppendFormat("\"{0}\": {{ \"separator_before\": {1}, \"separator_after\": {2}, \"_disabled\": {3}, \"label\": \"{4}\", \"action\": {5}, \"icon\": \"{6}\", \"shortcut\": {7}, \"shortcut_label\": \"{8}\" }},",
                        index, m.SeparatorBefore.ToString().ToLower(), m.SeparatorAfter.ToString().ToLower(), m.Disabled.ToString().ToLower(), m.Label, m.Action, m.Icon, m.Shortcut, m.ShortcutLabel);
                    index++;
                });
                builder.AppendFormat(",'contextmenu':{{ \"items\": function () {{ return {{ {0} }} }} }}", menuBuilder.ToString().Trim(','));
            }
            builder.Append("});});</script>");
            if (_viewContext != null)
            {
                _viewContext.Writer.Write(builder.ToString());
                return string.Empty;
            }
            return builder.ToString();
        }
        private void InitDode()
        {
            if (nodes == null && DataSource != null)
            {
                nodes = new List<Node>();
                DataSource
               .Where(m => parentProperty(m) == _rootId)
               .Each(m =>
               {
                   nodes.Add(InitNode(m));
               });
            }
        }
        private Node InitNode(T data)
        {
            Node node = new Node();
            node.id = valueProperty(data);
            node.text = textProperty(data);
            node.state = new State { opened = _expandAll };
            node.a_attr = data;
            node.children = new List<Node>();
            DataSource.Where(m => parentProperty(m) == node.id).Each(m => node.children.Add(InitNode(m)));
            return node;
        }
    }
}
