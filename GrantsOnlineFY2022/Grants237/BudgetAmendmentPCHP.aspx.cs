using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class BudgetAmendmentPCHP : System.Web.UI.Page
{
    DAL dal = new DAL();
    Amendment amend = new Amendment();
    DataSet ds;
    SortedList<string, string> DisabledColumn = new SortedList<string, string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        BindScripts();
        DisableColumn();

        if (!Page.IsPostBack)
        {
            string amendmentVersion = (Request.QueryString["ver"] == null) ? "1" : Request.QueryString["ver"].ToString();
            string budgetNarrativeId = (Request.QueryString["id"] == null) ? "1" : Request.QueryString["id"].ToString();

            ViewState["AmendmentVersion"] = amendmentVersion;
            Session["AmendmentVersion"] = amendmentVersion;
            ViewState["BudgetNarrativeID"] = budgetNarrativeId;

            BindData(false);
        }

        Master.PartTitle = "ParentChild+ Budget Amendment #" + ViewState["AmendmentVersion"].ToString();
    }

    private void DisableColumn()
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        ds = dal.GetBudgetNarrativeDisableColumn(AppInfo.FiscalYear, AppInfo.FundCode);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DisabledColumn.Add(ds.Tables[0].Rows[i]["ColumnName"].ToString(), ds.Tables[0].Rows[i]["ColumnName"].ToString());

            ((WebControl)ContentPlaceHolder.FindControl(ds.Tables[0].Rows[i]["ColumnName"].ToString())).Enabled = false;
            ((WebControl)ContentPlaceHolder.FindControl(ds.Tables[0].Rows[i]["ColumnName"].ToString())).BackColor = System.Drawing.Color.LightGray;
        }
    }

    private void BindData(bool isAfterSaved)
    {
        ds = amend.GetBudgetNarrativeDataAmendment(Int32.Parse(ViewState["BudgetNarrativeID"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        if (ds.Tables[0].Rows.Count > 0 && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["BudgetNarrativeID"].ToString()))
        {
            DataRow dr = ds.Tables[0].Rows[0];

            ViewState["BudgetNarrativeID"] = dr["BudgetNarrativeID"].ToString();

            #region col d
            //col d
            txtSupervisorDirectorColDOrg.Text = Int32.Parse(dr["SupervisorDirectorColD"].ToString()).ToString("N0");
            txtProjectCoordinatorColDOrg.Text = Int32.Parse(dr["ProjectCoordinatorColD"].ToString()).ToString("N0");
            txtStipendColDOrg.Text = Int32.Parse(dr["StipendColD"].ToString()).ToString("N0");
            txtOtherColDOrg.Text = Int32.Parse(dr["OtherColD"].ToString()).ToString("N0");
            
            txtAdvisorColDOrg.Text = Int32.Parse(dr["AdvisorColD"].ToString()).ToString("N0");
            txtClinicianColDOrg.Text = Int32.Parse(dr["ClinicianColD"].ToString()).ToString("N0");
            txtCoordinatorColDOrg.Text = Int32.Parse(dr["CoordinatorColD"].ToString()).ToString("N0");
            txtEducatorInstructorColDOrg.Text = Int32.Parse(dr["EducatorInstructorColD"].ToString()).ToString("N0");
            txtHomeVisitorColDOrg.Text = Int32.Parse(dr["HomeVisitorColD"].ToString()).ToString("N0");
            txtSpecialistColDOrg.Text = Int32.Parse(dr["SpecialistColD"].ToString()).ToString("N0");
            txtIPSStipendColDOrg.Text = Int32.Parse(dr["IPSStipendColD"].ToString()).ToString("N0");
            txtIPSOtherColDOrg.Text = Int32.Parse(dr["IPSOtherColD"].ToString()).ToString("N0");

            txtAideParaprofessionalColDOrg.Text = Int32.Parse(dr["AideParaprofessionalColD"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColDOrg.Text = Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()).ToString("N0");
            txtSSStipendColDOrg.Text = Int32.Parse(dr["SSStipendColD"].ToString()).ToString("N0");
            txtSSOtherColDOrg.Text = Int32.Parse(dr["SSOtherColD"].ToString()).ToString("N0");

            txtFringeBenefitsColDOrg.Text = Int32.Parse(dr["FringeBenefitsColD"].ToString()).ToString("N0");

            txtCSAdvisorColDOrg.Text = Int32.Parse(dr["CSAdvisorColD"].ToString()).ToString("N0");
            txtCSClinicianColDOrg.Text = Int32.Parse(dr["CSClinicianColD"].ToString()).ToString("N0");
            txtCSConsultantColDOrg.Text = Int32.Parse(dr["CSConsultantColD"].ToString()).ToString("N0");
            txtCSEducatorInstructorColDOrg.Text = Int32.Parse(dr["CSEducatorInstructorColD"].ToString()).ToString("N0");
            txtCSHomeVisitorColDOrg.Text = Int32.Parse(dr["CSHomeVisitorColD"].ToString()).ToString("N0");
            txtCSSpecialistColDOrg.Text = Int32.Parse(dr["CSSpecialistColD"].ToString()).ToString("N0");
            txtCSSpeakerColDOrg.Text = Int32.Parse(dr["CSSpeakerColD"].ToString()).ToString("N0");
            txtCSSubstituteColDOrg.Text = Int32.Parse(dr["CSSubstituteColD"].ToString()).ToString("N0");
            txtCSStipendColDOrg.Text = Int32.Parse(dr["CSStipendColD"].ToString()).ToString("N0");
            txtCSOtherColDOrg.Text = Int32.Parse(dr["CSOtherColD"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColDOrg.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColD"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColDOrg.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColD"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColDOrg.Text = Int32.Parse(dr["NonInstructionalSuppliesColD"].ToString()).ToString("N0");
            txtSMOtherColDOrg.Text = Int32.Parse(dr["SMOtherColD"].ToString()).ToString("N0");

            txtSupervisoryStaffColDOrg.Text = Int32.Parse(dr["SupervisoryStaffColD"].ToString()).ToString("N0");
            txtInstructionalStaffColDOrg.Text = Int32.Parse(dr["InstructionalStaffColD"].ToString()).ToString("N0");
            txtTravelOtherColDOrg.Text = Int32.Parse(dr["TravelOtherColD"].ToString()).ToString("N0");

            txtAdvertisingColDOrg.Text = Int32.Parse(dr["AdvertisingColD"].ToString()).ToString("N0");
            txtEquipmentRentalColDOrg.Text = Int32.Parse(dr["EquipmentRentalColD"].ToString()).ToString("N0");
            txtMaintenanceRepairsColDOrg.Text = Int32.Parse(dr["MaintenanceRepairsColD"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColDOrg.Text = Int32.Parse(dr["MembershipSubscriptionsColD"].ToString()).ToString("N0");
            txtPrintingReproductionColDOrg.Text = Int32.Parse(dr["PrintingReproductionColD"].ToString()).ToString("N0");
            txtStaffTrainingColDOrg.Text = Int32.Parse(dr["StaffTrainingColD"].ToString()).ToString("N0");
            txtRentalofSpaceColDOrg.Text = Int32.Parse(dr["RentalofSpaceColD"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColDOrg.Text = Int32.Parse(dr["TelephoneUtilitiesColD"].ToString()).ToString("N0");
            txtDirectServiceTransportationColDOrg.Text = Int32.Parse(dr["DirectServiceTransportationColD"].ToString()).ToString("N0");
            txtOCOtherColDOrg.Text = Int32.Parse(dr["OCOtherColD"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColDOrg.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColD"].ToString()).ToString("N0");
            txtApplicationFeesColDOrg.Text = Int32.Parse(dr["ApplicationFeesColD"].ToString()).ToString("N0");
            txtCEUCoursesColDOrg.Text = Int32.Parse(dr["CEUCoursesColD"].ToString()).ToString("N0");
            txtCollegeCoursesColDOrg.Text = Int32.Parse(dr["CollegeCoursesColD"].ToString()).ToString("N0");
            txtCBOtherColDOrg.Text = Int32.Parse(dr["CBOtherColD"].ToString()).ToString("N0");

            txtInstructionalEquipmentColDOrg.Text = Int32.Parse(dr["InstructionalEquipmentColD"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColDOrg.Text = Int32.Parse(dr["NoninstructionalEquipmentColD"].ToString()).ToString("N0");
            txtEqOtherColDOrg.Text = Int32.Parse(dr["EqOtherColD"].ToString()).ToString("N0");

            txtAncillaryColDOrg.Text = Int32.Parse(dr["AncillaryColD"].ToString()).ToString("N0");
            #endregion

            #region col f
            //col f
            txtSupervisorDirectorColFOrg.Text = Int32.Parse(dr["SupervisorDirectorColF"].ToString()).ToString("N0");
            txtProjectCoordinatorColFOrg.Text = Int32.Parse(dr["ProjectCoordinatorColF"].ToString()).ToString("N0");
            txtStipendColFOrg.Text = Int32.Parse(dr["StipendColF"].ToString()).ToString("N0");
            txtOtherColFOrg.Text = Int32.Parse(dr["OtherColF"].ToString()).ToString("N0");

            txtAdvisorColFOrg.Text = Int32.Parse(dr["AdvisorColF"].ToString()).ToString("N0");
            txtClinicianColFOrg.Text = Int32.Parse(dr["ClinicianColF"].ToString()).ToString("N0");
            txtCoordinatorColFOrg.Text = Int32.Parse(dr["CoordinatorColF"].ToString()).ToString("N0");
            txtEducatorInstructorColFOrg.Text = Int32.Parse(dr["EducatorInstructorColF"].ToString()).ToString("N0");
            txtHomeVisitorColFOrg.Text = Int32.Parse(dr["HomeVisitorColF"].ToString()).ToString("N0");
            txtSpecialistColFOrg.Text = Int32.Parse(dr["SpecialistColF"].ToString()).ToString("N0");
            txtIPSStipendColFOrg.Text = Int32.Parse(dr["IPSStipendColF"].ToString()).ToString("N0");
            txtIPSOtherColFOrg.Text = Int32.Parse(dr["IPSOtherColF"].ToString()).ToString("N0");

            txtAideParaprofessionalColFOrg.Text = Int32.Parse(dr["AideParaprofessionalColF"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColFOrg.Text = Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()).ToString("N0");
            txtSSStipendColFOrg.Text = Int32.Parse(dr["SSStipendColF"].ToString()).ToString("N0");
            txtSSOtherColFOrg.Text = Int32.Parse(dr["SSOtherColF"].ToString()).ToString("N0");

            txtFringeBenefitsColFOrg.Text = Int32.Parse(dr["FringeBenefitsColF"].ToString()).ToString("N0");

            txtCSAdvisorColFOrg.Text = Int32.Parse(dr["CSAdvisorColF"].ToString()).ToString("N0");
            txtCSClinicianColFOrg.Text = Int32.Parse(dr["CSClinicianColF"].ToString()).ToString("N0");
            txtCSConsultantColFOrg.Text = Int32.Parse(dr["CSConsultantColF"].ToString()).ToString("N0");
            txtCSEducatorInstructorColFOrg.Text = Int32.Parse(dr["CSEducatorInstructorColF"].ToString()).ToString("N0");
            txtCSHomeVisitorColFOrg.Text = Int32.Parse(dr["CSHomeVisitorColF"].ToString()).ToString("N0");
            txtCSSpecialistColFOrg.Text = Int32.Parse(dr["CSSpecialistColF"].ToString()).ToString("N0");
            txtCSSpeakerColFOrg.Text = Int32.Parse(dr["CSSpeakerColF"].ToString()).ToString("N0");
            txtCSSubstituteColFOrg.Text = Int32.Parse(dr["CSSubstituteColF"].ToString()).ToString("N0");
            txtCSStipendColFOrg.Text = Int32.Parse(dr["CSStipendColF"].ToString()).ToString("N0");
            txtCSOtherColFOrg.Text = Int32.Parse(dr["CSOtherColF"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColFOrg.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColF"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColFOrg.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColF"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColFOrg.Text = Int32.Parse(dr["NonInstructionalSuppliesColF"].ToString()).ToString("N0");
            txtSMOtherColFOrg.Text = Int32.Parse(dr["SMOtherColF"].ToString()).ToString("N0");

            txtSupervisoryStaffColFOrg.Text = Int32.Parse(dr["SupervisoryStaffColF"].ToString()).ToString("N0");
            txtInstructionalStaffColFOrg.Text = Int32.Parse(dr["InstructionalStaffColF"].ToString()).ToString("N0");
            txtTravelOtherColFOrg.Text = Int32.Parse(dr["TravelOtherColF"].ToString()).ToString("N0");

            txtAdvertisingColFOrg.Text = Int32.Parse(dr["AdvertisingColF"].ToString()).ToString("N0");
            txtEquipmentRentalColFOrg.Text = Int32.Parse(dr["EquipmentRentalColF"].ToString()).ToString("N0");
            txtMaintenanceRepairsColFOrg.Text = Int32.Parse(dr["MaintenanceRepairsColF"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColFOrg.Text = Int32.Parse(dr["MembershipSubscriptionsColF"].ToString()).ToString("N0");
            txtPrintingReproductionColFOrg.Text = Int32.Parse(dr["PrintingReproductionColF"].ToString()).ToString("N0");
            txtStaffTrainingColFOrg.Text = Int32.Parse(dr["StaffTrainingColF"].ToString()).ToString("N0");
            txtRentalofSpaceColFOrg.Text = Int32.Parse(dr["RentalofSpaceColF"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColFOrg.Text = Int32.Parse(dr["TelephoneUtilitiesColF"].ToString()).ToString("N0");
            txtDirectServiceTransportationColFOrg.Text = Int32.Parse(dr["DirectServiceTransportationColF"].ToString()).ToString("N0");
            txtOCOtherColFOrg.Text = Int32.Parse(dr["OCOtherColF"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColFOrg.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColF"].ToString()).ToString("N0");
            txtApplicationFeesColFOrg.Text = Int32.Parse(dr["ApplicationFeesColF"].ToString()).ToString("N0");
            txtCEUCoursesColFOrg.Text = Int32.Parse(dr["CEUCoursesColF"].ToString()).ToString("N0");
            txtCollegeCoursesColFOrg.Text = Int32.Parse(dr["CollegeCoursesColF"].ToString()).ToString("N0");
            txtCBOtherColFOrg.Text = Int32.Parse(dr["CBOtherColF"].ToString()).ToString("N0");

            

            txtInstructionalEquipmentColFOrg.Text = Int32.Parse(dr["InstructionalEquipmentColF"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColFOrg.Text = Int32.Parse(dr["NoninstructionalEquipmentColF"].ToString()).ToString("N0");
            txtEqOtherColFOrg.Text = Int32.Parse(dr["EqOtherColF"].ToString()).ToString("N0");

            txtAncillaryColFOrg.Text = Int32.Parse(dr["AncillaryColF"].ToString()).ToString("N0");

            txtIndirectPercentOrg.Text = string.IsNullOrEmpty(dr["IndirectPercent"].ToString())?"":Decimal.Parse(dr["IndirectPercent"].ToString()).ToString("N2");

            txtIndirectCostsColFOrg.Text = string.IsNullOrEmpty(dr["IndirectCosts"].ToString()) ? "" : Int32.Parse(dr["IndirectCosts"].ToString()).ToString("N0");

            #endregion

            txtSupervisorDirectorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["SupervisorDirectorNumofStaff"].ToString())) ? "0" : dr["SupervisorDirectorNumofStaff"].ToString();
            txtSupervisorDirectorFTEOrg.Text = (string.IsNullOrEmpty(dr["SupervisorDirectorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SupervisorDirectorFTE"].ToString()).ToString("N2");
            txtProjectCoordinatorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["ProjectCoordinatorNumofStaff"].ToString())) ? "0" : dr["ProjectCoordinatorNumofStaff"].ToString();
            txtProjectCoordinatorFTEOrg.Text = (string.IsNullOrEmpty(dr["ProjectCoordinatorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["ProjectCoordinatorFTE"].ToString()).ToString("N2");
            txtOtherNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["OtherNumofStaff"].ToString())) ? "" : dr["OtherNumofStaff"].ToString();
            txtOtherFTEOrg.Text = (string.IsNullOrEmpty(dr["OtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["OtherFTE"].ToString()).ToString("N2");

            txtAdvisorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["AdvisorNumofStaff"].ToString())) ? "0" : dr["AdvisorNumofStaff"].ToString();
            txtAdvisorFTEOrg.Text = (string.IsNullOrEmpty(dr["AdvisorFTE"].ToString())) ? "" : Convert.ToSingle(dr["AdvisorFTE"].ToString()).ToString("N2");
            txtClinicianNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["ClinicianNumofStaff"].ToString())) ? "0" : dr["ClinicianNumofStaff"].ToString();
            txtClinicianFTEOrg.Text = (string.IsNullOrEmpty(dr["ClinicianFTE"].ToString())) ? "" : Convert.ToSingle(dr["ClinicianFTE"].ToString()).ToString("N2");
            txtCoordinatorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["CoordinatorNumofStaff"].ToString())) ? "0" : dr["CoordinatorNumofStaff"].ToString();
            txtCoordinatorFTEOrg.Text = (string.IsNullOrEmpty(dr["CoordinatorFTE"].ToString())) ? "" : Convert.ToSingle(dr["CoordinatorFTE"].ToString()).ToString("N2");
            txtEducatorInstructorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["EducatorInstructorNumofStaff"].ToString())) ? "" : dr["EducatorInstructorNumofStaff"].ToString();
            txtEducatorInstructorFTEOrg.Text = (string.IsNullOrEmpty(dr["EducatorInstructorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["EducatorInstructorFTE"].ToString()).ToString("N2");
            txtHomeVisitorNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["HomeVisitorNumofStaff"].ToString())) ? "0" : dr["HomeVisitorNumofStaff"].ToString();
            txtHomeVisitorFTEOrg.Text = (string.IsNullOrEmpty(dr["HomeVisitorFTE"].ToString())) ? "" : Convert.ToSingle(dr["HomeVisitorFTE"].ToString()).ToString("N2");
            txtSpecialistNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["SpecialistNumofStaff"].ToString())) ? "0" : dr["SpecialistNumofStaff"].ToString();
            txtSpecialistFTEOrg.Text = (string.IsNullOrEmpty(dr["SpecialistFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SpecialistFTE"].ToString()).ToString("N2");
            txtIPSOtherNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["IPSOtherNumofStaff"].ToString())) ? "0" : dr["IPSOtherNumofStaff"].ToString();
            txtIPSOtherFTEOrg.Text = (string.IsNullOrEmpty(dr["IPSOtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["IPSOtherFTE"].ToString()).ToString("N2");

            txtAideParaprofessionalNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["AideParaprofessionalNumofStaff"].ToString())) ? "0" : dr["AideParaprofessionalNumofStaff"].ToString();
            txtAideParaprofessionalFTEOrg.Text = (string.IsNullOrEmpty(dr["AideParaprofessionalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["AideParaprofessionalFTE"].ToString()).ToString("N2");
            txtSecretaryBookkeeperNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["SecretaryBookkeeperNumofStaff"].ToString())) ? "0" : dr["SecretaryBookkeeperNumofStaff"].ToString();
            txtSecretaryBookkeeperFTEOrg.Text = (string.IsNullOrEmpty(dr["SecretaryBookkeeperFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SecretaryBookkeeperFTE"].ToString()).ToString("N2");
            txtSSOtherNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["SSOtherNumofStaff"].ToString())) ? "0" : dr["SSOtherNumofStaff"].ToString();
            txtSSOtherFTEOrg.Text = (string.IsNullOrEmpty(dr["SSOtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SSOtherFTE"].ToString()).ToString("N2");

            txtFringeBenefitsNumofStaffOrg.Text = (string.IsNullOrEmpty(dr["FringeBenefitsNumofStaff"].ToString())) ? "0" : dr["FringeBenefitsNumofStaff"].ToString();
            txtFringeBenefitsFTEOrg.Text = (string.IsNullOrEmpty(dr["FringeBenefitsFTE"].ToString())) ? "0" : Convert.ToSingle(dr["FringeBenefitsFTE"].ToString()).ToString("N2");

            txtCSAdvisorRateOrg.Text = (string.IsNullOrEmpty(dr["CSAdvisorRate"].ToString())) ? "0" : dr["CSAdvisorRate"].ToString();
            txtCSClinicianRateOrg.Text = (string.IsNullOrEmpty(dr["CSClinicianRate"].ToString())) ? "0" : dr["CSClinicianRate"].ToString();
            txtCSConsultantRateOrg.Text = (string.IsNullOrEmpty(dr["CSConsultantRate"].ToString())) ? "0" : dr["CSConsultantRate"].ToString();
            txtCSEducatorInstructorRateOrg.Text = (string.IsNullOrEmpty(dr["CSEducatorInstructorRate"].ToString())) ? "0" : dr["CSEducatorInstructorRate"].ToString();
            txtCSHomeVisitorRateOrg.Text = (string.IsNullOrEmpty(dr["CSHomeVisitorRate"].ToString())) ? "0" : dr["CSHomeVisitorRate"].ToString();
            txtCSSpecialistRateOrg.Text = (string.IsNullOrEmpty(dr["CSSpecialistRate"].ToString())) ? "0" : dr["CSSpecialistRate"].ToString();
            txtCSSpeakerRateOrg.Text = (string.IsNullOrEmpty(dr["CSSpeakerRate"].ToString())) ? "0" : dr["CSSpeakerRate"].ToString();
            txtCSSubstituteRateOrg.Text = (string.IsNullOrEmpty(dr["CSSubstituteRate"].ToString())) ? "0" : dr["CSSubstituteRate"].ToString();
            txtCSOtherRateOrg.Text = (string.IsNullOrEmpty(dr["CSOtherRate"].ToString())) ? "0" : dr["CSOtherRate"].ToString();

            txtSupervisoryStaffMileageRateOrg.Text = (string.IsNullOrEmpty(dr["SupervisoryStaffMileageRate"].ToString())) ? "0" : dr["SupervisoryStaffMileageRate"].ToString();
            txtInstructionalStaffMileageRateOrg.Text = (string.IsNullOrEmpty(dr["InstructionalStaffMileageRate"].ToString())) ? "0" : dr["InstructionalStaffMileageRate"].ToString();
            txtTravelOtherMileageRateOrg.Text = (string.IsNullOrEmpty(dr["TravelOtherMileageRate"].ToString())) ? "0" : dr["TravelOtherMileageRate"].ToString();

            txtCSAdvisorHDWOrg.Text = (string.IsNullOrEmpty(dr["CSAdvisorHrWkDayFlat"].ToString())) ? "-1" : dr["CSAdvisorHrWkDayFlat"].ToString();
            txtCSClinicianHDWOrg.Text = (string.IsNullOrEmpty(dr["CSClinicianHrWkDayFlat"].ToString())) ? "-1" : dr["CSClinicianHrWkDayFlat"].ToString();
            txtCSConsultantHDWOrg.Text = (string.IsNullOrEmpty(dr["CSConsultantHrWkDayFlat"].ToString())) ? "-1" : dr["CSConsultantHrWkDayFlat"].ToString();
            txtCSEducatorInstructorHDWOrg.Text = (string.IsNullOrEmpty(dr["CSEducatorInstructorHrWkDayFlat"].ToString())) ? "-1" : dr["CSEducatorInstructorHrWkDayFlat"].ToString();
            txtCSHomeVisitorHDWOrg.Text = (string.IsNullOrEmpty(dr["CSHomeVisitorHrWkDayFlat"].ToString())) ? "-1" : dr["CSHomeVisitorHrWkDayFlat"].ToString();
            txtCSSpecialistHDWOrg.Text = (string.IsNullOrEmpty(dr["CSSpecialistHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpecialistHrWkDayFlat"].ToString();
            txtCSSpeakerHDWOrg.Text = (string.IsNullOrEmpty(dr["CSSpeakerHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpeakerHrWkDayFlat"].ToString();
            txtCSSubstituteHDWOrg.Text = (string.IsNullOrEmpty(dr["CSSubstituteHrWkDayFlat"].ToString())) ? "-1" : dr["CSSubstituteHrWkDayFlat"].ToString();
            txtCSOtherHDWOrg.Text = (string.IsNullOrEmpty(dr["CSOtherHrWkDayFlat"].ToString())) ? "-1" : dr["CSOtherHrWkDayFlat"].ToString();


            if (ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {
                dr = ds.Tables[1].Rows[0];

                txtSupervisorDirectorColD.Text = dr["SupervisorDirectorColD"].ToString();
                txtProjectCoordinatorColD.Text = dr["ProjectCoordinatorColD"].ToString();
                txtStipendColD.Text = dr["StipendColD"].ToString();
                txtOtherColD.Text = dr["OtherColD"].ToString();

                txtAdvisorColD.Text = dr["AdvisorColD"].ToString();
                txtClinicianColD.Text = dr["ClinicianColD"].ToString();
                txtCoordinatorColD.Text = dr["CoordinatorColD"].ToString();
                txtEducatorInstructorColD.Text = dr["EducatorInstructorColD"].ToString();
                txtHomeVisitorColD.Text = dr["HomeVisitorColD"].ToString();
                txtSpecialistColD.Text = dr["SpecialistColD"].ToString();
                txtIPSStipendColD.Text = dr["IPSStipendColD"].ToString();
                txtIPSOtherColD.Text = dr["IPSOtherColD"].ToString();

                txtAideParaprofessionalColD.Text = dr["AideParaprofessionalColD"].ToString();
                txtSecretaryBookkeeperColD.Text = dr["SecretaryBookkeeperColD"].ToString();
                txtSSStipendColD.Text = dr["SSStipendColD"].ToString();
                txtSSOtherColD.Text = dr["SSOtherColD"].ToString();

                txtFringeBenefitsColD.Text = dr["FringeBenefitsColD"].ToString();

                txtCSAdvisorColD.Text = dr["CSAdvisorColD"].ToString();
                txtCSClinicianColD.Text = dr["CSClinicianColD"].ToString();
                txtCSConsultantColD.Text = dr["CSConsultantColD"].ToString();
                txtCSEducatorInstructorColD.Text = dr["CSEducatorInstructorColD"].ToString();
                txtCSHomeVisitorColD.Text = dr["CSHomeVisitorColD"].ToString();
                txtCSSpecialistColD.Text = dr["CSSpecialistColD"].ToString();
                txtCSSpeakerColD.Text = dr["CSSpeakerColD"].ToString();
                txtCSSubstituteColD.Text = dr["CSSubstituteColD"].ToString();
                txtCSStipendColD.Text = dr["CSStipendColD"].ToString();
                txtCSOtherColD.Text = dr["CSOtherColD"].ToString();

                txtEducationalInstructionalMaterialsColD.Text = dr["EducationalInstructionalMaterialsColD"].ToString();
                txtInstructionalTechnologySoftwareColD.Text = dr["InstructionalTechnologySoftwareColD"].ToString();
                txtNonInstructionalSuppliesColD.Text = dr["NonInstructionalSuppliesColD"].ToString();
                txtSMOtherColD.Text = dr["SMOtherColD"].ToString();

                txtSupervisoryStaffColD.Text = dr["SupervisoryStaffColD"].ToString();
                txtInstructionalStaffColD.Text = dr["InstructionalStaffColD"].ToString();
                txtTravelOtherColD.Text = dr["TravelOtherColD"].ToString();

                txtAdvertisingColD.Text = dr["AdvertisingColD"].ToString();
                txtEquipmentRentalColD.Text = dr["EquipmentRentalColD"].ToString();
                txtMaintenanceRepairsColD.Text = dr["MaintenanceRepairsColD"].ToString();
                txtMembershipSubscriptionsColD.Text = dr["MembershipSubscriptionsColD"].ToString();
                txtPrintingReproductionColD.Text = dr["PrintingReproductionColD"].ToString();
                txtStaffTrainingColD.Text = dr["StaffTrainingColD"].ToString();
                txtRentalofSpaceColD.Text = dr["RentalofSpaceColD"].ToString();
                txtTelephoneUtilitiesColD.Text = dr["TelephoneUtilitiesColD"].ToString();
                txtDirectServiceTransportationColD.Text = dr["DirectServiceTransportationColD"].ToString();
                txtOCOtherColD.Text = dr["OCOtherColD"].ToString();

                txtProfessionalDevelopOpportunitiesColD.Text = dr["ProfessionalDevelopOpportunitiesColD"].ToString();
                txtApplicationFeesColD.Text = dr["ApplicationFeesColD"].ToString();
                txtCEUCoursesColD.Text = dr["CEUCoursesColD"].ToString();
                txtCollegeCoursesColD.Text = dr["CollegeCoursesColD"].ToString();
                txtCBOtherColD.Text = dr["CBOtherColD"].ToString();

                txtInstructionalEquipmentColD.Text = dr["InstructionalEquipmentColD"].ToString();
                txtNoninstructionalEquipmentColD.Text = dr["NoninstructionalEquipmentColD"].ToString();
                txtEqOtherColD.Text = dr["EqOtherColD"].ToString();

                txtAncillaryColD.Text = dr["AncillaryColD"].ToString();

                //col f
                txtSupervisorDirectorColF.Text = dr["SupervisorDirectorColF"].ToString();
                txtProjectCoordinatorColF.Text = dr["ProjectCoordinatorColF"].ToString();
                txtStipendColF.Text = dr["StipendColF"].ToString();
                txtOtherColF.Text = dr["OtherColF"].ToString();

                txtAdvisorColF.Text = dr["AdvisorColF"].ToString();
                txtClinicianColF.Text = dr["ClinicianColF"].ToString();
                txtCoordinatorColF.Text = dr["CoordinatorColF"].ToString();
                txtEducatorInstructorColF.Text = dr["EducatorInstructorColF"].ToString();
                txtHomeVisitorColF.Text = dr["HomeVisitorColF"].ToString();
                txtSpecialistColF.Text = dr["SpecialistColF"].ToString();
                txtIPSStipendColF.Text = dr["IPSStipendColF"].ToString();
                txtIPSOtherColF.Text = dr["IPSOtherColF"].ToString();

                txtAideParaprofessionalColF.Text = dr["AideParaprofessionalColF"].ToString();
                txtSecretaryBookkeeperColF.Text = dr["SecretaryBookkeeperColF"].ToString();
                txtSSStipendColF.Text = dr["SSStipendColF"].ToString();
                txtSSOtherColF.Text = dr["SSOtherColF"].ToString();

                txtFringeBenefitsColF.Text = dr["FringeBenefitsColF"].ToString();

                txtCSAdvisorColF.Text = dr["CSAdvisorColF"].ToString();
                txtCSClinicianColF.Text = dr["CSClinicianColF"].ToString();
                txtCSConsultantColF.Text = dr["CSConsultantColF"].ToString();
                txtCSEducatorInstructorColF.Text = dr["CSEducatorInstructorColF"].ToString();
                txtCSHomeVisitorColF.Text = dr["CSHomeVisitorColF"].ToString();
                txtCSSpecialistColF.Text = dr["CSSpecialistColF"].ToString();
                txtCSSpeakerColF.Text = dr["CSSpeakerColF"].ToString();
                txtCSSubstituteColF.Text = dr["CSSubstituteColF"].ToString();
                txtCSStipendColF.Text = dr["CSStipendColF"].ToString();
                txtCSOtherColF.Text = dr["CSOtherColF"].ToString();

                txtEducationalInstructionalMaterialsColF.Text = dr["EducationalInstructionalMaterialsColF"].ToString();
                txtInstructionalTechnologySoftwareColF.Text = dr["InstructionalTechnologySoftwareColF"].ToString();
                txtNonInstructionalSuppliesColF.Text = dr["NonInstructionalSuppliesColF"].ToString();
                txtSMOtherColF.Text = dr["SMOtherColF"].ToString();

                txtSupervisoryStaffColF.Text = dr["SupervisoryStaffColF"].ToString();
                txtInstructionalStaffColF.Text = dr["InstructionalStaffColF"].ToString();
                txtTravelOtherColF.Text = dr["TravelOtherColF"].ToString();

                txtAdvertisingColF.Text = dr["AdvertisingColF"].ToString();
                txtEquipmentRentalColF.Text = dr["EquipmentRentalColF"].ToString();
                txtMaintenanceRepairsColF.Text = dr["MaintenanceRepairsColF"].ToString();
                txtMembershipSubscriptionsColF.Text = dr["MembershipSubscriptionsColF"].ToString();
                txtPrintingReproductionColF.Text = dr["PrintingReproductionColF"].ToString();
                txtStaffTrainingColF.Text = dr["StaffTrainingColF"].ToString();
                txtRentalofSpaceColF.Text = dr["RentalofSpaceColF"].ToString();
                txtTelephoneUtilitiesColF.Text = dr["TelephoneUtilitiesColF"].ToString();
                txtDirectServiceTransportationColF.Text = dr["DirectServiceTransportationColF"].ToString();
                txtOCOtherColF.Text = dr["OCOtherColF"].ToString();

                txtProfessionalDevelopOpportunitiesColF.Text = dr["ProfessionalDevelopOpportunitiesColF"].ToString();
                txtApplicationFeesColF.Text = dr["ApplicationFeesColF"].ToString();
                txtCEUCoursesColF.Text = dr["CEUCoursesColF"].ToString();
                txtCollegeCoursesColF.Text = dr["CollegeCoursesColF"].ToString();
                txtCBOtherColF.Text = dr["CBOtherColF"].ToString();

                txtInstructionalEquipmentColF.Text = dr["InstructionalEquipmentColF"].ToString();
                txtNoninstructionalEquipmentColF.Text = dr["NoninstructionalEquipmentColF"].ToString();
                txtEqOtherColF.Text = dr["EqOtherColF"].ToString();

                txtAncillaryColF.Text = dr["AncillaryColF"].ToString();

                txtIndirectPercent.Text = dr["IndirectPercent"].ToString();
                txtIndirectCostsColF.Text = dr["IndirectCosts"].ToString();

                txtSupervisorDirectorNumofStaff.Text = dr["SupervisorDirectorNumofStaff"].ToString();
                txtSupervisorDirectorFTE.Text = dr["SupervisorDirectorFTE"].ToString();
                txtProjectCoordinatorNumofStaff.Text = dr["ProjectCoordinatorNumofStaff"].ToString();
                txtProjectCoordinatorFTE.Text = dr["ProjectCoordinatorFTE"].ToString();
                txtOtherNumofStaff.Text = dr["OtherNumofStaff"].ToString();
                txtOtherFTE.Text = dr["OtherFTE"].ToString();

                txtAdvisorNumofStaff.Text = dr["AdvisorNumofStaff"].ToString();
                txtAdvisorFTE.Text = dr["AdvisorFTE"].ToString();
                txtClinicianNumofStaff.Text = dr["ClinicianNumofStaff"].ToString();
                txtClinicianFTE.Text = dr["ClinicianFTE"].ToString();
                txtCoordinatorNumofStaff.Text = dr["CoordinatorNumofStaff"].ToString();
                txtCoordinatorFTE.Text = dr["CoordinatorFTE"].ToString();
                txtEducatorInstructorNumofStaff.Text = dr["EducatorInstructorNumofStaff"].ToString();
                txtEducatorInstructorFTE.Text = dr["EducatorInstructorFTE"].ToString();
                txtHomeVisitorNumofStaff.Text = dr["HomeVisitorNumofStaff"].ToString();
                txtHomeVisitorFTE.Text = dr["HomeVisitorFTE"].ToString();
                txtSpecialistNumofStaff.Text = dr["SpecialistNumofStaff"].ToString();
                txtSpecialistFTE.Text = dr["SpecialistFTE"].ToString();
                txtIPSOtherNumofStaff.Text = dr["IPSOtherNumofStaff"].ToString();
                txtIPSOtherFTE.Text = dr["IPSOtherFTE"].ToString();

                txtAideParaprofessionalNumofStaff.Text = dr["AideParaprofessionalNumofStaff"].ToString();
                txtAideParaprofessionalFTE.Text = dr["AideParaprofessionalFTE"].ToString();
                txtSecretaryBookkeeperNumofStaff.Text = dr["SecretaryBookkeeperNumofStaff"].ToString();
                txtSecretaryBookkeeperFTE.Text = dr["SecretaryBookkeeperFTE"].ToString();
                txtSSOtherNumofStaff.Text = dr["SSOtherNumofStaff"].ToString();
                txtSSOtherFTE.Text = dr["SSOtherFTE"].ToString();

                txtFringeBenefitsNumofStaff.Text = dr["FringeBenefitsNumofStaff"].ToString();
                txtFringeBenefitsFTE.Text = dr["FringeBenefitsFTE"].ToString();

                txtCSAdvisorRate.Text = dr["CSAdvisorRate"].ToString();
                txtCSClinicianRate.Text = dr["CSClinicianRate"].ToString();
                txtCSConsultantRate.Text = dr["CSConsultantRate"].ToString();
                txtCSEducatorInstructorRate.Text = dr["CSEducatorInstructorRate"].ToString();
                txtCSHomeVisitorRate.Text = dr["CSHomeVisitorRate"].ToString();
                txtCSSpecialistRate.Text = dr["CSSpecialistRate"].ToString();
                txtCSSpeakerRate.Text = dr["CSSpeakerRate"].ToString();
                txtCSSubstituteRate.Text = dr["CSSubstituteRate"].ToString();
                txtCSOtherRate.Text = dr["CSOtherRate"].ToString();

                txtSupervisoryStaffMileageRate.Text = dr["SupervisoryStaffMileageRate"].ToString();
                txtInstructionalStaffMileageRate.Text = dr["InstructionalStaffMileageRate"].ToString();
                txtTravelOtherMileageRate.Text = dr["TravelOtherMileageRate"].ToString();

                txtCSAdvisorHDW.Text = (string.IsNullOrEmpty(dr["CSAdvisorHrWkDayFlat"].ToString())) ? "-1" : dr["CSAdvisorHrWkDayFlat"].ToString();
                txtCSClinicianHDW.Text = (string.IsNullOrEmpty(dr["CSClinicianHrWkDayFlat"].ToString())) ? "-1" : dr["CSClinicianHrWkDayFlat"].ToString();
                txtCSConsultantHDW.Text = (string.IsNullOrEmpty(dr["CSConsultantHrWkDayFlat"].ToString())) ? "-1" : dr["CSConsultantHrWkDayFlat"].ToString();
                txtCSEducatorInstructorHDW.Text = (string.IsNullOrEmpty(dr["CSEducatorInstructorHrWkDayFlat"].ToString())) ? "-1" : dr["CSEducatorInstructorHrWkDayFlat"].ToString();
                txtCSHomeVisitorHDW.Text = (string.IsNullOrEmpty(dr["CSHomeVisitorHrWkDayFlat"].ToString())) ? "-1" : dr["CSHomeVisitorHrWkDayFlat"].ToString();
                txtCSSpecialistHDW.Text = (string.IsNullOrEmpty(dr["CSSpecialistHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpecialistHrWkDayFlat"].ToString();
                txtCSSpeakerHDW.Text = (string.IsNullOrEmpty(dr["CSSpeakerHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpeakerHrWkDayFlat"].ToString();
                txtCSSubstituteHDW.Text = (string.IsNullOrEmpty(dr["CSSubstituteHrWkDayFlat"].ToString())) ? "-1" : dr["CSSubstituteHrWkDayFlat"].ToString();
                txtCSOtherHDW.Text = (string.IsNullOrEmpty(dr["CSOtherHrWkDayFlat"].ToString())) ? "-1" : dr["CSOtherHrWkDayFlat"].ToString();

                txtSupervisorDirectorDescr.Text = dr["SupervisorDirectorDescr"].ToString();
                txtProjectCoordinatorDescr.Text = dr["ProjectCoordinatorDescr"].ToString();
                txtStipendDescr.Text = dr["StipendDescr"].ToString();
                txtOtherDescr.Text = dr["OtherDescr"].ToString();
                txtAdvisorDescr.Text = dr["AdvisorDescr"].ToString();
                txtClinicianDescr.Text = dr["ClinicianDescr"].ToString();
                txtCoordinatorDescr.Text = dr["CoordinatorDescr"].ToString();
                txtEducatorInstructorDescr.Text = dr["EducatorInstructorDescr"].ToString();
                txtHomeVisitorDescr.Text = dr["HomeVisitorDescr"].ToString();
                txtSpecialistDescr.Text = dr["SpecialistDescr"].ToString();
                txtIPSStipendDescr.Text = dr["IPSStipendDescr"].ToString();
                txtIPSOtherDescr.Text = dr["IPSOtherDescr"].ToString();
                txtAideParaprofessionalDescr.Text = dr["AideParaprofessionalDescr"].ToString();
                txtSecretaryBookkeeperDescr.Text = dr["SecretaryBookkeeperDescr"].ToString();
                txtSSStipendDescr.Text = dr["SSStipendDescr"].ToString();
                txtSSOtherDescr.Text = dr["SSOtherDescr"].ToString();
                txtFringeBenefitsDescr.Text = dr["FringeBenefitsDescr"].ToString();
                txtCSAdvisorDescr.Text = dr["CSAdvisorDescr"].ToString();
                txtCSClinicianDescr.Text = dr["CSClinicianDescr"].ToString();
                txtCSConsultantDescr.Text = dr["CSConsultantDescr"].ToString();
                txtCSEducatorInstructorDescr.Text = dr["CSEducatorInstructorDescr"].ToString();
                txtCSHomeVisitorDescr.Text = dr["CSHomeVisitorDescr"].ToString();
                txtCSSpecialistDescr.Text = dr["CSSpecialistDescr"].ToString();
                txtCSSpeakerDescr.Text = dr["CSSpeakerDescr"].ToString();
                txtCSSubstituteDescr.Text = dr["CSSubstituteDescr"].ToString();
                txtCSStipendDescr.Text = dr["CSStipendDescr"].ToString();
                txtCSOtherDescr.Text = dr["CSOtherDescr"].ToString();
                txtEducationalInstructionalMaterialsDescr.Text = dr["EducationalInstructionalMaterialsDescr"].ToString();
                txtInstructionalTechnologySoftwareDescr.Text = dr["InstructionalTechnologySoftwareDescr"].ToString();
                txtNonInstructionalSuppliesDescr.Text = dr["NonInstructionalSuppliesDescr"].ToString();
                txtSMOtherDescr.Text = dr["SMOtherDescr"].ToString();
                txtSupervisoryStaffDescr.Text = dr["SupervisoryStaffDescr"].ToString();
                txtInstructionalStaffDescr.Text = dr["InstructionalStaffDescr"].ToString();
                txtTravelOtherDescr.Text = dr["TraveOtherDescr"].ToString();

                txtAdvertisingDescr.Text = dr["AdvertisingDescr"].ToString();
                txtEquipmentRentalDescr.Text = dr["EquipmentRentalDescr"].ToString();
                txtMaintenanceRepairsDescr.Text = dr["MaintenanceRepairsDescr"].ToString();
                txtMembershipSubscriptionsDescr.Text = dr["MembershipSubscriptionsDescr"].ToString();
                txtPrintingReproductionDescr.Text = dr["PrintingReproductionDescr"].ToString();
                txtStaffTrainingDescr.Text = dr["StaffTrainingDescr"].ToString();
                txtRentalofSpaceDescr.Text = dr["RentalofSpaceDescr"].ToString();
                txtTelephoneUtilitiesDescr.Text = dr["TelephoneUtilitiesDescr"].ToString();
                txtDirectServiceTransportationDescr.Text = dr["DirectServiceTransportationDescr"].ToString();
                txtOCOtherDescr.Text = dr["OCOtherDescr"].ToString();
                txtProfessionalDevelopOpportunitiesDescr.Text = dr["ProfessionalDevelopOpportunitiesDescr"].ToString();
                txtApplicationFeesDescr.Text = dr["ApplicationFeesDescr"].ToString();
                txtCEUCoursesDescr.Text = dr["CEUCoursesDescr"].ToString();
                txtCollegeCoursesDescr.Text = dr["CollegeCoursesDescr"].ToString();
                txtCollegeCoursesDescr.Text = dr["CollegeCoursesDescr"].ToString();
                txtCBOtherDescr.Text = dr["CBOtherDescr"].ToString();
                txtIndirectCostsDescr.Text = dr["IndirectCostsDescr"].ToString();
                txtInstructionalEquipmentDescr.Text = dr["InstructionalEquipmentDescr"].ToString();
                txtNoninstructionalEquipmentDescr.Text = dr["NoninstructionalEquipmentDescr"].ToString();
                txtEqOtherDescr.Text = dr["EqOtherDescr"].ToString();
                txtAncillaryDescr.Text = dr["AncillaryDescr"].ToString();
            }

            dr = ds.Tables[2].Rows[0];

            /*only total*/
            txtAdminSubTotalColD.Text = Int32.Parse(dr["AdminSubTotalColD"].ToString()).ToString("N0");
            txtIPSSubTotalColD.Text = Int32.Parse(dr["IPSSubTotalColD"].ToString()).ToString("N0");
            txtSSSubTotalColD.Text = Int32.Parse(dr["SSSubTotalColD"].ToString()).ToString("N0");
            txtFBSubTotalColD.Text = Int32.Parse(dr["FBSubTotalColD"].ToString()).ToString("N0");
            txtCSSubTotalColD.Text = Int32.Parse(dr["CSSubTotalColD"].ToString()).ToString("N0");
            txtSMSubTotalColD.Text = Int32.Parse(dr["SMSubTotalColD"].ToString()).ToString("N0");
            txtTravelSubTotalColD.Text = Int32.Parse(dr["TravelSubTotalColD"].ToString()).ToString("N0");
            txtOCSubTotalColD.Text = Int32.Parse(dr["OCSubTotalColD"].ToString()).ToString("N0");
            txtCBSubTotalColD.Text = Int32.Parse(dr["CBSubTotalColD"].ToString()).ToString("N0");
            txtEqSubTotalColD.Text = Int32.Parse(dr["EqSubTotalColD"].ToString()).ToString("N0");
            txtAncillarySubTotalColD.Text = Int32.Parse(dr["AncillarySubTotalColD"].ToString()).ToString("N0");
            txtGrantTotalColD.Text = Int32.Parse(dr["GrantTotalColD"].ToString()).ToString("N2");

            txtAdminSubTotalColF.Text = Int32.Parse(dr["AdminSubTotalColF"].ToString()).ToString("N0");
            txtIPSSubTotalColF.Text = Int32.Parse(dr["IPSSubTotalColF"].ToString()).ToString("N0");
            txtSSSubTotalColF.Text = Int32.Parse(dr["SSSubTotalColF"].ToString()).ToString("N0");
            txtFBSubTotalColF.Text = Int32.Parse(dr["FBSubTotalColF"].ToString()).ToString("N0");
            txtCSSubTotalColF.Text = Int32.Parse(dr["CSSubTotalColF"].ToString()).ToString("N0");
            txtSMSubTotalColF.Text = Int32.Parse(dr["SMSubTotalColF"].ToString()).ToString("N0");
            txtTravelSubTotalColF.Text = Int32.Parse(dr["TravelSubTotalColF"].ToString()).ToString("N0");
            txtOCSubTotalColF.Text = Int32.Parse(dr["OCSubTotalColF"].ToString()).ToString("N0");
            txtCBSubTotalColF.Text = Int32.Parse(dr["CBSubTotalColF"].ToString()).ToString("N0");
            txtEqSubTotalColF.Text = Int32.Parse(dr["EqSubTotalColF"].ToString()).ToString("N0");
            txtAncillarySubTotalColF.Text = Int32.Parse(dr["AncillarySubTotalColF"].ToString()).ToString("N0");
            txtGrantTotalColF.Text = Int32.Parse(dr["GrantTotalColF"].ToString()).ToString("N2");

            txtSupervisorDirector.Text = Int32.Parse(dr["SupervisorDirector"].ToString()).ToString("N0");
            txtProjectCoordinator.Text = Int32.Parse(dr["ProjectCoordinator"].ToString()).ToString("N0");
            txtStipend.Text = Int32.Parse(dr["Stipend"].ToString()).ToString("N0");
            txtOther.Text = Int32.Parse(dr["Other"].ToString()).ToString("N0");
            txtAdminSubTotal.Text = Int32.Parse(dr["AdminSubTotal"].ToString()).ToString("N0");
            txtAdvisor.Text = Int32.Parse(dr["Advisor"].ToString()).ToString("N0");
            txtClinician.Text = Int32.Parse(dr["Clinician"].ToString()).ToString("N0");
            txtCoordinator.Text = Int32.Parse(dr["Coordinator"].ToString()).ToString("N0");
            txtEducatorInstructor.Text = Int32.Parse(dr["EducatorInstructor"].ToString()).ToString("N0");
            txtHomeVisitor.Text = Int32.Parse(dr["HomeVisitor"].ToString()).ToString("N0");
            txtSpecialist.Text = Int32.Parse(dr["Specialist"].ToString()).ToString("N0");
            txtIPSStipend.Text = Int32.Parse(dr["IPSStipend"].ToString()).ToString("N0");
            txtIPSOther.Text = Int32.Parse(dr["IPSOther"].ToString()).ToString("N0");
            txtIPSSubTotal.Text = Int32.Parse(dr["IPSSubTotal"].ToString()).ToString("N0");
            txtAideParaprofessional.Text = Int32.Parse(dr["AideParaprofessional"].ToString()).ToString("N0");
            txtSecretaryBookkeeper.Text = Int32.Parse(dr["SecretaryBookkeeper"].ToString()).ToString("N0");
            txtSSStipend.Text = Int32.Parse(dr["SSStipend"].ToString()).ToString("N0");
            txtSSOther.Text = Int32.Parse(dr["SSOther"].ToString()).ToString("N0");
            txtSSSubTotal.Text = Int32.Parse(dr["SSSubTotal"].ToString()).ToString("N0");
            txtFringeBenefits.Text = Int32.Parse(dr["FringeBenefits"].ToString()).ToString("N0");
            txtFBSubTotal.Text = Int32.Parse(dr["FBSubTotal"].ToString()).ToString("N0");
            txtCSAdvisor.Text = Int32.Parse(dr["CSAdvisor"].ToString()).ToString("N0");
            txtCSClinician.Text = Int32.Parse(dr["CSClinician"].ToString()).ToString("N0");
            txtCSConsultant.Text = Int32.Parse(dr["CSConsultant"].ToString()).ToString("N0");
            txtCSEducatorInstructor.Text = Int32.Parse(dr["CSEducatorInstructor"].ToString()).ToString("N0");
            txtCSHomeVisitor.Text = Int32.Parse(dr["CSHomeVisitor"].ToString()).ToString("N0");
            txtCSSpecialist.Text = Int32.Parse(dr["CSSpecialist"].ToString()).ToString("N0");
            txtCSSpeaker.Text = Int32.Parse(dr["CSSpeaker"].ToString()).ToString("N0");
            txtCSSubstitute.Text = Int32.Parse(dr["CSSubstitute"].ToString()).ToString("N0");
            txtCSStipend.Text = Int32.Parse(dr["CSStipend"].ToString()).ToString("N0");
            txtCSOther.Text = Int32.Parse(dr["CSOther"].ToString()).ToString("N0");
            txtCSSubTotal.Text = Int32.Parse(dr["CSSubTotal"].ToString()).ToString("N0");
            txtEducationalInstructionalMaterials.Text = Int32.Parse(dr["EducationalInstructionalMaterials"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftware.Text = Int32.Parse(dr["InstructionalTechnologySoftware"].ToString()).ToString("N0");
            txtNonInstructionalSupplies.Text = Int32.Parse(dr["NonInstructionalSupplies"].ToString()).ToString("N0");
            txtSMOther.Text = Int32.Parse(dr["SMOther"].ToString()).ToString("N0");
            txtSMSubTotal.Text = Int32.Parse(dr["SMSubTotal"].ToString()).ToString("N0");
            txtSupervisoryStaff.Text = Int32.Parse(dr["SupervisoryStaff"].ToString()).ToString("N0");
            txtInstructionalStaff.Text = Int32.Parse(dr["InstructionalStaff"].ToString()).ToString("N0");
            txtTravelOther.Text = Int32.Parse(dr["TravelOther"].ToString()).ToString("N0");
            txtTravelSubTotal.Text = Int32.Parse(dr["TravelSubTotal"].ToString()).ToString("N0");
            txtAdvertising.Text = Int32.Parse(dr["Advertising"].ToString()).ToString("N0");
            txtEquipmentRental.Text = Int32.Parse(dr["EquipmentRental"].ToString()).ToString("N0");
            txtMaintenanceRepairs.Text = Int32.Parse(dr["MaintenanceRepairs"].ToString()).ToString("N0");
            txtMembershipSubscriptions.Text = Int32.Parse(dr["MembershipSubscriptions"].ToString()).ToString("N0");
            txtPrintingReproduction.Text = Int32.Parse(dr["PrintingReproduction"].ToString()).ToString("N0");
            txtStaffTraining.Text = Int32.Parse(dr["StaffTraining"].ToString()).ToString("N0");
            txtRentalofSpace.Text = Int32.Parse(dr["RentalofSpace"].ToString()).ToString("N0");
            txtTelephoneUtilities.Text = Int32.Parse(dr["TelephoneUtilities"].ToString()).ToString("N0");
            txtDirectServiceTransportation.Text = Int32.Parse(dr["DirectServiceTransportation"].ToString()).ToString("N0");
            txtOCOther.Text = Int32.Parse(dr["OCOther"].ToString()).ToString("N0");
            txtOCSubTotal.Text = Int32.Parse(dr["OCSubTotal"].ToString()).ToString("N0");
            txtProfessionalDevelopOpportunities.Text = Int32.Parse(dr["ProfessionalDevelopOpportunities"].ToString()).ToString("N0");
            txtApplicationFees.Text = Int32.Parse(dr["ApplicationFees"].ToString()).ToString("N0");
            txtCEUCourses.Text = Int32.Parse(dr["CEUCourses"].ToString()).ToString("N0");
            txtCollegeCourses.Text = Int32.Parse(dr["CollegeCourses"].ToString()).ToString("N0");
            txtCBOther.Text = Int32.Parse(dr["CBOther"].ToString()).ToString("N0");
            txtCBSubTotal.Text = Int32.Parse(dr["CBSubTotal"].ToString()).ToString("N0");
            txtIndirectCosts.Text = Int32.Parse(dr["IndirectCosts"].ToString()).ToString("N0");
            txtInstructionalEquipment.Text = Int32.Parse(dr["InstructionalEquipment"].ToString()).ToString("N0");
            txtNoninstructionalEquipment.Text = Int32.Parse(dr["NoninstructionalEquipment"].ToString()).ToString("N0");
            txtEqOther.Text = Int32.Parse(dr["EqOther"].ToString()).ToString("N0");
            txtEqSubTotal.Text = Int32.Parse(dr["EqSubTotal"].ToString()).ToString("N0");
            txtAncillary.Text = Int32.Parse(dr["Ancillary"].ToString()).ToString("N0");
            txtAncillarySubTotal.Text = Int32.Parse(dr["AncillarySubTotal"].ToString()).ToString("N0");

            txtAdminSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["AdminSubTotalNumofStaff"].ToString())) ? "" : dr["AdminSubTotalNumofStaff"].ToString();
            txtAdminSubTotalFTE.Text = (string.IsNullOrEmpty(dr["AdminSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["AdminSubTotalFTE"].ToString()).ToString("N2");
            txtIPSSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["IPSSubTotalNumofStaff"].ToString())) ? "0" : dr["IPSSubTotalNumofStaff"].ToString();
            txtIPSSubTotalFTE.Text = (string.IsNullOrEmpty(dr["IPSSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["IPSSubTotalFTE"].ToString()).ToString("N2");
            txtSSSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["SSSubTotalNumofStaff"].ToString())) ? "0" : dr["SSSubTotalNumofStaff"].ToString();
            txtSSSubTotalFTE.Text = (string.IsNullOrEmpty(dr["SSSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SSSubTotalFTE"].ToString()).ToString("N2");
            txtFBSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["FBSubTotalNumofStaff"].ToString())) ? "0" : dr["FBSubTotalNumofStaff"].ToString();
            txtFBSubTotalFTE.Text = (string.IsNullOrEmpty(dr["FBSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["FBSubTotalFTE"].ToString()).ToString("N2");
            txtIndirectCostsSubTotalColF.Text = (string.IsNullOrEmpty(dr["IndirectCosts"].ToString())) ? "0" : Convert.ToInt32(dr["IndirectCosts"].ToString()).ToString("N0");
            txtIndirectCostsSubTotal.Text = (string.IsNullOrEmpty(dr["IndirectCosts"].ToString())) ? "0" : Convert.ToInt32(dr["IndirectCosts"].ToString()).ToString("N0");

            txtGrantTotal.Text = Int32.Parse(dr["GrantTotal"].ToString()).ToString("N2");

            tblWarnings.Visible = false;
            tblFailed.Visible = false;
            tblSuccess.Visible = false;

            //get any warnings
            if (hasValidationWarning(isAfterSaved))
            {
                tblWarnings.Visible = true;
                lnkBackToHomeWarning.Visible = (isAfterSaved) ? true : false;
            }
            else
            {
                tblWarnings.Visible = false;
                lnkBackToHomeWarning.Visible = false;
            }

            //get any errors
            if (hasValidationErrors(isAfterSaved))
            {
                tblFailed.Visible = true;
            }

            if (tblWarnings.Visible || tblFailed.Visible)
            {
                tblSuccess.Visible = false;
            }
            else
            {
                tblSuccess.Visible = (isAfterSaved) ? true : false;
            }

            if (isAfterSaved)
            {
                if (tblWarnings.Visible)
                {
                    lnkBackToHomeWarning.Visible = true;
                    lnkBackToHomeError.Visible = false;
                }
                else
                {
                    lnkBackToHomeError.Visible = true;
                    lnkBackToHomeWarning.Visible = false;
                }
            }
            else
            {
                lnkBackToHomeError.Visible = false;
                lnkBackToHomeWarning.Visible = false;
            }
        }
    }

    private bool hasValidationWarning(bool isAfterSaved)
    {
        int warningCount = 0;

        DataRow dr = ds.Tables[2].Rows[0];

        //fringe warning
        if (!GlobalFunc.isValidFringe(dr))
        {
            warningCount++;
        }

        amend.UpdateBudgetAmendmentWarningCount(Int32.Parse(ViewState["BudgetNarrativeID"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()), warningCount);

        return warningCount > 0;
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        if (ds.Tables[1].Rows.Count == 0) return false;

        int errorCount = 0;

        setDefaultStyle();

        lstErrors.Items.Clear();

        List<string> lstErrorBoxes = new List<string>();

        DataRow dr = ds.Tables[1].Rows[0];

        if (!GlobalFuncAmendment.isValidBudgetAmendmentNarrativeQuestions(lstErrorBoxes, dr))
        {
            lstErrors.Items.Add("Please provide a budget narrative for all line items requested.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidProgramAdminCostsAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Please provide the requested Program or Admin costs.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidNumOfFTEAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 1-4: Please enter the # of FTEs (Full Time Equivalences) for each line requested.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidNumOfStaffFTEAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("The number of FTE should not be greater than the number of Staff.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidNumOfStaffAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 1-4: Please enter the # of Staff for each line requested.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidMileageRateAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 7: Please enter the mileage rate for each line requested.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidContractPaidRateAmendment(lstErrorBoxes, dr))
        {
            lstErrors.Items.Add("Line 5: Please provide the Rate ($) and Hr/Day/Wk/Yr/Flat Fee for each Contractual Service requested.");
            errorCount++;
        }

        if (!GlobalFuncAmendment.isValidIndirectPercentAmendment(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 10: Please provide your agency's Indirect Cost Approval Rate.");
            errorCount++;
        }
        
        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        amend.UpdateBudgetAmendmentErrorCount(Int32.Parse(ViewState["BudgetNarrativeID"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()), errorCount);

        return lstErrorBoxes.Count > 0;
    }

    private void BindScripts()
    {
        //col d
        txtSupervisorDirectorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSupervisorDirectorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtProjectCoordinatorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtProjectCoordinatorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtStipendColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtStipendColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAdvisorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAdvisorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtClinicianColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtClinicianColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCoordinatorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCoordinatorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEducatorInstructorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEducatorInstructorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtHomeVisitorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtHomeVisitorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSpecialistColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSpecialistColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtIPSStipendColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtIPSStipendColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtIPSOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtIPSOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAideParaprofessionalColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAideParaprofessionalColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSecretaryBookkeeperColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSecretaryBookkeeperColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSSStipendColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSSStipendColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSSOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSSOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtFringeBenefitsColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtFringeBenefitsColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSAdvisorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSAdvisorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSClinicianColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSClinicianColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSConsultantColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSConsultantColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSEducatorInstructorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSEducatorInstructorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSHomeVisitorColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSHomeVisitorColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSpecialistColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSpecialistColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSpeakerColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSpeakerColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSubstituteColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSubstituteColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSStipendColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSStipendColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEducationalInstructionalMaterialsColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEducationalInstructionalMaterialsColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalTechnologySoftwareColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalTechnologySoftwareColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtNonInstructionalSuppliesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtNonInstructionalSuppliesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSMOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSMOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSupervisoryStaffColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSupervisoryStaffColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalStaffColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalStaffColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtTravelOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtTravelOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAdvertisingColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAdvertisingColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEquipmentRentalColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEquipmentRentalColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtMaintenanceRepairsColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtMaintenanceRepairsColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtMembershipSubscriptionsColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtMembershipSubscriptionsColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtPrintingReproductionColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtPrintingReproductionColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtStaffTrainingColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtStaffTrainingColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtRentalofSpaceColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtRentalofSpaceColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtTelephoneUtilitiesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtTelephoneUtilitiesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtDirectServiceTransportationColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtDirectServiceTransportationColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtOCOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtOCOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtProfessionalDevelopOpportunitiesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtProfessionalDevelopOpportunitiesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtApplicationFeesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtApplicationFeesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCEUCoursesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCEUCoursesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCollegeCoursesColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCollegeCoursesColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCBOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCBOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalEquipmentColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalEquipmentColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtNoninstructionalEquipmentColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtNoninstructionalEquipmentColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEqOtherColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEqOtherColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAncillaryColD.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAncillaryColD.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");

        //col f
        txtSupervisorDirectorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSupervisorDirectorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtProjectCoordinatorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtProjectCoordinatorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtStipendColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtStipendColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAdvisorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAdvisorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtClinicianColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtClinicianColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCoordinatorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCoordinatorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEducatorInstructorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEducatorInstructorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtHomeVisitorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtHomeVisitorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSpecialistColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSpecialistColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtIPSStipendColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtIPSStipendColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtIPSOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtIPSOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAideParaprofessionalColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAideParaprofessionalColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSecretaryBookkeeperColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSecretaryBookkeeperColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSSStipendColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSSStipendColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSSOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSSOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtFringeBenefitsColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtFringeBenefitsColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSAdvisorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSAdvisorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSClinicianColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSClinicianColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSConsultantColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSConsultantColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSEducatorInstructorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSEducatorInstructorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSHomeVisitorColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSHomeVisitorColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSpecialistColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSpecialistColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSpeakerColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSpeakerColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSSubstituteColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSSubstituteColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSStipendColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSStipendColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCSOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCSOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEducationalInstructionalMaterialsColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEducationalInstructionalMaterialsColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalTechnologySoftwareColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalTechnologySoftwareColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtNonInstructionalSuppliesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtNonInstructionalSuppliesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSMOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSMOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtSupervisoryStaffColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtSupervisoryStaffColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalStaffColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalStaffColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtTravelOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtTravelOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAdvertisingColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAdvertisingColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEquipmentRentalColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEquipmentRentalColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtMaintenanceRepairsColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtMaintenanceRepairsColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtMembershipSubscriptionsColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtMembershipSubscriptionsColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtPrintingReproductionColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtPrintingReproductionColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtStaffTrainingColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtStaffTrainingColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtRentalofSpaceColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtRentalofSpaceColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtTelephoneUtilitiesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtTelephoneUtilitiesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtDirectServiceTransportationColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtDirectServiceTransportationColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtOCOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtOCOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtProfessionalDevelopOpportunitiesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtProfessionalDevelopOpportunitiesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtApplicationFeesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtApplicationFeesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCEUCoursesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCEUCoursesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCollegeCoursesColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCollegeCoursesColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtCBOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtCBOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtInstructionalEquipmentColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtInstructionalEquipmentColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtNoninstructionalEquipmentColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtNoninstructionalEquipmentColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtEqOtherColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtEqOtherColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");
        txtAncillaryColF.Attributes.Add("onkeypress", "javascript:CalcColValue(this);");
        txtAncillaryColF.Attributes.Add("onchange", "javascript:CalcColumnCTotal(this);");

        txtIndirectCostsColF.Attributes.Add("onkeypress", "javascript:CalcColIndirectCostValue(this);");
        txtIndirectCostsColF.Attributes.Add("onchange", "javascript:CalcColumnIndirectCosts(this);");

        txtTravelOtherMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtTravelOtherMileageRate.ClientID + "'" + ");");
        txtInstructionalStaffMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtInstructionalStaffMileageRate.ClientID + "'" + ");");
        txtSupervisoryStaffMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtSupervisoryStaffMileageRate.ClientID + "'" + ");");

        txtFringeBenefitsNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtFBSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtFringeBenefitsNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                 "'" + txtFringeBenefitsNumofStaff.ClientID + "'" + ");");

        txtSSOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");

        txtSecretaryBookkeeperNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");

        txtAideParaprofessionalNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");


        txtSupervisorDirectorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");

        txtProjectCoordinatorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");

        txtOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                   "'" + txtOtherNumofStaff.ClientID + "'" + ");");

        txtAdvisorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtClinicianNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtCoordinatorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSpecialistNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtIPSOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtEducatorInstructorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtHomeVisitorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                           "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");




        txtSupervisorDirectorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTEOrg.ClientID + "'" + "," + 
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");

        txtProjectCoordinatorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTEOrg.ClientID + "'" + "," + 
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");

        txtOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                               "'" + txtOtherFTEOrg.ClientID + "'" + "," +
                                                                               "'" + txtOtherFTE.ClientID + "'" + ");");

        txtAdvisorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtClinicianFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtCoordinatorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtEducatorInstructorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtHomeVisitorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtSpecialistFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtIPSOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtAideParaprofessionalFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtSecretaryBookkeeperFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtSSOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtFringeBenefitsFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtFBSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtFringeBenefitsFTEOrg.ClientID + "'" + "," +  
                                                                                       "'" + txtFringeBenefitsFTE.ClientID + "'" + ");");

        txtCSAdvisorRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSAdvisorRate.ClientID + "'" + ");");
        txtCSClinicianRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSClinicianRate.ClientID + "'" + ");");
        txtCSConsultantRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSConsultantRate.ClientID + "'" + ");");
        txtCSEducatorInstructorRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSEducatorInstructorRate.ClientID + "'" + ");");
        txtCSHomeVisitorRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSHomeVisitorRate.ClientID + "'" + ");");
        txtCSSpecialistRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSSpecialistRate.ClientID + "'" + ");");
        txtCSSpeakerRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSSpeakerRate.ClientID + "'" + ");");
        txtCSSubstituteRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSSubstituteRate.ClientID + "'" + ");");
        txtCSOtherRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtCSOtherRate.ClientID + "'" + ");");
        txtIndirectPercent.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtIndirectPercent.ClientID + "'" + ");");


        txtTravelOtherMileageRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtTravelOtherMileageRate.ClientID + "'" + ");");
        txtInstructionalStaffMileageRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtInstructionalStaffMileageRate.ClientID + "'" + ");");
        txtSupervisoryStaffMileageRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtSupervisoryStaffMileageRate.ClientID + "'" + ");");

        txtFringeBenefitsNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtFBSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtFringeBenefitsNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtFringeBenefitsNumofStaff.ClientID + "'" + ");");

        txtSSOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");

        txtSecretaryBookkeeperNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");

        txtAideParaprofessionalNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");


        txtSupervisorDirectorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");

        txtProjectCoordinatorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");

        txtOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                   "'" + txtOtherNumofStaff.ClientID + "'" + ");");


        txtAdvisorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                     "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtClinicianNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                       "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtCoordinatorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSpecialistNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtIPSOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtEducatorInstructorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtHomeVisitorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaffOrg.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtIPSOtherNumofStaffOrg.ClientID + "'" + "," + 
                                                                                                           "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSupervisorDirectorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTEOrg.ClientID + "'" + "," + 
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");

        txtProjectCoordinatorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTEOrg.ClientID + "'" + "," + 
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");

        txtOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTEOrg.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                               "'" + txtOtherFTEOrg.ClientID + "'" + "," + 
                                                                               "'" + txtOtherFTE.ClientID + "'" + ");");

        txtAdvisorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtClinicianFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtCoordinatorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtEducatorInstructorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtHomeVisitorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtSpecialistFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtIPSOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTEOrg.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");

        txtAideParaprofessionalFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtSecretaryBookkeeperFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtSSOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTEOrg.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTEOrg.ClientID + "'" + "," + 
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");

        txtFringeBenefitsFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtFBSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtFringeBenefitsFTEOrg.ClientID + "'" + "," +  
                                                                                       "'" + txtFringeBenefitsFTE.ClientID + "'" + ");");

        txtCSAdvisorRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSAdvisorRate.ClientID + "'" + ");");
        txtCSClinicianRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSClinicianRate.ClientID + "'" + ");");
        txtCSConsultantRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSConsultantRate.ClientID + "'" + ");");
        txtCSEducatorInstructorRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSEducatorInstructorRate.ClientID + "'" + ");");
        txtCSHomeVisitorRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSHomeVisitorRate.ClientID + "'" + ");");
        txtCSSpecialistRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSSpecialistRate.ClientID + "'" + ");");
        txtCSSpeakerRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSSpeakerRate.ClientID + "'" + ");");
        txtCSSubstituteRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSSubstituteRate.ClientID + "'" + ");");
        txtCSOtherRate.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtCSOtherRate.ClientID + "'" + ");");
        txtIndirectPercent.Attributes.Add("onkeypress", "javascript:UpdateToFloatValueKey(" + "'" + txtIndirectPercent.ClientID + "'" + ");");
    }

    private int SaveBudgetNarrativeDataAmendment(ref string errorMsg)
    {
        int BudgetNarrativeID = 0;

        if (Page.IsValid)
        {
            try
            {
                updateData();

                BudgetNarrativeID = amend.SaveBudgetNarrativeDataAmendment((ViewState["BudgetNarrativeID"] == null) ? -1 : Int32.Parse(ViewState["BudgetNarrativeID"].ToString()),
                                                                         Int32.Parse(Session["GrantApplicantId"].ToString()),
                                                                         txtSupervisorDirectorDescr.Text,
                                                                        txtProjectCoordinatorDescr.Text,
                                                                        txtStipendDescr.Text,
                                                                        txtOtherDescr.Text,
                                                                        txtAdvisorDescr.Text,
                                                                        txtClinicianDescr.Text,
                                                                        txtCoordinatorDescr.Text,
                                                                        txtEducatorInstructorDescr.Text,
                                                                        txtHomeVisitorDescr.Text,
                                                                        txtSpecialistDescr.Text,
                                                                        txtIPSStipendDescr.Text,
                                                                        txtIPSOtherDescr.Text,
                                                                        txtAideParaprofessionalDescr.Text,
                                                                        txtSecretaryBookkeeperDescr.Text,
                                                                        txtSSStipendDescr.Text,
                                                                        txtSSOtherDescr.Text,
                                                                        txtFringeBenefitsDescr.Text,
                                                                        txtCSAdvisorDescr.Text,
                                                                        txtCSClinicianDescr.Text,
                                                                        txtCSConsultantDescr.Text,
                                                                        txtCSEducatorInstructorDescr.Text,
                                                                        txtCSHomeVisitorDescr.Text,
                                                                        txtCSSpecialistDescr.Text,
                                                                        txtCSSpeakerDescr.Text,
                                                                        txtCSSubstituteDescr.Text,
                                                                        txtCSStipendDescr.Text,
                                                                        txtCSOtherDescr.Text,
                                                                        txtEducationalInstructionalMaterialsDescr.Text,
                                                                        txtInstructionalTechnologySoftwareDescr.Text,
                                                                        txtNonInstructionalSuppliesDescr.Text,
                                                                        txtSMOtherDescr.Text,
                                                                        txtSupervisoryStaffDescr.Text,
                                                                        txtInstructionalStaffDescr.Text,
                                                                        txtTravelOtherDescr.Text,
                                                                        txtAdvertisingDescr.Text,
                                                                        txtEquipmentRentalDescr.Text,
                                                                        txtMaintenanceRepairsDescr.Text,
                                                                        txtMembershipSubscriptionsDescr.Text,
                                                                        txtPrintingReproductionDescr.Text,
                                                                        txtStaffTrainingDescr.Text,
                                                                        txtRentalofSpaceDescr.Text,
                                                                        txtTelephoneUtilitiesDescr.Text,
                                                                        txtDirectServiceTransportationDescr.Text,
                                                                        txtOCOtherDescr.Text,
                                                                        txtProfessionalDevelopOpportunitiesDescr.Text,
                                                                        txtApplicationFeesDescr.Text,
                                                                        txtCEUCoursesDescr.Text,
                                                                        txtCollegeCoursesDescr.Text,
                                                                        txtCBOtherDescr.Text,
                                                                        txtIndirectPercent.Text,
                                                                        txtIndirectCostsDescr.Text,
                                                                        txtInstructionalEquipmentDescr.Text,
                                                                        txtNoninstructionalEquipmentDescr.Text,
                                                                        txtEqOtherDescr.Text,
                                                                        txtAncillaryDescr.Text,
                                                                         txtSupervisorDirectorColD.Text,
                                                                         txtProjectCoordinatorColD.Text,
                                                                         txtStipendColD.Text,
                                                                         txtOtherColD.Text,
                                                                         txtAdvisorColD.Text,
                                                                         txtClinicianColD.Text,
                                                                         txtCoordinatorColD.Text,
                                                                         txtEducatorInstructorColD.Text,
                                                                         txtHomeVisitorColD.Text,
                                                                         txtSpecialistColD.Text,
                                                                         txtIPSStipendColD.Text,
                                                                         txtIPSOtherColD.Text,
                                                                         txtAideParaprofessionalColD.Text,
                                                                         txtSecretaryBookkeeperColD.Text,
                                                                         txtSSOtherColD.Text,
                                                                         txtSSStipendColD.Text,
                                                                         txtFringeBenefitsColD.Text,
                                                                         txtCSAdvisorColD.Text,
                                                                         txtCSClinicianColD.Text,
                                                                         txtCSConsultantColD.Text,
                                                                         txtCSEducatorInstructorColD.Text,
                                                                         txtCSHomeVisitorColD.Text,
                                                                         txtCSSpecialistColD.Text,
                                                                         txtCSSpeakerColD.Text,
                                                                         txtCSSubstituteColD.Text,
                                                                         txtCSStipendColD.Text,
                                                                         txtCSOtherColD.Text,
                                                                         txtEducationalInstructionalMaterialsColD.Text,
                                                                         txtInstructionalTechnologySoftwareColD.Text,
                                                                         txtNonInstructionalSuppliesColD.Text,
                                                                         txtSMOtherColD.Text,
                                                                         txtSupervisoryStaffColD.Text,
                                                                         txtInstructionalStaffColD.Text,
                                                                         txtTravelOtherColD.Text,
                                                                         txtAdvertisingColD.Text,
                                                                         txtEquipmentRentalColD.Text,
                                                                         txtMaintenanceRepairsColD.Text,
                                                                         txtMembershipSubscriptionsColD.Text,
                                                                         txtPrintingReproductionColD.Text,
                                                                         txtStaffTrainingColD.Text,
                                                                         txtRentalofSpaceColD.Text,
                                                                         txtTelephoneUtilitiesColD.Text,
                                                                         txtDirectServiceTransportationColD.Text,
                                                                         txtOCOtherColD.Text,
                                                                         txtProfessionalDevelopOpportunitiesColD.Text,
                                                                         txtApplicationFeesColD.Text,
                                                                         txtCEUCoursesColD.Text,
                                                                         txtCollegeCoursesColD.Text,
                                                                         txtCBOtherColD.Text,
                                                                         txtInstructionalEquipmentColD.Text,
                                                                         txtNoninstructionalEquipmentColD.Text,
                                                                         txtEqOtherColD.Text,
                                                                         txtAncillaryColD.Text,
                                                                         txtSupervisorDirectorColF.Text,
                                                                         txtProjectCoordinatorColF.Text,
                                                                         txtStipendColF.Text,
                                                                         txtOtherColF.Text,
                                                                         txtAdvisorColF.Text,
                                                                         txtClinicianColF.Text,
                                                                         txtCoordinatorColF.Text,
                                                                         txtEducatorInstructorColF.Text,
                                                                         txtHomeVisitorColF.Text,
                                                                         txtSpecialistColF.Text,
                                                                         txtIPSStipendColF.Text,
                                                                         txtIPSOtherColF.Text,
                                                                         txtAideParaprofessionalColF.Text,
                                                                         txtSecretaryBookkeeperColF.Text,
                                                                         txtSSStipendColF.Text,
                                                                         txtSSOtherColF.Text,
                                                                         txtFringeBenefitsColF.Text,
                                                                         txtCSAdvisorColF.Text,
                                                                         txtCSClinicianColF.Text,
                                                                         txtCSConsultantColF.Text,
                                                                         txtCSEducatorInstructorColF.Text,
                                                                         txtCSHomeVisitorColF.Text,
                                                                         txtCSSpecialistColF.Text,
                                                                         txtCSSpeakerColF.Text,
                                                                         txtCSSubstituteColF.Text,
                                                                         txtCSStipendColF.Text,
                                                                         txtCSOtherColF.Text,
                                                                         txtEducationalInstructionalMaterialsColF.Text,
                                                                         txtInstructionalTechnologySoftwareColF.Text,
                                                                         txtNonInstructionalSuppliesColF.Text,
                                                                         txtSMOtherColF.Text,
                                                                         txtSupervisoryStaffColF.Text,
                                                                         txtInstructionalStaffColF.Text,
                                                                         txtTravelOtherColF.Text,
                                                                         txtAdvertisingColF.Text,
                                                                         txtEquipmentRentalColF.Text,
                                                                         txtMaintenanceRepairsColF.Text,
                                                                         txtMembershipSubscriptionsColF.Text,
                                                                         txtPrintingReproductionColF.Text,
                                                                         txtStaffTrainingColF.Text,
                                                                         txtRentalofSpaceColF.Text,
                                                                         txtTelephoneUtilitiesColF.Text,
                                                                         txtDirectServiceTransportationColF.Text,
                                                                         txtOCOtherColF.Text,
                                                                         txtProfessionalDevelopOpportunitiesColF.Text,
                                                                         txtApplicationFeesColF.Text,
                                                                         txtCEUCoursesColF.Text,
                                                                         txtCollegeCoursesColF.Text,
                                                                         txtCBOtherColF.Text,
                                                                         txtInstructionalEquipmentColF.Text,
                                                                         txtNoninstructionalEquipmentColF.Text,
                                                                         txtEqOtherColF.Text,
                                                                         txtAncillaryColF.Text,
                                                                         txtIndirectCostsColF.Text,
                                                                         txtSupervisorDirectorNumofStaff.Text,
                                                                         txtSupervisorDirectorFTE.Text,
                                                                         txtProjectCoordinatorNumofStaff.Text,
                                                                         txtProjectCoordinatorFTE.Text,
                                                                         txtOtherNumofStaff.Text,
                                                                         txtOtherFTE.Text,
                                                                         txtAdvisorNumofStaff.Text,
                                                                         txtAdvisorFTE.Text,
                                                                         txtClinicianNumofStaff.Text,
                                                                         txtClinicianFTE.Text,
                                                                         txtCoordinatorNumofStaff.Text,
                                                                         txtCoordinatorFTE.Text,
                                                                         txtEducatorInstructorNumofStaff.Text,
                                                                         txtEducatorInstructorFTE.Text,
                                                                         txtHomeVisitorNumofStaff.Text,
                                                                         txtHomeVisitorFTE.Text,
                                                                         txtSpecialistNumofStaff.Text,
                                                                         txtSpecialistFTE.Text,
                                                                         txtIPSOtherNumofStaff.Text,
                                                                         txtIPSOtherFTE.Text,
                                                                         txtAideParaprofessionalNumofStaff.Text,
                                                                         txtAideParaprofessionalFTE.Text,
                                                                         txtSecretaryBookkeeperNumofStaff.Text,
                                                                         txtSecretaryBookkeeperFTE.Text,
                                                                         txtSSOtherNumofStaff.Text,
                                                                         txtSSOtherFTE.Text,
                                                                         txtFringeBenefitsNumofStaff.Text,
                                                                         txtFringeBenefitsFTE.Text,
                                                                         txtCSAdvisorRate.Text,
                                                                        txtCSAdvisorHDW.Text,
                                                                         txtCSClinicianRate.Text,
                                                                        txtCSClinicianHDW.Text,
                                                                         txtCSConsultantRate.Text,
                                                                        txtCSConsultantHDW.Text,
                                                                         txtCSEducatorInstructorRate.Text,
                                                                        txtCSEducatorInstructorHDW.Text,
                                                                         txtCSHomeVisitorRate.Text,
                                                                        txtCSHomeVisitorHDW.Text,
                                                                         txtCSSpecialistRate.Text,
                                                                        txtCSSpecialistHDW.Text,
                                                                         txtCSSpeakerRate.Text,
                                                                        txtCSSpeakerHDW.Text,
                                                                         txtCSSubstituteRate.Text,
                                                                        txtCSSubstituteHDW.Text,
                                                                         txtCSOtherRate.Text,
                                                                        txtCSOtherHDW.Text,
                                                                         txtSupervisoryStaffMileageRate.Text,
                                                                         txtInstructionalStaffMileageRate.Text,
                                                                         txtTravelOtherMileageRate.Text,
                                                                        0,
                                                                        Int32.Parse(ViewState["AmendmentVersion"].ToString()),
                                                                        1);
            }
            catch (Exception ex)
            {
                errorMsg = ex.Message;
            }
        }

        return BudgetNarrativeID;
    }
    
    private void updateData()
    {
        txtIndirectPercent.Text = txtIndirectPercent.Text.Replace(",", "");
        txtSupervisorDirectorColD.Text = txtSupervisorDirectorColD.Text.Replace(",", "");
        txtProjectCoordinatorColD.Text = txtProjectCoordinatorColD.Text.Replace(",", "");
        txtStipendColD.Text = txtStipendColD.Text.Replace(",", "");
        txtOtherColD.Text = txtOtherColD.Text.Replace(",", "");
        txtAdvisorColD.Text = txtAdvisorColD.Text.Replace(",", "");
        txtClinicianColD.Text = txtClinicianColD.Text.Replace(",", "");
        txtCoordinatorColD.Text = txtCoordinatorColD.Text.Replace(",", "");
        txtEducatorInstructorColD.Text = txtEducatorInstructorColD.Text.Replace(",", "");
        txtHomeVisitorColD.Text = txtHomeVisitorColD.Text.Replace(",", "");
        txtSpecialistColD.Text = txtSpecialistColD.Text.Replace(",", "");
        txtIPSStipendColD.Text = txtIPSStipendColD.Text.Replace(",", "");
        txtIPSOtherColD.Text = txtIPSOtherColD.Text.Replace(",", "");
        txtAideParaprofessionalColD.Text = txtAideParaprofessionalColD.Text.Replace(",", "");
        txtSecretaryBookkeeperColD.Text = txtSecretaryBookkeeperColD.Text.Replace(",", "");
        txtSSOtherColD.Text = txtSSOtherColD.Text.Replace(",", "");
        txtSSStipendColD.Text = txtSSStipendColD.Text.Replace(",", "");
        txtFringeBenefitsColD.Text = txtFringeBenefitsColD.Text.Replace(",", "");
        txtCSAdvisorColD.Text = txtCSAdvisorColD.Text.Replace(",", "");
        txtCSClinicianColD.Text = txtCSClinicianColD.Text.Replace(",", "");
        txtCSConsultantColD.Text = txtCSConsultantColD.Text.Replace(",", "");
        txtCSEducatorInstructorColD.Text = txtCSEducatorInstructorColD.Text.Replace(",", "");
        txtCSHomeVisitorColD.Text = txtCSHomeVisitorColD.Text.Replace(",", "");
        txtCSSpecialistColD.Text = txtCSSpecialistColD.Text.Replace(",", "");
        txtCSSpeakerColD.Text = txtCSSpeakerColD.Text.Replace(",", "");
        txtCSSubstituteColD.Text = txtCSSubstituteColD.Text.Replace(",", "");
        txtCSStipendColD.Text = txtCSStipendColD.Text.Replace(",", "");
        txtCSOtherColD.Text = txtCSOtherColD.Text.Replace(",", "");
        txtEducationalInstructionalMaterialsColD.Text = txtEducationalInstructionalMaterialsColD.Text.Replace(",", "");
        txtInstructionalTechnologySoftwareColD.Text = txtInstructionalTechnologySoftwareColD.Text.Replace(",", "");
        txtNonInstructionalSuppliesColD.Text = txtNonInstructionalSuppliesColD.Text.Replace(",", "");
        txtSMOtherColD.Text = txtSMOtherColD.Text.Replace(",", "");
        txtSupervisoryStaffColD.Text = txtSupervisoryStaffColD.Text.Replace(",", "");
        txtInstructionalStaffColD.Text = txtInstructionalStaffColD.Text.Replace(",", "");
        txtTravelOtherColD.Text = txtTravelOtherColD.Text.Replace(",", "");
        txtAdvertisingColD.Text = txtAdvertisingColD.Text.Replace(",", "");
        txtEquipmentRentalColD.Text = txtEquipmentRentalColD.Text.Replace(",", "");
        txtMaintenanceRepairsColD.Text = txtMaintenanceRepairsColD.Text.Replace(",", "");
        txtMembershipSubscriptionsColD.Text = txtMembershipSubscriptionsColD.Text.Replace(",", "");
        txtPrintingReproductionColD.Text = txtPrintingReproductionColD.Text.Replace(",", "");
        txtStaffTrainingColD.Text = txtStaffTrainingColD.Text.Replace(",", "");
        txtRentalofSpaceColD.Text = txtRentalofSpaceColD.Text.Replace(",", "");
        txtTelephoneUtilitiesColD.Text = txtTelephoneUtilitiesColD.Text.Replace(",", "");
        txtDirectServiceTransportationColD.Text = txtDirectServiceTransportationColD.Text.Replace(",", "");
        txtOCOtherColD.Text = txtOCOtherColD.Text.Replace(",", "");
        txtProfessionalDevelopOpportunitiesColD.Text = txtProfessionalDevelopOpportunitiesColD.Text.Replace(",", "");
        txtApplicationFeesColD.Text = txtApplicationFeesColD.Text.Replace(",", "");
        txtCEUCoursesColD.Text = txtCEUCoursesColD.Text.Replace(",", "");
        txtCollegeCoursesColD.Text = txtCollegeCoursesColD.Text.Replace(",", "");
        txtCBOtherColD.Text = txtCBOtherColD.Text.Replace(",", "");
        txtInstructionalEquipmentColD.Text = txtInstructionalEquipmentColD.Text.Replace(",", "");
        txtNoninstructionalEquipmentColD.Text = txtNoninstructionalEquipmentColD.Text.Replace(",", "");
        txtEqOtherColD.Text = txtEqOtherColD.Text.Replace(",", "");
        txtAncillaryColD.Text = txtAncillaryColD.Text.Replace(",", "");
        txtSupervisorDirectorColF.Text = txtSupervisorDirectorColF.Text.Replace(",", "");
        txtProjectCoordinatorColF.Text = txtProjectCoordinatorColF.Text.Replace(",", "");
        txtStipendColF.Text = txtStipendColF.Text.Replace(",", "");
        txtOtherColF.Text = txtOtherColF.Text.Replace(",", "");
        txtAdvisorColF.Text = txtAdvisorColF.Text.Replace(",", "");
        txtClinicianColF.Text = txtClinicianColF.Text.Replace(",", "");
        txtCoordinatorColF.Text = txtCoordinatorColF.Text.Replace(",", "");
        txtEducatorInstructorColF.Text = txtEducatorInstructorColF.Text.Replace(",", "");
        txtHomeVisitorColF.Text = txtHomeVisitorColF.Text.Replace(",", "");
        txtSpecialistColF.Text = txtSpecialistColF.Text.Replace(",", "");
        txtIPSStipendColF.Text = txtIPSStipendColF.Text.Replace(",", "");
        txtIPSOtherColF.Text = txtIPSOtherColF.Text.Replace(",", "");
        txtAideParaprofessionalColF.Text = txtAideParaprofessionalColF.Text.Replace(",", "");
        txtSecretaryBookkeeperColF.Text = txtSecretaryBookkeeperColF.Text.Replace(",", "");
        txtSSStipendColF.Text = txtSSStipendColF.Text.Replace(",", "");
        txtSSOtherColF.Text = txtSSOtherColF.Text.Replace(",", "");
        txtFringeBenefitsColF.Text = txtFringeBenefitsColF.Text.Replace(",", "");
        txtCSAdvisorColF.Text = txtCSAdvisorColF.Text.Replace(",", "");
        txtCSClinicianColF.Text = txtCSClinicianColF.Text.Replace(",", "");
        txtCSConsultantColF.Text = txtCSConsultantColF.Text.Replace(",", "");
        txtCSEducatorInstructorColF.Text = txtCSEducatorInstructorColF.Text.Replace(",", "");
        txtCSHomeVisitorColF.Text = txtCSHomeVisitorColF.Text.Replace(",", "");
        txtCSSpecialistColF.Text = txtCSSpecialistColF.Text.Replace(",", "");
        txtCSSpeakerColF.Text = txtCSSpeakerColF.Text.Replace(",", "");
        txtCSSubstituteColF.Text = txtCSSubstituteColF.Text.Replace(",", "");
        txtCSStipendColF.Text = txtCSStipendColF.Text.Replace(",", "");
        txtCSOtherColF.Text = txtCSOtherColF.Text.Replace(",", "");
        txtEducationalInstructionalMaterialsColF.Text = txtEducationalInstructionalMaterialsColF.Text.Replace(",", "");
        txtInstructionalTechnologySoftwareColF.Text = txtInstructionalTechnologySoftwareColF.Text.Replace(",", "");
        txtNonInstructionalSuppliesColF.Text = txtNonInstructionalSuppliesColF.Text.Replace(",", "");
        txtSMOtherColF.Text = txtSMOtherColF.Text.Replace(",", "");
        txtSupervisoryStaffColF.Text = txtSupervisoryStaffColF.Text.Replace(",", "");
        txtInstructionalStaffColF.Text = txtInstructionalStaffColF.Text.Replace(",", "");
        txtTravelOtherColF.Text = txtTravelOtherColF.Text.Replace(",", "");
        txtAdvertisingColF.Text = txtAdvertisingColF.Text.Replace(",", "");
        txtEquipmentRentalColF.Text = txtEquipmentRentalColF.Text.Replace(",", "");
        txtMaintenanceRepairsColF.Text = txtMaintenanceRepairsColF.Text.Replace(",", "");
        txtMembershipSubscriptionsColF.Text = txtMembershipSubscriptionsColF.Text.Replace(",", "");
        txtPrintingReproductionColF.Text = txtPrintingReproductionColF.Text.Replace(",", "");
        txtStaffTrainingColF.Text = txtStaffTrainingColF.Text.Replace(",", "");
        txtRentalofSpaceColF.Text = txtRentalofSpaceColF.Text.Replace(",", "");
        txtTelephoneUtilitiesColF.Text = txtTelephoneUtilitiesColF.Text.Replace(",", "");
        txtDirectServiceTransportationColF.Text = txtDirectServiceTransportationColF.Text.Replace(",", "");
        txtOCOtherColF.Text = txtOCOtherColF.Text.Replace(",", "");
        txtProfessionalDevelopOpportunitiesColF.Text = txtProfessionalDevelopOpportunitiesColF.Text.Replace(",", "");
        txtApplicationFeesColF.Text = txtApplicationFeesColF.Text.Replace(",", "");
        txtCEUCoursesColF.Text = txtCEUCoursesColF.Text.Replace(",", "");
        txtCollegeCoursesColF.Text = txtCollegeCoursesColF.Text.Replace(",", "");
        txtCBOtherColF.Text = txtCBOtherColF.Text.Replace(",", "");
        txtInstructionalEquipmentColF.Text = txtInstructionalEquipmentColF.Text.Replace(",", "");
        txtNoninstructionalEquipmentColF.Text = txtNoninstructionalEquipmentColF.Text.Replace(",", "");
        txtEqOtherColF.Text = txtEqOtherColF.Text.Replace(",", "");
        txtAncillaryColF.Text = txtAncillaryColF.Text.Replace(",", "");
        txtSupervisorDirectorNumofStaff.Text = txtSupervisorDirectorNumofStaff.Text.Replace(",", "");
        txtSupervisorDirectorFTE.Text = txtSupervisorDirectorFTE.Text.Replace(",", "");
        txtProjectCoordinatorNumofStaff.Text = txtProjectCoordinatorNumofStaff.Text.Replace(",", "");
        txtProjectCoordinatorFTE.Text = txtProjectCoordinatorFTE.Text.Replace(",", "");
        txtOtherNumofStaff.Text = txtOtherNumofStaff.Text.Replace(",", "");
        txtOtherFTE.Text = txtOtherFTE.Text.Replace(",", "");
        txtAdvisorNumofStaff.Text = txtAdvisorNumofStaff.Text.Replace(",", "");
        txtAdvisorFTE.Text = txtAdvisorFTE.Text.Replace(",", "");
        txtClinicianNumofStaff.Text = txtClinicianNumofStaff.Text.Replace(",", "");
        txtClinicianFTE.Text = txtClinicianFTE.Text.Replace(",", "");
        txtCoordinatorNumofStaff.Text = txtCoordinatorNumofStaff.Text.Replace(",", "");
        txtCoordinatorFTE.Text = txtCoordinatorFTE.Text.Replace(",", "");
        txtEducatorInstructorNumofStaff.Text = txtEducatorInstructorNumofStaff.Text.Replace(",", "");
        txtEducatorInstructorFTE.Text = txtEducatorInstructorFTE.Text.Replace(",", "");
        txtHomeVisitorNumofStaff.Text = txtHomeVisitorNumofStaff.Text.Replace(",", "");
        txtHomeVisitorFTE.Text = txtHomeVisitorFTE.Text.Replace(",", "");
        txtSpecialistNumofStaff.Text = txtSpecialistNumofStaff.Text.Replace(",", "");
        txtSpecialistFTE.Text = txtSpecialistFTE.Text.Replace(",", "");
        txtIPSOtherNumofStaff.Text = txtIPSOtherNumofStaff.Text.Replace(",", "");
        txtIPSOtherFTE.Text = txtIPSOtherFTE.Text.Replace(",", "");
        txtAideParaprofessionalNumofStaff.Text = txtAideParaprofessionalNumofStaff.Text.Replace(",", "");
        txtAideParaprofessionalFTE.Text = txtAideParaprofessionalFTE.Text.Replace(",", "");
        txtSecretaryBookkeeperNumofStaff.Text = txtSecretaryBookkeeperNumofStaff.Text.Replace(",", "");
        txtSecretaryBookkeeperFTE.Text = txtSecretaryBookkeeperFTE.Text.Replace(",", "");
        txtSSOtherNumofStaff.Text = txtSSOtherNumofStaff.Text.Replace(",", "");
        txtSSOtherFTE.Text = txtSSOtherFTE.Text.Replace(",", "");
        txtFringeBenefitsNumofStaff.Text = txtFringeBenefitsNumofStaff.Text.Replace(",", "");
        txtFringeBenefitsFTE.Text = txtFringeBenefitsFTE.Text.Replace(",", "");
        txtCSAdvisorRate.Text = txtCSAdvisorRate.Text.Replace(",", "");
        txtCSClinicianRate.Text = txtCSClinicianRate.Text.Replace(",", "");
        txtCSConsultantRate.Text = txtCSConsultantRate.Text.Replace(",", "");
        txtCSEducatorInstructorRate.Text = txtCSEducatorInstructorRate.Text.Replace(",", "");
        txtCSHomeVisitorRate.Text = txtCSHomeVisitorRate.Text.Replace(",", "");
        txtCSSpecialistRate.Text = txtCSSpecialistRate.Text.Replace(",", "");
        txtCSSpeakerRate.Text = txtCSSpeakerRate.Text.Replace(",", "");
        txtCSSubstituteRate.Text = txtCSSubstituteRate.Text.Replace(",", "");
        txtCSOtherRate.Text = txtCSOtherRate.Text.Replace(",", "");
        txtSupervisoryStaffMileageRate.Text = txtSupervisoryStaffMileageRate.Text.Replace(",", "");
        txtInstructionalStaffMileageRate.Text = txtInstructionalStaffMileageRate.Text.Replace(",", "");
        txtTravelOtherMileageRate.Text = txtTravelOtherMileageRate.Text.Replace(",", "");
        txtIndirectCostsColF.Text = txtIndirectCostsColF.Text.Replace(",", "");
    }
    
    private void setDefaultStyle()
    {
        #region col d
        //col d
        txtSupervisorDirectorColD.CssClass = "styleUnHighlight";
        txtProjectCoordinatorColD.CssClass = "styleUnHighlight";
        txtStipendColD.CssClass = "styleUnHighlight";
        txtOtherColD.CssClass = "styleUnHighlight";
        txtAdvisorColD.CssClass = "styleUnHighlight";
        txtClinicianColD.CssClass = "styleUnHighlight";
        txtCoordinatorColD.CssClass = "styleUnHighlight";
        txtEducatorInstructorColD.CssClass = "styleUnHighlight";
        txtHomeVisitorColD.CssClass = "styleUnHighlight";
        txtSpecialistColD.CssClass = "styleUnHighlight";
        txtIPSStipendColD.CssClass = "styleUnHighlight";
        txtIPSOtherColD.CssClass = "styleUnHighlight";

        txtAideParaprofessionalColD.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeperColD.CssClass = "styleUnHighlight";
        txtSSStipendColD.CssClass = "styleUnHighlight";
        txtSSOtherColD.CssClass = "styleUnHighlight";

        txtFringeBenefitsColD.CssClass = "styleUnHighlight";

        txtCSAdvisorColD.CssClass = "styleUnHighlight";
        txtCSClinicianColD.CssClass = "styleUnHighlight";
        txtCSConsultantColD.CssClass = "styleUnHighlight";
        txtCSEducatorInstructorColD.CssClass = "styleUnHighlight";
        txtCSHomeVisitorColD.CssClass = "styleUnHighlight";
        txtCSSpecialistColD.CssClass = "styleUnHighlight";
        txtCSSpeakerColD.CssClass = "styleUnHighlight";
        txtCSSubstituteColD.CssClass = "styleUnHighlight";
        txtCSStipendColD.CssClass = "styleUnHighlight";
        txtCSOtherColD.CssClass = "styleUnHighlight";

        txtEducationalInstructionalMaterialsColD.CssClass = "styleUnHighlight";
        txtInstructionalTechnologySoftwareColD.CssClass = "styleUnHighlight";
        txtNonInstructionalSuppliesColD.CssClass = "styleUnHighlight";
        txtSMOtherColD.CssClass = "styleUnHighlight";

        txtSupervisoryStaffColD.CssClass = "styleUnHighlight";
        txtInstructionalStaffColD.CssClass = "styleUnHighlight";
        txtTravelOtherColD.CssClass = "styleUnHighlight";

        txtAdvertisingColD.CssClass = "styleUnHighlight";
        txtEquipmentRentalColD.CssClass = "styleUnHighlight";
        txtMaintenanceRepairsColD.CssClass = "styleUnHighlight";
        txtMembershipSubscriptionsColD.CssClass = "styleUnHighlight";
        txtPrintingReproductionColD.CssClass = "styleUnHighlight";
        txtStaffTrainingColD.CssClass = "styleUnHighlight";
        txtRentalofSpaceColD.CssClass = "styleUnHighlight";
        txtTelephoneUtilitiesColD.CssClass = "styleUnHighlight";
        txtDirectServiceTransportationColD.CssClass = "styleUnHighlight";
        txtOCOtherColD.CssClass = "styleUnHighlight";

        txtProfessionalDevelopOpportunitiesColD.CssClass = "styleUnHighlight";
        txtApplicationFeesColD.CssClass = "styleUnHighlight";
        txtCEUCoursesColD.CssClass = "styleUnHighlight";
        txtCollegeCoursesColD.CssClass = "styleUnHighlight";
        txtCBOtherColD.CssClass = "styleUnHighlight";

        txtInstructionalEquipmentColD.CssClass = "styleUnHighlight";
        txtNoninstructionalEquipmentColD.CssClass = "styleUnHighlight";
        txtEqOtherColD.CssClass = "styleUnHighlight";

        txtAncillaryColD.CssClass = "styleUnHighlight";
        #endregion

        #region col f
        //col f
        txtSupervisorDirectorColF.CssClass = "styleUnHighlight";
        txtProjectCoordinatorColF.CssClass = "styleUnHighlight";
        txtStipendColF.CssClass = "styleUnHighlight";
        txtOtherColF.CssClass = "styleUnHighlight";

        txtAdvisorColF.CssClass = "styleUnHighlight";
        txtClinicianColF.CssClass = "styleUnHighlight";
        txtCoordinatorColF.CssClass = "styleUnHighlight";
        txtEducatorInstructorColF.CssClass = "styleUnHighlight";
        txtHomeVisitorColF.CssClass = "styleUnHighlight";
        txtSpecialistColF.CssClass = "styleUnHighlight";
        txtIPSStipendColF.CssClass = "styleUnHighlight";
        txtIPSOtherColF.CssClass = "styleUnHighlight";

        txtAideParaprofessionalColF.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeperColF.CssClass = "styleUnHighlight";
        txtSSStipendColF.CssClass = "styleUnHighlight";
        txtSSOtherColF.CssClass = "styleUnHighlight";

        txtFringeBenefitsColF.CssClass = "styleUnHighlight";

        txtCSAdvisorColF.CssClass = "styleUnHighlight";
        txtCSClinicianColF.CssClass = "styleUnHighlight";
        txtCSConsultantColF.CssClass = "styleUnHighlight";
        txtCSEducatorInstructorColF.CssClass = "styleUnHighlight";
        txtCSHomeVisitorColF.CssClass = "styleUnHighlight";
        txtCSSpecialistColF.CssClass = "styleUnHighlight";
        txtCSSpeakerColF.CssClass = "styleUnHighlight";
        txtCSSubstituteColF.CssClass = "styleUnHighlight";
        txtCSStipendColF.CssClass = "styleUnHighlight";
        txtCSOtherColF.CssClass = "styleUnHighlight";

        txtEducationalInstructionalMaterialsColF.CssClass = "styleUnHighlight";
        txtInstructionalTechnologySoftwareColF.CssClass = "styleUnHighlight";
        txtNonInstructionalSuppliesColF.CssClass = "styleUnHighlight";
        txtSMOtherColF.CssClass = "styleUnHighlight";

        txtSupervisoryStaffColF.CssClass = "styleUnHighlight";
        txtInstructionalStaffColF.CssClass = "styleUnHighlight";
        txtTravelOtherColF.CssClass = "styleUnHighlight";

        txtAdvertisingColF.CssClass = "styleUnHighlight";
        txtEquipmentRentalColF.CssClass = "styleUnHighlight";
        txtMaintenanceRepairsColF.CssClass = "styleUnHighlight";
        txtMembershipSubscriptionsColF.CssClass = "styleUnHighlight";
        txtPrintingReproductionColF.CssClass = "styleUnHighlight";
        txtStaffTrainingColF.CssClass = "styleUnHighlight";
        txtRentalofSpaceColF.CssClass = "styleUnHighlight";
        txtTelephoneUtilitiesColF.CssClass = "styleUnHighlight";
        txtDirectServiceTransportationColF.CssClass = "styleUnHighlight";
        txtOCOtherColF.CssClass = "styleUnHighlight";

        txtProfessionalDevelopOpportunitiesColF.CssClass = "styleUnHighlight";
        txtApplicationFeesColF.CssClass = "styleUnHighlight";
        txtCEUCoursesColF.CssClass = "styleUnHighlight";
        txtCollegeCoursesColF.CssClass = "styleUnHighlight";
        txtCBOtherColF.CssClass = "styleUnHighlight";

        txtInstructionalEquipmentColF.CssClass = "styleUnHighlight";
        txtNoninstructionalEquipmentColF.CssClass = "styleUnHighlight";
        txtEqOtherColF.CssClass = "styleUnHighlight";

        txtAncillaryColF.CssClass = "styleUnHighlight";
        #endregion

        #region col c
        //col c
        txtSupervisorDirector.CssClass = "styleUnHighlight";
        txtSupervisorDirectorDescr.CssClass = "styleUnHighlight";
        txtProjectCoordinator.CssClass = "styleUnHighlight";
        txtProjectCoordinatorDescr.CssClass = "styleUnHighlight";
        txtStipend.CssClass = "styleUnHighlight";
        txtStipendDescr.CssClass = "styleUnHighlight";
        txtOther.CssClass = "styleUnHighlight";
        txtOtherDescr.CssClass = "styleUnHighlight";
        txtAdvisor.CssClass = "styleUnHighlight";
        txtAdvisorDescr.CssClass = "styleUnHighlight";
        txtClinician.CssClass = "styleUnHighlight";
        txtClinicianDescr.CssClass = "styleUnHighlight";
        txtCoordinator.CssClass = "styleUnHighlight";
        txtCoordinatorDescr.CssClass = "styleUnHighlight";
        txtEducatorInstructor.CssClass = "styleUnHighlight";
        txtEducatorInstructorDescr.CssClass = "styleUnHighlight";
        txtHomeVisitor.CssClass = "styleUnHighlight";
        txtHomeVisitorDescr.CssClass = "styleUnHighlight";
        txtSpecialist.CssClass = "styleUnHighlight";
        txtSpecialistDescr.CssClass = "styleUnHighlight";
        txtIPSStipend.CssClass = "styleUnHighlight";
        txtIPSStipendDescr.CssClass = "styleUnHighlight";
        txtIPSOther.CssClass = "styleUnHighlight";
        txtIPSOtherDescr.CssClass = "styleUnHighlight";

        txtAideParaprofessional.CssClass = "styleUnHighlight";
        txtAideParaprofessionalDescr.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeper.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeperDescr.CssClass = "styleUnHighlight";
        txtSSStipend.CssClass = "styleUnHighlight";
        txtSSStipendDescr.CssClass = "styleUnHighlight";
        txtSSOther.CssClass = "styleUnHighlight";
        txtSSOtherDescr.CssClass = "styleUnHighlight";

        txtFringeBenefits.CssClass = "styleUnHighlight";
        txtFringeBenefitsDescr.CssClass = "styleUnHighlight";

        txtCSAdvisor.CssClass = "styleUnHighlight";
        txtCSAdvisorDescr.CssClass = "styleUnHighlight";
        txtCSClinician.CssClass = "styleUnHighlight";
        txtCSClinicianDescr.CssClass = "styleUnHighlight";
        txtCSConsultant.CssClass = "styleUnHighlight";
        txtCSConsultantDescr.CssClass = "styleUnHighlight";
        txtCSEducatorInstructor.CssClass = "styleUnHighlight";
        txtCSEducatorInstructorDescr.CssClass = "styleUnHighlight";
        txtCSHomeVisitor.CssClass = "styleUnHighlight";
        txtCSHomeVisitorDescr.CssClass = "styleUnHighlight";
        txtCSSpecialist.CssClass = "styleUnHighlight";
        txtCSSpecialistDescr.CssClass = "styleUnHighlight";
        txtCSSpeaker.CssClass = "styleUnHighlight";
        txtCSSpeakerDescr.CssClass = "styleUnHighlight";
        txtCSSubstitute.CssClass = "styleUnHighlight";
        txtCSSubstituteDescr.CssClass = "styleUnHighlight";
        txtCSStipend.CssClass = "styleUnHighlight";
        txtCSStipendDescr.CssClass = "styleUnHighlight";
        txtCSOther.CssClass = "styleUnHighlight";
        txtCSOtherDescr.CssClass = "styleUnHighlight";

        txtEducationalInstructionalMaterials.CssClass = "styleUnHighlight";
        txtEducationalInstructionalMaterialsDescr.CssClass = "styleUnHighlight";
        txtInstructionalTechnologySoftware.CssClass = "styleUnHighlight";
        txtInstructionalTechnologySoftwareDescr.CssClass = "styleUnHighlight";
        txtNonInstructionalSupplies.CssClass = "styleUnHighlight";
        txtNonInstructionalSuppliesDescr.CssClass = "styleUnHighlight";
        txtSMOther.CssClass = "styleUnHighlight";
        txtSMOtherDescr.CssClass = "styleUnHighlight";

        txtSupervisoryStaff.CssClass = "styleUnHighlight";
        txtSupervisoryStaffDescr.CssClass = "styleUnHighlight";
        txtInstructionalStaff.CssClass = "styleUnHighlight";
        txtInstructionalStaffDescr.CssClass = "styleUnHighlight";
        txtTravelOther.CssClass = "styleUnHighlight";
        txtTravelOtherDescr.CssClass = "styleUnHighlight";

        txtAdvertising.CssClass = "styleUnHighlight";
        txtAdvertisingDescr.CssClass = "styleUnHighlight";
        txtEquipmentRental.CssClass = "styleUnHighlight";
        txtEquipmentRentalDescr.CssClass = "styleUnHighlight";
        txtMaintenanceRepairs.CssClass = "styleUnHighlight";
        txtMaintenanceRepairsDescr.CssClass = "styleUnHighlight";
        txtMembershipSubscriptions.CssClass = "styleUnHighlight";
        txtMembershipSubscriptionsDescr.CssClass = "styleUnHighlight";
        txtPrintingReproduction.CssClass = "styleUnHighlight";
        txtPrintingReproductionDescr.CssClass = "styleUnHighlight";
        txtStaffTraining.CssClass = "styleUnHighlight";
        txtStaffTrainingDescr.CssClass = "styleUnHighlight";
        txtRentalofSpace.CssClass = "styleUnHighlight";
        txtRentalofSpaceDescr.CssClass = "styleUnHighlight";
        txtTelephoneUtilities.CssClass = "styleUnHighlight";
        txtTelephoneUtilitiesDescr.CssClass = "styleUnHighlight";
        txtDirectServiceTransportation.CssClass = "styleUnHighlight";
        txtDirectServiceTransportationDescr.CssClass = "styleUnHighlight";
        txtOCOther.CssClass = "styleUnHighlight";
        txtOCOtherDescr.CssClass = "styleUnHighlight";

        txtProfessionalDevelopOpportunities.CssClass = "styleUnHighlight";
        txtProfessionalDevelopOpportunitiesDescr.CssClass = "styleUnHighlight";
        txtApplicationFees.CssClass = "styleUnHighlight";
        txtApplicationFeesDescr.CssClass = "styleUnHighlight";
        txtCEUCourses.CssClass = "styleUnHighlight";
        txtCEUCoursesDescr.CssClass = "styleUnHighlight";
        txtCollegeCourses.CssClass = "styleUnHighlight";
        txtCollegeCoursesDescr.CssClass = "styleUnHighlight";
        txtCBOther.CssClass = "styleUnHighlight";
        txtCollegeCoursesDescr.CssClass = "styleUnHighlight";

        txtIndirectPercent.CssClass = "styleUnHighlight";

        txtIndirectCosts.CssClass = "styleUnHighlight";
        txtIndirectCostsDescr.CssClass = "styleUnHighlight";

        txtInstructionalEquipment.CssClass = "styleUnHighlight";
        txtInstructionalEquipmentDescr.CssClass = "styleUnHighlight";
        txtNoninstructionalEquipment.CssClass = "styleUnHighlight";
        txtNoninstructionalEquipmentDescr.CssClass = "styleUnHighlight";
        txtEqOther.CssClass = "styleUnHighlight";
        txtEqOtherDescr.CssClass = "styleUnHighlight";

        txtAncillary.CssClass = "styleUnHighlight";
        txtAncillaryDescr.CssClass = "styleUnHighlight";

        txtCBOtherDescr.CssClass = "styleUnHighlight";
        #endregion

        txtSupervisorDirectorNumofStaff.CssClass = "styleUnHighlight";
        txtSupervisorDirectorFTE.CssClass = "styleUnHighlight";
        txtProjectCoordinatorNumofStaff.CssClass = "styleUnHighlight";
        txtProjectCoordinatorFTE.CssClass = "styleUnHighlight";
        txtOtherNumofStaff.CssClass = "styleUnHighlight";
        txtOtherFTE.CssClass = "styleUnHighlight";

        txtAdvisorNumofStaff.CssClass = "styleUnHighlight";
        txtAdvisorFTE.CssClass = "styleUnHighlight";
        txtClinicianNumofStaff.CssClass = "styleUnHighlight";
        txtClinicianFTE.CssClass = "styleUnHighlight";
        txtCoordinatorNumofStaff.CssClass = "styleUnHighlight";
        txtCoordinatorFTE.CssClass = "styleUnHighlight";
        txtEducatorInstructorNumofStaff.CssClass = "styleUnHighlight";
        txtEducatorInstructorFTE.CssClass = "styleUnHighlight";
        txtHomeVisitorNumofStaff.CssClass = "styleUnHighlight";
        txtHomeVisitorFTE.CssClass = "styleUnHighlight";
        txtSpecialistNumofStaff.CssClass = "styleUnHighlight";
        txtSpecialistFTE.CssClass = "styleUnHighlight";
        txtIPSOtherNumofStaff.CssClass = "styleUnHighlight";
        txtIPSOtherFTE.CssClass = "styleUnHighlight";

        txtAideParaprofessionalNumofStaff.CssClass = "styleUnHighlight";
        txtAideParaprofessionalFTE.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeperNumofStaff.CssClass = "styleUnHighlight";
        txtSecretaryBookkeeperFTE.CssClass = "styleUnHighlight";
        txtSSOtherNumofStaff.CssClass = "styleUnHighlight";
        txtSSOtherFTE.CssClass = "styleUnHighlight";

        txtFringeBenefitsNumofStaff.CssClass = "styleUnHighlight";
        txtFringeBenefitsFTE.CssClass = "styleUnHighlight";

        txtCSAdvisorRate.CssClass = "styleUnHighlight";
        txtCSClinicianRate.CssClass = "styleUnHighlight";
        txtCSConsultantRate.CssClass = "styleUnHighlight";
        txtCSEducatorInstructorRate.CssClass = "styleUnHighlight";
        txtCSHomeVisitorRate.CssClass = "styleUnHighlight";
        txtCSSpecialistRate.CssClass = "styleUnHighlight";
        txtCSSpeakerRate.CssClass = "styleUnHighlight";
        txtCSSubstituteRate.CssClass = "styleUnHighlight";
        txtCSOtherRate.CssClass = "styleUnHighlight";

        txtSupervisoryStaffMileageRate.CssClass = "styleUnHighlight";
        txtInstructionalStaffMileageRate.CssClass = "styleUnHighlight";
        txtTravelOtherMileageRate.CssClass = "styleUnHighlight";

        txtCSAdvisorHDW.CssClass = "styleUnHighlight";
        txtCSClinicianHDW.CssClass = "styleUnHighlight";
        txtCSConsultantHDW.CssClass = "styleUnHighlight";
        txtCSEducatorInstructorHDW.CssClass = "styleUnHighlight";
        txtCSHomeVisitorHDW.CssClass = "styleUnHighlight";
        txtCSSpecialistHDW.CssClass = "styleUnHighlight";
        txtCSSpeakerHDW.CssClass = "styleUnHighlight";
        txtCSSubstituteHDW.CssClass = "styleUnHighlight";
        txtCSOtherHDW.CssClass = "styleUnHighlight";
    }

    protected void btnSaveContinue_Click(object sender, EventArgs e)
    {
        int BudgetNarrativeID = -1;
        string errorMsg = "";

        try
        {
            BudgetNarrativeID = SaveBudgetNarrativeDataAmendment(ref errorMsg);

            if (BudgetNarrativeID > -1)
            {
                ViewState["BudgetNarrativeID"] = BudgetNarrativeID;

                BindData(true);
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error occurred while saving the data:: " + ex.Message;
            //lblMessage.Font.Bold = true;
            //lblMessage.ForeColor = System.Drawing.Color.DarkRed;
        }
    }

    protected void btnSaveHome_Click(object sender, EventArgs e)
    {
        int BudgetNarrativeID = -1;
        string errorMsg = "";

        try
        {
            BudgetNarrativeID = SaveBudgetNarrativeDataAmendment(ref errorMsg);

            if (BudgetNarrativeID > -1)
            {
                ViewState["BudgetNarrativeID"] = BudgetNarrativeID;

                BindData(true);
            }
        }
        catch (Exception ex)
        {
            //lblMessage.Text = "Error occurred while saving the data:: " + ex.Message;
            //lblMessage.Font.Bold = true;
            //lblMessage.ForeColor = System.Drawing.Color.DarkRed;
        }
    }

    protected void btnPrintHSBudget_Click(object sender, EventArgs e)
    {
        int BudgetNarrativeID = -1;
        string errorMsg = "";

        try
        {
            BudgetNarrativeID = SaveBudgetNarrativeDataAmendment(ref errorMsg);


            if (BudgetNarrativeID > -1)
            {
                ViewState["BudgetNarrativeID"] = BudgetNarrativeID;

                BindData(true);
            }
        }

        catch (Exception ex)
        {

        }

        Session["BudgetNarrativeID"] = BudgetNarrativeID;
        Response.Redirect("Print.aspx?type=PCHPBudgetAmendment");
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < lstBoxes.Count; i++)
        {
            ((WebControl)ContentPlaceHolder.FindControl(lstBoxes[i])).CssClass = "styleHighlight";
        }
    }
}
