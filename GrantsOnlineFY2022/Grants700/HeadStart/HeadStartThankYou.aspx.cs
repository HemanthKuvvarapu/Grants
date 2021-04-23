using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HeadStart_HeadStartThankYou : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("../SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {

            //if (Session["LeadAgencyName"] != null)
            //{
            //    HSLeadAgencyName.Text = Session["LeadAgencyName"].ToString();
            //    //ControlsInitialize();

            //}
            //else
            //    Response.Redirect("HeadStartFirstPage.aspx");
        }

    }
    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        NextPage("continue");
    }
    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        NextPage("home");
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {


        Response.Redirect("HSPrintOut.aspx");
    }

    private void NextPage(string action)
    {
        //if (action == "continue")
        //    Response.Redirect("ScheduleA.aspx");
        //else
        //Response.Redirect("CheckList.aspx");

        Response.Redirect("http://www.mass.gov/edu/birth-grade-12/early-education-and-care/financial-assistance/funding-opportunities/open-renewal-grants/");
    }
    //protected void btnPrint_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("PrintOut.aspx?type=part5");
    //}
}
