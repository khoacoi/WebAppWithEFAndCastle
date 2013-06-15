using Application.Common.Logging;
using Application.Common.Validator;
using Application.DAL;
using Application.DAL.Contract;
using Application.Domain.ProfileModule.AddressAggregate;
using Application.Domain.ProfileModule.PhoneAggregate;
using Application.Domain.ProfileModule.ProfileAddressAggregate;
using Application.Domain.ProfileModule.ProfileAggregate;
using Application.Domain.ProfileModule.ProfilePhoneAggregate;
using Application.Manager.Contract;
using Application.Manager.Implementation;
using Application.Repository.ProfileModule;
using Castle.Facilities.Logging;
using Castle.MicroKernel.Registration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Mvc;

namespace Application.DependencyResolver.DependencyInstallers
{
    public class DependencyConventions : IWindsorInstaller
    {
        public void Install(Castle.Windsor.IWindsorContainer container, Castle.MicroKernel.SubSystems.Configuration.IConfigurationStore store)
        {
            container.Register(
                        Classes.FromAssemblyInDirectory(new AssemblyFilter(HttpRuntime.BinDirectory, "Application.Web.*"))
                        .BasedOn<IController>()
                        .LifestyleTransient(),

                        Classes.FromAssemblyInDirectory(new AssemblyFilter(HttpRuntime.BinDirectory, "Application.Web.*"))
                        .BasedOn<IHttpController>()
                        .LifestyleTransient()
                                );
            container.Register(
                        Component.For<IQueryableUnitOfWork, UnitOfWork>().ImplementedBy<UnitOfWork>(),
                        Component.For<IProfileRepository, ProfileRepository>().ImplementedBy<ProfileRepository>(),
                        Component.For<IAddressRepository, AddressRepository>().ImplementedBy<AddressRepository>(),
                        Component.For<IAddressTypeRepository, AddressTypeRepository>().ImplementedBy<AddressTypeRepository>(),
                        Component.For<IPhoneTypeRepository, PhoneTypeRepository>().ImplementedBy<PhoneTypeRepository>(),
                        Component.For<IPhoneRepository, PhoneRepository>().ImplementedBy<PhoneRepository>(),
                        Component.For<IProfileAddressRepository, ProfileAddressRepository>().ImplementedBy<ProfileAddressRepository>(),
                        Component.For<IProfilePhoneRepository, ProfilePhoneRepository>().ImplementedBy<ProfilePhoneRepository>().LifestyleSingleton(),
                        Component.For<IContactManager>().ImplementedBy<ContactManager>()
                        );

            container.AddFacility<LoggingFacility>(f => f.UseLog4Net());

            LoggerFactory.SetCurrent(new TraceSourceLogFactory());
            EntityValidatorFactory.SetCurrent(new DataAnnotationsEntityValidatorFactory());
        }
    }
}
