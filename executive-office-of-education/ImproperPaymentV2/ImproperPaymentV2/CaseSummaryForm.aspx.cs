using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CaseSummaryForm : System.Web.UI.Page
{
    string RecID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.PageTitle = "Section V. CASE SUMMARY";
        lblErrMsg.Visible = false;

        if (!Page.IsPostBack)
        {
            RecID = Request.QueryString["recID"].ToString();
            if (Session["UserName"] != null)
            {
                hidRecID.Value = RecID;
                LoadCaseSummaryData(RecID);
            }
            else
            {
                lblErrMsg.Text = "Session Timed Out -- please exit and log in again.";
                lblErrMsg.Visible = true;
            }
        }

    }

    private void LoadCaseSummaryData(string RecID)
    {
        string sError = "";

        DataSet dsCase = CForms.GetCaseSummary(ref sError, RecID);
        if (sError == "")
        {
            DataRow drow = dsCase.Tables[0].Rows[0];
            //lblSampleID.Text = drow["SampleID"].ToString();
            //lblChildName.Text = drow["ChildName"].ToString();

            cboError.SelectedValue = drow["HasError"].ToString();
            txtMIDErrorNum.Text = drow["CountMIDError"].ToString();
            txtMIDErrorAmount.Text = drow["TotalMIDAmount"].ToString();
            txtTimesAddInquiryUsed.Text = drow["CountAddInquiryUsed"].ToString();
            txtTimesAddInquiryMitigated.Text = drow["CountAddInquiryMitigated"].ToString();
            txtIPAmountMitigated.Text = drow["TotalMitigatedAmount"].ToString();
            cboErrorAutho.SelectedValue = drow["OverUnderPayment"].ToString();
            txtTotalAmountIP.Text = drow["TotalIPAmount"].ToString();
            txtTotalPayment.Text = drow["TotalPaymentAmount"].ToString();
            txtCaseSummaryFindings.Text = drow["CaseSummaryFindings"].ToString();

            var hasMidError = Convert.ToBoolean(drow["HasMidError"]);
            var midOption= Convert.ToBoolean(drow["MidOption"]);
            if(cboError.SelectedValue=="0" || cboError.SelectedValue == "")
            {
                cboMissDoc.SelectedValue = "0";
            }
            else if (hasMidError && midOption)
            {
                cboMissDoc.SelectedValue = "2";
            }
            else if(hasMidError && !midOption)
            {
                cboMissDoc.SelectedValue = "1";
            }
            else
            {
                cboMissDoc.SelectedValue = "0";
            }

        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string errorMsg = "";

        try
        {
            Session["CaseSummaryFindings"] = txtCaseSummaryFindings.Text;
            CForms.SaveCaseSummary(ref errorMsg, Convert.ToInt32(hidRecID.Value), txtCaseSummaryFindings.Text);
            if (errorMsg == "")
            {
                LoadCaseSummaryData(RecID);
            }

        }
        catch (Exception ex)
        {
            lblErrMsg.Text = "Error updating the CaseSummary data, " + ex.Message;
            lblErrMsg.Visible = true;
            return;
        }
    }
}