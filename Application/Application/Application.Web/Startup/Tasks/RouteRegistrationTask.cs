using Application.Common.Bootstrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Application.Web.Startup.Tasks
{
    public class RouteRegistrationTask : IBootstrapperTask
    {
        public void Execute()
        {
            var routes = RouteTable.Routes;
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}