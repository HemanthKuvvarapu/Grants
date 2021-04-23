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

public partial class HeadStart_HSFamHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            //HSAgenName.Text = Session["Lead Agency Name"].ToString();
            BindHSGrid();
        }
    }

    private void BindHSGrid()
    {
        HSDAL dal = new HSDAL();
        DataSet ds = dal.GetHSFamilyChildcareSiteSurvey(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        //if (ds.Tables[0].Rows.Count > 0)
        //{
        grdHSFCC.DataSource = ds;
        grdHSFCC.DataBind();
        //}
    }

    protected void grdHSFCC_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        HSDAL dal = new HSDAL();

        int retVal = 0;

        if (e.CommandName == "Delete")
            retVal = dal.DeleteHSFamilyChidcareSurvey(Int32.Parse(grdHSFCC.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()));

        BindHSGrid();
    }

    protected void grdHSFCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("HSFamEntry.aspx");
    }

    protected void grdHSFCC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdHSFCC;
        DataSet dsSCs;
        DataRow oRow;
        HyperLink oHyperLink;


        grdHSFCC = (GridView)sender;
        dsSCs = (DataSet)grdHSFCC.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsSCs.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this HeadStart Family Childcare ?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "HSFamEntry.aspx?id=" + oRow["HeadStartFCCLeadAgencyIDNumber"].ToString();


        }
    }
}