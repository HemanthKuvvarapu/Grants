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

public partial class HeadStart_HSFamEntry : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = true;


        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            string HeadStartFCCLeadAgencyIDNumber = (Request.QueryString["id"] == null) ? "" : Request.QueryString["id"].ToString();

            if (!string.IsNullOrEmpty(HeadStartFCCLeadAgencyIDNumber))
            {


                DisplaySelectedProgram(Int32.Parse(HeadStartFCCLeadAgencyIDNumber));


                ViewState["HeadStartFCCLeadAgencyIDNumber"] = HeadStartFCCLeadAgencyIDNumber;

                //LoadPrograms();

                //SelectQris();
            }


            //if (Session["Lead Agency Name"] != null)
            //{
            //    HSLEAName2.Text = Session["Lead Agency Name"].ToString();
            //    BindData();
            //    CountPrograms();
            //    SelectQris();

            //}
            //else
            //    Response.Redirect("~/Default.aspx");
        }
    }
    //public bool AllDataCollected
    //{
    //    get
    //    {
    //        if (Int32.Parse(txtTotalCbPrograms.Text) == grdHSCenterbase.Rows.Count)
    //            return true;
    //        else
    //            return false;
    //    }
    //}


    //private void BindData()
    //{
    //    ds = dal.GetHSCenterBaseSiteSurvey(Int32.Parse(Session["GrantApplicantId"].ToString()));

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        txtTotalCbPrograms.Text = ds.Tables[0].Rows[0]["TotalCbPrograms"].ToString();

    //        trGridMsg.Visible = true;
    //        grdHSCenterbase.DataSource = ds;
    //        grdHSCenterbase.DataBind();
    //    }
    //    else
    //    {
    //        trGridMsg.Visible = false;
    //    }
    //}
    //private void SelectQris()
    //{
    //    {
    //        string Check = ddlQRISParticipation.SelectedValue;
    //        if (Check == "Yes")
    //        {
    //            trQRISSelectLevelSelections.Visible = true;
    //        }
    //        else
    //        {
    //            trQRISSelectLevelSelections.Visible = false;
    //        }
    //    }
    //}

    private void LoadPrograms()
    {


        if (ViewState["HeadStartFCCLeadAgencyIDNumber"] == null)
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
        txtProgramNumber.Text = "";
        txtFamilyChildCareProviderName.Text = "";
        txtHSFCCAddress.Text = "";
        txtHSFCCZipCode.Text = "";
        txtLicensedCapacity.Text = "";
        txtNumberChildrenEnrolledProgram.Text = "";
        txtNumberProvidersHome.Text = "";
        txtNumberAssistantHome.Text = "";
        txtCommentsFam.Text = "";

    }


    protected void btnSaveHSFCCInfo_Click(object sender, EventArgs e)
    {
        int retVal = -1;
        int txtHSTotalFCCProvider = 0;


        if (IsValidData())
        {
            if (ViewState["HeadStartFCCLeadAgencyIDNumber"] == null)
                retVal = dal.SaveHSFamilyChildCareSitSurvey(
                Int32.Parse(Session["GrantApplicantId"].ToString())
                  , txtHSTotalFCCProvider
                  , txtProgramNumber.Text
                  , txtFamilyChildCareProviderName.Text
                  , txtHSFCCAddress.Text
                  , txtHSFCCZipCode.Text
                  , Int32.Parse(txtLicensedCapacity.Text)
                  , Int32.Parse(txtNumberChildrenEnrolledProgram.Text)
                  , 0
                  , 0
                  , 0
                  , Int32.Parse(txtNumberProvidersHome.Text)
                  , Int32.Parse(txtNumberAssistantHome.Text)
                  , 0
                  , 0
                  , 0
                  , 0
                  , 0
                  , 0
                  , "No"
                  , 0
                  , "No"
                  , "Level 1"
                  , txtCommentsFam.Text
                  , AppInfo.FiscalYear
                  , ddlNAEYCAccredited.SelectedValue
                  , ddlAccreditation.SelectedValue
                  , txtAccreditationNumber.Text
                  , txtAccreditationEarnDate.Text
                  , txtAccreditationExpDate.Text);
            else
                retVal = dal.UpdateHSFamilyChildCareSiteSurvey(
                    Int32.Parse(ViewState["SelectedId"].ToString())
                    , txtProgramNumber.Text
                    , txtFamilyChildCareProviderName.Text
                    , txtHSFCCAddress.Text
                    , txtHSFCCZipCode.Text
                    , Int32.Parse(txtLicensedCapacity.Text)
                    , Int32.Parse(txtNumberChildrenEnrolledProgram.Text)
                    , 0
                    , 0
                    , 0
                    , Int32.Parse(txtNumberProvidersHome.Text)
                    , Int32.Parse(txtNumberAssistantHome.Text)
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , "No"
                    , 0
                    , "No"
                    , "Level 1"
                    , txtCommentsFam.Text
                    , txtHSTotalFCCProvider
                    , Int32.Parse(Session["GrantApplicantId"].ToString())
                    , ddlNAEYCAccredited.SelectedValue
                    , ddlAccreditation.SelectedValue
                    , txtAccreditationNumber.Text
                    , txtAccreditationEarnDate.Text
                    , txtAccreditationExpDate.Text);

        }


        if (retVal < -1)
        {
        }
        else
        {
            //LoadPrograms();
            //UpdateHSFCCtbl();
            trHasHSFamilyChildcare.Visible = true;
        }

    }

    private bool IsValidData()
    {
        return true;
    }

    private void DisplaySelectedProgram(int HeadStartFCCLeadAgencyIDNumber)
    {

        ViewState["Mode"] = "Update";


        ViewState["SelectedId"] = HeadStartFCCLeadAgencyIDNumber;

        ds = dal.GetHSFamilyChildcareSiteSurveyinfo(HeadStartFCCLeadAgencyIDNumber, AppInfo.FiscalYear);

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtProgramNumber.Text = dr["ProgramNumber"].ToString();
            txtFamilyChildCareProviderName.Text = dr["FamilyChildCareProviderName"].ToString();
            txtHSFCCAddress.Text = dr["Address"].ToString();
            txtHSFCCZipCode.Text = dr["ZipCode"].ToString();
            txtLicensedCapacity.Text = dr["LicensedCapacity"].ToString();
            txtNumberChildrenEnrolledProgram.Text = dr["NumberChildrenEnrolledProgram"].ToString();
            txtNumberProvidersHome.Text = dr["NumberProvidersHome"].ToString();
            txtNumberAssistantHome.Text = dr["NumberAssistantHome"].ToString();
            txtCommentsFam.Text = dr["CommentsFam"].ToString();

            ddlNAEYCAccredited.SelectedValue = dr["NAEYCAccredited"].ToString();

            if (ddlNAEYCAccredited.SelectedValue == "No")
            {
                trAccr.Visible = false;
            }
            else
            {
                trAccr.Visible = true;
                ddlAccreditation.SelectedValue = dr["Accreditation"].ToString();
                txtAccreditationNumber.Text = dr["AccreditationNumber"].ToString();
                txtAccreditationEarnDate.Text = dr["AccreditationEarnDate"].ToString();
                txtAccreditationExpDate.Text = dr["AccreditationExpDate"].ToString();
            }
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {

        txtProgramNumber.Text = "";
        txtFamilyChildCareProviderName.Text = "";
        txtHSFCCAddress.Text = "";
        txtHSFCCZipCode.Text = "";
        txtLicensedCapacity.Text = "";
        txtNumberChildrenEnrolledProgram.Text = "";
        txtNumberProvidersHome.Text = "";
        txtNumberAssistantHome.Text = "";
        txtCommentsFam.Text = "";

    }

    //private void UpdateHSFCCtbl()
    //{
    //    dal.UpdateHSFCCtbl(Int32.Parse(Session["GrantApplicantId"].ToString()));

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

    protected void ddlNAEYCAccredited_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = ddlNAEYCAccredited.SelectedValue;

        if (s == "Yes")
        {
            trAccr.Visible = true;
        }
        else
        {
            trAccr.Visible = false;
        }
    }

    protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (ddlNAEYCAccredited.SelectedValue == "Yes" &&
                 (ddlAccreditation.SelectedValue == "" ||
                 txtAccreditationNumber.Text.Trim() == "" ||
                 txtAccreditationExpDate.Text.Trim() == "" ||
                 txtAccreditationEarnDate.Text.Trim() == ""))
        {
            args.IsValid = false;
        }
    }
}