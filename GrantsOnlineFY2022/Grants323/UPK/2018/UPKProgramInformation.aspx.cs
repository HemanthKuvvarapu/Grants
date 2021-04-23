using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class UPK_2018_UPKProgramInformation : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        if (!IsPostBack)
        {
            LoadControls();
        }
    }

    private void LoadControls()
    {
        DataSet ds = dal.GetUpkSystemProviders(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        tblSysProviders.Visible = true;
        tblCenter.Visible = false;

        grdSysProviders.DataSource = ds.Tables[0];
        grdSysProviders.DataBind();

        chklAssessmentInstrument.DataSource = dal.GetAssessmentInstruments();
        chklAssessmentInstrument.DataValueField = "AssessmentInstrumentId";
        chklAssessmentInstrument.DataTextField = "Description";
        chklAssessmentInstrument.DataBind();

        rbtnUpkVersion.DataSource = dal.GetUpkVersions();
        rbtnUpkVersion.DataValueField = "UpkVersionId";
        rbtnUpkVersion.DataTextField = "Description";
        rbtnUpkVersion.DataBind();

        tblCommands.Visible = false;

        if (Session["ProgramTypeId"].ToString() != "5")
        {
            if (ds.Tables[0].Rows.Count >= 1)
            {
                btnAddNewProgram.Visible = false;
            }
            else
            {
                btnAddNewProgram.Visible = true;
            }
        }
        else
        {
            btnAddNewProgram.Visible = true;
        }
    }

    private void BindData(bool isAfterSaved)
    {
        DataSet ds = dal.GetUpkProgramInformation(Int32.Parse(ViewState["GrantUpkSystemProvidersId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            txtProgramName.Text = dr["ProgramName"].ToString().Trim();

            if (tblCenter.Visible)
            {
                if (!string.IsNullOrEmpty(dr["IsHeadStartProgram"].ToString().Trim()) && Convert.ToBoolean(dr["IsHeadStartProgram"].ToString()))
                    rbtnIsHeadStartProgram.Items.FindByValue("1").Selected = true;
                else
                    rbtnIsHeadStartProgram.Items.FindByValue("0").Selected = true;


                rbtnIsAccredited.SelectedIndex = rbtnIsAccredited.Items.IndexOf(rbtnIsAccredited.Items.FindByValue(dr["IsAccredited"].ToString()));

                rbtnIsAccredited_SelectedIndexChanged(this, new EventArgs());


                ddlAccreditation.SelectedIndex = ddlAccreditation.Items.IndexOf(ddlAccreditation.Items.FindByValue(dr["AccreditationTypeId"].ToString()));

                LoadAccreditationDetailsControls();

                if (txtAccreditationNumber.Enabled)
                {
                    txtAccreditationNumber.Text = dr["AccreditationNumber"].ToString();
                }

                if (txtAccreditationExpDate.Enabled)
                {
                    txtAccreditationExpDate.Text = dr["AccreditationExpirationDate"].ToString();
                }

                if (txtAccreditationEarnDate.Enabled)
                {
                    txtAccreditationEarnDate.Text = dr["AccreditationEarnDate"].ToString();
                }
            }

            if (!string.IsNullOrEmpty(dr["IsProgramLicensed"].ToString().Trim()))
            {
                rbtnIsProgramLicensed.SelectedValue = (dr["IsProgramLicensed"].ToString().Trim() == "True") ? "1" : "0";
            }

            txtEECProgramNumber.Text = dr["ProgramNumber"].ToString();

            if (!string.IsNullOrEmpty(dr["QRISLevel"].ToString()))
            {
                rdoQRISLevel.SelectedValue = dr["QRISLevel"].ToString();
            }


            txtUpkFundedPreschoolClassrooms.Text = !String.IsNullOrEmpty(dr["UpkFundedPreschoolClassrooms"].ToString()) ? dr["UpkFundedPreschoolClassrooms"].ToString() : "";
            txtNonUpkFundedPreschoolClassrooms.Text = !String.IsNullOrEmpty(dr["NonUpkFundedPreschoolClassrooms"].ToString()) ? dr["NonUpkFundedPreschoolClassrooms"].ToString() : "";

            txtChildren3YearOld.Text = !String.IsNullOrEmpty(dr["Children3YearOld"].ToString()) ? dr["Children3YearOld"].ToString() : "";
            txtChildren4YearOld.Text = !String.IsNullOrEmpty(dr["Children4YearOld"].ToString()) ? dr["Children4YearOld"].ToString() : "";
            txtChildren5YearOld.Text = !String.IsNullOrEmpty(dr["Children5YearOld"].ToString()) ? dr["Children5YearOld"].ToString() : "";

            txtPreschoolChildrenEnrolled.Text = !String.IsNullOrEmpty(dr["PreschoolChildrenEnrolled"].ToString()) ? dr["PreschoolChildrenEnrolled"].ToString() : "";
            txtPreschoolChildrenProjectedEnrollment.Text = !String.IsNullOrEmpty(dr["PreschoolChildrenProjectedEnrollment"].ToString()) ? dr["PreschoolChildrenProjectedEnrollment"].ToString() : "";

            txtChildrenWithFinAssistance.Text = !String.IsNullOrEmpty(dr["ChildrenWithFinAssistance"].ToString()) ? dr["ChildrenWithFinAssistance"].ToString() : "";
            txtProjectedChildrenWithFinAssistance.Text = !String.IsNullOrEmpty(dr["ProjectedChildrenWithFinAssistance"].ToString()) ? dr["ProjectedChildrenWithFinAssistance"].ToString() : "";

            txtChildrenWithIEP.Text = !String.IsNullOrEmpty(dr["ChildrenWithIEP"].ToString()) ? dr["ChildrenWithIEP"].ToString() : "";
            txtUPKChildrenWithIEP.Text = !String.IsNullOrEmpty(dr["UPKChildrenWithIEP"].ToString()) ? dr["UPKChildrenWithIEP"].ToString() : "";

            txtAssessmentInstrumentNotes.Text = dr["AssessmentInstrumentNotes"].ToString();
            rbtnUpkVersion.SelectedIndex = rbtnUpkVersion.Items.IndexOf(rbtnUpkVersion.Items.FindByValue(dr["UpkVersionId"].ToString()));
            rbtnIsToolLicensed.SelectedIndex = rbtnIsToolLicensed.Items.IndexOf(rbtnIsToolLicensed.Items.FindByValue(dr["IsToolLicensed"].ToString()));
        }
        else
        {
            LoadAccreditationDetailsControls();
        }

        tblCommands.Visible = true;

        if (isAfterSaved)
        {
            tblSuccess.Visible = true;
        }
        else
        {
            tblSuccess.Visible = false;
        }



        if (ds.Tables[1].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                chklAssessmentInstrument.Items.FindByValue(dr["AssessmentInstrumentId"].ToString()).Selected = true;
            }
        }
    }

    private string GetAssessmentInstruments()
    {
        StringBuilder xmlString = new StringBuilder();
        xmlString.Append("<root>");

        foreach (ListItem li in chklAssessmentInstrument.Items)
        {
            if (li.Selected)
                xmlString.Append(String.Format("<Tool><AssessmentInstrumentId>{0}</AssessmentInstrumentId></Tool>", li.Value));
        }
        xmlString.Append("</root>");

        return xmlString.ToString();
    }


    protected void rbtnIsAccredited_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlAccreditation.Enabled = true;
        ddlAccreditation.Items.Clear();
        ddlAccreditation.Items.Add(new ListItem("---------", "0"));

        if (Session["ProgramTypeId"].ToString() == "1" || Session["ProgramTypeId"].ToString() == "2" || Session["ProgramTypeId"].ToString() == "3")
        {
            if (rbtnIsAccredited.SelectedValue == "1")
            {
                ddlAccreditation.Items.Add(new ListItem("NAEYC", "1"));
                ddlAccreditation.Items.Add(new ListItem("NEASC", "2"));
            }
            else
            {
                ddlAccreditation.Enabled = false;
            }
        }
        else if (Session["ProgramTypeId"].ToString() == "4" || Session["ProgramTypeId"].ToString() == "5")
        {
            if (rbtnIsAccredited.SelectedValue == "1")
            {
                ddlAccreditation.Items.Add(new ListItem("NAFCC", "3"));
            }
            else
            {
                ddlAccreditation.Items.Add(new ListItem("CDA", "4"));
                ddlAccreditation.Items.Add(new ListItem("AA", "5"));
                ddlAccreditation.Items.Add(new ListItem("BA", "6"));
                ddlAccreditation.Items.Add(new ListItem("Master's Degree", "7"));
            }
        }

        ddlAccreditation.SelectedIndex = 0;

        LoadAccreditationDetailsControls();
    }

    protected void grdSysProviders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[e.Row.Cells.Count - 2].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this program?');");

            e.Row.Cells[1].Text = "";
            //e.Row.Cells[1].Text = "$" + Single.Parse(dr["Amount"].ToString()).ToString("N2");

            ((HyperLink)e.Row.FindControl("lnkClassrooms")).Text = "Edit Classroom(s)";
            ((HyperLink)e.Row.FindControl("lnkClassrooms")).NavigateUrl = "UPKClass.aspx?pid=" + dr["GrantUpkSystemProvidersId"].ToString();
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomValidator1.ErrorMessage = "";

        if (tblSysProviders.Visible)
        {
            int count = 0;
            RadioButtonList rbtn, rbtnHS;
            DropDownList ddl;
            CheckBox chk;
            TextBox txtNumber, txtDate;

            foreach (GridViewRow gr in grdSysProviders.Rows)
            {
                
                rbtn = (RadioButtonList)gr.FindControl("rbtnIsAccredited");
                
                ddl = (DropDownList)gr.FindControl("ddlAccreditation");
                txtNumber = (TextBox)gr.FindControl("txtAccreditationNumber");
                txtDate = (TextBox)gr.FindControl("txtAccreditationExpirationDate");
            }


            if (count == 0)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage += "Please identify the providers linked to your system by checking the box next to each program.<br>";
            }
        }
    }

    protected void CustomValidator17_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (chklAssessmentInstrument.SelectedIndex == -1)
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator18_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (rbtnUpkVersion.SelectedIndex == -1)
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator19_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (rbtnIsToolLicensed.SelectedIndex == -1)
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsHeadStartProgram.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsAccredited.SelectedIndex == -1)
            {
                args.IsValid = false;
            }

        }
    }

    protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rbtnIsProgramLicensed.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
    {
    }

    protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (rdoQRISLevel.SelectedIndex == -1)
            {
                args.IsValid = false;
            }
        }
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("UPKProgramInformation.aspx");
    }

    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Nullable<DateTime> dt = null;

            int retVal = dal.SaveUpkProgramInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString())
                    , Int32.Parse(Session["ProgramTypeId"].ToString())
                    , tblCenter.Visible ? (rbtnIsHeadStartProgram.SelectedValue == "1" ? true : false) : false
                    , tblCenter.Visible ? (rbtnIsProgramLicensed.SelectedValue == "1" ? true : false) : false
                    , txtUpkFundedPreschoolClassrooms.Text == "" ? 0 : Convert.ToInt32(txtUpkFundedPreschoolClassrooms.Text)
                    , txtNonUpkFundedPreschoolClassrooms.Text == "" ? 0 : Convert.ToInt32(txtNonUpkFundedPreschoolClassrooms.Text)
                    , Convert.ToInt32(txtPreschoolChildrenEnrolled.Text)
                    , Convert.ToInt32(txtPreschoolChildrenProjectedEnrollment.Text)
                    , Convert.ToInt32(txtChildrenWithFinAssistance.Text)
                    , Convert.ToInt32(txtProjectedChildrenWithFinAssistance.Text)
                    , Convert.ToInt32(txtChildrenWithIEP.Text)
                    , Convert.ToInt32(txtUPKChildrenWithIEP.Text)
                    , GetAssessmentInstruments()
                    , txtAssessmentInstrumentNotes.Text
                    , Convert.ToInt32(rbtnUpkVersion.SelectedValue)
                    , "", Convert.ToInt32(rbtnIsAccredited.SelectedValue)
                    , Convert.ToInt32(ddlAccreditation.SelectedValue)
                    , txtAccreditationNumber.Text.Trim()
                    , txtAccreditationExpDate.Enabled ? DateTime.Parse(txtAccreditationExpDate.Text.Trim()) : dt
                    , Convert.ToInt32(txtChildren3YearOld.Text)
                    , Convert.ToInt32(txtChildren4YearOld.Text)
                    , Convert.ToInt32(txtChildren5YearOld.Text)
                    , Convert.ToInt32(rbtnIsToolLicensed.SelectedValue)
                    , txtEECProgramNumber.Text
                    , rdoQRISLevel.SelectedValue
                    , ViewState["GrantUpkSystemProvidersId"].ToString()
                    , txtProgramName.Text
                    , txtAccreditationEarnDate.Enabled ? DateTime.Parse(txtAccreditationEarnDate.Text.Trim()) : dt
                    , AppInfo.FiscalYear );

            ViewState["GrantUpkSystemProvidersId"] = retVal;

            dal.SaveUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "2", 1);

            if (AppInfo.Competitive)
            {
                float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
                Session["Eligibility Amount"] = eligAmount.ToString("N2");
                Master.ReloadEligibilityAmount();
            }

            loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

            BindData(true);
        }
        else
        {
            //tblErrorMessage.Visible = true;
        }
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("UPKProgramInformation.aspx");
    }

    protected void grdSysProviders_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ViewState["GrantUpkSystemProvidersId"] = grdSysProviders.DataKeys[e.NewEditIndex].Value;

        tblCenter.Visible = true;
        tblSysProviders.Visible = false;

        BindData(false);
    }

    protected void grdSysProviders_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dal.DeleteUpkProgram(Convert.ToInt32(grdSysProviders.DataKeys[e.RowIndex].Value));

        if (AppInfo.Competitive)
        {
            float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
            Session["Eligibility Amount"] = eligAmount.ToString("N2");
            Master.ReloadEligibilityAmount();
        }

        loadAgencyInfo(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        LoadControls();
    }

    protected void btnAddNewProgram_Click(object sender, EventArgs e)
    {
        ViewState["GrantUpkSystemProvidersId"] = "0";

        tblSysProviders.Visible = false;
        tblCenter.Visible = true;
        tblCommands.Visible = true;

        BindData(false);
    }

    private void LoadAccreditationDetailsControls()
    {
        //Accreditation Date Earned
        txtAccreditationEarnDate.Text = "";
        btnCalendarEarnDate.Visible = false;

        if (rbtnIsAccredited.SelectedValue == "1")
        {
            txtAccreditationEarnDate.Enabled = false;
        }
        else
        {
            if (ddlAccreditation.SelectedItem.ToString() == "AA" || 
                ddlAccreditation.SelectedItem.ToString() == "BA" || 
                ddlAccreditation.SelectedItem.ToString() == "Master's Degree")
            {
                txtAccreditationEarnDate.Enabled = true;
                btnCalendarEarnDate.Visible = true;
            }
            else
            {
                txtAccreditationEarnDate.Enabled = false;
            }
        }

        //Accreditation Expiration Earned
        txtAccreditationExpDate.Text = "";
        btnCalendarExpDate.Visible = false;

        if (ddlAccreditation.SelectedItem.ToString() == "NAEYC" || 
            ddlAccreditation.SelectedItem.ToString() == "NEASC" || 
            ddlAccreditation.SelectedItem.ToString() == "NAFCC" ||
            ddlAccreditation.SelectedItem.ToString() == "CDA")
        {
            txtAccreditationExpDate.Enabled = true;
            btnCalendarExpDate.Visible = true;
        }
        else
        {
            txtAccreditationExpDate.Enabled = false;
        }

        //Accreditation number
        txtAccreditationNumber.Text = "";

        if (ddlAccreditation.SelectedItem.ToString() == "NAEYC" || 
            ddlAccreditation.SelectedItem.ToString() == "NEASC" || 
            ddlAccreditation.SelectedItem.ToString() == "NAFCC")
        {
            txtAccreditationNumber.Enabled = true;
        }
        else
        {
            txtAccreditationNumber.Enabled = false;
        }
    }

    protected void ddlAccreditation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAccreditation.SelectedValue != "0")
        {
            LoadAccreditationDetailsControls();
        }
        else
        {
            txtAccreditationExpDate.Text = "";
            txtAccreditationEarnDate.Text = "";
            txtAccreditationNumber.Text = "";

            txtAccreditationExpDate.Enabled = false;
            txtAccreditationEarnDate.Enabled = false;
            txtAccreditationNumber.Enabled = false;
        }
    }

    protected void CustomValidator20_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (ddlAccreditation.Enabled && ddlAccreditation.SelectedIndex == 0)
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator22_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationNumber.Enabled && string.IsNullOrEmpty(txtAccreditationNumber.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator21_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationEarnDate.Enabled && string.IsNullOrEmpty(txtAccreditationEarnDate.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    protected void CustomValidator23_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (tblCenter.Visible)
        {
            if (txtAccreditationExpDate.Enabled && string.IsNullOrEmpty(txtAccreditationExpDate.Text.Trim()))
            {
                args.IsValid = false;
            }
        }
    }

    private void loadAgencyInfo(int grantApplicantId)
    {
        DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Lead Agency Name"] = ds.Tables[0].Rows[0]["AgencyName"].ToString();
            Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
            Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
        }
    }

    protected void CustomValidator24_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (rbtnIsAccredited.SelectedValue == "0" && (Session["ProgramTypeId"].ToString() == "1" || Session["ProgramTypeId"].ToString() == "2" || Session["ProgramTypeId"].ToString() == "3"))
        {
            tblFailed.Visible = true;
            args.IsValid = false;
        }
        else
        {
            tblFailed.Visible = false;
            args.IsValid = true;
        }
    }
}


