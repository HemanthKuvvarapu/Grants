using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BudgetNarrativeSummaryProjected2Year : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart6cTitle;

        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        ds = dal.GetBudgetSummary(Int32.Parse(Session["GrantApplicantId"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            if (hasValidationErrors())
            {
                tblErrorMessage.Visible = true;
                tblHSBudget.Visible = false;
                btnPrintBudgetSummary.Visible = false;
            }
            else
            {
                tblErrorMessage.Visible = false;
                tblHSBudget.Visible = true;
                btnPrintBudgetSummary.Visible = true;

                txtAllocationFund.Text = Session["Eligibility Amount"].ToString();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables[0].Rows[0];

                    txtAdminSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AdminSubTotalColD"].ToString()).ToString("N0");
                    txtIPSSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IPSSubTotalColD"].ToString()).ToString("N0");
                    txtSSSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SSSubTotalColD"].ToString()).ToString("N0");
                    txtFBSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["FBSubTotalColD"].ToString()).ToString("N0");
                    txtCSSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CSSubTotalColD"].ToString()).ToString("N0");
                    txtSMSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SMSubTotalColD"].ToString()).ToString("N0");
                    txtTravelSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["TravelSubTotalColD"].ToString()).ToString("N0");
                    txtOCSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["OCSubTotalColD"].ToString()).ToString("N0");
                    txtCBSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CBSubTotalColD"].ToString()).ToString("N0");
                    txtEqSubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["EqSubTotalColD"].ToString()).ToString("N0");
                    txtAncillarySubTotalColD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AncillarySubTotalColD"].ToString()).ToString("N0");

                    txtAdminSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AdminSubTotalColF"].ToString()).ToString("N0");
                    txtIPSSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IPSSubTotalColF"].ToString()).ToString("N0");
                    txtSSSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SSSubTotalColF"].ToString()).ToString("N0");
                    txtFBSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["FBSubTotalColF"].ToString()).ToString("N0");
                    txtCSSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CSSubTotalColF"].ToString()).ToString("N0");
                    txtSMSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SMSubTotalColF"].ToString()).ToString("N0");
                    txtGrantTotalD.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["GrantTotalD"].ToString()).ToString("N2");
                    txtTravelSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["TravelSubTotalColF"].ToString()).ToString("N0");
                    txtOCSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["OCSubTotalColF"].ToString()).ToString("N0");
                    txtCBSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CBSubTotalColF"].ToString()).ToString("N0");
                    txtEqSubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["EqSubTotalColF"].ToString()).ToString("N0");
                    txtAncillarySubTotalColF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AncillarySubTotalColF"].ToString()).ToString("N0");

                    txtAdminSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AdminSubTotal"].ToString()).ToString("N0");
                    txtGrantTotalF.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["GrantTotalF"].ToString()).ToString("N2");
                    txtIPSSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IPSSubTotal"].ToString()).ToString("N0");
                    txtSSSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SSSubTotal"].ToString()).ToString("N0");
                    txtFBSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["FBSubTotal"].ToString()).ToString("N0");
                    txtCSSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CSSubTotal"].ToString()).ToString("N0");
                    txtSMSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SMSubTotal"].ToString()).ToString("N0");
                    txtTravelSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["TravelSubTotal"].ToString()).ToString("N0");
                    txtOCSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["OCSubTotal"].ToString()).ToString("N0");
                    txtCBSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["CBSubTotal"].ToString()).ToString("N0");
                    txtIndirectPercent.Text = Convert.ToSingle(ds.Tables[0].Rows[0]["IndirectPercent"].ToString()).ToString("N2");
                    txtIndirectCosts.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IndirectCosts"].ToString()).ToString("N0");
                    txtEqSubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["EqSubTotal"].ToString()).ToString("N0");
                    txtAncillarySubTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AncillarySubTotal"].ToString()).ToString("N0");

                    txtAdminSubTotalNumofStaff.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["AdminSubTotalNumofStaff"].ToString()).ToString();
                    txtIPSSubTotalNumofStaff.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IPSSubTotalNumofStaff"].ToString()).ToString();
                    txtSSSubTotalNumofStaff.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["SSSubTotalNumofStaff"].ToString()).ToString();
                    txtFBSubTotalNumofStaff.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["FBSubTotalNumofStaff"].ToString()).ToString();
                    txtGrantTotal.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["GrantTotal"].ToString()).ToString("N2");

                    txtFBSubTotalFTE.Text = Convert.ToDecimal(ds.Tables[0].Rows[0]["FBSubTotalFTE"].ToString()).ToString("N2");
                    txtSSSubTotalFTE.Text = Convert.ToDecimal(ds.Tables[0].Rows[0]["SSSubTotalFTE"].ToString()).ToString("N2");
                    txtIPSSubTotalFTE.Text = Convert.ToDecimal(ds.Tables[0].Rows[0]["IPSSubTotalFTE"].ToString()).ToString("N2");
                    txtAdminSubTotalFTE.Text = Convert.ToDecimal(ds.Tables[0].Rows[0]["AdminSubTotalFTE"].ToString()).ToString("N2");
                }
            }
        }
        else
        {
            tblErrorMessage.Visible = true;
            tblHSBudget.Visible = false;
            btnPrintBudgetSummary.Visible = false;
        }
    }

    private bool hasValidationErrors()
    {
        int errorCount = 0;
        float amount;
        float percent;

        if (!GlobalFunc.isValidBudgetSummaryEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), ds))
        {
            errorCount++;
        }

        if (!GlobalFunc.isValidBudgetSummaryEECAdminLimit(ds, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
        {
            errorCount++;
        }

        return errorCount > 0;
    }

    protected void btnPrintBudgetSummary_Click(object sender, EventArgs e)
    {
        Response.Redirect("Print.aspx?type=budgetSummaryProjected2Year");
    }

    protected void btnGoHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }
}