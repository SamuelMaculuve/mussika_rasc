using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ASP_Mussika
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


         //   routes.MapRoute(
         //    "Distritos",
         //    "{distritos}/{perfil}/{id}",
         //     new { controller = "distritos", action = "perfil", id = "" }
         //);

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "inicio", action = "principal", id = UrlParameter.Optional }
            );

            
           

        }
    }
}
