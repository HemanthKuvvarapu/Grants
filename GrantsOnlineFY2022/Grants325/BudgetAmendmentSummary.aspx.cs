using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BudgetAmendmentSummary : System.Web.UI.Page
{
    DAL dal = new DAL();
    Amendment amend = new Amendment();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        if (!Page.IsPostBack)
        {
            string amendmentVersion = (Request.QueryString["ver"] == null) ? "1" : Request.QueryString["ver"].ToString();
            ViewState["AmendmentVersion"] = amendmentVersion;
            Session["AmendmentVersion"] = amendmentVersion;

            BindData(false);
        }

        Master.PartTitle = "Budget Amendment #" + ViewState["AmendmentVersion"].ToString() + " Summary";
    }

    private void BindData(bool isAfterSaved)
    {
        ds = amend.GetBudgetAmendmentSummary(Int32.Parse(Session["GrantApplicantId"].ToString()), Int32.Parse(ViewState["AmendmentVersion"].ToString()));

        txtAllocationFund.Text = Session["Eligibility Amount"].ToString();

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            #region col D
            //col d
            txtSupervisorDirectorColDOrg.Text = Int32.Parse(dr["SupervisorDirectorColDOrg"].ToString()).ToString("N0");
            txtProjectCoordinatorColDOrg.Text = Int32.Parse(dr["ProjectCoordinatorColDOrg"].ToString()).ToString("N0");
            txtStipendColDOrg.Text = Int32.Parse(dr["StipendColDOrg"].ToString()).ToString("N0");
            txtOtherColDOrg.Text = Int32.Parse(dr["OtherColDOrg"].ToString()).ToString("N0");
            txtAdminSubTotalColDOrg.Text = Int32.Parse(dr["AdminSubTotalColDOrg"].ToString()).ToString("N0");
            txtAdvisorColDOrg.Text = Int32.Parse(dr["AdvisorColDOrg"].ToString()).ToString("N0");
            txtClinicianColDOrg.Text = Int32.Parse(dr["ClinicianColDOrg"].ToString()).ToString("N0");
            txtCoordinatorColDOrg.Text = Int32.Parse(dr["CoordinatorColDOrg"].ToString()).ToString("N0");
            txtEducatorInstructorColDOrg.Text = Int32.Parse(dr["EducatorInstructorColDOrg"].ToString()).ToString("N0");
            txtHomeVisitorColDOrg.Text = Int32.Parse(dr["HomeVisitorColDOrg"].ToString()).ToString("N0");
            txtSpecialistColDOrg.Text = Int32.Parse(dr["SpecialistColDOrg"].ToString()).ToString("N0");
            txtIPSStipendColDOrg.Text = Int32.Parse(dr["IPSStipendColDOrg"].ToString()).ToString("N0");
            txtIPSOtherColDOrg.Text = Int32.Parse(dr["IPSOtherColDOrg"].ToString()).ToString("N0");

            txtIPSSubTotalColDOrg.Text = Int32.Parse(dr["IPSSubTotalColDOrg"].ToString()).ToString("N0");

            txtAideParaprofessionalColDOrg.Text = Int32.Parse(dr["AideParaprofessionalColDOrg"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColDOrg.Text = Int32.Parse(dr["SecretaryBookkeeperColDOrg"].ToString()).ToString("N0");
            txtSSStipendColDOrg.Text = Int32.Parse(dr["SSStipendColDOrg"].ToString()).ToString("N0");
            txtSSOtherColDOrg.Text = Int32.Parse(dr["SSOtherColDOrg"].ToString()).ToString("N0");

            txtSSSubTotalColDOrg.Text = Int32.Parse(dr["SSSubTotalColDOrg"].ToString()).ToString("N0");

            txtFringeBenefitsColDOrg.Text = Int32.Parse(dr["FringeBenefitsColDOrg"].ToString()).ToString("N0");

            txtFBSubTotalColDOrg.Text = Int32.Parse(dr["FBSubTotalColDOrg"].ToString()).ToString("N0");

            txtCSAdvisorColDOrg.Text = Int32.Parse(dr["CSAdvisorColDOrg"].ToString()).ToString("N0");
            txtCSClinicianColDOrg.Text = Int32.Parse(dr["CSClinicianColDOrg"].ToString()).ToString("N0");
            txtCSConsultantColDOrg.Text = Int32.Parse(dr["CSConsultantColDOrg"].ToString()).ToString("N0");
            txtCSEducatorInstructorColDOrg.Text = Int32.Parse(dr["CSEducatorInstructorColDOrg"].ToString()).ToString("N0");
            txtCSHomeVisitorColDOrg.Text = Int32.Parse(dr["CSHomeVisitorColDOrg"].ToString()).ToString("N0");
            txtCSSpecialistColDOrg.Text = Int32.Parse(dr["CSSpecialistColDOrg"].ToString()).ToString("N0");
            txtCSSpeakerColDOrg.Text = Int32.Parse(dr["CSSpeakerColDOrg"].ToString()).ToString("N0");
            txtCSSubstituteColDOrg.Text = Int32.Parse(dr["CSSubstituteColDOrg"].ToString()).ToString("N0");
            txtCSStipendColDOrg.Text = Int32.Parse(dr["CSStipendColDOrg"].ToString()).ToString("N0");
            txtCSOtherColDOrg.Text = Int32.Parse(dr["CSOtherColDOrg"].ToString()).ToString("N0");

            txtCSSubTotalColDOrg.Text = Int32.Parse(dr["CSSubTotalColDOrg"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColDOrg.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColDOrg"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColDOrg.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColDOrg"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColDOrg.Text = Int32.Parse(dr["NonInstructionalSuppliesColDOrg"].ToString()).ToString("N0");
            txtSMOtherColDOrg.Text = Int32.Parse(dr["SMOtherColDOrg"].ToString()).ToString("N0");

            txtSMSubTotalColDOrg.Text = Int32.Parse(dr["SMSubTotalColDOrg"].ToString()).ToString("N0");

            txtSupervisoryStaffColDOrg.Text = Int32.Parse(dr["SupervisoryStaffColDOrg"].ToString()).ToString("N0");
            txtInstructionalStaffColDOrg.Text = Int32.Parse(dr["InstructionalStaffColDOrg"].ToString()).ToString("N0");
            txtTravelOtherColDOrg.Text = Int32.Parse(dr["TravelOtherColDOrg"].ToString()).ToString("N0");

            txtTravelSubTotalColDOrg.Text = Int32.Parse(dr["TravelSubTotalColDOrg"].ToString()).ToString("N0");

            txtAdvertisingColDOrg.Text = Int32.Parse(dr["AdvertisingColDOrg"].ToString()).ToString("N0");
            txtEquipmentRentalColDOrg.Text = Int32.Parse(dr["EquipmentRentalColDOrg"].ToString()).ToString("N0");
            txtMaintenanceRepairsColDOrg.Text = Int32.Parse(dr["MaintenanceRepairsColDOrg"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColDOrg.Text = Int32.Parse(dr["MembershipSubscriptionsColDOrg"].ToString()).ToString("N0");
            txtPrintingReproductionColDOrg.Text = Int32.Parse(dr["PrintingReproductionColDOrg"].ToString()).ToString("N0");
            txtStaffTrainingColDOrg.Text = Int32.Parse(dr["StaffTrainingColDOrg"].ToString()).ToString("N0");
            txtRentalofSpaceColDOrg.Text = Int32.Parse(dr["RentalofSpaceColDOrg"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColDOrg.Text = Int32.Parse(dr["TelephoneUtilitiesColDOrg"].ToString()).ToString("N0");
            txtDirectServiceTransportationColDOrg.Text = Int32.Parse(dr["DirectServiceTransportationColDOrg"].ToString()).ToString("N0");
            txtOCOtherColDOrg.Text = Int32.Parse(dr["OCOtherColDOrg"].ToString()).ToString("N0");

            txtOCSubTotalColDOrg.Text = Int32.Parse(dr["OCSubTotalColDOrg"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColDOrg.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColDOrg"].ToString()).ToString("N0");
            txtApplicationFeesColDOrg.Text = Int32.Parse(dr["ApplicationFeesColDOrg"].ToString()).ToString("N0");
            txtCEUCoursesColDOrg.Text = Int32.Parse(dr["CEUCoursesColDOrg"].ToString()).ToString("N0");
            txtCollegeCoursesColDOrg.Text = Int32.Parse(dr["CollegeCoursesColDOrg"].ToString()).ToString("N0");
            txtCBOtherColDOrg.Text = Int32.Parse(dr["CBOtherColDOrg"].ToString()).ToString("N0");

            txtCBSubTotalColDOrg.Text = Int32.Parse(dr["CBSubTotalColDOrg"].ToString()).ToString("N0");

            txtInstructionalEquipmentColDOrg.Text = Int32.Parse(dr["InstructionalEquipmentColDOrg"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColDOrg.Text = Int32.Parse(dr["NoninstructionalEquipmentColDOrg"].ToString()).ToString("N0");
            txtEqOtherColDOrg.Text = Int32.Parse(dr["EqOtherColDOrg"].ToString()).ToString("N0");

            txtEqSubTotalColDOrg.Text = Int32.Parse(dr["EqSubTotalColDOrg"].ToString()).ToString("N0");

            txtAncillarySubTotalColDOrg.Text = Int32.Parse(dr["AncillarySubTotalColDOrg"].ToString()).ToString("N0");

            txtGrantTotalColDOrg.Text = Int32.Parse(dr["GrantTotalColDOrg"].ToString()).ToString("N2");
            #endregion

            txtSupervisorDirectorColFOrg.Text = Int32.Parse(dr["SupervisorDirectorColFOrg"].ToString()).ToString("N0");
            txtProjectCoordinatorColFOrg.Text = Int32.Parse(dr["ProjectCoordinatorColFOrg"].ToString()).ToString("N0");
            txtStipendColFOrg.Text = Int32.Parse(dr["StipendColFOrg"].ToString()).ToString("N0");
            txtOtherColFOrg.Text = Int32.Parse(dr["OtherColFOrg"].ToString()).ToString("N0");
            txtAdminSubTotalColFOrg.Text = Int32.Parse(dr["AdminSubTotalColFOrg"].ToString()).ToString("N0");
            txtAdvisorColFOrg.Text = Int32.Parse(dr["AdvisorColFOrg"].ToString()).ToString("N0");
            txtClinicianColFOrg.Text = Int32.Parse(dr["ClinicianColFOrg"].ToString()).ToString("N0");
            txtCoordinatorColFOrg.Text = Int32.Parse(dr["CoordinatorColFOrg"].ToString()).ToString("N0");
            txtEducatorInstructorColFOrg.Text = Int32.Parse(dr["EducatorInstructorColFOrg"].ToString()).ToString("N0");
            txtHomeVisitorColFOrg.Text = Int32.Parse(dr["HomeVisitorColFOrg"].ToString()).ToString("N0");
            txtSpecialistColFOrg.Text = Int32.Parse(dr["SpecialistColFOrg"].ToString()).ToString("N0");
            txtIPSStipendColFOrg.Text = Int32.Parse(dr["IPSStipendColFOrg"].ToString()).ToString("N0");
            txtIPSOtherColFOrg.Text = Int32.Parse(dr["IPSOtherColFOrg"].ToString()).ToString("N0");

            txtIPSSubTotalColFOrg.Text = Int32.Parse(dr["IPSSubTotalColFOrg"].ToString()).ToString("N0");

            txtAideParaprofessionalColFOrg.Text = Int32.Parse(dr["AideParaprofessionalColFOrg"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColFOrg.Text = Int32.Parse(dr["SecretaryBookkeeperColFOrg"].ToString()).ToString("N0");
            txtSSStipendColFOrg.Text = Int32.Parse(dr["SSStipendColFOrg"].ToString()).ToString("N0");
            txtSSOtherColFOrg.Text = Int32.Parse(dr["SSOtherColFOrg"].ToString()).ToString("N0");

            txtSSSubTotalColFOrg.Text = Int32.Parse(dr["SSSubTotalColFOrg"].ToString()).ToString("N0");

            txtFringeBenefitsColFOrg.Text = Int32.Parse(dr["FringeBenefitsColFOrg"].ToString()).ToString("N0");

            txtFBSubTotalColFOrg.Text = Int32.Parse(dr["FBSubTotalColFOrg"].ToString()).ToString("N0");

            txtCSAdvisorColFOrg.Text = Int32.Parse(dr["CSAdvisorColFOrg"].ToString()).ToString("N0");
            txtCSClinicianColFOrg.Text = Int32.Parse(dr["CSClinicianColFOrg"].ToString()).ToString("N0");
            txtCSConsultantColFOrg.Text = Int32.Parse(dr["CSConsultantColFOrg"].ToString()).ToString("N0");
            txtCSEducatorInstructorColFOrg.Text = Int32.Parse(dr["CSEducatorInstructorColFOrg"].ToString()).ToString("N0");
            txtCSHomeVisitorColFOrg.Text = Int32.Parse(dr["CSHomeVisitorColFOrg"].ToString()).ToString("N0");
            txtCSSpecialistColFOrg.Text = Int32.Parse(dr["CSSpecialistColFOrg"].ToString()).ToString("N0");
            txtCSSpeakerColFOrg.Text = Int32.Parse(dr["CSSpeakerColFOrg"].ToString()).ToString("N0");
            txtCSSubstituteColFOrg.Text = Int32.Parse(dr["CSSubstituteColFOrg"].ToString()).ToString("N0");
            txtCSStipendColFOrg.Text = Int32.Parse(dr["CSStipendColFOrg"].ToString()).ToString("N0");
            txtCSOtherColFOrg.Text = Int32.Parse(dr["CSOtherColFOrg"].ToString()).ToString("N0");

            txtCSSubTotalColFOrg.Text = Int32.Parse(dr["CSSubTotalColFOrg"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColFOrg.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColFOrg"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColFOrg.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColFOrg"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColFOrg.Text = Int32.Parse(dr["NonInstructionalSuppliesColFOrg"].ToString()).ToString("N0");
            txtSMOtherColFOrg.Text = Int32.Parse(dr["SMOtherColFOrg"].ToString()).ToString("N0");

            txtSMSubTotalColFOrg.Text = Int32.Parse(dr["SMSubTotalColFOrg"].ToString()).ToString("N0");

            txtSupervisoryStaffColFOrg.Text = Int32.Parse(dr["SupervisoryStaffColFOrg"].ToString()).ToString("N0");
            txtInstructionalStaffColFOrg.Text = Int32.Parse(dr["InstructionalStaffColFOrg"].ToString()).ToString("N0");
            txtTravelOtherColFOrg.Text = Int32.Parse(dr["TravelOtherColFOrg"].ToString()).ToString("N0");

            txtTravelSubTotalColFOrg.Text = Int32.Parse(dr["TravelSubTotalColFOrg"].ToString()).ToString("N0");

            txtAdvertisingColFOrg.Text = Int32.Parse(dr["AdvertisingColFOrg"].ToString()).ToString("N0");
            txtEquipmentRentalColFOrg.Text = Int32.Parse(dr["EquipmentRentalColFOrg"].ToString()).ToString("N0");
            txtMaintenanceRepairsColFOrg.Text = Int32.Parse(dr["MaintenanceRepairsColFOrg"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColFOrg.Text = Int32.Parse(dr["MembershipSubscriptionsColFOrg"].ToString()).ToString("N0");
            txtPrintingReproductionColFOrg.Text = Int32.Parse(dr["PrintingReproductionColFOrg"].ToString()).ToString("N0");
            txtStaffTrainingColFOrg.Text = Int32.Parse(dr["StaffTrainingColFOrg"].ToString()).ToString("N0");
            txtRentalofSpaceColFOrg.Text = Int32.Parse(dr["RentalofSpaceColFOrg"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColFOrg.Text = Int32.Parse(dr["TelephoneUtilitiesColFOrg"].ToString()).ToString("N0");
            txtDirectServiceTransportationColFOrg.Text = Int32.Parse(dr["DirectServiceTransportationColFOrg"].ToString()).ToString("N0");
            txtOCOtherColFOrg.Text = Int32.Parse(dr["OCOtherColFOrg"].ToString()).ToString("N0");

            txtOCSubTotalColFOrg.Text = Int32.Parse(dr["OCSubTotalColFOrg"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColFOrg.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColFOrg"].ToString()).ToString("N0");
            txtApplicationFeesColFOrg.Text = Int32.Parse(dr["ApplicationFeesColFOrg"].ToString()).ToString("N0");
            txtCEUCoursesColFOrg.Text = Int32.Parse(dr["CEUCoursesColFOrg"].ToString()).ToString("N0");
            txtCollegeCoursesColFOrg.Text = Int32.Parse(dr["CollegeCoursesColFOrg"].ToString()).ToString("N0");
            txtCBOtherColFOrg.Text = Int32.Parse(dr["CBOtherColFOrg"].ToString()).ToString("N0");

            txtCBSubTotalColFOrg.Text = Int32.Parse(dr["CBSubTotalColFOrg"].ToString()).ToString("N0");

            txtIndirectCostsColFOrg.Text = Int32.Parse(dr["IndirectCostsColFOrg"].ToString()).ToString("N0");
            txtIndirectCostsSubTotalColFOrg.Text = Int32.Parse(dr["IndirectCostsSubTotalColFOrg"].ToString()).ToString("N0");

            txtInstructionalEquipmentColFOrg.Text = Int32.Parse(dr["InstructionalEquipmentColFOrg"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColFOrg.Text = Int32.Parse(dr["NoninstructionalEquipmentColFOrg"].ToString()).ToString("N0");
            txtEqOtherColFOrg.Text = Int32.Parse(dr["EqOtherColFOrg"].ToString()).ToString("N0");

            
            txtEqSubTotalColFOrg.Text = Int32.Parse(dr["EqSubTotalColFOrg"].ToString()).ToString("N0");

            txtAncillarySubTotalColFOrg.Text = Int32.Parse(dr["AncillarySubTotalColFOrg"].ToString()).ToString("N0");

            txtGrantTotalColFOrg.Text = Int32.Parse(dr["GrantTotalColFOrg"].ToString()).ToString("N2");

            txtSupervisorDirectorOrg.Text = Int32.Parse(dr["SupervisorDirectorOrg"].ToString()).ToString("N0");
            txtProjectCoordinatorOrg.Text = Int32.Parse(dr["ProjectCoordinatorOrg"].ToString()).ToString("N0");
            txtStipendOrg.Text = Int32.Parse(dr["StipendOrg"].ToString()).ToString("N0");
            txtOtherOrg.Text = Int32.Parse(dr["OtherOrg"].ToString()).ToString("N0");
            txtAdminSubTotalOrg.Text = Int32.Parse(dr["AdminSubTotalOrg"].ToString()).ToString("N0");
            txtAdvisorOrg.Text = Int32.Parse(dr["AdvisorOrg"].ToString()).ToString("N0");
            txtClinicianOrg.Text = Int32.Parse(dr["ClinicianOrg"].ToString()).ToString("N0");
            txtCoordinatorOrg.Text = Int32.Parse(dr["CoordinatorOrg"].ToString()).ToString("N0");
            txtEducatorInstructorOrg.Text = Int32.Parse(dr["EducatorInstructorOrg"].ToString()).ToString("N0");
            txtHomeVisitorOrg.Text = Int32.Parse(dr["HomeVisitorOrg"].ToString()).ToString("N0");
            txtSpecialistOrg.Text = Int32.Parse(dr["SpecialistOrg"].ToString()).ToString("N0");
            txtIPSStipendOrg.Text = Int32.Parse(dr["IPSStipendOrg"].ToString()).ToString("N0");
            txtIPSOtherOrg.Text = Int32.Parse(dr["IPSOtherOrg"].ToString()).ToString("N0");

            txtIPSSubTotalOrg.Text = Int32.Parse(dr["IPSSubTotalOrg"].ToString()).ToString("N0");

            txtAideParaprofessionalOrg.Text = Int32.Parse(dr["AideParaprofessionalOrg"].ToString()).ToString("N0");
            txtSecretaryBookkeeperOrg.Text = Int32.Parse(dr["SecretaryBookkeeperOrg"].ToString()).ToString("N0");
            txtSSStipendOrg.Text = Int32.Parse(dr["SSStipendOrg"].ToString()).ToString("N0");
            txtSSOtherOrg.Text = Int32.Parse(dr["SSOtherOrg"].ToString()).ToString("N0");

            txtSSSubTotalOrg.Text = Int32.Parse(dr["SSSubTotalOrg"].ToString()).ToString("N0");

            txtFringeBenefitsOrg.Text = Int32.Parse(dr["FringeBenefitsOrg"].ToString()).ToString("N0");

            txtFBSubTotalOrg.Text = Int32.Parse(dr["FBSubTotalOrg"].ToString()).ToString("N0");

            txtCSAdvisorOrg.Text = Int32.Parse(dr["CSAdvisorOrg"].ToString()).ToString("N0");
            txtCSClinicianOrg.Text = Int32.Parse(dr["CSClinicianOrg"].ToString()).ToString("N0");
            txtCSConsultantOrg.Text = Int32.Parse(dr["CSConsultantOrg"].ToString()).ToString("N0");
            txtCSEducatorInstructorOrg.Text = Int32.Parse(dr["CSEducatorInstructorOrg"].ToString()).ToString("N0");
            txtCSHomeVisitorOrg.Text = Int32.Parse(dr["CSHomeVisitorOrg"].ToString()).ToString("N0");
            txtCSSpecialistOrg.Text = Int32.Parse(dr["CSSpecialistOrg"].ToString()).ToString("N0");
            txtCSSpeakerOrg.Text = Int32.Parse(dr["CSSpeakerOrg"].ToString()).ToString("N0");
            txtCSSubstituteOrg.Text = Int32.Parse(dr["CSSubstituteOrg"].ToString()).ToString("N0");
            txtCSStipendOrg.Text = Int32.Parse(dr["CSStipendOrg"].ToString()).ToString("N0");
            txtCSOtherOrg.Text = Int32.Parse(dr["CSOtherOrg"].ToString()).ToString("N0");

            txtCSSubTotalOrg.Text = Int32.Parse(dr["CSSubTotalOrg"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsOrg.Text = Int32.Parse(dr["EducationalInstructionalMaterialsOrg"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareOrg.Text = Int32.Parse(dr["InstructionalTechnologySoftwareOrg"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesOrg.Text = Int32.Parse(dr["NonInstructionalSuppliesOrg"].ToString()).ToString("N0");
            txtSMOtherOrg.Text = Int32.Parse(dr["SMOtherOrg"].ToString()).ToString("N0");

            txtSMSubTotalOrg.Text = Int32.Parse(dr["SMSubTotalOrg"].ToString()).ToString("N0");

            txtSupervisoryStaffOrg.Text = Int32.Parse(dr["SupervisoryStaffOrg"].ToString()).ToString("N0");
            txtInstructionalStaffOrg.Text = Int32.Parse(dr["InstructionalStaffOrg"].ToString()).ToString("N0");
            txtTravelOtherOrg.Text = Int32.Parse(dr["TravelOtherOrg"].ToString()).ToString("N0");

            txtTravelSubTotalOrg.Text = Int32.Parse(dr["TravelSubTotalOrg"].ToString()).ToString("N0");

            txtAdvertisingOrg.Text = Int32.Parse(dr["AdvertisingOrg"].ToString()).ToString("N0");
            txtEquipmentRentalOrg.Text = Int32.Parse(dr["EquipmentRentalOrg"].ToString()).ToString("N0");
            txtMaintenanceRepairsOrg.Text = Int32.Parse(dr["MaintenanceRepairsOrg"].ToString()).ToString("N0");
            txtMembershipSubscriptionsOrg.Text = Int32.Parse(dr["MembershipSubscriptionsOrg"].ToString()).ToString("N0");
            txtPrintingReproductionOrg.Text = Int32.Parse(dr["PrintingReproductionOrg"].ToString()).ToString("N0");
            txtStaffTrainingOrg.Text = Int32.Parse(dr["StaffTrainingOrg"].ToString()).ToString("N0");
            txtRentalofSpaceOrg.Text = Int32.Parse(dr["RentalofSpaceOrg"].ToString()).ToString("N0");
            txtTelephoneUtilitiesOrg.Text = Int32.Parse(dr["TelephoneUtilitiesOrg"].ToString()).ToString("N0");
            txtDirectServiceTransportationOrg.Text = Int32.Parse(dr["DirectServiceTransportationOrg"].ToString()).ToString("N0");
            txtOCOtherOrg.Text = Int32.Parse(dr["OCOtherOrg"].ToString()).ToString("N0");

            txtOCSubTotalOrg.Text = Int32.Parse(dr["OCSubTotalOrg"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesOrg.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesOrg"].ToString()).ToString("N0");
            txtApplicationFeesOrg.Text = Int32.Parse(dr["ApplicationFeesOrg"].ToString()).ToString("N0");
            txtCEUCoursesOrg.Text = Int32.Parse(dr["CEUCoursesOrg"].ToString()).ToString("N0");
            txtCollegeCoursesOrg.Text = Int32.Parse(dr["CollegeCoursesOrg"].ToString()).ToString("N0");
            txtCBOtherOrg.Text = Int32.Parse(dr["CBOtherOrg"].ToString()).ToString("N0");

            txtCBSubTotalOrg.Text = Int32.Parse(dr["CBSubTotalOrg"].ToString()).ToString("N0");

            txtIndirectCostsOrg.Text = Int32.Parse(dr["IndirectCostsOrg"].ToString()).ToString("N0");
            txtIndirectCostsSubTotalOrg.Text = Int32.Parse(dr["IndirectCostsSubTotalOrg"].ToString()).ToString("N0");

            txtInstructionalEquipmentOrg.Text = Int32.Parse(dr["InstructionalEquipmentOrg"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentOrg.Text = Int32.Parse(dr["NoninstructionalEquipmentOrg"].ToString()).ToString("N0");
            txtEqOtherOrg.Text = Int32.Parse(dr["EqOtherOrg"].ToString()).ToString("N0");

            txtEqSubTotalOrg.Text = Int32.Parse(dr["EqSubTotalOrg"].ToString()).ToString("N0");

            txtAncillarySubTotalOrg.Text = Int32.Parse(dr["AncillarySubTotalOrg"].ToString()).ToString("N0");

            txtGrantTotalOrg.Text = Int32.Parse(dr["GrantTotalOrg"].ToString()).ToString("N2");
            
            #region col G
            //col d
            txtSupervisorDirectorColDDiff.Text = Int32.Parse(dr["SupervisorDirectorColDDiff"].ToString()).ToString("N0");
            txtProjectCoordinatorColDDiff.Text = Int32.Parse(dr["ProjectCoordinatorColDDiff"].ToString()).ToString("N0");
            txtStipendColDDiff.Text = Int32.Parse(dr["StipendColDDiff"].ToString()).ToString("N0");
            txtOtherColDDiff.Text = Int32.Parse(dr["OtherColDDiff"].ToString()).ToString("N0");
            txtAdminSubTotalColDDiff.Text = Int32.Parse(dr["AdminSubTotalColDDiff"].ToString()).ToString("N0");
            txtAdvisorColDDiff.Text = Int32.Parse(dr["AdvisorColDDiff"].ToString()).ToString("N0");
            txtClinicianColDDiff.Text = Int32.Parse(dr["ClinicianColDDiff"].ToString()).ToString("N0");
            txtCoordinatorColDDiff.Text = Int32.Parse(dr["CoordinatorColDDiff"].ToString()).ToString("N0");
            txtEducatorInstructorColDDiff.Text = Int32.Parse(dr["EducatorInstructorColDDiff"].ToString()).ToString("N0");
            txtHomeVisitorColDDiff.Text = Int32.Parse(dr["HomeVisitorColDDiff"].ToString()).ToString("N0");
            txtSpecialistColDDiff.Text = Int32.Parse(dr["SpecialistColDDiff"].ToString()).ToString("N0");
            txtIPSStipendColDDiff.Text = Int32.Parse(dr["IPSStipendColDDiff"].ToString()).ToString("N0");
            txtIPSOtherColDDiff.Text = Int32.Parse(dr["IPSOtherColDDiff"].ToString()).ToString("N0");

            txtIPSSubTotalColDDiff.Text = Int32.Parse(dr["IPSSubTotalColDDiff"].ToString()).ToString("N0");

            txtAideParaprofessionalColDDiff.Text = Int32.Parse(dr["AideParaprofessionalColDDiff"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColDDiff.Text = Int32.Parse(dr["SecretaryBookkeeperColDDiff"].ToString()).ToString("N0");
            txtSSStipendColDDiff.Text = Int32.Parse(dr["SSStipendColDDiff"].ToString()).ToString("N0");
            txtSSOtherColDDiff.Text = Int32.Parse(dr["SSOtherColDDiff"].ToString()).ToString("N0");

            txtSSSubTotalColDDiff.Text = Int32.Parse(dr["SSSubTotalColDDiff"].ToString()).ToString("N0");

            txtFringeBenefitsColDDiff.Text = Int32.Parse(dr["FringeBenefitsColDDiff"].ToString()).ToString("N0");

            txtFBSubTotalColDDiff.Text = Int32.Parse(dr["FBSubTotalColDDiff"].ToString()).ToString("N0");

            txtCSAdvisorColDDiff.Text = Int32.Parse(dr["CSAdvisorColDDiff"].ToString()).ToString("N0");
            txtCSClinicianColDDiff.Text = Int32.Parse(dr["CSClinicianColDDiff"].ToString()).ToString("N0");
            txtCSConsultantColDDiff.Text = Int32.Parse(dr["CSConsultantColDDiff"].ToString()).ToString("N0");
            txtCSEducatorInstructorColDDiff.Text = Int32.Parse(dr["CSEducatorInstructorColDDiff"].ToString()).ToString("N0");
            txtCSHomeVisitorColDDiff.Text = Int32.Parse(dr["CSHomeVisitorColDDiff"].ToString()).ToString("N0");
            txtCSSpecialistColDDiff.Text = Int32.Parse(dr["CSSpecialistColDDiff"].ToString()).ToString("N0");
            txtCSSpeakerColDDiff.Text = Int32.Parse(dr["CSSpeakerColDDiff"].ToString()).ToString("N0");
            txtCSSubstituteColDDiff.Text = Int32.Parse(dr["CSSubstituteColDDiff"].ToString()).ToString("N0");
            txtCSStipendColDDiff.Text = Int32.Parse(dr["CSStipendColDDiff"].ToString()).ToString("N0");
            txtCSOtherColDDiff.Text = Int32.Parse(dr["CSOtherColDDiff"].ToString()).ToString("N0");

            txtCSSubTotalColDDiff.Text = Int32.Parse(dr["CSSubTotalColDDiff"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColDDiff.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColDDiff"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColDDiff.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColDDiff"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColDDiff.Text = Int32.Parse(dr["NonInstructionalSuppliesColDDiff"].ToString()).ToString("N0");
            txtSMOtherColDDiff.Text = Int32.Parse(dr["SMOtherColDDiff"].ToString()).ToString("N0");

            txtSMSubTotalColDDiff.Text = Int32.Parse(dr["SMSubTotalColDDiff"].ToString()).ToString("N0");

            txtSupervisoryStaffColDDiff.Text = Int32.Parse(dr["SupervisoryStaffColDDiff"].ToString()).ToString("N0");
            txtInstructionalStaffColDDiff.Text = Int32.Parse(dr["InstructionalStaffColDDiff"].ToString()).ToString("N0");
            txtTravelOtherColDDiff.Text = Int32.Parse(dr["TravelOtherColDDiff"].ToString()).ToString("N0");

            txtTravelSubTotalColDDiff.Text = Int32.Parse(dr["TravelSubTotalColDDiff"].ToString()).ToString("N0");

            txtAdvertisingColDDiff.Text = Int32.Parse(dr["AdvertisingColDDiff"].ToString()).ToString("N0");
            txtEquipmentRentalColDDiff.Text = Int32.Parse(dr["EquipmentRentalColDDiff"].ToString()).ToString("N0");
            txtMaintenanceRepairsColDDiff.Text = Int32.Parse(dr["MaintenanceRepairsColDDiff"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColDDiff.Text = Int32.Parse(dr["MembershipSubscriptionsColDDiff"].ToString()).ToString("N0");
            txtPrintingReproductionColDDiff.Text = Int32.Parse(dr["PrintingReproductionColDDiff"].ToString()).ToString("N0");
            txtStaffTrainingColDDiff.Text = Int32.Parse(dr["StaffTrainingColDDiff"].ToString()).ToString("N0");
            txtRentalofSpaceColDDiff.Text = Int32.Parse(dr["RentalofSpaceColDDiff"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColDDiff.Text = Int32.Parse(dr["TelephoneUtilitiesColDDiff"].ToString()).ToString("N0");
            txtDirectServiceTransportationColDDiff.Text = Int32.Parse(dr["DirectServiceTransportationColDDiff"].ToString()).ToString("N0");
            txtOCOtherColDDiff.Text = Int32.Parse(dr["OCOtherColDDiff"].ToString()).ToString("N0");

            txtOCSubTotalColDDiff.Text = Int32.Parse(dr["OCSubTotalColDDiff"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColDDiff.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColDDiff"].ToString()).ToString("N0");
            txtApplicationFeesColDDiff.Text = Int32.Parse(dr["ApplicationFeesColDDiff"].ToString()).ToString("N0");
            txtCEUCoursesColDDiff.Text = Int32.Parse(dr["CEUCoursesColDDiff"].ToString()).ToString("N0");
            txtCollegeCoursesColDDiff.Text = Int32.Parse(dr["CollegeCoursesColDDiff"].ToString()).ToString("N0");
            txtCBOtherColDDiff.Text = Int32.Parse(dr["CBOtherColDDiff"].ToString()).ToString("N0");

            txtCBSubTotalColDDiff.Text = Int32.Parse(dr["CBSubTotalColDDiff"].ToString()).ToString("N0");

            txtInstructionalEquipmentColDDiff.Text = Int32.Parse(dr["InstructionalEquipmentColDDiff"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColDDiff.Text = Int32.Parse(dr["NoninstructionalEquipmentColDDiff"].ToString()).ToString("N0");
            txtEqOtherColDDiff.Text = Int32.Parse(dr["EqOtherColDDiff"].ToString()).ToString("N0");

            txtEqSubTotalColDDiff.Text = Int32.Parse(dr["EqSubTotalColDDiff"].ToString()).ToString("N0");

            txtAncillarySubTotalColDDiff.Text = Int32.Parse(dr["AncillarySubTotalColDDiff"].ToString()).ToString("N0");

            txtGrantTotalColDDiff.Text = Int32.Parse(dr["GrantTotalColDDiff"].ToString()).ToString("N2");
            #endregion

            #region col f
            //col f
            txtSupervisorDirectorColFDiff.Text = Int32.Parse(dr["SupervisorDirectorColFDiff"].ToString()).ToString("N0");
            txtProjectCoordinatorColFDiff.Text = Int32.Parse(dr["ProjectCoordinatorColFDiff"].ToString()).ToString("N0");
            txtStipendColFDiff.Text = Int32.Parse(dr["StipendColFDiff"].ToString()).ToString("N0");
            txtOtherColFDiff.Text = Int32.Parse(dr["OtherColFDiff"].ToString()).ToString("N0");

            txtAdminSubTotalColFDiff.Text = Int32.Parse(dr["AdminSubTotalColFDiff"].ToString()).ToString("N0");

            txtAdvisorColFDiff.Text = Int32.Parse(dr["AdvisorColFDiff"].ToString()).ToString("N0");
            txtClinicianColFDiff.Text = Int32.Parse(dr["ClinicianColFDiff"].ToString()).ToString("N0");
            txtCoordinatorColFDiff.Text = Int32.Parse(dr["CoordinatorColFDiff"].ToString()).ToString("N0");
            txtEducatorInstructorColFDiff.Text = Int32.Parse(dr["EducatorInstructorColFDiff"].ToString()).ToString("N0");
            txtHomeVisitorColFDiff.Text = Int32.Parse(dr["HomeVisitorColFDiff"].ToString()).ToString("N0");
            txtSpecialistColFDiff.Text = Int32.Parse(dr["SpecialistColFDiff"].ToString()).ToString("N0");
            txtIPSStipendColFDiff.Text = Int32.Parse(dr["IPSStipendColFDiff"].ToString()).ToString("N0");
            txtIPSOtherColFDiff.Text = Int32.Parse(dr["IPSOtherColFDiff"].ToString()).ToString("N0");

            txtIPSSubTotalColFDiff.Text = Int32.Parse(dr["IPSSubTotalColFDiff"].ToString()).ToString("N0");

            txtAideParaprofessionalColFDiff.Text = Int32.Parse(dr["AideParaprofessionalColFDiff"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColFDiff.Text = Int32.Parse(dr["SecretaryBookkeeperColFDiff"].ToString()).ToString("N0");
            txtSSStipendColFDiff.Text = Int32.Parse(dr["SSStipendColFDiff"].ToString()).ToString("N0");
            txtSSOtherColFDiff.Text = Int32.Parse(dr["SSOtherColFDiff"].ToString()).ToString("N0");

            txtSSSubTotalColFDiff.Text = Int32.Parse(dr["SSSubTotalColFDiff"].ToString()).ToString("N0");

            txtFringeBenefitsColFDiff.Text = Int32.Parse(dr["FringeBenefitsColFDiff"].ToString()).ToString("N0");

            txtFBSubTotalColFDiff.Text = Int32.Parse(dr["FBSubTotalColFDiff"].ToString()).ToString("N0");

            txtCSAdvisorColFDiff.Text = Int32.Parse(dr["CSAdvisorColFDiff"].ToString()).ToString("N0");
            txtCSClinicianColFDiff.Text = Int32.Parse(dr["CSClinicianColFDiff"].ToString()).ToString("N0");
            txtCSConsultantColFDiff.Text = Int32.Parse(dr["CSConsultantColFDiff"].ToString()).ToString("N0");
            txtCSEducatorInstructorColFDiff.Text = Int32.Parse(dr["CSEducatorInstructorColFDiff"].ToString()).ToString("N0");
            txtCSHomeVisitorColFDiff.Text = Int32.Parse(dr["CSHomeVisitorColFDiff"].ToString()).ToString("N0");
            txtCSSpecialistColFDiff.Text = Int32.Parse(dr["CSSpecialistColFDiff"].ToString()).ToString("N0");
            txtCSSpeakerColFDiff.Text = Int32.Parse(dr["CSSpeakerColFDiff"].ToString()).ToString("N0");
            txtCSSubstituteColFDiff.Text = Int32.Parse(dr["CSSubstituteColFDiff"].ToString()).ToString("N0");
            txtCSStipendColFDiff.Text = Int32.Parse(dr["CSStipendColFDiff"].ToString()).ToString("N0");
            txtCSOtherColFDiff.Text = Int32.Parse(dr["CSOtherColFDiff"].ToString()).ToString("N0");

            txtCSSubTotalColFDiff.Text = Int32.Parse(dr["CSSubTotalColFDiff"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColFDiff.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColFDiff"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColFDiff.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColFDiff"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColFDiff.Text = Int32.Parse(dr["NonInstructionalSuppliesColFDiff"].ToString()).ToString("N0");
            txtSMOtherColFDiff.Text = Int32.Parse(dr["SMOtherColFDiff"].ToString()).ToString("N0");

            txtSMSubTotalColFDiff.Text = Int32.Parse(dr["SMSubTotalColFDiff"].ToString()).ToString("N0");

            txtSupervisoryStaffColFDiff.Text = Int32.Parse(dr["SupervisoryStaffColFDiff"].ToString()).ToString("N0");
            txtInstructionalStaffColFDiff.Text = Int32.Parse(dr["InstructionalStaffColFDiff"].ToString()).ToString("N0");
            txtTravelOtherColFDiff.Text = Int32.Parse(dr["TravelOtherColFDiff"].ToString()).ToString("N0");

            txtTravelSubTotalColFDiff.Text = Int32.Parse(dr["TravelSubTotalColFDiff"].ToString()).ToString("N0");

            txtAdvertisingColFDiff.Text = Int32.Parse(dr["AdvertisingColFDiff"].ToString()).ToString("N0");
            txtEquipmentRentalColFDiff.Text = Int32.Parse(dr["EquipmentRentalColFDiff"].ToString()).ToString("N0");
            txtMaintenanceRepairsColFDiff.Text = Int32.Parse(dr["MaintenanceRepairsColFDiff"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColFDiff.Text = Int32.Parse(dr["MembershipSubscriptionsColFDiff"].ToString()).ToString("N0");
            txtPrintingReproductionColFDiff.Text = Int32.Parse(dr["PrintingReproductionColFDiff"].ToString()).ToString("N0");
            txtStaffTrainingColFDiff.Text = Int32.Parse(dr["StaffTrainingColFDiff"].ToString()).ToString("N0");
            txtRentalofSpaceColFDiff.Text = Int32.Parse(dr["RentalofSpaceColFDiff"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColFDiff.Text = Int32.Parse(dr["TelephoneUtilitiesColFDiff"].ToString()).ToString("N0");
            txtDirectServiceTransportationColFDiff.Text = Int32.Parse(dr["DirectServiceTransportationColFDiff"].ToString()).ToString("N0");
            txtOCOtherColFDiff.Text = Int32.Parse(dr["OCOtherColFDiff"].ToString()).ToString("N0");

            txtOCSubTotalColFDiff.Text = Int32.Parse(dr["OCSubTotalColFDiff"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColFDiff.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColFDiff"].ToString()).ToString("N0");
            txtApplicationFeesColFDiff.Text = Int32.Parse(dr["ApplicationFeesColFDiff"].ToString()).ToString("N0");
            txtCEUCoursesColFDiff.Text = Int32.Parse(dr["CEUCoursesColFDiff"].ToString()).ToString("N0");
            txtCollegeCoursesColFDiff.Text = Int32.Parse(dr["CollegeCoursesColFDiff"].ToString()).ToString("N0");
            txtCBOtherColFDiff.Text = Int32.Parse(dr["CBOtherColFDiff"].ToString()).ToString("N0");

            txtCBSubTotalColFDiff.Text = Int32.Parse(dr["CBSubTotalColFDiff"].ToString()).ToString("N0");

            txtIndirectCostsColFDiff.Text = Int32.Parse(dr["IndirectCostsColFDiff"].ToString()).ToString("N0");
            txtIndirectCostsSubTotalColFDiff.Text = Int32.Parse(dr["IndirectCostsSubTotalColFDiff"].ToString()).ToString("N0");

            txtInstructionalEquipmentColFDiff.Text = Int32.Parse(dr["InstructionalEquipmentColFDiff"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColFDiff.Text = Int32.Parse(dr["NoninstructionalEquipmentColFDiff"].ToString()).ToString("N0");
            txtEqOtherColFDiff.Text = Int32.Parse(dr["EqOtherColFDiff"].ToString()).ToString("N0");

            txtEqSubTotalColFDiff.Text = Int32.Parse(dr["EqSubTotalColFDiff"].ToString()).ToString("N0");

            txtAncillarySubTotalColFDiff.Text = Int32.Parse(dr["AncillarySubTotalColFDiff"].ToString()).ToString("N0");

            txtGrantTotalColFDiff.Text = Int32.Parse(dr["GrantTotalColFDiff"].ToString()).ToString("N2");
            #endregion

            
            txtSupervisorDirectorColD.Text = Int32.Parse(dr["SupervisorDirectorColD"].ToString()).ToString("N0");
            txtProjectCoordinatorColD.Text = Int32.Parse(dr["ProjectCoordinatorColD"].ToString()).ToString("N0");
            txtStipendColD.Text = Int32.Parse(dr["StipendColD"].ToString()).ToString("N0");
            txtOtherColD.Text = Int32.Parse(dr["OtherColD"].ToString()).ToString("N0");
            txtAdminSubTotalColD.Text = Int32.Parse(dr["AdminSubTotalColD"].ToString()).ToString("N0");
            txtAdvisorColD.Text = Int32.Parse(dr["AdvisorColD"].ToString()).ToString("N0");
            txtClinicianColD.Text = Int32.Parse(dr["ClinicianColD"].ToString()).ToString("N0");
            txtCoordinatorColD.Text = Int32.Parse(dr["CoordinatorColD"].ToString()).ToString("N0");
            txtEducatorInstructorColD.Text = Int32.Parse(dr["EducatorInstructorColD"].ToString()).ToString("N0");
            txtHomeVisitorColD.Text = Int32.Parse(dr["HomeVisitorColD"].ToString()).ToString("N0");
            txtSpecialistColD.Text = Int32.Parse(dr["SpecialistColD"].ToString()).ToString("N0");
            txtIPSStipendColD.Text = Int32.Parse(dr["IPSStipendColD"].ToString()).ToString("N0");
            txtIPSOtherColD.Text = Int32.Parse(dr["IPSOtherColD"].ToString()).ToString("N0");

            txtIPSSubTotalColD.Text = Int32.Parse(dr["IPSSubTotalColD"].ToString()).ToString("N0");

            txtAideParaprofessionalColD.Text = Int32.Parse(dr["AideParaprofessionalColD"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColD.Text = Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()).ToString("N0");
            txtSSStipendColD.Text = Int32.Parse(dr["SSStipendColD"].ToString()).ToString("N0");
            txtSSOtherColD.Text = Int32.Parse(dr["SSOtherColD"].ToString()).ToString("N0");

            txtSSSubTotalColD.Text = Int32.Parse(dr["SSSubTotalColD"].ToString()).ToString("N0");

            txtFringeBenefitsColD.Text = Int32.Parse(dr["FringeBenefitsColD"].ToString()).ToString("N0");

            txtFBSubTotalColD.Text = Int32.Parse(dr["FBSubTotalColD"].ToString()).ToString("N0");

            txtCSAdvisorColD.Text = Int32.Parse(dr["CSAdvisorColD"].ToString()).ToString("N0");
            txtCSClinicianColD.Text = Int32.Parse(dr["CSClinicianColD"].ToString()).ToString("N0");
            txtCSConsultantColD.Text = Int32.Parse(dr["CSConsultantColD"].ToString()).ToString("N0");
            txtCSEducatorInstructorColD.Text = Int32.Parse(dr["CSEducatorInstructorColD"].ToString()).ToString("N0");
            txtCSHomeVisitorColD.Text = Int32.Parse(dr["CSHomeVisitorColD"].ToString()).ToString("N0");
            txtCSSpecialistColD.Text = Int32.Parse(dr["CSSpecialistColD"].ToString()).ToString("N0");
            txtCSSpeakerColD.Text = Int32.Parse(dr["CSSpeakerColD"].ToString()).ToString("N0");
            txtCSSubstituteColD.Text = Int32.Parse(dr["CSSubstituteColD"].ToString()).ToString("N0");
            txtCSStipendColD.Text = Int32.Parse(dr["CSStipendColD"].ToString()).ToString("N0");
            txtCSOtherColD.Text = Int32.Parse(dr["CSOtherColD"].ToString()).ToString("N0");

            txtCSSubTotalColD.Text = Int32.Parse(dr["CSSubTotalColD"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColD.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColD"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColD.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColD"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColD.Text = Int32.Parse(dr["NonInstructionalSuppliesColD"].ToString()).ToString("N0");
            txtSMOtherColD.Text = Int32.Parse(dr["SMOtherColD"].ToString()).ToString("N0");

            txtSMSubTotalColD.Text = Int32.Parse(dr["SMSubTotalColD"].ToString()).ToString("N0");

            txtSupervisoryStaffColD.Text = Int32.Parse(dr["SupervisoryStaffColD"].ToString()).ToString("N0");
            txtInstructionalStaffColD.Text = Int32.Parse(dr["InstructionalStaffColD"].ToString()).ToString("N0");
            txtTravelOtherColD.Text = Int32.Parse(dr["TravelOtherColD"].ToString()).ToString("N0");

            txtTravelSubTotalColD.Text = Int32.Parse(dr["TravelSubTotalColD"].ToString()).ToString("N0");

            txtAdvertisingColD.Text = Int32.Parse(dr["AdvertisingColD"].ToString()).ToString("N0");
            txtEquipmentRentalColD.Text = Int32.Parse(dr["EquipmentRentalColD"].ToString()).ToString("N0");
            txtMaintenanceRepairsColD.Text = Int32.Parse(dr["MaintenanceRepairsColD"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColD.Text = Int32.Parse(dr["MembershipSubscriptionsColD"].ToString()).ToString("N0");
            txtPrintingReproductionColD.Text = Int32.Parse(dr["PrintingReproductionColD"].ToString()).ToString("N0");
            txtStaffTrainingColD.Text = Int32.Parse(dr["StaffTrainingColD"].ToString()).ToString("N0");
            txtRentalofSpaceColD.Text = Int32.Parse(dr["RentalofSpaceColD"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColD.Text = Int32.Parse(dr["TelephoneUtilitiesColD"].ToString()).ToString("N0");
            txtDirectServiceTransportationColD.Text = Int32.Parse(dr["DirectServiceTransportationColD"].ToString()).ToString("N0");
            txtOCOtherColD.Text = Int32.Parse(dr["OCOtherColD"].ToString()).ToString("N0");

            txtOCSubTotalColD.Text = Int32.Parse(dr["OCSubTotalColD"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColD.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColD"].ToString()).ToString("N0");
            txtApplicationFeesColD.Text = Int32.Parse(dr["ApplicationFeesColD"].ToString()).ToString("N0");
            txtCEUCoursesColD.Text = Int32.Parse(dr["CEUCoursesColD"].ToString()).ToString("N0");
            txtCollegeCoursesColD.Text = Int32.Parse(dr["CollegeCoursesColD"].ToString()).ToString("N0");
            txtCBOtherColD.Text = Int32.Parse(dr["CBOtherColD"].ToString()).ToString("N0");

            txtCBSubTotalColD.Text = Int32.Parse(dr["CBSubTotalColD"].ToString()).ToString("N0");

            txtInstructionalEquipmentColD.Text = Int32.Parse(dr["InstructionalEquipmentColD"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColD.Text = Int32.Parse(dr["NoninstructionalEquipmentColD"].ToString()).ToString("N0");
            txtEqOtherColD.Text = Int32.Parse(dr["EqOtherColD"].ToString()).ToString("N0");

            txtEqSubTotalColD.Text = Int32.Parse(dr["EqSubTotalColD"].ToString()).ToString("N0");

            txtAncillarySubTotalColD.Text = Int32.Parse(dr["AncillarySubTotalColD"].ToString()).ToString("N0");

            txtGrantTotalColD.Text = Int32.Parse(dr["GrantTotalColD"].ToString()).ToString("N2");
              
              
            txtSupervisorDirectorColF.Text = Int32.Parse(dr["SupervisorDirectorColF"].ToString()).ToString("N0");
            txtProjectCoordinatorColF.Text = Int32.Parse(dr["ProjectCoordinatorColF"].ToString()).ToString("N0");
            txtStipendColF.Text = Int32.Parse(dr["StipendColF"].ToString()).ToString("N0");
            txtOtherColF.Text = Int32.Parse(dr["OtherColF"].ToString()).ToString("N0");

            txtAdminSubTotalColF.Text = Int32.Parse(dr["AdminSubTotalColF"].ToString()).ToString("N0");

            txtAdvisorColF.Text = Int32.Parse(dr["AdvisorColF"].ToString()).ToString("N0");
            txtClinicianColF.Text = Int32.Parse(dr["ClinicianColF"].ToString()).ToString("N0");
            txtCoordinatorColF.Text = Int32.Parse(dr["CoordinatorColF"].ToString()).ToString("N0");
            txtEducatorInstructorColF.Text = Int32.Parse(dr["EducatorInstructorColF"].ToString()).ToString("N0");
            txtHomeVisitorColF.Text = Int32.Parse(dr["HomeVisitorColF"].ToString()).ToString("N0");
            txtSpecialistColF.Text = Int32.Parse(dr["SpecialistColF"].ToString()).ToString("N0");
            txtIPSStipendColF.Text = Int32.Parse(dr["IPSStipendColF"].ToString()).ToString("N0");
            txtIPSOtherColF.Text = Int32.Parse(dr["IPSOtherColF"].ToString()).ToString("N0");

            txtIPSSubTotalColF.Text = Int32.Parse(dr["IPSSubTotalColF"].ToString()).ToString("N0");

            txtAideParaprofessionalColF.Text = Int32.Parse(dr["AideParaprofessionalColF"].ToString()).ToString("N0");
            txtSecretaryBookkeeperColF.Text = Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()).ToString("N0");
            txtSSStipendColF.Text = Int32.Parse(dr["SSStipendColF"].ToString()).ToString("N0");
            txtSSOtherColF.Text = Int32.Parse(dr["SSOtherColF"].ToString()).ToString("N0");

            txtSSSubTotalColF.Text = Int32.Parse(dr["SSSubTotalColF"].ToString()).ToString("N0");

            txtFringeBenefitsColF.Text = Int32.Parse(dr["FringeBenefitsColF"].ToString()).ToString("N0");

            txtFBSubTotalColF.Text = Int32.Parse(dr["FBSubTotalColF"].ToString()).ToString("N0");

            txtCSAdvisorColF.Text = Int32.Parse(dr["CSAdvisorColF"].ToString()).ToString("N0");
            txtCSClinicianColF.Text = Int32.Parse(dr["CSClinicianColF"].ToString()).ToString("N0");
            txtCSConsultantColF.Text = Int32.Parse(dr["CSConsultantColF"].ToString()).ToString("N0");
            txtCSEducatorInstructorColF.Text = Int32.Parse(dr["CSEducatorInstructorColF"].ToString()).ToString("N0");
            txtCSHomeVisitorColF.Text = Int32.Parse(dr["CSHomeVisitorColF"].ToString()).ToString("N0");
            txtCSSpecialistColF.Text = Int32.Parse(dr["CSSpecialistColF"].ToString()).ToString("N0");
            txtCSSpeakerColF.Text = Int32.Parse(dr["CSSpeakerColF"].ToString()).ToString("N0");
            txtCSSubstituteColF.Text = Int32.Parse(dr["CSSubstituteColF"].ToString()).ToString("N0");
            txtCSStipendColF.Text = Int32.Parse(dr["CSStipendColF"].ToString()).ToString("N0");
            txtCSOtherColF.Text = Int32.Parse(dr["CSOtherColF"].ToString()).ToString("N0");

            txtCSSubTotalColF.Text = Int32.Parse(dr["CSSubTotalColF"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterialsColF.Text = Int32.Parse(dr["EducationalInstructionalMaterialsColF"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareColF.Text = Int32.Parse(dr["InstructionalTechnologySoftwareColF"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesColF.Text = Int32.Parse(dr["NonInstructionalSuppliesColF"].ToString()).ToString("N0");
            txtSMOtherColF.Text = Int32.Parse(dr["SMOtherColF"].ToString()).ToString("N0");

            txtSMSubTotalColF.Text = Int32.Parse(dr["SMSubTotalColF"].ToString()).ToString("N0");

            txtSupervisoryStaffColF.Text = Int32.Parse(dr["SupervisoryStaffColF"].ToString()).ToString("N0");
            txtInstructionalStaffColF.Text = Int32.Parse(dr["InstructionalStaffColF"].ToString()).ToString("N0");
            txtTravelOtherColF.Text = Int32.Parse(dr["TravelOtherColF"].ToString()).ToString("N0");

            txtTravelSubTotalColF.Text = Int32.Parse(dr["TravelSubTotalColF"].ToString()).ToString("N0");

            txtAdvertisingColF.Text = Int32.Parse(dr["AdvertisingColF"].ToString()).ToString("N0");
            txtEquipmentRentalColF.Text = Int32.Parse(dr["EquipmentRentalColF"].ToString()).ToString("N0");
            txtMaintenanceRepairsColF.Text = Int32.Parse(dr["MaintenanceRepairsColF"].ToString()).ToString("N0");
            txtMembershipSubscriptionsColF.Text = Int32.Parse(dr["MembershipSubscriptionsColF"].ToString()).ToString("N0");
            txtPrintingReproductionColF.Text = Int32.Parse(dr["PrintingReproductionColF"].ToString()).ToString("N0");
            txtStaffTrainingColF.Text = Int32.Parse(dr["StaffTrainingColF"].ToString()).ToString("N0");
            txtRentalofSpaceColF.Text = Int32.Parse(dr["RentalofSpaceColF"].ToString()).ToString("N0");
            txtTelephoneUtilitiesColF.Text = Int32.Parse(dr["TelephoneUtilitiesColF"].ToString()).ToString("N0");
            txtDirectServiceTransportationColF.Text = Int32.Parse(dr["DirectServiceTransportationColF"].ToString()).ToString("N0");
            txtOCOtherColF.Text = Int32.Parse(dr["OCOtherColF"].ToString()).ToString("N0");

            txtOCSubTotalColF.Text = Int32.Parse(dr["OCSubTotalColF"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunitiesColF.Text = Int32.Parse(dr["ProfessionalDevelopOpportunitiesColF"].ToString()).ToString("N0");
            txtApplicationFeesColF.Text = Int32.Parse(dr["ApplicationFeesColF"].ToString()).ToString("N0");
            txtCEUCoursesColF.Text = Int32.Parse(dr["CEUCoursesColF"].ToString()).ToString("N0");
            txtCollegeCoursesColF.Text = Int32.Parse(dr["CollegeCoursesColF"].ToString()).ToString("N0");
            txtCBOtherColF.Text = Int32.Parse(dr["CBOtherColF"].ToString()).ToString("N0");

            txtCBSubTotalColF.Text = Int32.Parse(dr["CBSubTotalColF"].ToString()).ToString("N0");

            txtIndirectCostsColF.Text = Int32.Parse(dr["IndirectCostsColF"].ToString()).ToString("N0");
            txtIndirectCostsSubTotalColF.Text = Int32.Parse(dr["IndirectCostsSubTotalColF"].ToString()).ToString("N0");

            txtInstructionalEquipmentColF.Text = Int32.Parse(dr["InstructionalEquipmentColF"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColF.Text = Int32.Parse(dr["NoninstructionalEquipmentColF"].ToString()).ToString("N0");
            txtEqOtherColF.Text = Int32.Parse(dr["EqOtherColF"].ToString()).ToString("N0");

            txtEqSubTotalColF.Text = Int32.Parse(dr["EqSubTotalColF"].ToString()).ToString("N0");

            txtAncillarySubTotalColF.Text = Int32.Parse(dr["AncillarySubTotalColF"].ToString()).ToString("N0");

            txtGrantTotalColF.Text = Int32.Parse(dr["GrantTotalColF"].ToString()).ToString("N2");
            
            #region col I
            //col c
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
            //txtIndirectPercent.Text = Decimal.Parse(dr["IndirectPercent"].ToString()).ToString("N2");
            txtIndirectCosts.Text = Int32.Parse(dr["IndirectCosts"].ToString()).ToString("N0");
            txtIndirectCostsSubTotal.Text = Int32.Parse(dr["IndirectCostsSubTotal"].ToString()).ToString("N0");
            txtInstructionalEquipment.Text = Int32.Parse(dr["InstructionalEquipment"].ToString()).ToString("N0");
            txtNoninstructionalEquipment.Text = Int32.Parse(dr["NoninstructionalEquipment"].ToString()).ToString("N0");
            txtEqOther.Text = Int32.Parse(dr["EqOther"].ToString()).ToString("N0");
            txtEqSubTotal.Text = Int32.Parse(dr["EqSubTotal"].ToString()).ToString("N0");
            txtAncillary.Text = Int32.Parse(dr["Ancillary"].ToString()).ToString("N0");
            txtAncillarySubTotal.Text = Int32.Parse(dr["AncillarySubTotal"].ToString()).ToString("N0");
            #endregion



            txtGrantTotal.Text = Int32.Parse(dr["GrantTotal"].ToString()).ToString("N2");

            if (hasValidationErrors())
            {
                tblFailed.Visible = true;
            }
            else
            {
                tblFailed.Visible = false;
            }
        }
    }
    
    private bool hasValidationErrors()
    {
        int errorCount = 0;
        float amount;

        lstErrors.Items.Clear();

        //if (!GlobalFuncAmendment.isValidBudgetAmendmentSummaryEligibilityAmount(Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), ds))
        //{
        //    lstErrors.Items.Add("The requested amount is not equal to the total eligibility amount. Please revise your budget accordingly.");
        //    errorCount++;
        //}

        if (!GlobalFuncAmendment.isValidBudgetAmendmentSummaryEECAdminLimit(ds, Int32.Parse(Single.Parse(Session["Eligibility Amount"].ToString()).ToString()), out amount))
        {
            lstErrors.Items.Add("EEC's " + AppInfo.EECAdminLimitPerc + "% Admin limit has been exceeded by " + "$" + amount.ToString("N0") +". Please revise your budget accordingly.");
            errorCount++;
        }

        return lstErrors.Items.Count > 0;
    }
    

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    protected void btnGoHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AmendmentHome.aspx?ver=" + ViewState["AmendmentVersion"].ToString());
    }

    protected void btnPrintHSBudgetSummary2015_Click(object sender, EventArgs e)
    {
        Response.Redirect("Print.aspx?type=BudgetAmendmentSummary");
    }
}