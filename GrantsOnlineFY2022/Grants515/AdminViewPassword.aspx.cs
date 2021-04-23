using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;


public partial class AdminViewPassword : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthUser"] == null)
            Response.Redirect("Default.aspx");

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        pnlDataSummary.Visible = true;
        grdDataSummary.DataSource = dal.GetAdminView(Convert.ToInt32(AppInfo.FundCode.ToString()), Convert.ToInt32(AppInfo.FiscalYear.ToString()));
        grdDataSummary.DataBind();

        lblDataSummary.Text = "Total records found: " + grdDataSummary.Rows.Count.ToString();
        lblDataSummary.Font.Bold = true;
        lblDataSummary.ForeColor = System.Drawing.Color.DarkBlue;
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        string fileName = "Grant" + AppInfo.FundCode.ToString() + "Applicants" + AppInfo.FiscalYear.ToString() + ".xls";

        Response.Clear();
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName);

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        grdDataSummary.RenderControl(htmlWrite);

        htmlWrite.WriteBreak();
        htmlWrite.WriteBreak();

        Response.Write(stringWrite.ToString());
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */

    }
}
