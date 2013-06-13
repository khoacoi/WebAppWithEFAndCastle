using System.Web;
using System.Web.Optimization;

namespace Application.Web
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/plugins/jquery/jquery-{version}.js",
                        "~/Scripts/plugins/jquery/jquery.metadata.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/plugins/jquery/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));
            //Signal-R
            bundles.Add(new ScriptBundle("~/bundles/signalR").Include(
                "~/Scripts/plugins/signalR/jquery.signalR-{version}.js"
                ));
            //RequireJS
            bundles.Add(new ScriptBundle("~/bundles/require").IncludeDirectory(
                       "~/Scripts/plugins/require", "*.js"));
            //KnockoutJS
            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
                                    "~/Scripts/plugins/knockout/knockout-{version}.js",
                                    "~/Scripts/plugins/knockout/knockout.validation.js"));

            //AngularJS
            //bundles.Add(new ScriptBundle("~/bundles/angular").IncludeDirectory(
            //                        "~/Scripts/plugins/angular", "*.js"));
            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                                    "~/Scripts/plugins/angular/angular.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/plugins/modernizr/modernizr-*"));


            

            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/bootstrap.css", "~/Content/Site.css"));
        }
    }
}