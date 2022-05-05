using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using RouteMagic;
using nwt_website;
namespace nwt_website
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapHttpHandler<WallpaperDownloadHandler>("WallpaperHandler", "news-resources/wallpaper/{wallpaper}/{dimensions}");
            //routes.MapPageRoute("GetWallpaper", "news-resources/wallpaper/{wallpaperId}/{dimensions}",
            //         "~/news-resources/download-wallpaper.ashx");
        }
    }
}