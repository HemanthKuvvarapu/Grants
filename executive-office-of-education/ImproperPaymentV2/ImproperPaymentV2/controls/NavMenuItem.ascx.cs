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

public partial class controls_NavMenuItem : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public String LinkText
    {
        get
        {
            return lnkMenuItem.Text;
        }
        set
        {
            lnkMenuItem.Text = value;
        }
    }

    public String CommandArgument
    {
        get
        {
            return lnkMenuItem.CommandArgument;
        }
        set
        {
            lnkMenuItem.CommandArgument = value;
        }
    }

    public String MenuWidth
    {
        set
        {
            tblMenuItem.Rows[0].Cells[0].Style.Add("width", value);
        }
    }


    public void Initialize(String text, String arg, String width)
    {
        this.LinkText = text;
        this.CommandArgument = arg;
        this.MenuWidth = width;

        lnkMenuItem.CssClass = "navTopMenuItemB";
        lnkMenuItem.Style.Add("height", "23px");
        //lnkMenuItem.Style.Add("color", "#f0f1f5");
        //lnkMenuItem.Style.Add("background-color", "#c1a400");
    }

    public void SetFocus()
    {
        lnkMenuItem.CssClass = "navTopMenuItemF";
        //lnkMenuItem.Style.Add("color", "#ffffff");
        //lnkMenuItem.Style.Add("background-color", "#b30e1e");
    }

    protected void lnkMenuItem_Click(object sender, EventArgs e)
    {
        String sArg = ((LinkButton)sender).CommandArgument;

        Session["CurrentMenuFocus"] = sArg;

        if (sArg == "MenuItem1")
        {
            string hn;

            if (Session["HideNames"] == null)
                Response.Redirect("logout.aspx");

            if (Session["HideNames"].ToString() == "1")
                hn = "1";
            else
                hn = "0";

            Response.Redirect("selectChild.aspx?hn=" + hn);
        }
        else if (sArg == "MenuItem2")
        {
            Response.Redirect("Report.aspx");
        }
        else if (sArg == "MenuItem3")
        {            
            Response.Redirect("logout.aspx");
        }
        else if (sArg == "MenuItem4")
        {
            Response.Redirect("logout.aspx");

            //string EecAppUrl = System.Configuration.ConfigurationManager.AppSettings.Get("EecAppUrl");
            //string sessionId = Session["SessionId"].ToString();
            //sessionId = CGlobal.EncryptDES(sessionId, "#12B@@k$");
            //Response.Redirect(EecAppUrl + "?SSO=true&sessionid=" + sessionId);
        }
    }
}
