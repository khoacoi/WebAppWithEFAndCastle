using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace Application.Web.App_Start
{
    public class SignalRRegistration
    {
        public static void Registration()
        {
            RouteTable.Routes.MapHubs();
        }
    }
}