using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class PaymentReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
            ControlsInitialize();
        }
    }
    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Improper Authorizations for Payment Reporting";
        //Master.NavMenuItem = "MenuItem2";   //current focus tab
        LoadIPReportData();
        LoadReportData();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditPaymentReport.aspx");
    }
    private void LoadIPReportData()
    {
        var ipReviewStartDate = Session["IPReviewStartDate"].ToString();
        DataSet ds = CReport.GetIPReportData(ipReviewStartDate, 1);

        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            var dataRow = ds.Tables[0].Rows[0];
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (!String.IsNullOrEmpty(row["QuestionAspID"].ToString()) && !row["QuestionType"].ToString().Equals("Table") && !row["QuestionType"].ToString().Equals("CheckBox"))
                {
                    (this.Master.FindControl("ContentPlaceHolder1").FindControl(row["QuestionAspID"].ToString()) as Label).Text = row["QuestionAns"].ToString();
                }
                if(row["QuestionType"].ToString().Equals("CheckBox"))
                {
                    (this.Master.FindControl("ContentPlaceHolder1").FindControl(row["QuestionAspID"].ToString()) as CheckBox).Checked = row["QuestionAns"].ToString().Equals("Yes");
                }
            }

        }
    }

    private void LoadReportData()
    {
        DataSet ds = CReport.GetReportData();

        txtNumOfCaseRecord.Text = ds.Tables[0].Rows[0]["NumOfRecord"].ToString();
        txtNumOfCaseComplete.Text = ds.Tables[0].Rows[0]["NumOfCompletedRecord"].ToString();
        txtNumOfCaseRecordCompete.Text = txtNumOfCaseRecord.Text;

        //txtAuthoAmount.Text = "$" + ds.Tables[0].Rows[0]["AuthoAmount"].ToString();
        txtNumOfErrorCase.Text = ds.Tables[0].Rows[0]["NumOfErrorCase"].ToString();
        txtNumCaseImproperPayment.Text = ds.Tables[0].Rows[0]["NumOfImproperPayment"].ToString();
        //txtPercentImproperDoc.Text = ds.Tables[0].Rows[0]["PercentCaseImproperDoc"].ToString();
        //txtTotalImproperDoc.Text = ds.Tables[0].Rows[0]["AmountImproperDoc"].ToString();

        txtTotalGrossForReviewPeriod.Text = "$" + ((ds.Tables[0].Rows[0]["GrossImproperPayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["GrossImproperPayment"].ToString());
        txtTotalAmtOfUnderPaymentsForReviewPeriod.Text = "$" + ((ds.Tables[0].Rows[0]["Underpayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["Underpayment"].ToString());
        txtTotalAmtOfOverPaymentsForReviewPeriod.Text = "$" + ((ds.Tables[0].Rows[0]["Overpayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["Overpayment"].ToString());
        txtNumOfIPMID.Text = ds.Tables[0].Rows[0]["NumOfImproperDoc"].ToString();
        txtPercentCasesError.Text = ((ds.Tables[0].Rows[0]["PercentCasesError"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["PercentCasesError"].ToString()) + "%";
        txtPercentCaseImproperPayment.Text = ((ds.Tables[0].Rows[0]["PercentCaseImproperPayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["PercentCaseImproperPayment"].ToString()) + "%";
        txtPercentageTotalOfPayments.Text = ((ds.Tables[0].Rows[0]["PercentImproperPayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["PercentImproperPayment"].ToString()) + "%";
        txtAvgAmtOfIP.Text = "$" + ((ds.Tables[0].Rows[0]["AverageImproperPayment"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["AverageImproperPayment"].ToString());
        //7A is replaced 
        //txtTotalDollarIPMID.Text = "$" + ((ds.Tables[0].Rows[0]["AmountImproperDoc"].ToString() == "") ? "0.00" : ds.Tables[0].Rows[0]["AmountImproperDoc"].ToString());
        txtNumOfMIDErrorsMitigatedAI.Text = ds.Tables[0].Rows[0]["NumOfMIDErrorsMitigatedUsingAI"].ToString();
        txtTotalAmtMIDErrorsMitigatedAI.Text = "$" + ds.Tables[0].Rows[0]["AmountOfMIDErrorsMitigatedUsingAI"].ToString();
        txtTotalMIDErrors.Text= ds.Tables[0].Rows[0]["NumOfMIDErrors"].ToString();
        txtTotalDollarIPMID.Text= "$" + ds.Tables[0].Rows[0]["AmountOfMIDErrors"].ToString();
        txtTotalAmtForSampledCases.Text= "$" + ds.Tables[0].Rows[0]["AuthoAmount"].ToString();
        txtEstAnualAmtOfIP.Text= "$" + ds.Tables[0].Rows[0]["GrossImproperPayment"].ToString();
        //9A
        //Total number of MID errors that, after an AI was considered and possibly used, still resulted in an improper payment – Enter the difference between 7A and 8A
        txtNumOfMIDErrorsAfterAI.Text = Math.Abs(Convert.ToInt32(ds.Tables[0].Rows[0]["NumOfMIDErrors"]) - Convert.ToInt32(ds.Tables[0].Rows[0]["NumOfMIDErrorsMitigatedUsingAI"])).ToString();
        //9B.  Total dollar amount of MID improper payments that resulted even after an AI was considered and possibly used – Enter the difference between 7B and 8B.
        txtTotalAmtOfMIDAfterAI.Text = Math.Abs(Convert.ToDecimal(ds.Tables[0].Rows[0]["AmountOfMIDErrors"]) - Convert.ToDecimal(ds.Tables[0].Rows[0]["AmountOfMIDErrorsMitigatedUsingAI"])).ToString();

        //14A
        txtTotalAmtOfCCDFSubsidyPayment.Text= "$" + ds.Tables[0].Rows[0]["TotalAmountOfSubsidyPayment"].ToString();
        //14B
        txtEstAnualAmtOfIP.Text= "$" + ds.Tables[0].Rows[0]["AnualAmountOfIPSubsidy"].ToString();

    }
}
