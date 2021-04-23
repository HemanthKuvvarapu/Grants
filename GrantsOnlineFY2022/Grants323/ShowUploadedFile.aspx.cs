using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ShowUploadedFile : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request["type"].ToString();

        int index = -1;

        if (!IsPostBack)
        {
            DataSet ds = dal.GetUploadedFiles(Int32.Parse(Session["GrantApplicantID"].ToString()),
                                              AppInfo.FundCode, AppInfo.FiscalYear);

            if (ds.Tables[0].Rows.Count > 0 )
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["FileUploadedType"].ToString() == type)
                    {
                        index = i;
                        break;
                    }
                }

                if (index >= 0)
                {
                    byte[] rateFile = (byte[])ds.Tables[0].Rows[index]["FileBytes"];
                    string fileType = ds.Tables[0].Rows[index]["FileType"].ToString();
                    string fileName = ds.Tables[0].Rows[index]["FileName"].ToString();

                    if (rateFile != null)
                    {
                        try
                        {
                            Response.Clear();
                            Response.ClearContent();
                            Response.ClearHeaders();
                            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                            switch (fileType.ToLower())
                            {
                                case "pdf":
                                    Response.ContentType = "application/pdf"; break;
                                case "xls":
                                    Response.ContentType = "application/vnd.ms-excel"; break;
                                case "xlsx":
                                    Response.ContentType = "application/vnd.ms-excel"; break;
                                case "doc":
                                    Response.ContentType = "applicantion/word"; break;
                                case "docx":
                                    Response.ContentType = "applicantion/word"; break;
                                default:
                                    Response.ContentType = "application/pdf"; break;
                            }
                            Response.AddHeader("content-length", rateFile.Length.ToString());
                            Response.BinaryWrite(rateFile);
                            Response.Flush();
                            Response.End();
                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                            Response.End();
                        }
                    }
                }
            }
        }
    }
}
