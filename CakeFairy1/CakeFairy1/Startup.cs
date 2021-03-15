using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CakeFairy1.Startup))]
namespace CakeFairy1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
