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
/// Summary description for CChild
/// </summary>
public class CChild
{
	private CChild()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DataSet LoadAllChild(string month, int hidenames)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();
        String sError = "";

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetMonthlySampleDetail]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            if (!string.IsNullOrEmpty(month))
            {
                oCmd.Parameters.Add(new SqlParameter("@serviceDate", SqlDbType.SmallDateTime)).Value = month;
            }
            oCmd.Parameters.Add(new SqlParameter("@hidenames", SqlDbType.TinyInt)).Value = hidenames;

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

    public static DataSet LoadSelectedChildInfo(string recID, int type, string serviceDate, string sessionID, string hidenames)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();
        String sError = "";

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetSelectedChildInfo]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ServiceDate", SqlDbType.DateTime)).Value = serviceDate;

            if (type == 1)
            {
                oCmd.Parameters.Add(new SqlParameter("@IsCPC", SqlDbType.TinyInt)).Value = "1";
            }
            else if (type == 2 || type == 4)
            {
                oCmd.Parameters.Add(new SqlParameter("@IsVoucher", SqlDbType.TinyInt)).Value = "1";
            }
            else
            {
                oCmd.Parameters.Add(new SqlParameter("@IsECCIMS", SqlDbType.TinyInt)).Value = "1";
            }

            oCmd.Parameters.Add(new SqlParameter("@SessionID", SqlDbType.VarChar)).Value = sessionID;
            oCmd.Parameters.Add(new SqlParameter("@hidenames", SqlDbType.TinyInt)).Value = hidenames;

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

    public static DataSet GetSelectedChildRecords(string recID, int type, string serviceDate)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();
        String sError = "";

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetSelectedChildRecords]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ServiceDate", SqlDbType.DateTime)).Value = serviceDate;

            if (type == 2 || type == 4)
            {
                oCmd.Parameters.Add(new SqlParameter("@IsVoucher", SqlDbType.TinyInt)).Value = "1";
            }
            else
            {
                oCmd.Parameters.Add(new SqlParameter("@IsECCIMS", SqlDbType.TinyInt)).Value = "1";
            }
            
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

    public static DataSet GetAllServiceDates(ref String sError, DateTime startDate, DateTime endDate)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetAllServiceDate]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@StartDate", SqlDbType.Date)).Value = startDate;
            oCmd.Parameters.Add(new SqlParameter("@EndDate", SqlDbType.Date)).Value = endDate;

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

    public static DataSet GetCPCAuthoInfo(string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();
        String sError = "";

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetCPCAuthoInfo]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;

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

    public static void SetCPCAuthoInfo(ref string sError, string recID, string rate, string days, string feeLevel, string familyIncome,
                                       string familySize, string parentFee, string transAmount, string authoAmount,
                                       string authoType)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetCPCAuthoInfo]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@Rate", SqlDbType.Decimal)).Value = rate;
            oCmd.Parameters.Add(new SqlParameter("@Days", SqlDbType.Decimal)).Value = days;

            if (!string.IsNullOrEmpty(feeLevel))
            {
                oCmd.Parameters.Add(new SqlParameter("@FeeLevel", SqlDbType.Int)).Value = feeLevel;
            }

            if (!string.IsNullOrEmpty(familyIncome))
            {
                oCmd.Parameters.Add(new SqlParameter("@FamilyIncome", SqlDbType.Decimal)).Value = familyIncome;
            }

            if (!string.IsNullOrEmpty(familySize))
            {
                oCmd.Parameters.Add(new SqlParameter("@FamilySize", SqlDbType.Int)).Value = familySize;
            }

            if (!string.IsNullOrEmpty(parentFee))
            {
                oCmd.Parameters.Add(new SqlParameter("@ParentFee", SqlDbType.Decimal)).Value = parentFee;
            }

            if (!string.IsNullOrEmpty(transAmount))
            {
                oCmd.Parameters.Add(new SqlParameter("@TransAmount", SqlDbType.Decimal)).Value = transAmount;
            }

            oCmd.Parameters.Add(new SqlParameter("@AuthoAmount", SqlDbType.Decimal)).Value = authoAmount;
            oCmd.Parameters.Add(new SqlParameter("@AuthoType", SqlDbType.Char)).Value = authoType;

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

    //public static DataSet GetFeeLevel(ref String sError, string FamSize, string FamIncome)
    //{
    //    SqlConnection oConn = new SqlConnection();
    //    SqlCommand oCmd = new SqlCommand();
    //    SqlDataAdapter oAdapt = new SqlDataAdapter();
    //    DataSet dsInfo = new DataSet();

    //    try
    //    {
    //        oConn.ConnectionString = AppData.DBConnectionString;

    //        oCmd.CommandText = "[uspGetFeeLevel]";
    //        oCmd.CommandType = CommandType.StoredProcedure;
    //        oCmd.Connection = oConn;

    //        oCmd.Parameters.Add(new SqlParameter("@FamSIze", SqlDbType.Integer)).Value = Convert.ToInt16(FamSize);
    //        oCmd.Parameters.Add(new SqlParameter("@FamIncome", SqlDbType.Decimal)).Value = Convert.ToDecimal(FamIncome);

    //        oConn.Open();
    //        oAdapt.SelectCommand = oCmd;
    //        oAdapt.Fill(dsInfo);
    //        oConn.Close();
    //    }
    //    catch (Exception e)
    //    {
    //        sError = e.Message;
    //    }
    //    finally
    //    {
    //        if (oConn != null)
    //        {
    //            if (oConn.State == ConnectionState.Open)
    //            {
    //                oConn.Close();
    //            }
    //        }

    //        if (oAdapt != null)
    //        {
    //            oAdapt = null;
    //        }

    //        oConn = null;
    //        oCmd = null;
    //    }

    //    return dsInfo;

    //}
}
