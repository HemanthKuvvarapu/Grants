using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class _Default : System.Web.UI.Page
{
    String sUsername = "";
    String sPassword = "";
    String sIsAdmin = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        ControlsInitialize();
    }


    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Improper Payment (IP)";
        //Master.NavMenuItem = "";   //current focus tab
        UserMsg.Text = "";
        UserMsg.Visible = false;
        Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
        Session["IPReviewEndDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewEndDate");

    }

    private Boolean isIAPUser(string sUsername, string sPassword)
    {
        //If this is an internal authorized IAP user then show names 
        string sError = "";
        
        if (CUser.CheckIAPUser(ref sError, sUsername, sPassword))
        {
            if (sError == "")
            {
                DataSet dsUser = CUser.LoadAllUsersInfo(ref sError, sUsername);
                if (sError == "")
                {
                    Session["IsAdminUser"] = dsUser.Tables[0].Rows[0]["IsAdmin"].ToString();
                }
                return true;
            }
            else
            {
                UserMsg.Text = sError;
                UserMsg.Visible = true;
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        UserMsg.Text = "";
        UserMsg.Visible = false;
        sUsername = ReviewerName.Text;
        sPassword = ReviewerPass.Text;

        //SSI.Security
        //ssi = new SSI.Security();

        //String sSessionID = ssi.StartNewSession(sUsername, "#12B@@k$");

        //sSessionID = EncryptDES(sSessionID, "#12B@@k$");
        //Session["DevLogin"] = "true";


        if (sUsername == "" || sPassword == "")
        {
            Session["HideNames"] = "1";
            Session["UserName"] = "";
            UserMsg.Text = "Please enter username and password.";
            UserMsg.Visible = true;
            return;
        }

        if ((sUsername == "FedReviewer" && sPassword == "WorldPeace") ||
            (sUsername == "IPFedUser" && sPassword == "W0rldPeace"))
        {
            Session["HideNames"] = "1";
            Session["UserName"] = sUsername;
            Session["IsAdminUser"] = "0";
            Session["IsReadOnly"] = "1";
            Response.Redirect("selectChild.aspx?hn=1");
        }
        else
        {
            if (isIAPUser(sUsername, sPassword))
            {

                Session["HideNames"] = "0";
                Session["UserName"] = sUsername;
                Session["IsReadOnly"] = "0";
                Response.Redirect("selectChild.aspx?hn=0");
            }
            else
            {
                Session["HideNames"] = "1";  //Default
                Session["UserName"] = "";
                Session["IsReadOnly"] = "1";
                Session["IsAdminUser"] = "";
                if (UserMsg.Text == "")
                    UserMsg.Text = "Unknown username/password.  Please try again.";
                UserMsg.Visible = true;
                return;
            }
        }
    }
}
