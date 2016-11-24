/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Easy.ViewPort.jsTree
{
    public class Events
    {
        /// <summary>
        /// triggered after all events are bound
        /// </summary>
        public const string Init = "init.jstree";
        /// <summary>
        /// triggered after the loading text is shown and before loading starts
        /// </summary>
        public const string Loading = "loading.jstree";
        /// <summary>
        /// triggered after the root node is loaded for the first time
        /// 
        /// </summary>
        public const string Loaded = "loaded.jstree";
        /// <summary>
        /// triggered after all nodes are finished loading
        /// </summary>
        public const string Ready = "ready.jstree";
        /// <summary>
        /// triggered after a node is loaded
        /// function(node,status)
        /// </summary>
        public const string LoadNode = "load_node.jstree";
        /// <summary>
        /// triggered when new data is inserted to the tree model
        /// function(nodes,parent)
        /// </summary>
        public const string Model = "model.jstree";
        /// <summary>
        /// triggered after nodes are redrawn
        /// function(nodes)
        /// </summary>
        public const string Redraw = "redraw.jstree";
        /// <summary>
        /// triggered when a node is about to be opened (if the node is supposed to be in the DOM, it will be, but it won't be visible yet)
        /// function(node)
        /// </summary>
        public const string BeforeOpen = "before_open.jstree";
        /// <summary>
        /// triggered when a node is opened (if there is an animation it will not be completed yet)
        /// function(node)
        /// </summary>
        public const string OpenNode = "open_node.jstree";
        /// <summary>
        /// triggered when a node is opened and the animation is complete
        /// function(node)
        /// </summary>
        public const string AfterOpen = "after_open.jstree";
        /// <summary>
        /// triggered when a node is closed (if there is an animation it will not be complete yet)
        /// function(node)
        /// </summary>
        public const string CloseNode = "close_node.jstree";
        /// <summary>
        /// triggered when a node is closed and the animation is complete
        /// function(node)
        /// </summary>
        public const string AfterClose = "after_close.jstree";
        /// <summary>
        /// triggered when an open_all call completes
        /// function(node)
        /// </summary>
        public const string OpenAll = "open_all.jstree";
        /// <summary>
        /// triggered when an close_all call completes
        /// function(node)
        /// </summary>
        public const string CloseAll = "close_all.jstree";
        /// <summary>
        /// triggered when an node is enabled
        /// function(node)
        /// </summary>
        public const string EnableNode = "enable_node.jstree";
        /// <summary>
        /// triggered when an node is disabled
        /// function(node)
        /// </summary>
        public const string DisableNode = "disable_node.jstree";
        /// <summary>
        /// triggered when an node is clicked or intercated with by the user
        /// function(node)
        /// </summary>
        public const string ActiveNode = "activate_node.jstree";
        /// <summary>
        /// triggered when an node is hovered
        /// function(node,selected)
        /// </summary>
        public const string HoverNode = "hover_node.jstree";
        /// <summary>
        /// triggered when an node is no longer hovered
        /// function(node)
        /// </summary>
        public const string DeHoverNode = "dehover_node.jstree";
        /// <summary>
        /// triggered when an node is selected
        /// function(node,selected,event)
        /// </summary>
        public const string SelectNode = "select_node.jstree";
        /// <summary>
        /// triggered when selection changes
        /// function(node,action,selected,event)
        /// </summary>
        public const string Change = "changed.jstree";
        /// <summary>
        /// triggered when an node is deselected
        /// function(node,selected,event)
        /// </summary>
        public const string DeSelectNode = "deselect_node.jstree";
        /// <summary>
        /// triggered when all nodes are selected
        /// function(selected)
        /// </summary>
        public const string SelectAll = "select_all.jstree";
        /// <summary>
        /// triggered when all nodes are deselected
        /// function(node,selected)
        /// </summary>
        public const string DeSelectAll = "deselect_all.jstree";
        /// <summary>
        /// triggered when a set_state call completes
        /// </summary>
        public const string SetState = "set_state.jstree";
        /// <summary>
        /// triggered when a refresh call completes
        /// </summary>
        public const string Refresh = "refresh.jstree";
        /// <summary>
        /// triggered when a node is refreshed
        /// function(node,nodes)
        /// </summary>
        public const string RefreshNode = "refresh_node.jstree";
        /// <summary>
        /// triggered when a node text value is changed
        /// function(obj,text)
        /// </summary>
        public const string SetText = "set_text.jstree";
        /// <summary>
        /// triggered when a node is created
        /// function(node,parent,position)
        /// </summary>
        public const string CreateNode = "create_node.jstree";
        /// <summary>
        /// triggered when a node is renamed
        /// function(node,text,old)
        /// </summary>
        public const string RenameNode = "rename_node.jstree";
        /// <summary>
        /// triggered when a node is deleted
        /// function(node,parent)
        /// </summary>
        public const string DeleteNode = "delete_node.jstree";
        /// <summary>
        /// triggered when a node is moved
        /// function(node,parent,position,old_parent,old_position,is_multi,old_instance,new_instance)
        /// </summary>
        public const string MoveNode = "move_node.jstree";
        /// <summary>
        /// triggered when a node is copied
        /// function(node,original,parent,position,old_parent,old_position,is_multi,old_instance,new_instance)
        /// </summary>
        public const string CopyNode = "copy_node.jstree";
        /// <summary>
        /// triggered when nodes are added to the buffer for moving
        /// function(node)
        /// </summary>
        public const string Cut = "cut.jstree";
        /// <summary>
        /// triggered when nodes are added to the buffer for copying
        /// function(node)
        /// </summary>
        public const string Copy = "copy.jstree";
        /// <summary>
        /// triggered when paste is invoked
        /// function(parent,node,mode)
        /// </summary>
        public const string Paste = "paste.jstree";
        /// <summary>
        /// triggered when a theme is set
        /// function(theme)
        /// </summary>
        public const string SetTheme = "set_theme.jstree";
        /// <summary>
        /// triggered when the contextmenu is shown for a node
        /// function(node,x,y)
        /// </summary>
        public const string ShowContextMenu = "show_contextmenu.jstree";
        /// <summary>
        /// triggered after search is complete
        /// function(nodes,str,res)
        /// </summary>
        public const string Search = "search.jstree";
        /// <summary>
        /// triggered after search is complete
        /// function(nodes,str,res)
        /// </summary>
        public const string ClearSearch = "clear_search.jstree";
    }

    public class Plugins
    {
        public const string CheckBox = "checkbox";
        public const string ContextMenu = "contextmenu";
        public const string DragAndDrop = "dnd";
        public const string Search = "search";
        public const string Sort = "sort";
        public const string State = "state";
        public const string Types = "types";
        public const string Unique = "unique";
        public const string Wholerow = "wholerow";
    }

}
