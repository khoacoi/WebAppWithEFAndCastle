using Application.Common.Bootstrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;

namespace Application.Web.Startup.Tasks
{
    public class MvcOverridesRegistrationTask : IBootstrapperTask
    {
        public void Execute()
        {
            ////Bind default binder to Choice extended default model binder. By this extension, model binder now 
            ////supports property binder extension, instead of in parameter of action of controller.
            //ModelBinders.Binders.DefaultBinder = new ExtendedDefaultModelBinder();
            //ModelBinders.Binders.Add(typeof(TypedObject), new TypedObjectBinder());
        }
    }
}