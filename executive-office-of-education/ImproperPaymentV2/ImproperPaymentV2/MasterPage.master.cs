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

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    private Boolean _showFooter = true;
    private Boolean _showPageTitle = true;
    private Boolean _showNavMenu = true;

    private String _pageTitle = "";

    protected void Page_Load(object sender, EventArgs e)
    {

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
}
