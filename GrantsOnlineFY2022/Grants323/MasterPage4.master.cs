using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage4 : System.Web.UI.MasterPage
{
    private Boolean _showFooter = true;
    private Boolean _showPageTitle = true;
    private Boolean _showNavMenu = true;

    private String _pageTitle = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null)
        {
            TopNavMenu1.Visible = false;
        }
        else
        {
            TopNavMenu1.Visible = true;
        }

        Session["UPKHome"] = "0";
        Session["PreschoolHome"] = "0";
        Session["HeadStart"] = "0";

        if (AppInfo.FundCode == 511)
        {
            Session["UPKHome"] = "1";
        }
        else if (AppInfo.FundCode == 391)
        {
            Session["PreschoolHome"] = "1";
        }
        else if (AppInfo.FundCode == 390)
        {
            Session["HeadStart"] = "1";
        }

        if (!IsPostBack)
        {
            Session["GrantTypeId"] = System.Configuration.ConfigurationManager.AppSettings.Get("GrantTypeId");

            string title = "FY " + AppInfo.FiscalYear + " " + AppInfo.GrantName + " Grant (Fund Code " + AppInfo.FundCode + ")";

            Page.Title = title;
            PageTitle = title;
        }
    }

    public String PartTitle
    {
        get
        {
            return lblPart.Text;
        }
        set
        {
            lblPart.Text = value;
        }
    }

    public Boolean ShowFooter
    {
        get
        {
            return _showFooter;
        }
        set
        {
            _showFooter = value;
            Footer1.Visible = _showFooter;
        }
    }

    public Boolean ShowPageTitle
    {
        get
        {
            return _showPageTitle;
        }
        set
        {
            _showPageTitle = value;
            PageTitle1.Visible = _showPageTitle;
        }
    }

    public Boolean ShowNavMenu
    {
        get
        {
            return _showNavMenu;
        }
        set
        {
            _showNavMenu = value;
            TopNavMenu1.Visible = _showNavMenu;
        }
    }

    public String PageTitle
    {
        get
        {
            return _pageTitle;
        }
        set
        {
            _pageTitle = value;
            PageTitle1.SetPageTitle(_pageTitle);
        }
    }

    public String NavMenuItem
    {
        set
        {
            TopNavMenu1.CurrentMenuItem = value;
        }
    }

    public void ReloadEligibilityAmount()
    {
        AgencyInfo1.ReloadEligibilityAmount();
    }
}
