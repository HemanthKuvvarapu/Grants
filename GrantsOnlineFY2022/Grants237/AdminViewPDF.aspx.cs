using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminViewPDF : System.Web.UI.Page
{
    DAL dal = new DAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthUser"] == null)
            Response.Redirect("Default.aspx");

        if (!IsPostBack)
        {
            //Session["FundCode"] = Request.QueryString["type"];
            ShowData(Convert.ToInt32(Session["FundCode"]), "");

            //if (Request.QueryString.Keys.Count == 0)
            //{
            //    ShowGrantSelection();
            //}
            //else if (Request.QueryString["type"] == null)
            //{
            //    ShowGrantSelection();
            //}
            //else
            //{
            //    Session["FundCode"] = Request.QueryString["type"];
            //    ShowData(Convert.ToInt32(Session["FundCode"]), "");
            //}
        }
    }

    protected void btnSelectGrantType_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url + "?type=" + ddlGrantType.SelectedValue);
    }

    private void ShowData(int fundCode, string agencyName)
    {
        tblGrant.Visible = false;
        tblData.Visible = true;

        lblGrantInfo.Text = AppInfo.GrantName;

        DataSet ds = dal.GetAdminGrantSummaryPDF(AppInfo.FundCode, AppInfo.FiscalYear);
        //string sql = "Select GrantApplicantId , AgencyName,Password, FirstName, LastName , Email, Phone from GrantContactvws where FundCode = " + fundCode.ToString() + " " + " and Password Is Not NULL and len(Password) > 0 ";

        //if (!String.IsNullOrEmpty(agencyName))
        //    sql += " and AgencyName like '%" + agencyName + "%'";


        //sql += " Order by AgencyName";

        //DataSet ds = dal.RunSql(sql);

        grdData.DataSource = ds;
        grdData.DataBind();

    }
    //private void ShowGrantSelection()
    //{
    //    tblGrant.Visible = true;
    //    tblData.Visible = false;

    //    DataSet ds = dal.RunSql("Select FundCode = 237, FundCode from dbo.GrantApplicant");
    //    ddlGrantType.DataSource = ds;
    //    ddlGrantType.DataTextField = "FundCode";
    //    ddlGrantType.DataValueField = "FundCode";
    //    ddlGrantType.DataBind();
    //}
    protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Print")
        {
		Response.Redirect("Print.aspx?type=package&GrantApplicantId=" + Convert.ToInt32(grdData.DataKeys[Convert.ToInt32(e.CommandArgument)].Value).ToString());
	}
	else if (e.CommandName == "PrintPCHP")
	{
		Response.Redirect("Print.aspx?type=packagePCHP&GrantApplicantId=" + Convert.ToInt32(grdData.DataKeys[Convert.ToInt32(e.CommandArgument)].Value).ToString());
	}
           
    }


    private void PrintPDF(int GrantApplicantId)
    {
        string connStr = dal.GetConnStringForLicensing();

        byte[] result = null;
        string eD = "";
        int requestID = 0;

       // SSRSAgent2008.SSRSAgent c = new SSRSAgent2008.SSRSAgent();
        string ssrsFolder = "/GrantsOnline/FY" + Session["FiscalYear"].ToString() + System.Configuration.ConfigurationManager.AppSettings.Get("SSRSFolder" + Session["FundCode"].ToString());
        string fileName = "GrantApplicant_";

        fileName = fileName + "OnlineGrantSummary.pdf";
        //requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummary", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);

        //if (Session["FundCode"].ToString() == "237")
        //{
        //    fileName = fileName + "OnlineGrantSummary.pdf";
        //    requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummary", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
        //}
        //else
        //{
        //    fileName = fileName + "OnlineGrantSummary.pdf";
        //    requestID = c.AddRequest(connStr, ssrsFolder + "GrantSummary", GrantApplicantId.ToString(), "GrantApplicantId", 1, "PDF", ref eD);
        //}



        if (requestID > 0)
            result = new byte[0];// c.GetImage(connStr, requestID, ref eD);
        else
        {
            Response.Write(eD);
            Response.End();
        }

        // display it
        if (result != null)
        {
            try
            {
                Response.Clear();
                Response.ClearContent();
                Response.ClearHeaders();
                Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", result.Length.ToString());
                Response.BinaryWrite(result);
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
    protected void btnFilterData_Click(object sender, EventArgs e)
    {
        ShowData(Convert.ToInt32(Session["FundCode"].ToString()), txtAgencyName.Text.Trim());
    }
    protected void btnGetAllData_Click(object sender, EventArgs e)
    {
        txtAgencyName.Text = "";
        ShowData(Convert.ToInt32(Session["FundCode"].ToString()), "");
    }

    protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grdData;
        DataSet ds;
        DataRow oRow;

        grdData = (GridView)sender;
        ds = (DataSet)grdData.DataSource;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            oRow = ds.Tables[0].Rows[e.Row.RowIndex];    //get the current datasource row

            LinkButton linkPDF = (LinkButton)e.Row.Cells[0].Controls[0];

		linkPDF.CommandName = (oRow["IsPCHP"].ToString() == "1")? "PrintPCHP" : "Print";

            if (string.IsNullOrEmpty(oRow["latestSubmitDate"].ToString()))
            {
                linkPDF.Enabled = false;
            }
        }
    }
}