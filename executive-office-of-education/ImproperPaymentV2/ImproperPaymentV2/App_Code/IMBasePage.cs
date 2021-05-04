using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for IMBasePage
/// </summary>
public class IMBasePage : System.Web.UI.Page
{
    public IMBasePage()
    {

    }

    protected String GetParameter(String sKey)
    {
        String sTemp = "";

        try
        {
            if (Request.HttpMethod == "GET")
            {

                sTemp = Request.QueryString[sKey].ToString();
            }
            else
            {
                if (Request.Form[sKey] != null)
                {
                    sTemp = Request.Form[sKey].ToString();
                }
            }
        }
        catch (Exception e)
        {
            return e.Message;
        }

        return sTemp;
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Context.Session != null)
        {
            if (Session.IsNewSession)
            {
                HttpCookie newSessionIdCookie = Request.Cookies["ASP.NET_SessionId"];
                if (newSessionIdCookie != null)
                {
                    string newSessionIdCookieValue = newSessionIdCookie.Value;
                    if (newSessionIdCookieValue != string.Empty)
                    {
                        // This means Session was timed Out and New Session was started
                        TerminateSession();
                    }
                }
            }
        }
    }

    //ADD THIS STUFF IN FOR SINGLE SIGN-IN/SECURITY

    //protected CUser CurrentUser;

    //protected Status PageInitialize()
    //{
    //    if (Session.IsNewSession)
    //    {
    //        return Status.FAIL;
    //    }
    //    else
    //    {
    //        ImproperPaymentV2.SSI.Security ssi = new ImproperPaymentV2.SSI.Security();
    //        CurrentUser = (CUser)Session["UserInfo"];

    //        if (CurrentUser == null)
    //        {
    //            return Status.FAIL;
    //        }
    //        else if (!ssi.IsValidSession(CurrentUser.SSISessionID))
    //        {
    //            return Status.FAIL;
    //        }
    //        else
    //        {
    //            ssi.UpdateSessionHistory(CurrentUser.SSISessionID, ImproperPaymentV2.SSI.EECApp.ProfessionalDevelopment, "");

    //            //if (!CurrentUser.AgreeTermOfUse)
    //            //{
    //            //    Response.Redirect("UserAgreement.aspx");
    //            //}

    //            return Status.SUCCESS;
    //        }
    //    }
    //}

    protected void RedirectDefaultPage()
    {
        Response.Redirect("~/" + AppData.GetValue("PAGE_DEFAULT"));
    }


    protected string DecryptDES(string stringToDecrypt)
    {
        return CGlobal.DecryptDES(stringToDecrypt, "#12B@@k$");
    }

    protected string EncryptDES(string stringToEncrypt)
    {
        return CGlobal.EncryptDES(stringToEncrypt, "#12B@@k$");
    }


    protected void TerminateSession()
    {
        sSessionID = "";
        Session.Clear();
        System.Web.Security.FormsAuthentication.SignOut();

        RedirectDefaultPage();
        //Response.Redirect("default.aspx");
    }


    private String sSessionID
    {
        get
        {
            HttpCookie SessionKeyCookie = Request.Cookies["SESSION_ID"];
            if (SessionKeyCookie != null)
            {
                return SessionKeyCookie.Value.Replace("-", "%2D");
            }
            else
            {
                return "";
            }
        }
        set
        {
            HttpCookie SessionKeyCookie = Request.Cookies["SESSION_ID"];
            if (SessionKeyCookie != null)
            {
                SessionKeyCookie.Value = value;
            }
        }
    }
}

