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
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();

        Session["FiscalYear"] = System.Configuration.ConfigurationManager.AppSettings.Get("FiscalYear");
        Session["FundCode"] = System.Configuration.ConfigurationManager.AppSettings.Get("FundCode");
        Session["GrantName"] = System.Configuration.ConfigurationManager.AppSettings.Get("GrantName");
    }

    protected void lbtnGotoRFR_Click(object sender, EventArgs e)
    {
        if (AppInfo.Competitive)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("SelectLogin.aspx");
        }
    }
}

