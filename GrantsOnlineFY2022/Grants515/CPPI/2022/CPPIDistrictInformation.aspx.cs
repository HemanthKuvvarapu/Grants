using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class CPPI_2020_CPPIDistrictInformation : System.Web.UI.Page
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
        //DataSet ds = dal.GetCPPIDistrictInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        BindData(false);

        /*
        DataSet ds = dal.GetUpkSystemProvidersNew(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        tblSysProviders.Visible = true;
        tblCenter.Visible = false;

        if (ds.Tables.Count > 0)
        {
            grdSysProviders.DataSource = ds.Tables[0];
            grdSysProviders.DataBind();
        }

        tblCommands.Visible = false;

        //if (Session["ProgramTypeId"].ToString() != "4")
        {
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count >= 1)
            {
                btnAddNewProgram.Visible = false;
            }
            else
            {
                btnAddNewProgram.Visible = true;
            }
        }
        //else
        //{
        //    btnAddNewProgram.Visible = true;
        //}
        */
    }

    private void BindData(bool isAfterSaved)
    {
        DataSet ds = dal.GetCPPIDistrictInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtDistrictName.Text = dr["DistrictName"].ToString();
            txtTotalEnrollment.Text = dr["TotalEnrollment"].ToString();
            txtHSGradRate.Text = dr["HighSchoolGradRate"].ToString();
            txtPctMeetExceed3rdGrade.Text = dr["PctMeetExceed3rdGrade"].ToString();
            txtPctMeetExceedELA.Text = dr["PctMeetExceedELA"].ToString();
            txtPctMeetExceedMath.Text = dr["PctMeetExceedMath"].ToString();
            txtPctRetentionEarlyK2.Text = dr["PctRetentionEarlyK2"].ToString();
            txtPctSuspensionK5.Text = dr["PctSuspensionK5"].ToString();
        }
    }


    private bool hasValidationErrors(bool isAfterSaved)
    {
        //int errorCount = 0;

        //setDefaultStyle();

        //lstErrors.Items.Clear();

        List<string> lstErrorBoxes = new List<string>();
       
        return lstErrorBoxes.Count > 0;
    }


    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIHome.aspx");
    }

    protected void btnGotoProgram_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIProgramInformation.aspx");
    }

    //CPPI
    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            tblFailed.Visible = true;
        }
        else
        {
            tblFailed.Visible = false;

            int retVal = dal.SaveCPPIDistrictInformation(Convert.ToInt32(Session["GrantApplicantId"].ToString())
                    , Convert.ToString(txtDistrictName.Text)
                    , Convert.ToInt32(txtTotalEnrollment.Text)
                    , Convert.ToDecimal(txtHSGradRate.Text)
                    , Convert.ToDecimal(txtPctMeetExceed3rdGrade.Text)
                    , Convert.ToDecimal(txtPctMeetExceedELA.Text)
                    , Convert.ToDecimal(txtPctMeetExceedMath.Text)
                    , Convert.ToDecimal(txtPctRetentionEarlyK2.Text)
                    , Convert.ToDecimal(txtPctSuspensionK5.Text));


            BindData(true);
            tblSuccess.Visible = true;
        }
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("CPPIHome.aspx");
    }



    //private void loadAgencyInfo(int grantApplicantId)
    //{
    //    DataSet ds = dal.GetGrantApplicant(Convert.ToInt32(Session["GrantApplicantId"]), AppInfo.FundCode);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        Session["Lead Agency Name"] = ds.Tables[0].Rows[0]["AgencyName"].ToString();
    //        Session["Eligibility Amount"] = Decimal.Parse(ds.Tables[0].Rows[0]["EligibilityAmount"].ToString()).ToString("N2");
    //        Session["Program Name"] = ds.Tables[0].Rows[0]["ProgramName"].ToString();
    //        Session["ProgramTypeId"] = ds.Tables[0].Rows[0]["ProgramTypeId"].ToString();
    //    }
    //}



}


