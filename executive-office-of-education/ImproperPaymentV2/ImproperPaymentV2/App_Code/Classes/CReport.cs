using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CReport
/// </summary>
public class CReport
{
    private CReport()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataSet GetReportData()
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetPaymentReport]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oConn.Open();
            oAdapt.SelectCommand = oCmd;
            oAdapt.Fill(dsInfo);
            oConn.Close();
        }
        catch (Exception e)
        {
            //sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            if (oAdapt != null)
            {
                oAdapt = null;
            }

            oConn = null;
            oCmd = null;
        }

        return dsInfo;
    }

    public static DataSet GetReportList()
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetIPReportList]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oConn.Open();
            oAdapt.SelectCommand = oCmd;
            oAdapt.Fill(dsInfo);
            oConn.Close();
        }
        catch (Exception e)
        {
            //sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            if (oAdapt != null)
            {
                oAdapt = null;
            }

            oConn = null;
            oCmd = null;
        }

        return dsInfo;
    }

    public static DataSet GetErrorReportData(ref string sError, string sReviewDate)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetErrorReportData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@ReviewDate", SqlDbType.Date)).Value = sReviewDate;

            oConn.Open();
            oAdapt.SelectCommand = oCmd;
            oAdapt.Fill(dsInfo);
            oConn.Close();
        }
        catch (Exception e)
        {
            sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            if (oAdapt != null)
            {
                oAdapt = null;
            }

            oConn = null;
            oCmd = null;
        }

        return dsInfo;
    }

    public static void SaveErrorReportData(ref string sError, 
                string txtIPReviewDate,
                string txtPercentCaseImproperPayment,
                string txtSeniorOfficial,
                string txtSeniorOfficialTitle,
                string txtTimelineReducingErrorRate,
                string txtTargetFutureImproperPayment,
                string txtAction1,
                string txtAction2,
                string txtAction3,
                string txtAction4,
                string txtMilestone1,
                string txtMilestone2,
                string txtMilestone3,
                string txtMilestone4,
                string txtTimeline1,
                string txtTimeline2,
                string txtTimeline3,
                string txtTimeline4,
                string txtResponsible1,
                string txtResponsible2,
                string txtResponsible3,
                string txtResponsible4)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSaveErrorReportData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@IPReviewDate", SqlDbType.Date)).Value = txtIPReviewDate;
            oCmd.Parameters.Add(new SqlParameter("@txtPercentCaseImproperPayment", SqlDbType.Decimal)).Value = txtPercentCaseImproperPayment;
            oCmd.Parameters.Add(new SqlParameter("@txtSeniorOfficial", SqlDbType.VarChar)).Value = txtSeniorOfficial;
            oCmd.Parameters.Add(new SqlParameter("@txtSeniorOfficialTitle", SqlDbType.VarChar)).Value = txtSeniorOfficialTitle;
            oCmd.Parameters.Add(new SqlParameter("@txtTimelineReducingErrorRate", SqlDbType.VarChar)).Value = txtTimelineReducingErrorRate;
            oCmd.Parameters.Add(new SqlParameter("@txtTargetFutureImproperPayment", SqlDbType.VarChar)).Value = txtTargetFutureImproperPayment;
            oCmd.Parameters.Add(new SqlParameter("@txtAction1", SqlDbType.VarChar)).Value = txtAction1;
            oCmd.Parameters.Add(new SqlParameter("@txtAction2", SqlDbType.VarChar)).Value = txtAction2;
            oCmd.Parameters.Add(new SqlParameter("@txtAction3", SqlDbType.VarChar)).Value = txtAction3;
            oCmd.Parameters.Add(new SqlParameter("@txtAction4", SqlDbType.VarChar)).Value = txtAction4;
            oCmd.Parameters.Add(new SqlParameter("@txtMilestone1", SqlDbType.VarChar)).Value = txtMilestone1;
            oCmd.Parameters.Add(new SqlParameter("@txtMilestone2", SqlDbType.VarChar)).Value = txtMilestone2;
            oCmd.Parameters.Add(new SqlParameter("@txtMilestone3", SqlDbType.VarChar)).Value = txtMilestone3;
            oCmd.Parameters.Add(new SqlParameter("@txtMilestone4", SqlDbType.VarChar)).Value = txtMilestone4;
            oCmd.Parameters.Add(new SqlParameter("@txtTimeline1", SqlDbType.VarChar)).Value = txtTimeline1;
            oCmd.Parameters.Add(new SqlParameter("@txtTimeline2", SqlDbType.VarChar)).Value = txtTimeline2;
            oCmd.Parameters.Add(new SqlParameter("@txtTimeline3", SqlDbType.VarChar)).Value = txtTimeline3;
            oCmd.Parameters.Add(new SqlParameter("@txtTimeline4", SqlDbType.VarChar)).Value = txtTimeline4;
            oCmd.Parameters.Add(new SqlParameter("@txtResponsible1", SqlDbType.VarChar)).Value = txtResponsible1;
            oCmd.Parameters.Add(new SqlParameter("@txtResponsible2", SqlDbType.VarChar)).Value = txtResponsible2;
            oCmd.Parameters.Add(new SqlParameter("@txtResponsible3", SqlDbType.VarChar)).Value = txtResponsible3;
            oCmd.Parameters.Add(new SqlParameter("@txtResponsible4", SqlDbType.VarChar)).Value = txtResponsible4;

            oConn.Open();
            oCmd.ExecuteNonQuery();
            oConn.Close();
        }
        catch (Exception e)
        {
            sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            oConn = null;
            oCmd = null;
        }

    }
	
	public static DataSet GetIPReportData(string reportSatrtDate, int reportId )
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            SqlParameter[] pArray = new SqlParameter[2];
            pArray[0] = new SqlParameter("@IPReviewStartDate", SqlDbType.Date);
            pArray[0].Value = reportSatrtDate;

            pArray[1] = new SqlParameter("@ReportID", SqlDbType.Int);
            pArray[1].Value = reportId;

            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetIPReportData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;
            oCmd.Parameters.AddRange(pArray);

            oConn.Open();
            oAdapt.SelectCommand = oCmd;
            oAdapt.Fill(dsInfo);
            oConn.Close();
        }
        catch (Exception e)
        {
            //sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            if (oAdapt != null)
            {
                oAdapt = null;
            }

            oConn = null;
            oCmd = null;
        }

        return dsInfo;
    }

    public static void SaveIPReportData(DataTable dt)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            SqlParameter[] pArray = new SqlParameter[1];

            pArray[0] = new SqlParameter("@reportData", SqlDbType.Structured);
            pArray[0].Value = dt;
            pArray[0].TypeName = "dbo.udtIPReportData";

            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSaveIPReport]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;
            oCmd.Parameters.AddRange(pArray);

            oConn.Open();
            oAdapt.SelectCommand = oCmd;
            oAdapt.Fill(dsInfo);
            oConn.Close();

        }
        catch (Exception e)
        {
            //sError = e.Message;
        }
        finally
        {
            if (oConn != null)
            {
                if (oConn.State == ConnectionState.Open)
                {
                    oConn.Close();
                }
            }

            if (oAdapt != null)
            {
                oAdapt = null;
            }

            oConn = null;
            oCmd = null;
        }
    }
}
