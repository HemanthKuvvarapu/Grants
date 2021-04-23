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

public partial class AmendmentHome : System.Web.UI.Page
{
    DAL dal = new DAL();
    Amendment amend = new Amendment();
    bool enableSubmit = true;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        string amendmentVersion = Request.QueryString["ver"].ToString();

        ViewState["AmendmentVersion"] = amendmentVersion;
        Session["AmendmentVersion"] = amendmentVersion;

        Master.PartTitle = "Budget Amendment #" + ViewState["AmendmentVersion"].ToString();

        MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            LoadLeadAgencyList();
            LoadSubcontractorList();

            BindAllGrids();
        }

        btnSubmit.Enabled = (enableSubmit)?true:false;
        printSummaryTable.Visible = IsAmendmentSubmitted();
    }

    private bool IsAmendmentSubmitted()
    {
        DataSet ds = amend.GetAmendmentSubmitData(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["LatestSubmitDate"].ToString()))
            {
                return true;
            }
        }

        return false;
    }

    private void BindAllGrids()
    {
        BindLAGrid();
        BindSCGrid();
        BindSummaryGrid();
        BindCoverPage();

        if (grdSummary.Visible == false)
        {
            enableSubmit = false;
        }

        btnSubmit.Enabled = (enableSubmit) ? true : false;
    }

    private void BindLAGrid()
    {
        DAL dal = new DAL();

        DataSet ds = amend.GetLeadAgencyAmendmentInfo(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        grdLA.DataSource = ds;
        grdLA.DataBind();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grdLA.Visible = true;
        }
        else
        {
            grdLA.Visible = false;
        }
    }

    private void BindSCGrid()
    {
        DAL dal = new DAL();

        DataSet ds = dal.GetHSSubContractorsInfo(Int32.Parse(Session["GrantApplicantId"].ToString()), 0);

        if (ds.Tables[0].Rows.Count == 0)
        {
            tblSCs.Visible = false;
        }
        else
        {
            ds = amend.GetSubContractorsAmendmentInfo(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

            grdSCs.DataSource = ds;
            grdSCs.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdSCs.Visible = true;
            }
            else
            {
                grdSCs.Visible = false;
            }
        }
    }

    private void BindSummaryGrid()
    {
        DAL dal = new DAL();

        DataSet ds = amend.GetBudgetAmendmentSummary(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        DataSet dsLA = (DataSet) grdLA.DataSource;
        DataSet dsSC = (DataSet) grdSCs.DataSource;

        if (dsLA.Tables[0].Rows.Count > 0 || (dsSC != null && dsSC.Tables[0].Rows.Count > 0))
        {
            grdSummary.Visible = true;

            grdSummary.DataSource = ds;
            grdSummary.DataBind();

            tblSubmit.Visible = true;
        }
        else
        {
            grdSummary.Visible = false;

            tblSubmit.Visible = false;
        }
    }

    private void BindCoverPage()
    {
        DAL dal = new DAL();

        DataSet ds = ds = amend.GetCoverPageAmendmentData(Session["GrantApplicantId"].ToString(), ViewState["AmendmentVersion"].ToString());

        DataSet dsCover = (DataSet)grdCover.DataSource;

        if (ds.Tables[0].Rows.Count == 0)
        {
            if (enableSubmit)
            {
                enableSubmit = false;
            }
        }

        grdCover.DataSource = ds;
        grdCover.DataBind();

        if (grdSummary.Visible == false)
        {
            grdCover.Visible = false;
        }
        else
        {
            grdCover.Visible = true;
        }
    }

    private void LoadLeadAgencyList()
    {
        DAL dal = new DAL();

        DataSet ds = amend.GetAvailLeadAgencyAmendmentList(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[0];

                lstLeadAgency.Items.Add(new ListItem(dr["AgencyName"].ToString(), dr["BudgetNarrativeID"].ToString()));
            }

            tblLeadAgencyList.Visible = true;
        }
        else
        {
            tblLeadAgencyList.Visible = false;
        }
    }

    private void LoadSubcontractorList()
    {
        DAL dal = new DAL();

        DataSet ds = amend.GetAvailSubContractorsAmendmentList(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        if (ds.Tables[0].Rows.Count > 0)
        {
            lstSubcontractor.Items.Add(new ListItem("----------------------------", "-1"));

            DataRow dr;

            for (int i=0; i<ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                lstSubcontractor.Items.Add(new ListItem(dr["AgencyName"].ToString(), dr["BudgetNarrativeID"].ToString()));
            }

            tblSubContractorList.Visible = true;
            //tblSCs.Visible = true;
        }
        else
        {
            tblSubContractorList.Visible = false;
            //tblSCs.Visible = false;
        }
    }

    protected void grdLA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DAL dal = new DAL();

        int retVal = 0;

        if (e.CommandName == "Delete")
        {
            retVal = amend.DeleteAmendmentData(Int32.Parse(grdLA.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()),
                                             Int32.Parse(ViewState["AmendmentVersion"].ToString()));
        }

        LoadLeadAgencyList();
        BindAllGrids();
    }

    protected void grdSCs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DAL dal = new DAL();

        int retVal = 0;

        if (e.CommandName == "Delete")
        {
            retVal = amend.DeleteAmendmentData(Int32.Parse(grdSCs.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()),
                                             Int32.Parse(ViewState["AmendmentVersion"].ToString()));
        }

        LoadSubcontractorList();
        BindAllGrids();
    }

    protected void grdCover_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
        {
            Response.Redirect("AmendmentCoverPage.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
        }
    }

    protected void grdLA_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void grdSCs_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void btnAddNewLA_Click(object sender, EventArgs e)
    {
        if (lstLeadAgency.SelectedValue != "-1")
        {
            Response.Redirect("BudgetAmendmentLeadAgency.aspx?id=" + lstLeadAgency.SelectedValue.ToString() + "&ver=" + ViewState["AmendmentVersion"].ToString());
        }
    }

    protected void btnAddNewSC_Click(object sender, EventArgs e)
    {
        if (lstSubcontractor.SelectedValue != "-1")
        {
            Response.Redirect("BudgetAmendmentSubcontractor.aspx?id=" + lstSubcontractor.SelectedValue.ToString() + "&ver=" + ViewState["AmendmentVersion"].ToString());
        }
    }

    protected void grdLA_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdLA;
        DataSet dsLA;
        DataRow oRow;
        HyperLink oHyperLink;
        Image statusImage;

        grdLA = (GridView)sender;
        dsLA = (DataSet)grdLA.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsLA.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this lead agency budget amendment?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "BudgetAmendmentLeadAgency.aspx?id=" + oRow["BudgetNarrativeID"].ToString() + "&ver=" + ViewState["AmendmentVersion"].ToString();

            statusImage = (Image)e.Row.Cells[4].Controls[1];

            if (string.IsNullOrEmpty(oRow["ErrorCount"].ToString()) || Int32.Parse(oRow["ErrorCount"].ToString()) == 0)
            {
                statusImage.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                statusImage.ImageUrl = "~/Images/InComplete.jpg";
            }

            if (!string.IsNullOrEmpty(oRow["ErrorCount"].ToString()) && Int32.Parse(oRow["ErrorCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = "<span class=\"styleErrors\">" + oRow["ErrorCount"].ToString() + " error(s) found.&nbsp;&nbsp;&nbsp;&nbsp;</span>";
            }

            if (!string.IsNullOrEmpty(oRow["WarningCount"].ToString()) && Int32.Parse(oRow["WarningCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<span class=\"styleWarnings\">" + oRow["WarningCount"].ToString() + " warning(s) found.</span>";
            }

            if (enableSubmit && (!string.IsNullOrEmpty(oRow["ErrorCount"].ToString())) && (Int32.Parse(oRow["ErrorCount"].ToString()) > 0))
            {
                enableSubmit = false;
            }
        }
    }

    protected void grdSCs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdSCs;
        DataSet dsSCs;
        DataRow oRow;
        HyperLink oHyperLink;
        Image statusImage;

        grdSCs = (GridView)sender;
        dsSCs = (DataSet)grdSCs.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsSCs.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this subcontractor budget amendment?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "BudgetAmendmentSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString() + "&ver=" + ViewState["AmendmentVersion"].ToString();

            statusImage = (Image)e.Row.Cells[4].Controls[1];

            if (string.IsNullOrEmpty(oRow["ErrorCount"].ToString()) || Int32.Parse(oRow["ErrorCount"].ToString()) == 0)
            {
                statusImage.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                statusImage.ImageUrl = "~/Images/InComplete.jpg";
            }

            if (!string.IsNullOrEmpty(oRow["ErrorCount"].ToString()) && Int32.Parse(oRow["ErrorCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = "<span class=\"styleErrors\">" + oRow["ErrorCount"].ToString() + " error(s) found.&nbsp;&nbsp;&nbsp;&nbsp;</span>";
            }

            if (!string.IsNullOrEmpty(oRow["WarningCount"].ToString()) && Int32.Parse(oRow["WarningCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<span class=\"styleWarnings\">" + oRow["WarningCount"].ToString() + " warning(s) found.</span>";
            }

            if (enableSubmit && (Int32.Parse(oRow["ErrorCount"].ToString()) > 0))
            {
                enableSubmit = false;
            }
        }
    }

    protected void grdSummary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdSummary;
        DataSet dsSummary;
        DataRow oRow;
        HyperLink oHyperLink;
        Image statusImage;
        int errorCount = 0;
        float amount = 0;

        grdSummary = (GridView)sender;
        dsSummary = (DataSet)grdSummary.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsSummary.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            //e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this subcontractor budget amendment?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "BudgetAmendmentSummary.aspx?ver=" + ViewState["AmendmentVersion"].ToString();

            e.Row.Cells[2].Text = "Budget Amendment Summary";

            statusImage = (Image)e.Row.Cells[4].Controls[1];

            //if (!GlobalFuncAmendment.isValidBudgetAmendmentSummaryEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), dsSummary))
           // {
            //    errorCount++;
            //}

            if (!GlobalFuncAmendment.isValidBudgetAmendmentSummaryEECAdminLimit(dsSummary, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
            {
                errorCount++;
            }

            if (errorCount == 0)
            {
                statusImage.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                statusImage.ImageUrl = "~/Images/InComplete.jpg";
            }

            if (errorCount > 0)
            {
                e.Row.Cells[5].Text = "<span class=\"styleErrors\">" + errorCount.ToString() + " error(s) found.&nbsp;&nbsp;&nbsp;&nbsp;</span>";
            }

            //if (!string.IsNullOrEmpty(oRow["WarningCount"].ToString()) && Int32.Parse(oRow["WarningCount"].ToString()) > 0)
            //{
            //    e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<span class=\"styleWarnings\">" + oRow["WarningCount"].ToString() + " warning(s) found.</span>";
            //}

            if (enableSubmit && (errorCount > 0))
            {
                enableSubmit = false;
            }
        }
    }

    protected void grdCover_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdCover;
        DataSet dsCover;
        DataRow oRow;
        HyperLink oHyperLink;
        Image statusImage;
        int errorCount = 0;

        grdCover = (GridView)sender;
        dsCover = (DataSet)grdCover.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsCover.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            //e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this subcontractor budget amendment?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "AmendmentCoverPage.aspx?ver=" + ViewState["AmendmentVersion"].ToString();

            e.Row.Cells[2].Text = "Budget Amendment Cover Page";

            statusImage = (Image)e.Row.Cells[3].Controls[1];

            /*
            if (!GlobalFunc.isValidBudgetAmendmentSummaryEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), dsSummary))
            {
                errorCount++;
            }

            if (!GlobalFunc.isValidBudgetAmendmentSummaryEECAdminLimit(dsSummary, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
            {
                errorCount++;
            }
            */

            if (errorCount == 0)
            {
                statusImage.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                statusImage.ImageUrl = "~/Images/InComplete.jpg";
            }

            if (errorCount > 0)
            {
                e.Row.Cells[4].Text = "<span class=\"styleErrors\">" + errorCount.ToString() + " error(s) found.&nbsp;&nbsp;&nbsp;&nbsp;</span>";
            }

            //if (!string.IsNullOrEmpty(oRow["WarningCount"].ToString()) && Int32.Parse(oRow["WarningCount"].ToString()) > 0)
            //{
            //    e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<span class=\"styleWarnings\">" + oRow["WarningCount"].ToString() + " warning(s) found.</span>";
            //}

            if (enableSubmit && (errorCount > 0))
            {
                enableSubmit = false;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            amend.SaveAmendmentSubmitDate(Convert.ToInt32(Session["GrantApplicantId"]), Int32.Parse(ViewState["AmendmentVersion"].ToString()));
        }
        catch { }

        Response.Redirect("AmendmentComplete.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    protected void btnPrintAllAmendment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Print.aspx?type=BudgetAmendmentAll");
    }
}
