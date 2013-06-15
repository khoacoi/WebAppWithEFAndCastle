using Application.Common.Bootstrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Application.Web.Startup.Tasks
{
    public class SignalRRegistrationTask : IBootstrapperTask
    {
        public void Execute()
        {
            RouteTable.Routes.MapHubs();
        }
    }
}