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

public partial class AjaxSessionUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //update the session
        if (Session["GrantApplicantId"] != null)
        {
            Response.ContentType = "text/html";
            Response.Write("Session Updated - Server Time:" + DateTime.Now.ToString());//the text "Session Updated - Server Time:" MUST be part of the response. the js looks for this text.
        }

        //if (Session["SessionID"] != null)
        //{
        //    string sessionid = Session["SessionID"].ToString();

        //    if (sec.IsValidSession(sessionid))
        //    {
        //        sec.UpdateSessionHistory(sessionid, SSO.SSO_WS.EECApp.eCCIMS, "");

        //        Response.ContentType = "text/html";
        //        Response.Write("Session Updated - Server Time:" + DateTime.Now.ToString() + ": " + sessionid);//the text "Session Updated - Server Time:" MUST be part of the response. the js looks for this text.
        //    }

        //}





    }
}
