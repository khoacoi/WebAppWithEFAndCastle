﻿using Application.Common.Bootstrapper;
using Application.Common.Extensions;
using Application.DependencyResolver.DependencyInstallers;
using Application.DependencyResolver.Factory;
using Application.Web.Startup.Tasks;
using Castle.Windsor;
using CommonServiceLocator.WindsorAdapter;
using Microsoft.Practices.ServiceLocation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Application.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        private readonly IWindsorContainer container;

        public MvcApplication()
        {
            this.container = new WindsorContainer();
            this.container.Install(new DependencyConventions());
            //this.container.Install(new WebDependencyConventions());
            ServiceLocator.SetLocatorProvider(() => new WindsorServiceLocator(this.container));
        }

        public override void Dispose()
        {
            this.container.Dispose();
            base.Dispose();
        }

        protected void Application_Start()
        {
            //AreaRegistration.RegisterAllAreas();

            //WebApiConfig.Register(GlobalConfiguration.Configuration);
            //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            //BundleConfig.RegisterBundles(BundleTable.Bundles);
            //AuthConfig.RegisterAuth();
            InitializeAction(this.container);
            var controllerFactory = new WindsorControllerFactory(container.Kernel);
            ControllerBuilder.Current.SetControllerFactory(controllerFactory);

        }

        private void InitializeAction(IWindsorContainer container)
        {
            var tasks = new IBootstrapperTask[] {
                new SignalRRegistrationTask(),
                new RouteRegistrationTask(),
                new AuthorizeRegistrationTask(),
                new FilterRegistrationTask(),
                new BundleRegistrationTask(),
                new MvcOverridesRegistrationTask(),
            };
            tasks.Each(t => t.Execute());
            //tasks.Each(t => t.Execute(container));
        }
    }
}