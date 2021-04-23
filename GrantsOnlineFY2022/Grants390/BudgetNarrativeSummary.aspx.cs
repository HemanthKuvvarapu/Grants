using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BudgetNarrativeSummary : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart6aTitle;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "6a");

        BindScripts();

        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindScripts()
    {
        lnkShowDetailAdmin.NavigateUrl = "javascript:showDetail('" + lnkShowDetailAdmin.ClientID + "', '" + grdViewAdmin.ClientID + "');";
        lnkShowDetailIP.NavigateUrl = "javascript:showDetail('" + lnkShowDetailIP.ClientID + "', '" + grdViewIP.ClientID + "');";
        lnkShowDetailSS.NavigateUrl = "javascript:showDetail('" + lnkShowDetailSS.ClientID + "', '" + grdViewSS.ClientID + "');";
        lnkShowDetailFB.NavigateUrl = "javascript:showDetail('" + lnkShowDetailFB.ClientID + "', '" + grdViewFB.ClientID + "');";
        lnkShowDetailCS.NavigateUrl = "javascript:showDetail('" + lnkShowDetailCS.ClientID + "', '" + grdViewCS.ClientID + "');";
        lnkShowDetailSM.NavigateUrl = "javascript:showDetail('" + lnkShowDetailSM.ClientID + "', '" + grdViewSM.ClientID + "');";
        lnkShowDetailTravel.NavigateUrl = "javascript:showDetail('" + lnkShowDetailTravel.ClientID + "', '" + grdViewTravel.ClientID + "');";
        lnkShowDetailOC.NavigateUrl = "javascript:showDetail('" + lnkShowDetailOC.ClientID + "', '" + grdViewOC.ClientID + "');";
        lnkShowDetailCB.NavigateUrl = "javascript:showDetail('" + lnkShowDetailCB.ClientID + "', '" + grdViewCB.ClientID + "');";
        lnkShowDetailIndirect.NavigateUrl = "javascript:showDetail('" + lnkShowDetailIndirect.ClientID + "', '" + grdViewIndirect.ClientID + "');";
        lnkShowDetailEquipment.NavigateUrl = "javascript:showDetail('" + lnkShowDetailEquipment.ClientID + "', '" + grdViewEquipment.ClientID + "');";
        lnkShowDetailAncillary.NavigateUrl = "javascript:showDetail('" + lnkShowDetailAncillary.ClientID + "', '" + grdViewAncillary.ClientID + "');";
    }

    private void BindData()
    {
        tblFailed.Visible = false;

        ds = dal.GetBudgetNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()), 1);

        if (ds.Tables[0].Rows.Count > 0)
        {
            ds = dal.GetBudgetSummary(Int32.Parse(Session["GrantApplicantId"].ToString()));

            txtAllocationFund.Text = Session["Eligibility Amount"].ToString();

            if (ds.Tables[0].Rows.Count > 0)
            {
                tblError.Visible = false;
                tblHSBudget.Visible = true;
                btnPrintBudgetSummary.Visible = true;

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
                //Ancillary
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
                txtIndirectCosts2.Text = Convert.ToInt32(ds.Tables[0].Rows[0]["IndirectCosts"].ToString()).ToString("N0");
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


                //start all detail grid view binding
                grdViewAdmin.DataSource = ds.Tables[1];
                grdViewAdmin.DataBind();

                grdViewIP.DataSource = ds.Tables[1];
                grdViewIP.DataBind();

                grdViewSS.DataSource = ds.Tables[1];
                grdViewSS.DataBind();

                grdViewFB.DataSource = ds.Tables[1];
                grdViewFB.DataBind();

                grdViewCS.DataSource = ds.Tables[1];
                grdViewCS.DataBind();

                grdViewSM.DataSource = ds.Tables[1];
                grdViewSM.DataBind();

                grdViewTravel.DataSource = ds.Tables[1];
                grdViewTravel.DataBind();

                grdViewOC.DataSource = ds.Tables[1];
                grdViewOC.DataBind();

                grdViewCB.DataSource = ds.Tables[1];
                grdViewCB.DataBind();

                grdViewIndirect.DataSource = ds.Tables[1];
                grdViewIndirect.DataBind();

                grdViewEquipment.DataSource = ds.Tables[1];
                grdViewEquipment.DataBind();

                grdViewAncillary.DataSource = ds.Tables[1];
                grdViewAncillary.DataBind();

                //get validation errors
                //get any errors
                if (hasValidationErrors())
                {
                    tblFailed.Visible = true;
                }
                else
                {
                    tblFailed.Visible = false;
                }
            }
        }
        else
        {
            tblError.Visible = true;
            tblHSBudget.Visible = false;
            btnPrintBudgetSummary.Visible = false;
        }
    }

    private bool hasValidationErrors()
    {
        int errorCount = 0;
        float amount;

        lstErrors.Items.Clear();

        //if (!GlobalFunc.isValidBudgetSummaryEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), ds))
        //{
        //    lstErrors.Items.Add("The requested amount is not equal to the total eligibility amount. Please revise your budget accordingly.");
        //    errorCount++;
        //}
        if (!GlobalFunc.isValidBudgetSummaryOverEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), ds))
        {
            lstErrors.Items.Add("The requested amount is more than the total eligibility amount. Please revise your budget accordingly.");
            errorCount++;
        }

        if (!GlobalFunc.isValidBudgetSummaryEECAdminLimit(ds, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
        {
            lstErrors.Items.Add("EEC's " + AppInfo.EECAdminLimitPerc.ToString() + "% Admin limit has been exceeded by " + "$" + amount.ToString("N0") +". Please revise your budget accordingly.");
            errorCount++;
        }

        if (AppInfo.FundCode == 511) //UPK only
        {
            if (Session["ProgramTypeId"].ToString() == "5") //only check if FCS
            {
                if (!GlobalFunc.isValidBudgetSummaryProviderTransfer(Int32.Parse(Session["GrantApplicantId"].ToString()), Convert.ToSingle(Session["Eligibility Amount"].ToString()), AppInfo.UPKPassFundToProviderPerc))
                {
                    lstErrors.Items.Add("The Lead Agency's requested amount did not account for " + (AppInfo.UPKPassFundToProviderPerc * 100f).ToString("N0") + "% of their UPK funds being passed through to the Providers.");
                    errorCount++;
                }
            }
        }

        double amount2;

        if (!GlobalFunc.isValidBudgetSummaryAncillaryServices(ds, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount2))
        {
            lstErrors.Items.Add("EEC's 5% Ancillary Services has been exceeded by " + "$" + amount.ToString("N0") + ". Please revise your budget accordingly.");
            errorCount++;
        }

        return lstErrors.Items.Count > 0;
    }

    protected void btnGoHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnPrintBudgetSummary_Click(object sender, EventArgs e)
    {
        Response.Redirect("Print.aspx?type=budgetSummary");
    }

    #region grdView binding

    protected void grdViewAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = Int32.Parse(oRow["AdminSubTotalNumofStaff"].ToString()).ToString("N0");
            e.Row.Cells[2].Text = Single.Parse(oRow["AdminSubTotalFTE"].ToString()).ToString("N2");
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["AdminSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["AdminSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["AdminSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewIP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = Int32.Parse(oRow["IPSSubTotalNumofStaff"].ToString()).ToString("N0");
            e.Row.Cells[2].Text = Single.Parse(oRow["IPSSubTotalFTE"].ToString()).ToString("N2");
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["IPSSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["IPSSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["IPSSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewSS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = Int32.Parse(oRow["SSSubTotalNumofStaff"].ToString()).ToString("N0");
            e.Row.Cells[2].Text = Single.Parse(oRow["SSSubTotalFTE"].ToString()).ToString("N2");
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["SSSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["SSSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["SSSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewFB_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = Int32.Parse(oRow["FBSubTotalNumofStaff"].ToString()).ToString("N0");
            e.Row.Cells[2].Text = Single.Parse(oRow["FBSubTotalFTE"].ToString()).ToString("N2");
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["FBSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["FBSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["FBSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewCS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["CSSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["CSSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["CSSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewSM_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["SMSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["SMSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["SMSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewTravel_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["TravelSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["TravelSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["TravelSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewOC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["OCSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["OCSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["OCSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewCB_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["CBSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["CBSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["CBSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewIndirect_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "";
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["IndirectCosts"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "";

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewEquipment_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["EqSubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["EqSubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["EqSubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }

    protected void grdViewAncillary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grd;
        DataTable ds;
        DataRow oRow;
        HyperLink oHyperLink;

        grd = (GridView)sender;
        ds = (DataTable)grd.DataSource;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = e.Row.Cells[0].Text + "<br/>" + "<img src='images/spacer.gif' width='189px' height='1px' alt='' />";
            e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[2].Text = e.Row.Cells[2].Text + "<br/>" + "<img src='images/spacer.gif' width='100px' height='1px' alt='' />";
            e.Row.Cells[3].Text = e.Row.Cells[3].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[4].Text = e.Row.Cells[4].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<br/>" + "<img src='images/spacer.gif' width='115px' height='1px' alt='' />";
            e.Row.Cells[6].Text = e.Row.Cells[6].Text + "<br/>" + "<img src='images/spacer.gif' width='85px' height='1px' alt='' />";
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[0].Text = oRow["AgencyName"].ToString();
            e.Row.Cells[1].Text = "";
            e.Row.Cells[2].Text = "";
            e.Row.Cells[3].Text = "$" + Decimal.Parse(oRow["AncillarySubTotalColD"].ToString()).ToString("N0");
            e.Row.Cells[4].Text = "$" + Decimal.Parse(oRow["AncillarySubTotalColF"].ToString()).ToString("N0");
            e.Row.Cells[5].Text = "$" + Decimal.Parse(oRow["AncillarySubTotal"].ToString()).ToString("N0");

            oHyperLink = (HyperLink)e.Row.Cells[6].Controls[1];

            if (oRow["IsLeadAgency"].ToString() == "1")
                oHyperLink.NavigateUrl = "BudgetNarrative.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
            else
                oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();
        }
    }
    #endregion
}
