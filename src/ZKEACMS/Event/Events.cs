using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Event
{
    public class Events
    {
        #region Page
        public const string OnPageAdding = "OnPageAdding";
        public const string OnPageAdded = "OnPageAdded";
        public const string OnPageUpdating = "OnPageUpdating";
        public const string OnPageUpdated = "OnPageUpdated";
        public const string OnPageExecuting = "OnPageExecuting";
        public const string OnPageExecuted = "OnPageExecuted";
        public const string OnPagePublishing = "OnPagePublishing";
        public const string OnPagePublished = "OnPagePublished";
        public const string OnPageDeleted = "OnPageDeleted";
        #endregion

        #region Widget
        public const string OnWidgetAdding = "OnWidgetAdding";
        public const string OnWidgetAdded = "OnWidgetAdded";
        public const string OnWidgetUpdating = "OnWidgetUpdating";
        public const string OnWidgetUpdated = "OnWidgetUpdated";
        public const string OnWidgetBasePartUpdated = "OnWidgetBasePartUpdated";
        public const string OnWidgetDeleting = "OnWidgetDeleting";
        public const string OnWidgetDeleted = "OnWidgetDeleted";
        #endregion

        #region Article
        public const string OnArticlePublished = "OnArticlePublished";
        #endregion
    }
}
