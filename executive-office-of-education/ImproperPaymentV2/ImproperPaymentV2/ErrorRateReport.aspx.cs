using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ErrorRateReport : IPBasePage //System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageTitle = "Improper Payment Error Rate Review Corrective Action Plan (ACF-405)";
        lblErrMsg.Visible = false;

        if (!Page.IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                LoadErrorRateTable();
            }
            else
            {
                lblErrMsg.Text = "Session Timed Out -- please exit and log in again.";
                lblErrMsg.Visible = true;
            }
        }
    }

    private void LoadErrorRateTable()
    {
        string sError = "";
        string sReviewDate = System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate");    //Session["IPReviewStartDate"].ToString();

        DataSet dsErrorReportTable = CReport.GetErrorReportData(ref sError, sReviewDate);
        if (sError == "")
        {
            DataRow dr = dsErrorReportTable.Tables[0].Rows[0];

            if (dsErrorReportTable.Tables.Count > 0 && dsErrorReportTable.Tables[0].Rows.Count > 0)
            {

                txtPercentCaseImproperPayment.Text = dr["txtPercentCaseImproperPayment"].ToString() == "" ? "0.00" : dr["txtPercentCaseImproperPayment"].ToString();
                //if (txtPercentCaseImproperPayment.Text == "")
                //    txtPercentCaseImproperPayment.Text = "0.00";
                txtSeniorOfficial.Text = dr["txtSeniorOfficialName"].ToString();
                txtSeniorOfficialTitle.Text = dr["txtSeniorOfficialJobTItle"].ToString();
                txtTimelineReducingErrorRate.Text = dr["txtTimelineReducingErrorRate"].ToString();
                txtTargetFutureImproperPayment.Text = dr["txtTargetFutureImproperPayment"].ToString();

                txtAction1.Text = dr["txtAction1"].ToString();
                txtAction2.Text = dr["txtAction2"].ToString();
                txtAction3.Text = dr["txtAction3"].ToString();
                txtAction4.Text = dr["txtAction4"].ToString();

                txtMilestone1.Text = dr["txtMilestone1"].ToString();
                txtMilestone2.Text = dr["txtMilestone2"].ToString();
                txtMilestone3.Text = dr["txtMilestone3"].ToString();
                txtMilestone4.Text = dr["txtMilestone4"].ToString();

                txtTimeline1.Text = dr["txtTimeline1"].ToString();
                txtTimeline2.Text = dr["txtTimeline2"].ToString();
                txtTimeline3.Text = dr["txtTimeline3"].ToString();
                txtTimeline4.Text = dr["txtTimeline4"].ToString();

                txtResponsible1.Text = dr["txtResponsible1"].ToString();
                txtResponsible2.Text = dr["txtResponsible2"].ToString();
                txtResponsible3.Text = dr["txtResponsible3"].ToString();
                txtResponsible4.Text = dr["txtResponsible4"].ToString();
            }
            else
            {
                InitializePage();
            }
        }
    }

    private void InitializePage()
    {
        txtPercentCaseImproperPayment.Text = "0.00";
        txtSeniorOfficial.Text = "";
        txtSeniorOfficialTitle.Text = "";
        txtTimelineReducingErrorRate.Text = "";
        txtTargetFutureImproperPayment.Text = "";

        txtAction1.Text = "";
        txtAction2.Text = "";
        txtAction3.Text = "";
        txtAction4.Text = "";

        txtMilestone1.Text = "";
        txtMilestone2.Text = "";
        txtMilestone3.Text = "";
        txtMilestone4.Text = "";

        txtTimeline1.Text = "";
        txtTimeline2.Text = "";
        txtTimeline3.Text = "";
        txtTimeline4.Text = "";

        txtResponsible1.Text = "";
        txtResponsible2.Text = "";
        txtResponsible3.Text = "";
        txtResponsible4.Text = "";
    }
 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string errorMsg = "";

        int i = 0;
        int j = 0;

        try
        {
            //string errorMsg = "";

            CReport.SaveErrorReportData(ref errorMsg,
                System.Configuration.ConfigurationManager.AppSettings.Get("IPReviewStartDate"),     //Session["IPReviewStartDate"].ToString(),
                txtPercentCaseImproperPayment.Text,
                txtSeniorOfficial.Text,
                txtSeniorOfficialTitle.Text,
                txtTimelineReducingErrorRate.Text,
                txtTargetFutureImproperPayment.Text,
                txtAction1.Text,
                txtAction2.Text,
                txtAction3.Text,
                txtAction4.Text,
                txtMilestone1.Text,
                txtMilestone2.Text,
                txtMilestone3.Text,
                txtMilestone4.Text,
                txtTimeline1.Text,
                txtTimeline2.Text,
                txtTimeline3.Text,
                txtTimeline4.Text,
                txtResponsible1.Text,
                txtResponsible2.Text,
                txtResponsible3.Text,
                txtResponsible4.Text);

            if (errorMsg == "")
            {
                lblErrMsg.Visible = false;
                LoadErrorRateTable();
            }

        }
        catch (Exception ex)
        {
            lblErrMsg.Text = "Error updating the Error Rate Table, " + ex.Message;
            lblErrMsg.Visible = true;
            return;
        }
    }
}