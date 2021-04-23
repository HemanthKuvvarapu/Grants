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

public partial class MasterPageNEW : System.Web.UI.MasterPage
{
    private Boolean _showFooter = true;
    private Boolean _showPageTitle = true;
    private Boolean _showNavMenu = true;

    private String _pageTitle = "";

    DAL dal = new DAL();

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

        DataSet pds = dal.GetBudgetAmountTotal(Convert.ToInt32(Session["GrantApplicantId"]));
        DataRow dr = pds.Tables[0].Rows[0];
        lblBudgetAmount.Text = Decimal.Parse(dr["BudgetAmountTotal"].ToString()).ToString("N2");

        if ((lblBudgetAmount.Text != "") && (lblBudgetAmount.Text != "0"))
        {
            trNEW.Visible = true;
            tdBudgetAmt.Visible = true;
        }
        else
        {
            trNEW.Visible = false;
            tdBudgetAmt.Visible = false;
        }

        if (!IsPostBack)
        {
            string title = "FY " + AppInfo.FiscalYear + " " + AppInfo.GrantName + " " + AppInfo.GrantAppType + " (Fund Code " + AppInfo.FundCode + ")";

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
