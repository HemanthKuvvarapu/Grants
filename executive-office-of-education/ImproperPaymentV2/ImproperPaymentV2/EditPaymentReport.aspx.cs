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

public partial class EditPaymentReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["IPReviewStartDate"] = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");
            ControlsInitialize();
        }

        ValidateReportInput();
    }

    private void ControlsInitialize()
    {
        Master.ShowFooter = false;
        //Master.ShowPageTitle = false;
        //Master.ShowNavMenu = false;
        Master.PageTitle = "Edit Improper Authorizations for Payment Reporting";
        //Master.NavMenuItem = "MenuItem2";   //current focus tab
        LoadIPReportData();
        LoadReportData();
    }

    private void ValidateReportInput()
    {
        ////Make sure one and only one checkbox is checked in Item 15
        if (!chkNotSampleDrawnFromPooled.Checked && !chkSampleDrawnFromPooled.Checked && !chkSampleDrawnFromPooledButNoPooling.Checked)
        {
            ErrorMsg.Text = "Please check one of the checkboxes in Item 15";
            ErrorMsg.Visible = true;
            tblErrorMsg.Visible = true;
            return;
        }

        else if (chkNotSampleDrawnFromPooled.Checked && (chkSampleDrawnFromPooled.Checked || chkSampleDrawnFromPooledButNoPooling.Checked)
             || chkSampleDrawnFromPooled.Checked && (chkNotSampleDrawnFromPooled.Checked || chkSampleDrawnFromPooledButNoPooling.Checked)
             || chkSampleDrawnFromPooledButNoPooling.Checked && (chkSampleDrawnFromPooled.Checked || chkNotSampleDrawnFromPooled.Checked))
        {
            ErrorMsg.Text = "Please check only one of the checkboxes in Item 15";
            ErrorMsg.Visible = true;
            tblErrorMsg.Visible = true;

            return;
        }
        else
        {
            ErrorMsg.Text = "";
            ErrorMsg.Visible = true;
            tblErrorMsg.Visible = false;

            return;
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
        txtTotalMIDErrors.Text = ds.Tables[0].Rows[0]["NumOfMIDErrors"].ToString();
        txtTotalDollarIPMID.Text = "$" + ds.Tables[0].Rows[0]["AmountOfMIDErrors"].ToString();
        txtTotalAmtForSampledCases.Text = "$" + ds.Tables[0].Rows[0]["AuthoAmount"].ToString();
        txtEstAnualAmtOfIP.Text = "$" + ds.Tables[0].Rows[0]["GrossImproperPayment"].ToString();
        //9A
        //Total number of MID errors that, after an AI was considered and possibly used, still resulted in an improper payment – Enter the difference between 7A and 8A
        txtNumOfMIDErrorsAfterAI.Text = Math.Abs(Convert.ToInt32(ds.Tables[0].Rows[0]["NumOfMIDErrors"]) - Convert.ToInt32(ds.Tables[0].Rows[0]["NumOfMIDErrorsMitigatedUsingAI"])).ToString();
        //9B.  Total dollar amount of MID improper payments that resulted even after an AI was considered and possibly used – Enter the difference between 7B and 8B.
        txtTotalAmtOfMIDAfterAI.Text = Math.Abs(Convert.ToDecimal(ds.Tables[0].Rows[0]["AmountOfMIDErrors"]) - Convert.ToDecimal(ds.Tables[0].Rows[0]["AmountOfMIDErrorsMitigatedUsingAI"])).ToString();
        //14A
        txtTotalAmtOfCCDFSubsidyPayment.Text = "$" + ds.Tables[0].Rows[0]["TotalAmountOfSubsidyPayment"].ToString();
        //14B
        txtEstAnualAmtOfIP.Text = "$" + ds.Tables[0].Rows[0]["AnualAmountOfIPSubsidy"].ToString();

    }

    private void LoadIPReportData()
    {
        var ipReviewStartDate = Session["IPReviewStartDate"].ToString();
        DataSet ds = CReport.GetIPReportData(ipReviewStartDate, 1);

        if (ds.Tables.Count>0 && ds.Tables[0].Rows.Count > 0)
        {
            var dataRow = ds.Tables[0].Rows[0];
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if(row["QuestionType"].ToString().Equals("TextBox"))
                {
                    (this.Master.FindControl("ContentPlaceHolder1").FindControl(row["QuestionAspID"].ToString()) as TextBox).Text = row["QuestionAns"].ToString();
                }
                if (row["QuestionType"].ToString().Equals("RadioButton"))
                {
                   (this.Master.FindControl("ContentPlaceHolder1").FindControl(row["QuestionAspID"].ToString()) as RadioButtonList).SelectedValue = row["QuestionAns"].ToString();
                }
                if (row["QuestionType"].ToString().Equals("CheckBox"))
                {
                    (this.Master.FindControl("ContentPlaceHolder1").FindControl(row["QuestionAspID"].ToString()) as CheckBox).Checked = row["QuestionAns"].ToString().Equals("Yes");
                }
            }

        }
    }

    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        string errorMsg = "";
        try
        {
            SaveIPReportData();
        }
        catch (Exception ex)
        {
            //errorMsg.Text = ex.Message;
            //errorMsg.Visible = true;
            return;
        }
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PaymentReport.aspx");
    }

    private void SaveIPReportData()
    {
        ValidateReportInput();
        if (string.IsNullOrEmpty(ErrorMsg.Text))
        {
            try
            {
                DataTable dt = GetIPReportDataTable();
                var allControls = this.Master.FindControl("ContentPlaceHolder1").Controls;
                DataRow dr;
                foreach (Control ctrl in allControls)
                {
                    if (ctrl is TextBox)
                    {
                        TextBox ctrlTextBox = (ctrl as TextBox);
                        //if (!string.IsNullOrEmpty(ctrlTextBox.Text))
                        //{
                            dr = dt.NewRow();
                            dr["ReportId"] = 1;
                            dr["QuestionAspID"] = ctrlTextBox.ID;
                            dr["QuestionAns"] = ctrlTextBox.Text;
                            dr["ModifiedBy"] = (User != null && User.Identity != null) ? User.Identity.Name : "";

                            dt.Rows.Add(dr);
                        //}
                    }

                    if (ctrl is RadioButtonList)
                    {
                        RadioButtonList ctrlRadioButtonList = (ctrl as RadioButtonList);
                       // if (!string.IsNullOrEmpty(ctrlRadioButtonList.SelectedValue))
                        //{
                            dr = dt.NewRow();
                            dr["ReportId"] = 1;
                            dr["QuestionAspID"] = ctrlRadioButtonList.ID;
                            dr["QuestionAns"] = ctrlRadioButtonList.SelectedValue;
                            dr["ModifiedBy"] = (User != null && User.Identity != null) ? User.Identity.Name : "";

                            dt.Rows.Add(dr);
                       // }
                    }
                    if (ctrl is Label)
                    {
                        Label ctrlLabel = (ctrl as Label);
                        //if (!string.IsNullOrEmpty(ctrlLabel.Text))
                        //{
                            dr = dt.NewRow();
                            dr["ReportId"] = 1;
                            dr["QuestionAspID"] = ctrlLabel.ID;
                            dr["QuestionAns"] = ctrlLabel.Text;
                            dr["ModifiedBy"] = (User != null && User.Identity != null) ? User.Identity.Name : "";

                            dt.Rows.Add(dr);
                        //}
                    }
                    if (ctrl is CheckBox)
                    {
                        CheckBox ctrlCheckBox = (ctrl as CheckBox);
                       // if (ctrlCheckBox.Checked)
                        //{
                            dr = dt.NewRow();
                            dr["ReportId"] = 1;
                            dr["QuestionAspID"] = ctrlCheckBox.ID;
                            dr["QuestionAns"] = ctrlCheckBox.Checked ? "Yes" : "No";
                            dr["ModifiedBy"] = (User != null && User.Identity != null) ? User.Identity.Name : "";

                            dt.Rows.Add(dr);
                        //}
                    }
                }

                CReport.SaveIPReportData(dt);
            }
            catch
            {
                ErrorMsg.Text = "Exception while saving the data";
                ErrorMsg.Visible = true;
                tblErrorMsg.Visible = true;
            }

        }
    }

    private DataTable GetIPReportDataTable()
    {
        DataTable dt = new DataTable("udtIPReportData");
        dt.Columns.Add("ReportId");
        dt.Columns.Add("QuestionAspID");
        dt.Columns.Add("QuestionAns");
        dt.Columns.Add("ModifiedBy");


        return dt;
    }
}
