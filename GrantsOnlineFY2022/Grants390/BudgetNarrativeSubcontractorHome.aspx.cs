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

public partial class BudgetNarrativeSubcontractorHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = "Subcontractor Budget (Part 5)";

        MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            BindSCGrid();
        }
    }

    private void BindSCGrid()
    {
        DAL dal = new DAL();

        DataSet ds = dal.GetHSSubContractorsInfo(Int32.Parse(Session["GrantApplicantId"].ToString()), 0);

        //if (ds.Tables[0].Rows.Count > 0)
        //{
            grdSCs.DataSource = ds;
            grdSCs.DataBind();
        //}
    }

    protected void grdSCs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DAL dal = new DAL();

        int retVal = 0;

        if (e.CommandName == "Delete")
            retVal = dal.DeleteSubcontractorData(Int32.Parse(grdSCs.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()));

        BindSCGrid();
    }

    protected void grdSCs_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("BudgetNarrativeSubcontractor.aspx");
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

            e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this subcontractor?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "BudgetNarrativeSubcontractor.aspx?id=" + oRow["BudgetNarrativeID"].ToString();

            statusImage = (Image)e.Row.Cells[4].Controls[1];

            if (Int32.Parse(oRow["ErrorCount"].ToString()) == 0)
            {
                statusImage.ImageUrl = "~/Images/Completed.jpg";
            }
            else
            {
                statusImage.ImageUrl = "~/Images/InComplete.jpg";
            }

            if (Int32.Parse(oRow["ErrorCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = "<span class=\"styleErrors\">" + oRow["ErrorCount"].ToString() + " error(s) found.&nbsp;&nbsp;&nbsp;&nbsp;</span>";
            }

            if (Int32.Parse(oRow["WarningCount"].ToString()) > 0)
            {
                e.Row.Cells[5].Text = e.Row.Cells[5].Text + "<span class=\"styleWarnings\">" + oRow["WarningCount"].ToString() + " warning(s) found.</span>";
            }
        }
    }
}
