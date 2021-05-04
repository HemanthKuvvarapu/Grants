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

public partial class Template : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ControlsInitialize();
        }
    }

    private void ControlsInitialize()
    {
        //Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Hello World!";
        Master.NavMenuItem = "MenuItem2";   //current focus tab
    }
}
