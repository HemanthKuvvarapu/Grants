using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AdminViewContent : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthUser"] == null)
            Response.Redirect("Default.aspx");
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment; filename=OnlineGrantData.xls");

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        grdDataSummary.RenderControl(htmlWrite);

        htmlWrite.WriteBreak();
        htmlWrite.WriteBreak();

        Response.Write(stringWrite.ToString());
        Response.End();
    }
    protected void lbtnShowAll_Click(object sender, EventArgs e)
    {
        BindData("ALL");
    }

    private void BindData(string type)
    {
        divData.Visible = true;

        grdDataSummary.DataSource = dal.GetAdminViewShowData(type, Convert.ToInt32(AppInfo.FundCode.ToString()), Convert.ToInt32(AppInfo.FiscalYear.ToString()));
        grdDataSummary.DataBind();

        lblDataSummary.Text = "Total records found: " + grdDataSummary.Rows.Count.ToString();
        lblDataSummary.Font.Bold = true;
        lblDataSummary.ForeColor = System.Drawing.Color.DarkBlue;
    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */

    }
    //protected void lbtnShowPartDataALL_Click(object sender, EventArgs e)
    //{
    //    BindData("ALL");
    //}
    protected void lbtnShowPart1Data_Click(object sender, EventArgs e)
    {
        BindData("part1");
    }
    protected void lbtnShowPart2Data_Click(object sender, EventArgs e)
    {
        BindData("part2");
    }
    protected void lbtnShowPart3Data_Click(object sender, EventArgs e)
    {
        BindData("part3");
    }
    protected void lbtnShowPart4Data_Click(object sender, EventArgs e)
    {
        BindData("part4");
    }
    protected void lbtnShowPart5Data_Click(object sender, EventArgs e)
    {
        BindData("part5");
    }
    protected void lbtnShowPart6aData_Click(object sender, EventArgs e)
    {
        BindData("part6a");
    }
    protected void lbtnShowPart6bData_Click(object sender, EventArgs e)
    {
        BindData("part6b");
    }
    protected void lbtnShowPart6cData_Click(object sender, EventArgs e)
    {
        BindData("part6c");
    }
    protected void lbtnShowPart7Data_Click(object sender, EventArgs e)
    {
        BindData("part7");
    }

    protected void lbtnShowPart8Data_Click(object sender, EventArgs e)
    {
        BindData("part8");
    }

    protected void lbtnShowPart9Data_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDownloadfile.aspx");
    }

   protected void lbtnShowPart10Data_Click(object sender, EventArgs e)
    {
        BindData("part10");
    }

   protected void lbtnShowLEASUBrprt_Click(object sender, EventArgs e)
   {
       Response.Redirect("http://eec-dwh-bos-001/Reports/Pages/Report.aspx?ItemPath=%2fGrantsOnline%2f237CFCE+FY2015%2f237LeadSubrpt");
   }


}
