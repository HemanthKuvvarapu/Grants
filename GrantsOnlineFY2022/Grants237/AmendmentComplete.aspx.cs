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

public partial class AmendmentComplete : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    int amendmentVersion = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        string amendmentVersion = (Request.QueryString["ver"] == null) ? "1" : Request.QueryString["ver"].ToString();

        ViewState["AmendmentVersion"] = amendmentVersion;
        Session["AmendmentVersion"] = amendmentVersion;
    }

    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        if (Session["PCHPAgency"] != null && Session["PCHPAgency"].ToString() == "1")
        {
            Response.Redirect("Print.aspx?type=BudgetAmendmentPCHPAll");
        }
        else
        {
            Response.Redirect("Print.aspx?type=BudgetAmendmentAll");
        }
    }
}
