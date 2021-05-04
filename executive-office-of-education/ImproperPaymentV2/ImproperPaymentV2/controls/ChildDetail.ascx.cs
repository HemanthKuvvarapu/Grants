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

public partial class controls_ChildDetail : System.Web.UI.UserControl
{
    public string eID;
    public string recID;
    public string recType;
    public string serviceDate;
    public string funding;
    public string placement = "0";
    public DataSet dsChildInfo;
    public DataSet dsReviewerEntryInfo;
    //private object childInfo3;

    protected void Page_Load(object sender, EventArgs e)
    {
        String sError = "";

        if (recID != null)
        {
            /*begin - load the child info*/
            //DataSet dsChildInfo = CChild.LoadSelectedChildInfo(recID, Convert.ToInt16(recType), serviceDate);
            //txtID.Text = eID;
            //txtCounty.Text = dsChildInfo.Tables[0].Rows[0]["County"].ToString();
            //txtReviewDate.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["ReviewDate"].ToString());
            //if (txtReviewDate.Text == "")
            //    txtReviewDate.Text = "N/A";
            txtChildName.Text = dsChildInfo.Tables[0].Rows[0]["FirstName"].ToString() + " " + dsChildInfo.Tables[0].Rows[0]["LastName"].ToString();
            txtChildDOB.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["DOB"].ToString());
            //txtChildSSN.Text = dsChildInfo.Tables[0].Rows[0]["SSN"].ToString();
            txtVendorName.Text = dsChildInfo.Tables[0].Rows[0]["VendorName"].ToString();
            //txtServiceDate.Text = AppData.FormatMonthYearStr(dsChildInfo.Tables[0].Rows[0]["ServiceDate"].ToString());
            txtFunding.Text = dsChildInfo.Tables[0].Rows[0]["Funding"].ToString();
            txtAuthoStartDate.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["AuthoStartDate"].ToString());
            txtAuthoEndDate.Text = AppData.FormatDateStr(dsChildInfo.Tables[0].Rows[0]["AuthoEndDate"].ToString());
            //txtFunding.Text = funding;
            //txtPlacement.Text = (placement == "0") ? "INITIAL ASSESSMENT" : "REASSESSMENT";
            /*end - load the child info*/

            // New items 2014
            string subType = dsChildInfo.Tables[0].Rows[0]["subType"].ToString();
            string QRISflag = dsChildInfo.Tables[0].Rows[0]["QRIS"].ToString();
            string AddonAmt = dsChildInfo.Tables[0].Rows[0]["AddonAmt"].ToString();

            string providerRate = dsChildInfo.Tables[0].Rows[0]["Provider Rate"].ToString();
            string parentFee = dsChildInfo.Tables[0].Rows[0]["Parent Fee"].ToString();
            string transportAmount = dsChildInfo.Tables[0].Rows[0]["Transportation Amount"].ToString();
            string authorizedAmount = dsChildInfo.Tables[0].Rows[0]["Authorized Amount"].ToString();
            string days = dsChildInfo.Tables[0].Rows[0]["Days"].ToString();
            string authoType = dsChildInfo.Tables[0].Rows[0]["Autho Type"].ToString();
            string familySize = dsChildInfo.Tables[0].Rows[0]["Family Size"].ToString();
            string familyIncome = dsChildInfo.Tables[0].Rows[0]["Family income"].ToString();
            string feeLevel = dsChildInfo.Tables[0].Rows[0]["Fee Level"].ToString();
            string serviceCode = dsChildInfo.Tables[0].Rows[0]["ServiceCode"].ToString();
            //string supService = dsChildInfo.Tables[0].Rows[0]["SupService"].ToString();
            string recType = dsChildInfo.Tables[0].Rows[0]["RecType"].ToString();
            string programType = dsChildInfo.Tables[0].Rows[0]["Program Type"].ToString();
            string multiRec = dsChildInfo.Tables[0].Rows[0]["MultiRec"].ToString();
            string employmentType = dsChildInfo.Tables[0].Rows[0]["Employment Type"].ToString();
            string partTimeHours = dsChildInfo.Tables[0].Rows[0]["Part-Time Hours"].ToString();
            string fullTimeHours = dsChildInfo.Tables[0].Rows[0]["Full-Time Hours"].ToString();
            string travelTime = dsChildInfo.Tables[0].Rows[0]["Travel Time"].ToString();

