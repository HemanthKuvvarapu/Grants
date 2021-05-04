using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
/// Helper class for executing stored procedures using a connection from the ASP.NET
/// SQL connection pool.
/// Author: Jon Hunt
/// Date: 03/04/2010
/// </summary>
public static class SQLHelper
{
    /// <summary>
    /// Executes a stored procedure and returns the result as a DataSet.  This overload has no
    /// return value parameter (as most stored procedures don't require one)
    /// </summary>
    /// <param name="storedProcedureName">The name of the stored procedure to execute</param>
    /// <param name="parameters">A list of SqlParameter objects which are the Name/Value
    /// pairs of parameters.</param>
    /// <returns>A DataSet populated with the results from the procedure</returns>
    public static DataSet ExecuteStoredProc(string storedProcedureName, params SqlParameter[] parameters)
    {
        long returnValue;
        return ExecuteStoredProc(AppData.DBConnectionString, storedProcedureName, out returnValue, parameters);
    }

    public static DataSet ExecuteStoredProc(string dbConnectionString, string storedProcedureName, params SqlParameter[] parameters)
    {
        long returnValue;
        return ExecuteStoredProc(dbConnectionString, storedProcedureName, out returnValue, parameters);
    }

    public static DataSet ExecuteStoredProc(string dbConnectionString, string storedProcedureName, out long returnValue, params SqlParameter[] parameters)
    {
        DataSet dsResult = new DataSet();
        SqlParameter returnParam = new SqlParameter("@RETURN_VALUE", SqlDbType.BigInt);
        returnValue = 0;

        // Create and open SQL connection
        using (SqlConnection conn = new SqlConnection(dbConnectionString))
        {
            conn.Open();

            // Create SQL stored procedure command
            using (SqlCommand command = new SqlCommand(storedProcedureName, conn))
            {
                command.CommandType = CommandType.StoredProcedure;
                
                // Set parameters
                foreach (SqlParameter p in parameters)
                {
                    command.Parameters.Add(p);
                }

                // Add return value parameter
                returnParam.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(returnParam);

                using (SqlDataAdapter da = new SqlDataAdapter(command))
                {
                    // Execute stored procedure and fill DataSet
                    da.Fill(dsResult);
                }
            }
        }

        if (returnParam.Value is long)
        {
            returnValue = (long)returnParam.Value;
        }

        return dsResult;
    }
}
