using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Event
{
    public class Events
    {
        #region
        public const string OnDatabaseCreated = "ZKEACMS.Events.OnDatabaseCreated";
        #endregion

        #region Page
        public const string OnPageAdding = "ZKEACMS.Events.OnPageAdding";
        public const string OnPageAdded = "ZKEACMS.Events.OnPageAdded";
        public const string OnPageUpdating = "ZKEACMS.Events.OnPageUpdating";
        public const string OnPageUpdated = "ZKEACMS.Events.OnPageUpdated";
        public const string OnPageExecuting = "ZKEACMS.Events.OnPageExecuting";
        public const string OnPageExecuted = "ZKEACMS.Events.OnPageExecuted";
        public const string OnPagePublishing = "ZKEACMS.Events.OnPagePublishing";
        public const string OnPagePublished = "ZKEACMS.Events.OnPagePublished";
        public const string OnPageDeleted = "ZKEACMS.Events.OnPageDeleted";
        #endregion

        #region Widget
        public const string OnWidgetAdding = "ZKEACMS.Events.OnWidgetAdding";
        public const string OnWidgetAdded = "ZKEACMS.Events.OnWidgetAdded";
        public const string OnWidgetUpdating = "ZKEACMS.Events.OnWidgetUpdating";
        public const string OnWidgetUpdated = "ZKEACMS.Events.OnWidgetUpdated";
        public const string OnWidgetBasePartUpdated = "ZKEACMS.Events.OnWidgetBasePartUpdated";
        public const string OnWidgetDeleting = "ZKEACMS.Events.OnWidgetDeleting";
        public const string OnWidgetDeleted = "ZKEACMS.Events.OnWidgetDeleted";
        #endregion

        #region Article
        public const string OnArticleAdding = "ZKEACMS.Events.OnArticleAdding";
        public const string OnArticleAdded = "ZKEACMS.Events.OnArticleAdded";
        public const string OnArticleUpdating = "ZKEACMS.Events.OnArticleUpdating";
        public const string OnArticleUpdated = "ZKEACMS.Events.OnArticleUpdated";
        public const string OnArticleDeleting = "ZKEACMS.Events.OnArticleDeleting";
        public const string OnArticleDeleted = "ZKEACMS.Events.OnArticleDeleted";
        public const string OnArticlePublished = "ZKEACMS.Events.OnArticlePublished";
        #endregion

        #region Product
        public const string OnProductAdding = "ZKEACMS.Events.OnProductAdding";
        public const string OnProductAdded = "ZKEACMS.Events.OnProductAdded";
        public const string OnProductUpdating = "ZKEACMS.Events.OnProductUpdating";
        public const string OnProductUpdated = "ZKEACMS.Events.OnProductUpdated";
        public const string OnProductDeleting = "ZKEACMS.Events.OnProductDeleting";
        public const string OnProductDeleted = "ZKEACMS.Events.OnProductDeleted";
        public const string OnProductPublished = "ZKEACMS.Events.OnProductPublished";
        #endregion
    }
}
