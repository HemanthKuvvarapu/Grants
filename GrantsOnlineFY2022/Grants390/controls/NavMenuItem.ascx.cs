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
            tblMenuItem.Rows[0].Cells[1].Style.Add("width", value);
        }
    }

    public void Initialize(String text, String arg, String width)
    {
        this.LinkText = text;
        this.CommandArgument = arg;
        this.MenuWidth = width;

        imgLeft.ImageUrl = "~/images/spacer.gif";
        tblMenuItem.Rows[0].Cells[1].Style.Remove("background");
        imgRight.ImageUrl = "~/images/spacer.gif";
        lnkMenuItem.Style.Add("color", "#b5111a");
    }

    public void SetFocus()
    {
        imgLeft.ImageUrl = "~/images/menuitemleftedge.jpg";
        tblMenuItem.Rows[0].Cells[1].Style.Add("background", "url(images/menuitembg.jpg)");
        imgRight.ImageUrl = "~/images/menuitemrightedge.jpg";
        lnkMenuItem.Style.Add("color", "#ffffff");
    }

    public void Hide()
    {
        lnkMenuItem.Visible = false;
    }

    protected void lnkMenuItem_Click(object sender, EventArgs e)
    {
        String sArg = ((LinkButton)sender).CommandArgument;
        Session["CurrentMenuFocus"] = sArg;

        if (sArg == "Home")
        {
            if (Session["GrantApplicantId"] == null)
            {
                Session.RemoveAll();
                Session.Clear();
                Response.Redirect("~/Default.aspx");
            }
            else if (Session["UPKHome"] != null && Session["UPKHome"].ToString() == "1")
            {
                Response.Redirect("UPKHome.aspx");
            }
            else if (Session["PreschoolHome"] != null && Session["PreschoolHome"].ToString() == "1")
            {
                Response.Redirect("PreschoolHome.aspx");
            }
            else if (Session["HeadStart"] != null && Session["HeadStart"].ToString() == "1")
            {
                Response.Redirect("HeadStartHome.aspx");
            }
            else
            {
                Response.Redirect("CheckList.aspx");
            }
        }
        else if (sArg == "Logout")
        {

            //Session.RemoveAll();
            //Session.Clear();

            if (Session["UPKHome"] != null && Session["UPKHome"].ToString() == "1")
            {
                Response.Redirect("../Default.aspx");
            }
            else if (Session["PreschoolHome"] != null && Session["PreschoolHome"].ToString() == "1")
            {
                Response.Redirect("../Default.aspx");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
