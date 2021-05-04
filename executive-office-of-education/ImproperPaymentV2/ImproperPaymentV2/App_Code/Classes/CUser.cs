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
/// Summary description for CUser
/// </summary>
public class CUser
{
    private String sID = "";
    private String sUserID = "";
    private String sType = "";
    private String sIsActive = "0";
    //private String sIsPilotUser = "0";

    private String sLastName = "";
    private String sFirstName = "";
    private String sSSISessionID = "";
    private String sUserName = "";
    private String sSSIUserID = "";

    public CUser(String sSSISessionID, DataSet dsSSOUserInfo, DataSet dsIPUserInfo)
    {
        DataRow oRow;

        SSISessionID = sSSISessionID;

        oRow = dsSSOUserInfo.Tables[0].Rows[0];

        sSSIUserID = oRow["User_ID"].ToString();
        sUserName = oRow["Username"].ToString();
        sFirstName = oRow["Firstname"].ToString();
        sLastName = oRow["Lastname"].ToString();

        sID = sSSIUserID;

        oRow = dsIPUserInfo.Tables[0].Rows[0];
        sUserID = oRow["UserID"].ToString();
        sType = oRow["UserType"].ToString();
        if (oRow["isActive"].ToString() == "1")
            sIsActive = "1";
        //if (oRow["isPilotUser"].ToString() == "1")
        //    sIsPilotUser = "1";
    }

    public static DataSet LoadAllUsersInfo(ref string sError, string username)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();
        //String sError = "";

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetAllUserInfo]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.BigInt, 4, System.Data.ParameterDirection.ReturnValue, false, (byte)0, (byte)0, "", System.Data.DataRowVersion.Current, null));
            oCmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.VarChar)).Value = username;

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

    public static bool CheckIAPUser(ref string sError, string username, string password)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        bool isIAPUser = false;

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspCheckIAPUser]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RETURN_VALUE", System.Data.SqlDbType.BigInt, 4, System.Data.ParameterDirection.ReturnValue, false, (byte)0, (byte)0, "", System.Data.DataRowVersion.Current, null));
            oCmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.VarChar)).Value = username;
            oCmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar)).Value = password;
            oConn.Open();
            oCmd.ExecuteNonQuery();

            if (Convert.ToInt32(oCmd.Parameters["@RETURN_VALUE"].Value.ToString()) == 1) 
            {
                isIAPUser = true;
            }
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

        return isIAPUser;
    }

    public String SSISessionID
    {
        get
        {
            return sSSISessionID;
        }
        set
        {
            sSSISessionID = value;
        }
    }
}