            txtDays.Text = ((!string.IsNullOrEmpty(days)) ? days : "0");
            txtParentFee.Text = ((!string.IsNullOrEmpty(parentFee)) ? Convert.ToDouble(parentFee).ToString("N2") : "0.00");
            if (multiRec == "1" && string.IsNullOrEmpty(providerRate))
                txtProviderRate.Text = "See Detail";
            else
                txtProviderRate.Text = ((!string.IsNullOrEmpty(providerRate)) ? Convert.ToDouble(providerRate).ToString("N2") : "0.00"); 
            txtTransportationAmount.Text = ((!string.IsNullOrEmpty(transportAmount)) ? Convert.ToDouble(transportAmount).ToString("N2") : "0.00");
            txtAuthorizedAmount.Text = ((!string.IsNullOrEmpty(authorizedAmount)) ? Convert.ToDouble(authorizedAmount).ToString("N2") : "0.00");
            txtFeeLevel.Text = ((!string.IsNullOrEmpty(feeLevel)) ? feeLevel : "0");
            txtFamilySize.Text = ((!string.IsNullOrEmpty(familySize)) ? familySize : "0");
            txtAuthoType.Text = ((!string.IsNullOrEmpty(authoType)) ? ((authoType == "R")?"Renewal":"New") : "New");
            txtFamilyIncome.Text = ((!string.IsNullOrEmpty(familyIncome)) ? Convert.ToDouble(familyIncome).ToString("N2") : "0.00");
            txtServiceCode.Text = ((!string.IsNullOrEmpty(serviceCode)) ? serviceCode : "---");
            //txtSupService.Text = ((!string.IsNullOrEmpty(supService)) ? Convert.ToDouble(supService).ToString("N2") : "0.00");
            //txtAssessmentType.Text = ((!string.IsNullOrEmpty(authoType)) ? ((authoType == "R") ? "Reassessment" : "Initial") : "Initial");
            txtAssessmentType.Text = ((!string.IsNullOrEmpty(authoType)) ? authoType : "New");
            txtSubsidyType.Text = ((!string.IsNullOrEmpty(recType)) ? ((recType == "3") ? "Contract" : "Voucher") : "Voucher");
            txtProgramType.Text = ((!string.IsNullOrEmpty(programType)) ? programType : "---");
         
            txtSubType.Text = ((!string.IsNullOrEmpty(subType)) ? subType : "---");
            txtAddonAmt.Text = ((!string.IsNullOrEmpty(AddonAmt)) ? Convert.ToDouble(AddonAmt).ToString("N2") : "0.00");
            txtQRISInc.Text = ((!string.IsNullOrEmpty(QRISflag)) ? QRISflag : "No");
            txtQRISIncField.Value = txtQRISInc.Text;
           
            txtDaysField.Value = txtDays.Text;
            txtParentFeeField.Value = txtParentFee.Text;
            txtProviderRateField.Value = txtProviderRate.Text;
            txtTransportationAmountField.Value = txtTransportationAmount.Text;
            txtAuthorizedAmountField.Value = txtAuthorizedAmount.Text;
            txtFeeLevelField.Value = txtFeeLevel.Text;
            txtFamilySizeField.Value = txtFamilySize.Text;
            txtFamilyIncomeField.Value = txtFamilyIncome.Text;
            txtAuthorizedAmountField.Value = txtAuthorizedAmount.Text;
            //txtSupServiceField.Value = txtSupService.Text;
            txtAddonAmtField.Value = txtAddonAmt.Text;
            txtProgramTypeField.Value = txtProgramType.Text;
            txtEmploymentTypeField.Value = ((!string.IsNullOrEmpty(employmentType)) ? employmentType : ""); ;
            txtPartTimeHoursField.Value = ((!string.IsNullOrEmpty(partTimeHours)) ? partTimeHours : "0"); ;
            txtFullTimeHoursField.Value = ((!string.IsNullOrEmpty(fullTimeHours)) ? fullTimeHours : "0");
            txtTravelTimeField.Value = ((!string.IsNullOrEmpty(travelTime)) ? travelTime : "0");

            if (dsReviewerEntryInfo.Tables.Count > 0 && dsReviewerEntryInfo.Tables[0].Rows.Count > 0)
            {
                txtReviewerDaysField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["Days"].ToString();
                txtReviewerFamilyIncomeField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["FamilyIncome"].ToString();
                txtReviewerFamilySizeField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["FamilySize"].ToString();
                txtReviewerFeeLevelField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["FeeLevel"].ToString();
                txtReviewerParentFeeField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["ParentFee"].ToString();
                txtReviewerProviderRateField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["ProviderRate"].ToString();
                txtReviewerTransAmountField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["TransAmount"].ToString();
                txtReviewerTotalAmountField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["TotalAmount"].ToString();
                txtReviewerVarianceAmountField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["Variance"].ToString().Replace(",","");
                txtReviewerSMIField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["smi"].ToString();
                txtReviewerSupportiveServicesField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["ReviewerSupServices"].ToString();
                txtReviewerProgramTypeField.Value= dsReviewerEntryInfo.Tables[0].Rows[0]["ProgramType"].ToString();
                txtReviewerEmploymentTypeField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["EmploymentType"].ToString();
                txtReviewerPartTimeHoursField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["PartTimeHours"].ToString();
                txtReviewerFullTimeHoursField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["FullTimeHours"].ToString();
                txtReviewerTravelTimeField.Value = dsReviewerEntryInfo.Tables[0].Rows[0]["TravelTime"].ToString();
            }

            breakTable.Visible = false;
            childInfo3.Visible = false;
            grdChildList.Visible = false;

            //2017 CCFA Update: Show all detail for all billings, including adjustments during the review period

            //if (multiRec == "1")
            {
                //DataSet dsChildRecs = CChild.GetSelectedChildRecords(recID, Convert.ToInt16(recType), serviceDate);
                //if (dsChildRecs.Tables[0].Rows.Count > 0)
                {
                    DataView dsDataView = new DataView();
                    //dsDataView = dsChildRecs.Tables[0].DefaultView;
                    dsDataView = dsChildInfo.Tables[1].DefaultView;

                    grdChildList.DataSource = dsDataView;
                    grdChildList.DataBind();
                    breakTable.Visible = true;
                    childInfo3.Visible = true;
                    grdChildList.Visible = true;
                }
            }
        }
    }

    //protected void txtResponsibleField_ValueChanged(object sender, EventArgs e)
    //{

    //}
}
