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

public partial class HeadStart_CenterbaseEntry : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        MaintainScrollPositionOnPostBack = true;


        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            string HeadStartCBLeadAgencyIDNumber = (Request.QueryString["id"] == null) ? "" : Request.QueryString["id"].ToString();

            if (!string.IsNullOrEmpty(HeadStartCBLeadAgencyIDNumber))
            {


                DisplaySelectedProgram(Int32.Parse(HeadStartCBLeadAgencyIDNumber));


                ViewState["HeadStartCBLeadAgencyIDNumber"] = HeadStartCBLeadAgencyIDNumber;

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
    //        string Check = ddlCenterbasedQRISParticipation.SelectedValue;
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


        if (ViewState["HeadStartCBLeadAgencyIDNumber"] == null)
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
        txtHSProgramNumber.Text = "";
        txtHeadStartFacilityName.Text = "";
        txtHSCenterbasedAddress.Text = "";
        txtCity.Text = "";
        txtZipCode.Text = "";
        txtEECLicensedCapacity.Text = "";
        txtTotalNumberClassrooms.Text = "";
        txtCenterBasescomments.Text = "";

    }


    protected void btnSaveHSCenterBased_Click(object sender, EventArgs e)
    {
        int retVal = -1;
        int txtTotalCbPrograms = 0;

        if (Page.IsValid)
        {
            if (ViewState["HeadStartCBLeadAgencyIDNumber"] == null)
                retVal = dal.SaveHSCenterbaseSitSurvey(
                    Int32.Parse(Session["GrantApplicantId"].ToString())
                    , txtTotalCbPrograms
                    , txtHSProgramNumber.Text
                    , txtHeadStartFacilityName.Text
                    , txtHSCenterbasedAddress.Text
                    , txtCity.Text
                    , txtZipCode.Text
                    , Int32.Parse(txtEECLicensedCapacity.Text)
                    , 0
                    , 0
                    , 0
                    , ddlNAEYCAccredited.SelectedValue
                    , Int32.Parse(txtTotalNumberClassrooms.Text)
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , "No"
                    , "Level 1"
                    , "Level 1"
                    , txtCenterBasescomments.Text
                    , AppInfo.FiscalYear
                    , ddlAccreditation.SelectedValue
                    , txtAccreditationNumber.Text
                    , txtAccreditationEarnDate.Text
                    , txtAccreditationExpDate.Text);
            else
                retVal = dal.UpdateHSCenterBaseSiteSurvey(
                    Int32.Parse(ViewState["SelectedId"].ToString())
                    , txtHSProgramNumber.Text
                    , txtHeadStartFacilityName.Text
                    , txtHSCenterbasedAddress.Text
                    , txtCity.Text
                    , txtZipCode.Text
                    , Int32.Parse(txtEECLicensedCapacity.Text)
                    , 0
                    , 0
                    , 0
                    , ddlNAEYCAccredited.SelectedValue
                    , Int32.Parse(txtTotalNumberClassrooms.Text)
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , 0
                    , "No"
                    , "Level 1"
                    , "Level 1"
                    , txtCenterBasescomments.Text
                    , txtTotalCbPrograms
                    , Int32.Parse(Session["GrantApplicantId"].ToString())
                    , ddlAccreditation.SelectedValue
                    , txtAccreditationNumber.Text
                    , txtAccreditationEarnDate.Text
                    , txtAccreditationExpDate.Text);
        }

        if (retVal < -1)
        {

            //LoadPrograms();
            trHasHSCenterBased.Visible = true;
            //trQRISGrantLevelSelections.Visible = true; 
        }
        else
        {



            //LoadPrograms();
            //UpdateHSCenterBaseSurveytbl();
            trHasHSCenterBased.Visible = true;
        }

    }

    private bool IsValidData()
    {
        return true;
    }

    //protected void txtTotalCbPrograms_TextChanged(object sender, EventArgs e)
    //{
    //    CountPrograms();

    //}
    //protected void grdHSCenterbase_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "select")
    //    {
    //        DisplaySelectedProgram(Int32.Parse(grdHSCenterbase.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()));
    //    }

    //}

    private void DisplaySelectedProgram(int HeadStartCBLeadAgencyIDNumber)
    {
        ////ResetProgram();
        ViewState["Mode"] = "Update";
        ////tblAddEditProgram.Visible = true;

        ViewState["SelectedId"] = HeadStartCBLeadAgencyIDNumber;

        ds = dal.GetHSCenterBaseSiteSurveyinfo(HeadStartCBLeadAgencyIDNumber, AppInfo.FiscalYear);

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtHSProgramNumber.Text = dr["ProgramNumber"].ToString();
            txtHeadStartFacilityName.Text = dr["HeadStartFacilityName"].ToString();
            txtHSCenterbasedAddress.Text = dr["Address"].ToString();
            txtCity.Text = dr["City"].ToString();
            txtZipCode.Text = dr["ZipCode"].ToString();
            txtEECLicensedCapacity.Text = dr["EECLicensedCapacity"].ToString();

            txtTotalNumberClassrooms.Text = dr["TotalNumberClassrooms"].ToString();

            txtCenterBasescomments.Text = dr["Comments"].ToString();

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

        txtHSProgramNumber.Text = "";
        txtHeadStartFacilityName.Text = "";
        txtHSCenterbasedAddress.Text = "";
        txtCity.Text = "";
        txtZipCode.Text = "";
        txtEECLicensedCapacity.Text = "";

        txtTotalNumberClassrooms.Text = "";

        txtCenterBasescomments.Text = "";

    }

    //private void UpdateHSCenterBaseSurveytbl()
    //{
    //    dal.UpdateHSCenterBaseSitetbl(Int32.Parse(Session["GrantApplicantId"].ToString()));

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


