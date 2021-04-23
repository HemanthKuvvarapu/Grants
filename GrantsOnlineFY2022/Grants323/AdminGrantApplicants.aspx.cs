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

public partial class AdminGrantApplicants : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthUser"] == null)
            Response.Redirect("Default.aspx");

        lblFailed.Visible = false;
        lblSuccess.Visible = false;

        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        ds = dal.GetGrantApplicants(AppInfo.FundCode, AppInfo.FiscalYear);

        grdApplicants.DataSource = ds;
        grdApplicants.DataBind();
    }

    protected void grdApplicants_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            e.Row.Cells[0].Text = dr["GrantApplicantId"].ToString();

            CheckBox chkAwarded = (CheckBox)e.Row.FindControl("chkAwarded");
            chkAwarded.Checked = (dr["Awarded"].ToString() == "1" ? true : false);

            TextBox txtEligAmount = (TextBox)e.Row.FindControl("txtEligAmount");
            txtEligAmount.Text = Single.Parse(String.IsNullOrEmpty(dr["EligibilityAmount"].ToString())?"0": dr["EligibilityAmount"].ToString()).ToString("N2");

            TextBox txtAgencyName = (TextBox)e.Row.FindControl("txtAgencyName");
            txtAgencyName.Text = dr["AgencyName"].ToString();

            TextBox txtProgramname = (TextBox)e.Row.FindControl("txtProgramName");
            txtProgramname.Text = dr["UPKProgramName"].ToString();

            TextBox txtVendorCode = (TextBox)e.Row.FindControl("txtVendorCode");
            txtVendorCode.Text = dr["VendorCode"].ToString();

            TextBox txtMMarsId = (TextBox)e.Row.FindControl("txtMMarsId");
            txtMMarsId.Text = dr["MMarsId"].ToString();

            TextBox txtADNumber = (TextBox)e.Row.FindControl("txtADNumber");
            txtADNumber.Text = dr["ADNumber"].ToString();

            TextBox txtAddress1 = (TextBox)e.Row.FindControl("txtAddress1");
            txtAddress1.Text = dr["Address1"].ToString();

            TextBox txtAddress2 = (TextBox)e.Row.FindControl("txtAddress2");
            txtAddress2.Text = dr["Address2"].ToString();

            TextBox txtCity = (TextBox)e.Row.FindControl("txtCity");
            txtCity.Text = dr["City"].ToString();

            TextBox txtState = (TextBox)e.Row.FindControl("txtState");
            txtState.Text = dr["State"].ToString();

            TextBox txtZipCode = (TextBox)e.Row.FindControl("txtZipcode");
            txtZipCode.Text = dr["Zipcode"].ToString();

            CheckBox chkPCHP = (CheckBox)e.Row.FindControl("chkPCHP");
            chkPCHP.Checked = (dr["isPCHP"].ToString() == "1" ? true : false);

            TextBox originalBudgetAlloc = (TextBox)e.Row.FindControl("txtOriginalAmount");
            originalBudgetAlloc.Text = Single.Parse(String.IsNullOrEmpty(dr["OriginalBudgetAlloc"].ToString()) ? txtEligAmount.Text : dr["OriginalBudgetAlloc"].ToString()).ToString("N2");

            TextBox ba1 = (TextBox)e.Row.FindControl("txtBA1");
            ba1.Text = Single.Parse(String.IsNullOrEmpty(dr["Amendment1Eligibility"].ToString()) ? "0" : dr["Amendment1Eligibility"].ToString()).ToString("N2");

            TextBox ba2 = (TextBox)e.Row.FindControl("txtBA2");
            ba2.Text = Single.Parse(String.IsNullOrEmpty(dr["Amendment2Eligibility"].ToString()) ? "0" : dr["Amendment2Eligibility"].ToString()).ToString("N2");

            TextBox ba3 = (TextBox)e.Row.FindControl("txtBA3");
            ba3.Text = Single.Parse(String.IsNullOrEmpty(dr["Amendment3Eligibility"].ToString()) ? "0" : dr["Amendment3Eligibility"].ToString()).ToString("N2");

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < grdApplicants.Rows.Count; i++)
            {
                int grantApplicantId = Int32.Parse(grdApplicants.Rows[i].Cells[0].Text.ToString());
                string awarded = ((CheckBox)grdApplicants.Rows[i].Cells[1].FindControl("chkAwarded")).Checked ? "1" : "0";
                string agencyName = ((TextBox)grdApplicants.Rows[i].Cells[2].FindControl("txtAgencyName")).Text.ToString();
                string programName = ((TextBox)grdApplicants.Rows[i].Cells[3].FindControl("txtProgramName")).Text.ToString();
                //string eligAmount = Single.Parse(((TextBox)grdApplicants.Rows[i].Cells[4].FindControl("txtEligAmount")).Text.ToString().Replace(",", "")).ToString("N2");
                string origAmount = Single.Parse(((TextBox)grdApplicants.Rows[i].Cells[5].FindControl("txtOriginalAmount")).Text.ToString().Replace(",", "")).ToString("N2");
                string BA1 = Single.Parse(((TextBox)grdApplicants.Rows[i].Cells[6].FindControl("txtBA1")).Text.ToString().Replace(",", "")).ToString("N2");
                string BA2 = Single.Parse(((TextBox)grdApplicants.Rows[i].Cells[7].FindControl("txtBA2")).Text.ToString().Replace(",", "")).ToString("N2");
                string BA3 = Single.Parse(((TextBox)grdApplicants.Rows[i].Cells[8].FindControl("txtBA3")).Text.ToString().Replace(",", "")).ToString("N2");
                string vendorCode = ((TextBox)grdApplicants.Rows[i].Cells[9].FindControl("txtVendorCode")).Text.ToString();
                string MMarsId = ((TextBox)grdApplicants.Rows[i].Cells[10].FindControl("txtMMarsId")).Text.ToString();
                string ADNumber = ((TextBox)grdApplicants.Rows[i].Cells[11].FindControl("txtADNumber")).Text.ToString();
                string address1 = ((TextBox)grdApplicants.Rows[i].Cells[12].FindControl("txtAddress1")).Text.ToString();
                string address2 = ((TextBox)grdApplicants.Rows[i].Cells[13].FindControl("txtAddress2")).Text.ToString();
                string city = ((TextBox)grdApplicants.Rows[i].Cells[14].FindControl("txtCity")).Text.ToString();
                string state = ((TextBox)grdApplicants.Rows[i].Cells[15].FindControl("txtState")).Text.ToString();
                string zipcode = ((TextBox)grdApplicants.Rows[i].Cells[16].FindControl("txtZipcode")).Text.ToString();
                string pchp = ((CheckBox)grdApplicants.Rows[i].Cells[17].FindControl("chkPCHP")).Checked ? "1" : "0";

                string eligAmount= (Single.Parse(origAmount) + Single.Parse(BA1) + Single.Parse(BA2) + Single.Parse(BA3)).ToString("N2");


                dal.UpdateGrantApplicants(grantApplicantId, agencyName, programName, eligAmount, vendorCode, 
                                          MMarsId, ADNumber, address1, address2, city, state, zipcode, awarded, pchp,origAmount,BA1,BA2,BA3);
            }

            lblFailed.Visible = false;
            lblSuccess.Visible = true;
        }
        catch (Exception ex)
        {
            lblFailed.Visible = true;
            lblSuccess.Visible = false;
        }

        BindData();
    }
}
