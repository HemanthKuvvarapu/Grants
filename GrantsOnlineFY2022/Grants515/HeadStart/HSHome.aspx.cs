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

public partial class HeadStart_HSHome : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("~/SessionTimeout.aspx");

        MaintainScrollPositionOnPostBack = true;

        if (!Page.IsPostBack)
        {
            //HSAgenName2.Text = Session["Lead Agency Name"].ToString();
            BindHSGrid();
        }
    }

    private void BindHSGrid()
    {
        HSDAL dal = new HSDAL();
        DataSet ds = dal.GetHSHomeBaseSiteSurvey(Int32.Parse(Session["GrantApplicantId"].ToString()), AppInfo.FiscalYear);

        grdHSHSHomeBase.DataSource = ds;
        grdHSHSHomeBase.DataBind();

    }

    protected void grdHSHSHomeBase_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        HSDAL dal = new HSDAL();

        int retVal = 0;

        if (e.CommandName == "Delete")
            retVal = dal.DeleteHSHomeBaseSurvey(Int32.Parse(grdHSHSHomeBase.DataKeys[Int32.Parse(e.CommandArgument.ToString())].Value.ToString()));

        BindHSGrid();
    }

    protected void grdHSHSHomeBase_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("HSHomeEntry.aspx");
    }

    protected void grdHSHSHomeBase_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdHSHSHomeBase;
        DataSet dsSCs;
        DataRow oRow;
        HyperLink oHyperLink;


        grdHSHSHomeBase = (GridView)sender;
        dsSCs = (DataSet)grdHSHSHomeBase.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = dsSCs.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            e.Row.Cells[1].Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this Home Based Programs?');");

            oHyperLink = (HyperLink)e.Row.Cells[0].Controls[0];
            oHyperLink.NavigateUrl = "HSHomeEntry.aspx?id=" + oRow["HSHBSiteID"].ToString();


        }
    }
}