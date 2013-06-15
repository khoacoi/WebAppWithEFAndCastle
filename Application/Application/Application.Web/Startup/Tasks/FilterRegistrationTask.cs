using Application.Common.Bootstrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.Web.Startup.Tasks
{
    public class FilterRegistrationTask : IBootstrapperTask
    {
        public void Execute()
        {
            //TODO: add global filter handling works with ELMAH.
            //GlobalFilters.Filters.Add(new ImpersonatingValidationFilter());
            //GlobalFilters.Filters.Add(new SSOSessionValidationFilter());
            GlobalFilters.Filters.Add(new HandleErrorAttribute());
        }
    }
}