using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data;

/// <summary>
/// Summary description for IPServices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class IPServices : System.Web.Services.WebService {

    public IPServices () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    //[WebMethod(EnableSession = true)]
    //public void SaveFormStatus(string recID, string elementID, string status)
    //{
    //    string sError = "";
    //    CForms.SetFormStatus(ref sError, recID, elementID, status);
    //}

    [WebMethod(EnableSession = true)]
    public string ResetCaseIncomplete(string recID)
    {
        string sError = "";
        CForms.ResetDataEntryFormIncomplete(ref sError, recID);
        return sError;
    }


    [WebMethod(EnableSession = true)]
    public string SaveReviewerInfo(string recID, string feeLevel, string familySize, string familyIncome,
                                   string days, string providerRate, string parentFee, string transAmount,
                                   string totalAmount, string smi, string reviewerSupServices)
    {
        string sError = "";

        CForms.SetReviewerEntryData(ref sError, recID, feeLevel, familySize, familyIncome,
                                    days, providerRate, parentFee, transAmount, totalAmount, smi, reviewerSupServices);

        return "";
    }

    [WebMethod(EnableSession = true)]
    public string SaveReviewerInfo(string recID, string feeLevel, string familySize, string familyIncome,
                                   string days, string providerRate, string parentFee, string transAmount,
                                   string totalAmount, string smi, string reviewerSupServices, 
                                   string programType, string employmentType,string partTimeHours, string fullTimeHours, 
                                   string travelTime)
    {
        string sError = "";

        CForms.SetReviewerEntryData(ref sError, recID, feeLevel, familySize, familyIncome,
                                    days, providerRate, parentFee, transAmount, totalAmount, smi, reviewerSupServices
                                    ,programType,employmentType,partTimeHours,fullTimeHours,travelTime);

        return "";
    }

    [WebMethod(EnableSession = true)]
    public string SaveFormInfo(string recID, string elementID, string itemXML, string dataXML, string sessionID)
    {
        string sError = "";
        DataSet ds;

        CForms.SetLastFormID(ref sError, recID, elementID, sessionID);

        if (!string.IsNullOrEmpty(itemXML))
        {
            ds = new DataSet();
            ds.ReadXml(new System.IO.StringReader(itemXML));

            if (ds.Tables.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    CForms.SetFormItemStatus(ref sError, recID, ds.Tables[0].Rows[i]["ID"].ToString(), ds.Tables[0].Rows[i]["Value"].ToString());
                }

            }
        }

        ds = new DataSet();
        ds.ReadXml(new System.IO.StringReader(dataXML));

        CForms.SetFormResultStatus(ref sError, recID, elementID,
                                    ds.Tables[0].Rows[0]["Analysis"].ToString(),
                                    ds.Tables[0].Rows[0]["Findings"].ToString(),
                                    ds.Tables[0].Rows[0]["Result1"].ToString(),
                                    ds.Tables[0].Rows[0]["Result2"].ToString(),
                                    ds.Tables[0].Rows[0]["Result3"].ToString(),
                                    ds.Tables[0].Rows[0]["Amount"].ToString());

        return sError;
    }

}

