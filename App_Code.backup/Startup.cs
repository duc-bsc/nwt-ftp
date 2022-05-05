using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(nwt_website.Startup))]
namespace nwt_website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
