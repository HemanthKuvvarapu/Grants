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
/// Summary description for CForms
/// </summary>
public class CForms
{
	private CForms()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void SetFormResultStatus(ref string sError, string recID, string elementID, string analysis, string findings, string result1, string result2, string result3, string amount)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetResultStatus]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ElementID", SqlDbType.Int)).Value = elementID;

            if (!string.IsNullOrEmpty(analysis))
                oCmd.Parameters.Add(new SqlParameter("@Analysis", SqlDbType.VarChar)).Value = analysis;

            if (!string.IsNullOrEmpty(findings))
                oCmd.Parameters.Add(new SqlParameter("@Findings", SqlDbType.VarChar)).Value = findings;

            if (!string.IsNullOrEmpty(result1))
                oCmd.Parameters.Add(new SqlParameter("@Result1", SqlDbType.Char)).Value = result1;

            if (!string.IsNullOrEmpty(result2))
                oCmd.Parameters.Add(new SqlParameter("@Result2", SqlDbType.Char)).Value = result2;

            if (!string.IsNullOrEmpty(result3))
                oCmd.Parameters.Add(new SqlParameter("@Result3", SqlDbType.Char)).Value = result3;

            if (!string.IsNullOrEmpty(amount))
                oCmd.Parameters.Add(new SqlParameter("@Amount", SqlDbType.Decimal)).Value = amount;

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

    public static void SetFormItemStatus(ref string sError, string recID, string itemID, string status)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetItemStatus]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ItemID", SqlDbType.Int)).Value = itemID;
            oCmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.TinyInt)).Value = status;

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

    public static void SetFinalReviewerComment(ref string sError, string recID, string username, string date,
                                                   string status, string comment)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetReviewerFinalComment]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ReviewerName", SqlDbType.VarChar)).Value = username;
            oCmd.Parameters.Add(new SqlParameter("@ReviewDate", SqlDbType.DateTime)).Value = date;
            oCmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.TinyInt)).Value = status;

            if (!string.IsNullOrEmpty(comment))
            {
                oCmd.Parameters.Add(new SqlParameter("@Comment", SqlDbType.VarChar)).Value = comment;
            }

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

    public static void SetDataEntryForm(ref string sError, string recID, string childID, string sampleMonth,
                                        string reviewDate, string reviewerName, string errorNum, string improperPayment,
                                        string improperPaymentType, string missingDoc, string totalPaid, string county, string CaseSummaryFindings)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetDataEntryForm]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            if (errorNum == "")
                errorNum = "0";

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@ChildID", SqlDbType.VarChar)).Value = childID;
            oCmd.Parameters.Add(new SqlParameter("@County", SqlDbType.VarChar)).Value = county;
            oCmd.Parameters.Add(new SqlParameter("@SampleMonth", SqlDbType.DateTime)).Value = sampleMonth;
            oCmd.Parameters.Add(new SqlParameter("@ReviewDate", SqlDbType.DateTime)).Value = reviewDate;
            oCmd.Parameters.Add(new SqlParameter("@ReviewerName", SqlDbType.VarChar)).Value = reviewerName;
            oCmd.Parameters.Add(new SqlParameter("@ErrorNum", SqlDbType.TinyInt)).Value = errorNum;
            oCmd.Parameters.Add(new SqlParameter("@ImproperPayment", SqlDbType.Decimal)).Value = improperPayment;
            oCmd.Parameters.Add(new SqlParameter("@ImproperPaymentType", SqlDbType.Char)).Value = improperPaymentType;
            oCmd.Parameters.Add(new SqlParameter("@MissingDoc", SqlDbType.Char)).Value = missingDoc;
            oCmd.Parameters.Add(new SqlParameter("@TotalPaid", SqlDbType.Decimal)).Value = totalPaid;
            oCmd.Parameters.Add(new SqlParameter("@CaseSummaryFindings", SqlDbType.VarChar)).Value = CaseSummaryFindings;
            
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

    //public static void SetFormStatus(ref string sError, string recID, string elementID, string status)
    //{
    //    SqlConnection oConn = new SqlConnection();
    //    SqlCommand oCmd = new SqlCommand();

    //    try
    //    {
    //        oConn.ConnectionString = AppData.DBConnectionString;

    //        oCmd.CommandText = "[uspSetElementStatus]";
    //        oCmd.CommandType = CommandType.StoredProcedure;
    //        oCmd.Connection = oConn;

    //        oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
    //        oCmd.Parameters.Add(new SqlParameter("@ElementID", SqlDbType.Int)).Value = elementID;
    //        oCmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.TinyInt)).Value = status;

    //        oConn.Open();
    //        oCmd.ExecuteNonQuery();
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

    //        oConn = null;
    //        oCmd = null;
    //    }
    //}

    public static DataSet GetReviewerEntryData(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetReviewerEntryData]";
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

    public static void SetReviewerEntryData(ref String sError, string recID, string feeLevel, string familySize, string familyIncome,
                                   string days, string providerRate, string parentFee, string transAmount, string totalAmount, string smi,
                                   string reviewerSupServices)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetReviewerEntryData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;

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

            if (!string.IsNullOrEmpty(days))
            {
                oCmd.Parameters.Add(new SqlParameter("@Days", SqlDbType.Decimal)).Value = days;
            }

            if (!string.IsNullOrEmpty(providerRate))
            {
                oCmd.Parameters.Add(new SqlParameter("@ProviderRate", SqlDbType.Decimal)).Value = providerRate;
            }

            if (!string.IsNullOrEmpty(feeLevel))
            {
                oCmd.Parameters.Add(new SqlParameter("@FeeLevel", SqlDbType.Int)).Value = feeLevel;
            }

            if (!string.IsNullOrEmpty(transAmount))
            {
                oCmd.Parameters.Add(new SqlParameter("@TransAmount", SqlDbType.Decimal)).Value = transAmount;
            }

            if (!string.IsNullOrEmpty(totalAmount))
            {
                oCmd.Parameters.Add(new SqlParameter("@TotalAmount", SqlDbType.Decimal)).Value = totalAmount;
            }

            if (!string.IsNullOrEmpty(smi))
            {
                oCmd.Parameters.Add(new SqlParameter("@SMI", SqlDbType.Int)).Value = smi;
            }

            if (!string.IsNullOrEmpty(reviewerSupServices))
            {
                oCmd.Parameters.Add(new SqlParameter("@ReviewerSupServices", SqlDbType.Decimal)).Value = reviewerSupServices;
            }

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

    public static void SetReviewerEntryData(ref String sError, string recID, string feeLevel, string familySize, string familyIncome,
                                   string days, string providerRate, string parentFee, string transAmount, string totalAmount, string smi,
                                   string reviewerSupServices, string programType,string employmentType, string partTimeHours, string fullTimeHours, string travelTime)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetReviewerEntryData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;

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

            if (!string.IsNullOrEmpty(days))
            {
                oCmd.Parameters.Add(new SqlParameter("@Days", SqlDbType.Decimal)).Value = days;
            }

            if (!string.IsNullOrEmpty(providerRate))
            {
                oCmd.Parameters.Add(new SqlParameter("@ProviderRate", SqlDbType.Decimal)).Value = providerRate;
            }

            if (!string.IsNullOrEmpty(feeLevel))
            {
                oCmd.Parameters.Add(new SqlParameter("@FeeLevel", SqlDbType.Int)).Value = feeLevel;
            }

            if (!string.IsNullOrEmpty(transAmount))
            {
                oCmd.Parameters.Add(new SqlParameter("@TransAmount", SqlDbType.Decimal)).Value = transAmount;
            }

            if (!string.IsNullOrEmpty(totalAmount))
            {
                oCmd.Parameters.Add(new SqlParameter("@TotalAmount", SqlDbType.Decimal)).Value = totalAmount;
            }

            if (!string.IsNullOrEmpty(smi))
            {
                oCmd.Parameters.Add(new SqlParameter("@SMI", SqlDbType.Int)).Value = smi;
            }

            if (!string.IsNullOrEmpty(reviewerSupServices))
            {
                oCmd.Parameters.Add(new SqlParameter("@ReviewerSupServices", SqlDbType.Decimal)).Value = reviewerSupServices;
            }
            if (!string.IsNullOrEmpty(programType))
            {
                oCmd.Parameters.Add(new SqlParameter("@ProgramType", SqlDbType.VarChar)).Value = programType;
            }
            if (!string.IsNullOrEmpty(employmentType))
            {
                oCmd.Parameters.Add(new SqlParameter("@EmploymentType", SqlDbType.VarChar)).Value = employmentType;
            }
            if (!string.IsNullOrEmpty(partTimeHours))
            {
                oCmd.Parameters.Add(new SqlParameter("@PartTimeHours", SqlDbType.Int)).Value = partTimeHours;
            }
            if (!string.IsNullOrEmpty(fullTimeHours))
            {
                oCmd.Parameters.Add(new SqlParameter("@FullTimeHours", SqlDbType.Int)).Value = fullTimeHours;
            }
            if (!string.IsNullOrEmpty(travelTime))
            {
                oCmd.Parameters.Add(new SqlParameter("@TravelTime", SqlDbType.Int)).Value = travelTime;
            }

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


    public static DataSet GetAllFormsData(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetFormData]";
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

    public static DataSet GetAllFormsInfo(ref String sError, string eligType, string reassesment)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetSectionTemplate]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@EligType", SqlDbType.TinyInt)).Value = eligType;
            oCmd.Parameters.Add(new SqlParameter("@reassessment", SqlDbType.TinyInt)).Value = reassesment;

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

    public static DataSet GetReviewerFinalComment(ref String sError, string recID, string username)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetReviewerFinalComment]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;

            if (!string.IsNullOrEmpty(username))
            {
                oCmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.VarChar)).Value = username;
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

    public static DataSet GetFormTemplateInfo(ref String sError, int formID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetFormTemplateInfo]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@FormID", SqlDbType.Int)).Value = formID;
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

    public static DataSet GetFormSavedData(ref String sError, int recID, int formID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetFormSavedData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@FormID", SqlDbType.Int)).Value = formID;

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

    public static DataSet GetRequirementInfo(ref String sError, int recID, int formID, string recType, string eligType, string reassesment, string parent)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetRequirementListData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = recID;
            oCmd.Parameters.Add(new SqlParameter("@FormID", SqlDbType.Int)).Value = formID;
            oCmd.Parameters.Add(new SqlParameter("@EligType", SqlDbType.TinyInt)).Value = eligType;
            oCmd.Parameters.Add(new SqlParameter("@reassessment", SqlDbType.TinyInt)).Value = reassesment;
            oCmd.Parameters.Add(new SqlParameter("@subsidyType", SqlDbType.TinyInt)).Value = recType;

            if (!string.IsNullOrEmpty(parent))
            {
                oCmd.Parameters.Add(new SqlParameter("@Parent", SqlDbType.Int)).Value = parent;
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

    public static DataSet GetMIDTableData(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetMIDTableData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = Convert.ToInt32(recID);
            //oCmd.Parameters.Add(new SqlParameter("@FormID", SqlDbType.Int)).Value = formID;

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
    public static DataSet GetMIDTableDataPivot(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetMIDTableDataPivot]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = Convert.ToInt32(recID);

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
    public static DataSet GetDataEntryFormData(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetDataEntryForm]";
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

    public static void SetLastFormID(ref string sError, string RecID, string FormID, string SessionID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSetLastFormID]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = RecID;
            oCmd.Parameters.Add(new SqlParameter("@FormID", SqlDbType.Int)).Value = FormID;
            oCmd.Parameters.Add(new SqlParameter("@SessionID", SqlDbType.VarChar)).Value = SessionID;

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

    public static void ResetDataEntryFormIncomplete(ref string sError, string RecID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspResetRecordIncomplete]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = RecID;

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

    public static void SaveMIDTableData(ref string sError, int RecID, int ElementID, int QuestionID, string QuestionAns, string UserName)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSaveMIDTableData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = RecID;
            oCmd.Parameters.Add(new SqlParameter("@ElementID", SqlDbType.Int)).Value = ElementID;
            oCmd.Parameters.Add(new SqlParameter("@QuestionID", SqlDbType.Int)).Value = QuestionID;
            oCmd.Parameters.Add(new SqlParameter("@QuestionAns", SqlDbType.VarChar)).Value = QuestionAns;
            oCmd.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar)).Value = UserName;

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


    public static DataSet GetCaseSummary(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspGetCaseSummary]";
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

    public static DataSet CheckMIDandCaseSummaryData(ref String sError, string recID)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();
        SqlDataAdapter oAdapt = new SqlDataAdapter();
        DataSet dsInfo = new DataSet();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspCheckMIDandCaseSummaryData]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = Convert.ToInt32(recID);

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

    public static void SaveCaseSummary(ref string sError, int RecID, string CaseSummaryFindings)
    {
        SqlConnection oConn = new SqlConnection();
        SqlCommand oCmd = new SqlCommand();

        try
        {
            oConn.ConnectionString = AppData.DBConnectionString;

            oCmd.CommandText = "[uspSaveCaseSummary]";
            oCmd.CommandType = CommandType.StoredProcedure;
            oCmd.Connection = oConn;

            oCmd.Parameters.Add(new SqlParameter("@RecID", SqlDbType.Int)).Value = RecID;
            oCmd.Parameters.Add(new SqlParameter("@CaseSummaryFindings", SqlDbType.VarChar)).Value = CaseSummaryFindings;

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

}

