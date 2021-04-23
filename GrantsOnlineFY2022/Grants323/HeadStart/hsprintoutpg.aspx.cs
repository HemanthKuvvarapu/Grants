using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class HeadStart_hsprintoutpg : System.Web.UI.Page
{
    HSDAL dal = new HSDAL();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string connStr = dal.GetConnectionStringForLicensing();
            string reportName = Session["Lead Agency Name"].ToString();

            //string fileMonth = "";



            //string reportMonth = Session["Month"].ToString();
            byte[] result = null;
            string eD = "";
            int requestID = 0;

            int GrantApplicantId;

            if (Session["GrantApplicantId"] != null)
                GrantApplicantId = Convert.ToInt32(Session["GrantApplicantId"]);
            else if (Request.QueryString["GrantApplicantId"] != null)
                GrantApplicantId = Convert.ToInt32(Request.QueryString["GrantApplicantId"]);
            else
                GrantApplicantId = 0;

            /* int LeadAgencyIDNumber;

             if (Session["LeadAgencyIDNumber"] != null)
                 LeadAgencyIDNumber = Convert.ToInt32(Session["LeadAgencyIDNumber"]);
             else if (Request.QueryString["LeadAgencyIDNumber"] != null)
                 LeadAgencyIDNumber = Convert.ToInt32(Request.QueryString["LeadAgencyIDNumber"]);
             else
                 LeadAgencyIDNumber = 0;


             ds = dal.CFCEGetMonthInfo(LeadAgencyIDNumber);

             if (ds.Tables[0].Rows.Count > 0)
             {
                 DataRow dr = ds.Tables[0].Rows[0];
                 fileMonth = dr["Month"].ToString();

             }
             */

            #region 2005 version
            //RPTAgent.SqlReport c = new RPTAgent.SqlReport();
            SSRSAgent2008.SSRSAgent c = new SSRSAgent2008.SSRSAgent();

            string ssrsFolder = ConfigurationManager.AppSettings["SSRSFolder"];
            string fileName = reportName;
            //string report = ds ;
            string type = "";

            if (Request.QueryString["type"] != null)
                type = Request.QueryString["type"].ToString();

            switch (type)
            {

                case "HSSurveyCenterBasedList":
                    fileName = fileName + "_" + "Head Start Center Based Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSCenterBaseSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "HSSurveyFCCList":
                    fileName = fileName + "_" + "Head Start Family Childcare Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSFCCSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
                case "HSSurveyHomeBasedList":
                    fileName = fileName + "_" + "Head Start Home Based Site Survey" + ".pdf";
                    requestID = c.AddRequest(connStr, ssrsFolder + "HSHomeBaseSiteSurvey ", GrantApplicantId.ToString() + "|" + AppInfo.FiscalYear.ToString(), "HeadStartLeadAgencyID|FiscalYear", 2, "PDF", ref eD);
                    break;
            }
            //for multiple params the format is param1|param2|param3
            if (requestID > 0)
                result = c.GetImage(connStr, requestID, ref eD);//this creates the pdf
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

            #endregion
        }
    }
}