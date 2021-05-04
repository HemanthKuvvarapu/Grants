using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Report :  IMBasePage
{
    //public string pubHideNames = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ControlsInitialize();
        }
    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        Master.PageTitle = "Improper Payment (IP) Reports";

        //UserMsg.Text = "";
        //UserMsg.Visible = false;
        Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
        Session["IPReviewEndDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewEndDate");

        //pubHideNames = GetParameter("hn");
        //hidHideNames.Value = pubHideNames;
        //if (hidHideNames.Value == "")
        //    hidHideNames.Value = Session["HideNames"].ToString();

        DataSet ds = CReport.GetReportList();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grdReports.DataSource = ds;
            grdReports.DataBind();
        }


    }

    protected void grdReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        LinkButton btnSelect;
        //LinkButton btnReport;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView oRow = (DataRowView)e.Row.DataItem;

            btnSelect = (LinkButton)e.Row.Cells[2].FindControl("btnSelect");
            btnSelect.CommandArgument = e.Row.RowIndex.ToString();
            btnSelect.CommandName = "Select";
            btnSelect.Text = "Select";

            //btnReport.Text = "<a href='" + oRow["ReportName"].ToString() + "?ID='" + oRow["ReportID"].ToString() + ">" + oRow["ReportName"].ToString() + "</a>";
        }

    }

    protected void grdReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //String sError = "";
        int iIndex;
        //string hn;
        string sReportFilename = "";

        //if (pubHideNames == "")
        //{
        //    pubHideNames = Session["HideNames"].ToString();
        //}
        if (e.CommandName == "Select")
        {
            iIndex = Convert.ToInt16(e.CommandArgument);
            
            sReportFilename = grdReports.Rows[iIndex].Cells[2].Text;
            if (sReportFilename == "")
            {
                DataSet ds = CReport.GetReportList();
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    sReportFilename = ds.Tables[0].Rows[iIndex]["ReportFileName"].ToString();
                }
            }

            Response.Redirect(sReportFilename);
        }
        //else if (e.CommandName == "View")
        //{
        //    iIndex = Convert.ToInt16(e.CommandArgument);
        //}
    }

}