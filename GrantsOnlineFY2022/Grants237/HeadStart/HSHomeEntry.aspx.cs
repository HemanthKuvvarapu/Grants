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

public partial class HeadStart_HSHomeEntry : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = true;


        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            string HSHBSiteID = (Request.QueryString["id"] == null) ? "" : Request.QueryString["id"].ToString();

            if (!string.IsNullOrEmpty(HSHBSiteID))
            {


                DisplaySelectedProgram(Int32.Parse(HSHBSiteID));


                ViewState["HSHBSiteID"] = HSHBSiteID;


            }
            else
            {
                ResetProgram();
            }
        }
    }



    private void LoadPrograms()
    {


        if (ViewState["HSHBSiteID"] == null)
        {

            ViewState["Mode"] = "Add";



        }

        else
        {

            ViewState["Mode"] = "Update";
        }
    }


    private void ResetProgram()
    {
        txtProgramName.Text = "";
        txtHSHomeAddress.Text = "";
        txtCommunitiesServed.Text = "";
        txtZipCode.Text = "";
        txtFundedCapacityHeadstart.Text = "";
        txtFundedCapacityEarlyHeadStart.Text = "";
        ddlStaffDegreeLevel.SelectedIndex = 1;
        txtNumberDualLanguageLearnersHome.Text = "0";
        txtComments.Text = "";

    }


    protected void btnSaveHSHomeinfo_Click(object sender, EventArgs e)
    {
        int retVal = -1;
        int txtTotalHBVisits = 0;

        if (IsValidData())
        {
            if (ViewState["HSHBSiteID"] == null)
                retVal = dal.SaveHSHomebaseSitSurvey(
                    Int32.Parse(Session["GrantApplicantId"].ToString())
                    , txtTotalHBVisits
                    , txtProgramName.Text
                    , txtHSHomeAddress.Text
                    , txtCommunitiesServed.Text
                    , txtZipCode.Text
                    , ddlStaffDegreeLevel.SelectedValue
                    , Int32.Parse(txtFundedCapacityHeadstart.Text)
                    , Int32.Parse(txtFundedCapacityEarlyHeadStart.Text)
                    , Int32.Parse(txtNumberDualLanguageLearnersHome.Text)
                    , txtComments.Text
                    , AppInfo.FiscalYear);
            else
                retVal = dal.UpdateHSHomeBaseSiteSurvey(
                    Int32.Parse(ViewState["SelectedId"].ToString())
                    , txtProgramName.Text
                    , txtHSHomeAddress.Text
                    , txtCommunitiesServed.Text
                    , txtZipCode.Text
                    , ddlStaffDegreeLevel.SelectedValue
                    , Int32.Parse(txtFundedCapacityHeadstart.Text)
                    , Int32.Parse(txtFundedCapacityEarlyHeadStart.Text)
                    , Int32.Parse(txtNumberDualLanguageLearnersHome.Text)
                    , txtComments.Text
                    , txtTotalHBVisits
                    , Int32.Parse(Session["GrantApplicantId"].ToString())
                    );

        }

        if (retVal < -1)
        {
            lblAddEditMsg.Text = "";
            trHasHSHomeBased.Visible = true;


        }
        else
        {
            lblAddEditMsg.Text = "";

            //bind and count

            //UpdateHSHometbl();
            trHasHSHomeBased.Visible = true;
        }

    }


    private bool IsValidData()
    {
        return true;
    }



    private void DisplaySelectedProgram(int HSHBSiteID)
    {

        ViewState["Mode"] = "Update";


        ViewState["SelectedId"] = HSHBSiteID;

        ds = dal.GetHSHomeBaseSiteSurveyinfo(HSHBSiteID);

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtProgramName.Text = dr["ProgramName"].ToString();
            txtHSHomeAddress.Text = dr["Address"].ToString();
            txtCommunitiesServed.Text = dr["CommunitiesServed"].ToString();
            txtZipCode.Text = dr["ZipCode"].ToString();
            //ddlStaffDegreeLevel.SelectedIndex = ddlStaffDegreeLevel.Items.IndexOf(ddlStaffDegreeLevel.Items.FindByValue(dr["StaffDegreeLevel"].ToString()));
            ddlStaffDegreeLevel.SelectedIndex = 1;
            txtFundedCapacityHeadstart.Text = dr["FundedCapacityHeadstart"].ToString();
            txtFundedCapacityEarlyHeadStart.Text = dr["FundedCapacityEarlyHeadStart"].ToString();
            //txtNumberDualLanguageLearnersHome.Text = dr["NumberDualLanguageLearnersHome"].ToString();
            txtNumberDualLanguageLearnersHome.Text = "0";
            txtComments.Text = dr["Comments"].ToString();

        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ResetProgram();
    }

    //private void UpdateHSHometbl()
    //{
    //    dal.UpdateHSHometbl(Int32.Parse(Session["GrantApplicantId"].ToString()));

    //}

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        NextPage();
    }

    private void NextPage()
    {
        {
            Response.Redirect("HeadStartSiteSurveyChecklist.aspx");
        }
    }


    protected void btnBackprevious1_Click(object sender, EventArgs e)
    {
        saveandhome();

    }

    private void saveandhome()
    {

        {
            Response.Redirect("HeadStartSiteSurveyChecklist.aspx");

        }


    }


}
