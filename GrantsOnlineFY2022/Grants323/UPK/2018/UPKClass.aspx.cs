using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UPK_2018_UPKClass : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        string providerId = Request.QueryString["pid"];

        ViewState["GrantUpkSystemProvidersId"] = providerId;

        BindScripts();

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindScripts()
    {
        txtWeeksPerYearOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
        txtDaysPerWeekOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
        txtHoursPerDayOperation.Attributes.Add("onchange", "javascript:calTotalHrPerYear()");
    }

    private void BindData()
    {
        grdClasses.DataSource = dal.GetUpkClassrooms(Convert.ToInt32(ViewState["GrantUpkSystemProvidersId"].ToString()));
        grdClasses.DataBind();

        if (grdClasses.Rows.Count == 0)
        {
            ViewState["UpkClassroomId"] = "0";

            tblClassroom.Visible = false;
            tblClassroomSummary.Visible = true;
            tblHome.Visible = true;

            dal.SaveUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 0);
        }
        else
        {
            dal.SaveUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 1);
        }

        if (grdClasses.Rows.Count > 0 && (Session["ProgramTypeId"].ToString() == "4" || Session["ProgramTypeId"].ToString() == "5"))
        {
            btnAddNewClass.Visible = false;
        }
        else
        {
            btnAddNewClass.Visible = true;
        }
    }

    protected void btnAddNewClass_Click(object sender, EventArgs e)
    {
        ViewState["UpkClassroomId"] = "0";

        ResetClass();
        tblClassroom.Visible = true;
        tblClassroomSummary.Visible = false;
        tblHome.Visible = false;
    }

    protected void btnCancelClass_Click(object sender, EventArgs e)
    {
        tblClassroomSummary.Visible = true;
        tblHome.Visible = true;
        tblClassroom.Visible = false;

        ResetClass();
    }

    protected void btnSaveClass_Click(object sender, EventArgs e)
    {
        SaveClass();
    }

    private void SaveClass()
    {
        if (IsValidClassData())
        {
            int retVal = dal.SaveUpkClassroom(Convert.ToInt32(Session["GrantApplicantId"].ToString())
                    , Convert.ToInt32(ViewState["UpkClassroomId"].ToString())
                    , txtClassroom.Text
                    , Convert.ToInt32(txtTotalChildren.Text)
                    , Convert.ToInt32(txtHighNeedsChildren.Text)
                    , Convert.ToInt32(txtEnglishLearner.Text)
                    , Convert.ToInt32(txtHispanicChildren.Text)
                    , Convert.ToInt32(txtNonHispanicChildren.Text)
                    , Convert.ToInt32(txtIndianChildren.Text)
                    , Convert.ToInt32(txtAsianChildren.Text)
                    , Convert.ToInt32(txtAfricanChildren.Text)
                    , Convert.ToInt32(txtHawaiianChildren.Text)
                    , Convert.ToInt32(txtWhiteChildren.Text)
                    , Convert.ToInt32(txtBiracialChildren.Text)
                    , Convert.ToInt32(txtOtherRaceChildren.Text)
                    , Convert.ToInt32(txtUnspecifiedChildren.Text)
                    , Convert.ToInt32(txtPreSchoolChildren.Text)
                    , ViewState["GrantUpkSystemProvidersId"].ToString()
                    , Convert.ToInt32(txtWeeksPerYearOperation.Text)
                    , Convert.ToInt32(txtDaysPerWeekOperation.Text)
                    , Convert.ToInt32(txtHoursPerDayOperation.Text)
                    , AppInfo.FiscalYear
                    );

            dal.SaveUPKPartStatus(Convert.ToInt32(Session["GrantApplicantId"].ToString()), "4", 1);

            if (retVal == 0)
            {
                tblErrorMessage1.Visible = true;
                lblErrorMessage1.Text = "Error while saving the information. Please contact EEC.";
            }
            else
            {
                if (AppInfo.Competitive)
                {
                    float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
                    Session["Eligibility Amount"] = eligAmount.ToString("N2");
                    Master.ReloadEligibilityAmount();
                }

                ViewState["UpkClassroomId"] = "0";
                tblClassroom.Visible = false;
                tblClassroomSummary.Visible = true;
                tblHome.Visible = true;
                BindData();
            }
        }
    }
    
    private bool IsValidClassData()
    {
        bool validData = true;
        string errMsg = "";

        if (Convert.ToInt32(txtPreSchoolChildren.Text) > Convert.ToInt32(txtTotalChildren.Text))
        {
            validData = false;
            errMsg += "&nbsp;The total number of preschool-aged children should not exceed the total number of children in the classroom. Please double-check the numbers that you have entered.<br/>";
        }

        if (Convert.ToInt32(txtHighNeedsChildren.Text) > Convert.ToInt32(txtPreSchoolChildren.Text))
        {
            validData = false;
            errMsg += "&nbsp;The total number of preschool-aged children who are high needs should not exceed the total number of preschool-aged children in the classroom. Please double-check the numbers that you have entered.<br/>";
        }

        if (Convert.ToInt32(txtHighNeedsChildren.Text) <= 0)
        {
            validData = false;
            errMsg += "&nbsp;Serving high needs children is required for this grant. Please double-check your work.<br/>";
        }

        if (Convert.ToInt32(txtEnglishLearner.Text) > Convert.ToInt32(txtPreSchoolChildren.Text))
        {
            validData = false;
            errMsg += "&nbsp;The total number of preschool-aged children who are dual language learners should not exceed the total number of preschool-aged children in the classroom. Please double-check the numbers that you have entered.<br/>";
        }

        if ((Convert.ToInt32(txtHispanicChildren.Text) + Convert.ToInt32(txtNonHispanicChildren.Text)) != Convert.ToInt32(txtPreSchoolChildren.Text))
        {
            validData = false;
            errMsg += "&nbsp;The total number of preschool-aged children entered for the <b><u>Ethnic Composition categories</u></b> must equal the total number of preschool-aged children in the classroom. Please double-check the numbers that you have entered.<br/>";
        }

        if ((Convert.ToInt32(txtIndianChildren.Text) +
            Convert.ToInt32(txtAsianChildren.Text) +
            Convert.ToInt32(txtAfricanChildren.Text) +
            Convert.ToInt32(txtHawaiianChildren.Text) +
            Convert.ToInt32(txtWhiteChildren.Text) +
            Convert.ToInt32(txtBiracialChildren.Text) +
            Convert.ToInt32(txtOtherRaceChildren.Text) +
            Convert.ToInt32(txtUnspecifiedChildren.Text)) != Convert.ToInt32(txtPreSchoolChildren.Text))
        {
            validData = false;
            errMsg += "&nbsp;The total number of preschool-aged children entered for the <b><u>Racial Composition categories</u></b> must equal the total number of preschool-aged children in the classroom. Please double-check the numbers that you have entered.<br/>";
        }

        if (validData)
        {
            lblErrorMessage1.Text = "";
            tblErrorMessage1.Visible = false;
        }
        else
        {
            lblErrorMessage1.Text = errMsg;
            tblErrorMessage1.Visible = true;
        }

        return validData;
    }
    
    private void ResetClass()
    {
        txtClassroom.Text = "";
        txtTotalChildren.Text = "";
        txtPreSchoolChildren.Text = "";
        txtHighNeedsChildren.Text = "";

        txtEnglishLearner.Text = "";
        txtHispanicChildren.Text = "";
        txtNonHispanicChildren.Text = "";
        txtIndianChildren.Text = "";
        txtAsianChildren.Text = "";
        txtAfricanChildren.Text = "";
        txtHawaiianChildren.Text = "";
        txtWhiteChildren.Text = "";
        txtBiracialChildren.Text = "";
        txtOtherRaceChildren.Text = "";
        txtUnspecifiedChildren.Text = "";

        txtWeeksPerYearOperation.Text = "";
        txtDaysPerWeekOperation.Text = "";
        txtHoursPerDayOperation.Text = "";
        txtTotalHoursPerYear.Text = "";

        lblErrorMessage1.Text = "";

        tblErrorMessage1.Visible = false;
    }

    protected void grdClasses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ViewState["UpkClassroomId"] = grdClasses.DataKeys[e.NewEditIndex].Value;
        //btnAddNewClass.Enabled = false;
        tblClassroom.Visible = true;
        tblClassroomSummary.Visible = false;
        tblHome.Visible = false;
        BindClassroom(Convert.ToInt32(ViewState["UpkClassroomId"].ToString()));
    }

    private void BindClassroom(int upkClassroomId)
    {
        DataSet ds = dal.GetUpkClassroom(upkClassroomId);

        DataRow dr;

        if (ds.Tables[0].Rows.Count > 0)
        {
            dr = ds.Tables[0].Rows[0];
            txtClassroom.Text = dr["ClassroomName"].ToString();
            txtTotalChildren.Text = dr["TotalChildren"].ToString();
            txtPreSchoolChildren.Text = dr["PreSchoolChildren"].ToString();
            txtHighNeedsChildren.Text = dr["HighNeedsChildren"].ToString();

            txtEnglishLearner.Text = dr["EnglishLearner"].ToString();
            txtHispanicChildren.Text = dr["HispanicChildren"].ToString();
            txtNonHispanicChildren.Text = dr["NonHispanicChildren"].ToString();
            txtIndianChildren.Text = dr["IndianChildren"].ToString();
            txtAsianChildren.Text = dr["AsianChildren"].ToString();
            txtAfricanChildren.Text = dr["AfricanChildren"].ToString();
            txtHawaiianChildren.Text = dr["HawaiianChildren"].ToString();
            txtWhiteChildren.Text = dr["WhiteChildren"].ToString();
            txtBiracialChildren.Text = dr["BiracialChildren"].ToString();
            txtOtherRaceChildren.Text = dr["OtherRaceChildren"].ToString();
            txtUnspecifiedChildren.Text = dr["UnspecifiedChildren"].ToString();

            txtWeeksPerYearOperation.Text = !String.IsNullOrEmpty(dr["WeeksPerYearOperation"].ToString()) ? dr["WeeksPerYearOperation"].ToString() : "";
            txtDaysPerWeekOperation.Text = !String.IsNullOrEmpty(dr["DaysPerWeekOperation"].ToString()) ? dr["DaysPerWeekOperation"].ToString() : "";
            txtHoursPerDayOperation.Text = !String.IsNullOrEmpty(dr["HoursPerDayOperation"].ToString()) ? dr["HoursPerDayOperation"].ToString() : "";

            txtTotalHoursPerYear.Text = (Int32.Parse(string.IsNullOrEmpty(txtWeeksPerYearOperation.Text) ? "0" : txtWeeksPerYearOperation.Text) *
                             Int32.Parse(string.IsNullOrEmpty(txtDaysPerWeekOperation.Text) ? "0" : txtDaysPerWeekOperation.Text) *
                             Int32.Parse(string.IsNullOrEmpty(txtHoursPerDayOperation.Text) ? "0" : txtHoursPerDayOperation.Text)).ToString();
        }
    }

    protected void grdClasses_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            e.Row.Cells[e.Row.Cells.Count - 1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this classroom?');");

            if (AppInfo.Competitive)
            {
                e.Row.Cells[3].Text = "$" + Single.Parse(dr["Amount"].ToString()).ToString("N2");
            }
            else
            {
                e.Row.Cells[3].Text = "------";
            }
        }
    }

    protected void grdClasses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dal.DeleteUpkClassroom(Convert.ToInt32(grdClasses.DataKeys[e.RowIndex].Value));

        if (AppInfo.Competitive)
        {
            float eligAmount = dal.UpdateUPKEligAmount(Convert.ToInt32(Session["GrantApplicantId"].ToString()));
            Session["Eligibility Amount"] = eligAmount.ToString("N2");
            Master.ReloadEligibilityAmount();
        }

        BindData();
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("UPKProgramInformation.aspx");
    }
}