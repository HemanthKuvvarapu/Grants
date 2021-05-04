using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Logout : IPBasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageInitialize();

        /*End the SSI Session if still alive*/

        if (Session["SessionID"] != null)
        {
            string sSessionID = Session["SessionID"].ToString();
            SSI.Security ssi = new SSI.Security();
            ssi.EndSession(sSessionID);
            TerminateSession();
        }
        else
        {
            Response.Redirect(AppData.GetValue("PAGE_DEFAULT"));
        }
    }
}