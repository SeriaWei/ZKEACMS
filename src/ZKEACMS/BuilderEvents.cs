/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Common.Service;
using ZKEACMS.Event;
using ZKEACMS.Page;
using ZKEACMS.Widget;

namespace ZKEACMS
{
    public static class BuilderEvents
    {
        public static void ConfigEvents(this IServiceCollection services)
        {
            services.AddScoped<IEventManager, EventManager>();
            services.RegistEvent<RemoveCacheOnPagePublishedEventHandler>(Events.OnPagePublished);
            services.RegistEvent<RemoveOldVersionOnPagePublishedEventHandler>(Events.OnPagePublished);
            services.RegistEvent<RemoveCacheOnPageDeletedEventHandler>(Events.OnPageDeleted);
            services.RegistEvent<WidgetChangedTriggerPageEventHandler>(Events.OnWidgetAdded, Events.OnWidgetUpdated, Events.OnWidgetDeleted, Events.OnWidgetBasePartUpdated);
            services.RegistEvent<UpdatePageUrlOnPageUrlChangedEventHandler>(Events.OnPageUrlChanged);
            services.RegistEvent<RemoveCacheOnPageUrlChangedEventHandler>(Events.OnPageUrlChanged);
            services.RegistEvent<UpdateNavOnPageUrlChangeEventHandler>(Events.OnPageUrlChanged);
        }
    }
}
