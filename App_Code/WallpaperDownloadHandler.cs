using System;
using System.Web;

namespace nwt_website
{
    public class WallpaperDownloadHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string FileName = "";
            var response = context.Response;

            //if (context.Request.QueryString["name"] != null)
            //{
            //    FileName = context.Request.QueryString["name"].ToString();
            //    FileName = context.Server.UrlDecode(FileName).Replace("\"", "");
            //}
            var routeValues = context.Request.RequestContext.RouteData.Values;
            string filenameTemplate = "~/images/wallpapers/{0}-{1}.jpg";
            FileName = string.Format(filenameTemplate, routeValues["wallpaper"], routeValues["dimensions"]);
            string FilePath = System.Web.Hosting.HostingEnvironment.MapPath(FileName);
            System.IO.FileInfo fileInfo = new System.IO.FileInfo(FilePath);
            try
            {
                if (fileInfo.Exists)
                {
                    response.Clear();
                    response.AddHeader("Content-Disposition", "attachment; filename=\"" + fileInfo.Name + "\"");
                    response.AddHeader("Content-Length", fileInfo.Length.ToString());
                    response.ContentType = "image/jpg";
                    response.TransmitFile(fileInfo.FullName);
                    response.Flush();
                }
                else
                {
                    throw new Exception("File not found");
                }
            }
            catch (Exception ex)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(ex.Message);
                context.Response.Write("  " + FilePath);
            }
            finally
            {
                context.Response.End();
            }
        }
        public bool IsReusable { get { return false; } }
    }
}