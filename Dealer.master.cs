using System;
using Microsoft.AspNet.Identity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using createsend_dotnet;

public partial class Dealer : System.Web.UI.MasterPage
{

    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            initDealerNewsletters();
        }
    }
  protected void initDealerNewsletters()
    {
        AuthenticationDetails auth = new ApiKeyAuthenticationDetails("e7cecea33b7db4870796202ec8ceefcc");//BSC API Key
        var general = new General(auth);
        IEnumerable<BasicClient> clients = general.Clients();

        BasicClient c = clients.Single(client => client.ClientID == "adaf7af12dc7af8589030658537a216c");//NWT Client ID
        var cl = new Client(auth, c.ClientID);
        var philsList = (from l in cl.Campaigns()
                    where l.Name.Contains("Distributor Download")
                    orderby l.SentDate descending
                    select new 
                    {
                        Name=l.Name,
                        SentDate=DateTime.Parse(l.SentDate).ToShortDateString(),
                        WebVersionURL=l.WebVersionURL
                    }).First();
        philsRamblingsLink.NavigateUrl = philsList.WebVersionURL;

        var keithsList = (from l in cl.Campaigns()
                    where l.Name.Contains("Part Special")
                    orderby l.SentDate descending
                    select new 
                    {
                        Name=l.Name,
                        SentDate=DateTime.Parse(l.SentDate).ToShortDateString(),
                        WebVersionURL=l.WebVersionURL
                    }).First();
        keithsPartsLink.NavigateUrl = keithsList.WebVersionURL;
    }   
    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }
    
    
    
}
