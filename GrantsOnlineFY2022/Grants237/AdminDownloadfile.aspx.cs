using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDownloadfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
 
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("content-disposition", "attachment; filename=OnlineGrantData.xls");

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        GridView1.RenderControl(htmlWrite);

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


    private void BindGrid()
    {

        string constr = ConfigurationManager.ConnectionStrings["GrantRenewalCom"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {

            using (SqlCommand cmd = new SqlCommand())
            {

                cmd.CommandText = "Select e.[GrantApplicantID],FileID ,e.[AgencyName],[FileUploadedType],[FileBytes],[FileName],[FileType],[FileModifiedDate]from dbo.GrantApplicant e join dbo.GrantUploadedFiles b on e.[GrantApplicantID] = b.[GrantApplicantID] Where e.FundCode = " + AppInfo.FundCode.ToString() + " and e.FiscalYear = " + AppInfo.FiscalYear.ToString() + " Order by e.[AgencyName] asc"; 

                cmd.Connection = con;

                con.Open();

                GridView1.DataSource = cmd.ExecuteReader();

                GridView1.DataBind();

                con.Close();

            }

        }

    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);

        byte[] bytes;

        string fileName, contentType;

        string constr = ConfigurationManager.ConnectionStrings["GrantRenewalCom"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {

            using (SqlCommand cmd = new SqlCommand())
            {

                cmd.CommandText = "select FileName,FileBytes , FileType from GrantUploadedFiles where FileID=@FileID";
                
                cmd.Parameters.AddWithValue("@FileID", id);

                cmd.Connection = con;

                con.Open();

                using (SqlDataReader sdr = cmd.ExecuteReader())
                {

                    sdr.Read();

                    bytes = (byte[])sdr["FileBytes"];

                    contentType = sdr["FileType"].ToString();

                    fileName = sdr["FileName"].ToString();

                }

                con.Close();

            }

        }

        Response.Clear();

        Response.Buffer = true;

        Response.Charset = "";

        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Response.ContentType = contentType;

        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

        Response.BinaryWrite(bytes);

        Response.Flush();

        Response.End();

    }
}
