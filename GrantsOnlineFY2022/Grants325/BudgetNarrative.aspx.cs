using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BudgetNarrative : System.Web.UI.Page
{
    DAL dal = new DAL();
    DataSet ds;
    DataSet ds2;
    SortedList<string, string> DisabledColumn = new SortedList<string,string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["GrantApplicantId"] == null) Response.Redirect("SessionTimeout.aspx");

        Master.PartTitle = AppInfo.DisplayPart4Title;

        lblInstruction.Text = dal.GetPartInstruction(AppInfo.FundCode, AppInfo.FiscalYear, "4");

        BindScripts();
        DisableColumn();

        if (!Page.IsPostBack)
        {
            BindData(false);
        }
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
        ds = dal.GetBudgetNarrativeData(Int32.Parse(Session["GrantApplicantId"].ToString()), 1);

        if (ds.Tables[0].Rows.Count > 0 && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["BudgetNarrativeID"].ToString()))
        {
            DataRow dr = ds.Tables[0].Rows[0];

            ViewState["BudgetNarrativeID"] = dr["BudgetNarrativeID"].ToString();

            #region col d
            //col d
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

            txtAncillaryColD.Text = Int32.Parse(dr["AncillaryColD"].ToString()).ToString("N0");
            txtAncillarySubTotalColD.Text = Int32.Parse(dr["AncillarySubTotalColD"].ToString()).ToString("N0");

            txtGrantTotalColD.Text = Int32.Parse(dr["GrantTotalColD"].ToString()).ToString("N2");
            #endregion

            #region col f
            //col f
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

            txtInstructionalEquipmentColF.Text = Int32.Parse(dr["InstructionalEquipmentColF"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentColF.Text = Int32.Parse(dr["NoninstructionalEquipmentColF"].ToString()).ToString("N0");
            txtEqOtherColF.Text = Int32.Parse(dr["EqOtherColF"].ToString()).ToString("N0");

            txtEqSubTotalColF.Text = Int32.Parse(dr["EqSubTotalColF"].ToString()).ToString("N0");

            txtAncillaryColF.Text = Int32.Parse(dr["AncillaryColF"].ToString()).ToString("N0");
            txtAncillarySubTotalColF.Text = Int32.Parse(dr["AncillarySubTotalColF"].ToString()).ToString("N0");

            txtGrantTotalColF.Text = Int32.Parse(dr["GrantTotalColF"].ToString()).ToString("N2");
            #endregion

            #region col c
            //col c
            txtSupervisorDirector.Text = Int32.Parse(dr["SupervisorDirector"].ToString()).ToString("N0");
            txtSupervisorDirectorDescr.Text = dr["SupervisorDirectorDescr"].ToString();
            txtProjectCoordinator.Text = Int32.Parse(dr["ProjectCoordinator"].ToString()).ToString("N0");
            txtProjectCoordinatorDescr.Text = dr["ProjectCoordinatorDescr"].ToString();
            txtStipend.Text = Int32.Parse(dr["Stipend"].ToString()).ToString("N0");
            txtStipendDescr.Text = dr["StipendDescr"].ToString();
            txtOther.Text = Int32.Parse(dr["Other"].ToString()).ToString("N0");
            txtOtherDescr.Text = dr["OtherDescr"].ToString();

            txtAdminSubTotal.Text = Int32.Parse(dr["AdminSubTotal"].ToString()).ToString("N0");

            txtAdvisor.Text = Int32.Parse(dr["Advisor"].ToString()).ToString("N0");
            txtAdvisorDescr.Text = dr["AdvisorDescr"].ToString();
            txtClinician.Text = Int32.Parse(dr["Clinician"].ToString()).ToString("N0");
            txtClinicianDescr.Text = dr["ClinicianDescr"].ToString();
            txtCoordinator.Text = Int32.Parse(dr["Coordinator"].ToString()).ToString("N0");
            txtCoordinatorDescr.Text = dr["CoordinatorDescr"].ToString();
            txtEducatorInstructor.Text = Int32.Parse(dr["EducatorInstructor"].ToString()).ToString("N0");
            txtEducatorInstructorDescr.Text = dr["EducatorInstructorDescr"].ToString();
            txtHomeVisitor.Text = Int32.Parse(dr["HomeVisitor"].ToString()).ToString("N0");
            txtHomeVisitorDescr.Text = dr["HomeVisitorDescr"].ToString();
            txtSpecialist.Text = Int32.Parse(dr["Specialist"].ToString()).ToString("N0");
            txtSpecialistDescr.Text = dr["SpecialistDescr"].ToString();
            txtIPSStipend.Text = Int32.Parse(dr["IPSStipend"].ToString()).ToString("N0");
            txtIPSStipendDescr.Text = dr["IPSStipendDescr"].ToString();
            txtIPSOther.Text = Int32.Parse(dr["IPSOther"].ToString()).ToString("N0");
            txtIPSOtherDescr.Text = dr["IPSOtherDescr"].ToString();

            txtIPSSubTotal.Text = Int32.Parse(dr["IPSSubTotal"].ToString()).ToString("N0");

            txtAideParaprofessional.Text = Int32.Parse(dr["AideParaprofessional"].ToString()).ToString("N0");
            txtAideParaprofessionalDescr.Text = dr["AideParaprofessionalDescr"].ToString();
            txtSecretaryBookkeeper.Text = Int32.Parse(dr["SecretaryBookkeeper"].ToString()).ToString("N0");
            txtSecretaryBookkeeperDescr.Text = dr["SecretaryBookkeeperDescr"].ToString();
            txtSSStipend.Text = Int32.Parse(dr["SSStipend"].ToString()).ToString("N0");
            txtSSStipendDescr.Text = dr["SSStipendDescr"].ToString();
            txtSSOther.Text = Int32.Parse(dr["SSOther"].ToString()).ToString("N0");
            txtSSOtherDescr.Text = dr["SSOtherDescr"].ToString();

            txtSSSubTotal.Text = Int32.Parse(dr["SSSubTotal"].ToString()).ToString("N0");

            txtFringeBenefits.Text = Int32.Parse(dr["FringeBenefits"].ToString()).ToString("N0");
            txtFringeBenefitsDescr.Text = dr["FringeBenefitsDescr"].ToString();

            txtFBSubTotal.Text = Int32.Parse(dr["FBSubTotal"].ToString()).ToString("N0");

            txtCSAdvisor.Text = Int32.Parse(dr["CSAdvisor"].ToString()).ToString("N0");
            txtCSAdvisorDescr.Text = dr["CSAdvisorDescr"].ToString();
            txtCSClinician.Text = Int32.Parse(dr["CSClinician"].ToString()).ToString("N0");
            txtCSClinicianDescr.Text = dr["CSClinicianDescr"].ToString();
            txtCSConsultant.Text = Int32.Parse(dr["CSConsultant"].ToString()).ToString("N0");
            txtCSConsultantDescr.Text = dr["CSConsultantDescr"].ToString();
            txtCSEducatorInstructor.Text = Int32.Parse(dr["CSEducatorInstructor"].ToString()).ToString("N0");
            txtCSEducatorInstructorDescr.Text = dr["CSEducatorInstructorDescr"].ToString();
            txtCSHomeVisitor.Text = Int32.Parse(dr["CSHomeVisitor"].ToString()).ToString("N0");
            txtCSHomeVisitorDescr.Text = dr["CSHomeVisitorDescr"].ToString();
            txtCSSpecialist.Text = Int32.Parse(dr["CSSpecialist"].ToString()).ToString("N0");
            txtCSSpecialistDescr.Text = dr["CSSpecialistDescr"].ToString();
            txtCSSpeaker.Text = Int32.Parse(dr["CSSpeaker"].ToString()).ToString("N0");
            txtCSSpeakerDescr.Text = dr["CSSpeakerDescr"].ToString();
            txtCSSubstitute.Text = Int32.Parse(dr["CSSubstitute"].ToString()).ToString("N0");
            txtCSSubstituteDescr.Text = dr["CSSubstituteDescr"].ToString();
            txtCSStipend.Text = Int32.Parse(dr["CSStipend"].ToString()).ToString("N0");
            txtCSStipendDescr.Text = dr["CSStipendDescr"].ToString();
            txtCSOther.Text = Int32.Parse(dr["CSOther"].ToString()).ToString("N0");
            txtCSOtherDescr.Text = dr["CSOtherDescr"].ToString();

            txtCSSubTotal.Text = Int32.Parse(dr["CSSubTotal"].ToString()).ToString("N0");

            txtEducationalInstructionalMaterials.Text = Int32.Parse(dr["EducationalInstructionalMaterials"].ToString()).ToString("N0");
            txtEducationalInstructionalMaterialsDescr.Text = dr["EducationalInstructionalMaterialsDescr"].ToString();
            txtInstructionalTechnologySoftware.Text = Int32.Parse(dr["InstructionalTechnologySoftware"].ToString()).ToString("N0");
            txtInstructionalTechnologySoftwareDescr.Text = dr["InstructionalTechnologySoftwareDescr"].ToString();
            txtNonInstructionalSupplies.Text = Int32.Parse(dr["NonInstructionalSupplies"].ToString()).ToString("N0");
            txtNonInstructionalSuppliesDescr.Text = dr["NonInstructionalSuppliesDescr"].ToString();
            txtSMOther.Text = Int32.Parse(dr["SMOther"].ToString()).ToString("N0");
            txtSMOtherDescr.Text = dr["SMOtherDescr"].ToString();

            txtSMSubTotal.Text = Int32.Parse(dr["SMSubTotal"].ToString()).ToString("N0");

            txtSupervisoryStaff.Text = Int32.Parse(dr["SupervisoryStaff"].ToString()).ToString("N0");
            txtSupervisoryStaffDescr.Text = dr["SupervisoryStaffDescr"].ToString();
            txtInstructionalStaff.Text = Int32.Parse(dr["InstructionalStaff"].ToString()).ToString("N0");
            txtInstructionalStaffDescr.Text = dr["InstructionalStaffDescr"].ToString();
            txtTravelOther.Text = Int32.Parse(dr["TravelOther"].ToString()).ToString("N0");
            txtTravelOtherDescr.Text = dr["TraveOtherDescr"].ToString();

            txtTravelSubTotal.Text = Int32.Parse(dr["TravelSubTotal"].ToString()).ToString("N0");

            txtAdvertising.Text = Int32.Parse(dr["Advertising"].ToString()).ToString("N0");
            txtAdvertisingDescr.Text = dr["AdvertisingDescr"].ToString();
            txtEquipmentRental.Text = Int32.Parse(dr["EquipmentRental"].ToString()).ToString("N0");
            txtEquipmentRentalDescr.Text = dr["EquipmentRentalDescr"].ToString();
            txtMaintenanceRepairs.Text = Int32.Parse(dr["MaintenanceRepairs"].ToString()).ToString("N0");
            txtMaintenanceRepairsDescr.Text = dr["MaintenanceRepairsDescr"].ToString();
            txtMembershipSubscriptions.Text = Int32.Parse(dr["MembershipSubscriptions"].ToString()).ToString("N0");
            txtMembershipSubscriptionsDescr.Text = dr["MembershipSubscriptionsDescr"].ToString();
            txtPrintingReproduction.Text = Int32.Parse(dr["PrintingReproduction"].ToString()).ToString("N0");
            txtPrintingReproductionDescr.Text = dr["PrintingReproductionDescr"].ToString();
            txtStaffTraining.Text = Int32.Parse(dr["StaffTraining"].ToString()).ToString("N0");
            txtStaffTrainingDescr.Text = dr["StaffTrainingDescr"].ToString();
            txtRentalofSpace.Text = Int32.Parse(dr["RentalofSpace"].ToString()).ToString("N0");
            txtRentalofSpaceDescr.Text = dr["RentalofSpaceDescr"].ToString();
            txtTelephoneUtilities.Text = Int32.Parse(dr["TelephoneUtilities"].ToString()).ToString("N0");
            txtTelephoneUtilitiesDescr.Text = dr["TelephoneUtilitiesDescr"].ToString();
            txtDirectServiceTransportation.Text = Int32.Parse(dr["DirectServiceTransportation"].ToString()).ToString("N0");
            txtDirectServiceTransportationDescr.Text = dr["DirectServiceTransportationDescr"].ToString();
            txtOCOther.Text = Int32.Parse(dr["OCOther"].ToString()).ToString("N0");
            txtOCOtherDescr.Text = dr["OCOtherDescr"].ToString();

            txtOCSubTotal.Text = Int32.Parse(dr["OCSubTotal"].ToString()).ToString("N0");

            txtProfessionalDevelopOpportunities.Text = Int32.Parse(dr["ProfessionalDevelopOpportunities"].ToString()).ToString("N0");
            txtProfessionalDevelopOpportunitiesDescr.Text = dr["ProfessionalDevelopOpportunitiesDescr"].ToString();
            txtApplicationFees.Text = Int32.Parse(dr["ApplicationFees"].ToString()).ToString("N0");
            txtApplicationFeesDescr.Text = dr["ApplicationFeesDescr"].ToString();
            txtCEUCourses.Text = Int32.Parse(dr["CEUCourses"].ToString()).ToString("N0");
            txtCEUCoursesDescr.Text = dr["CEUCoursesDescr"].ToString();
            txtCollegeCourses.Text = Int32.Parse(dr["CollegeCourses"].ToString()).ToString("N0");
            txtCollegeCoursesDescr.Text = dr["CollegeCoursesDescr"].ToString();
            txtCBOther.Text = Int32.Parse(dr["CBOther"].ToString()).ToString("N0");
            txtCollegeCoursesDescr.Text = dr["CollegeCoursesDescr"].ToString();
            txtCBOtherDescr.Text = dr["CBOtherDescr"].ToString();

            txtCBSubTotal.Text = Int32.Parse(dr["CBSubTotal"].ToString()).ToString("N0");

            txtIndirectPercent.Text = Decimal.Parse(dr["IndirectPercent"].ToString()).ToString("N2");

            txtIndirectCosts.Text = Int32.Parse(dr["IndirectCosts"].ToString()).ToString("N0");
            txtIndirectCostsDescr.Text = dr["IndirectCostsDescr"].ToString();

            txtInstructionalEquipment.Text = Int32.Parse(dr["InstructionalEquipment"].ToString()).ToString("N0");
            txtInstructionalEquipmentDescr.Text = dr["InstructionalEquipmentDescr"].ToString();
            txtNoninstructionalEquipment.Text = Int32.Parse(dr["NoninstructionalEquipment"].ToString()).ToString("N0");
            txtNoninstructionalEquipmentDescr.Text = dr["NoninstructionalEquipmentDescr"].ToString();
            txtEqOther.Text = Int32.Parse(dr["EqOther"].ToString()).ToString("N0");
            txtEqOtherDescr.Text = dr["EqOtherDescr"].ToString();

            txtAncillary.Text = Int32.Parse(dr["Ancillary"].ToString()).ToString("N0");
            txtAncillarySubTotal.Text = Int32.Parse(dr["AncillarySubTotal"].ToString()).ToString("N0");
            txtAncillaryDescr.Text = dr["AncillaryDescr"].ToString();

            txtEqSubTotal.Text = Int32.Parse(dr["EqSubTotal"].ToString()).ToString("N0");
            #endregion

            txtSupervisorDirectorNumofStaff.Text = (string.IsNullOrEmpty(dr["SupervisorDirectorNumofStaff"].ToString())) ? "0" : dr["SupervisorDirectorNumofStaff"].ToString();
            txtSupervisorDirectorFTE.Text = (string.IsNullOrEmpty(dr["SupervisorDirectorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SupervisorDirectorFTE"].ToString()).ToString("N2");
            txtProjectCoordinatorNumofStaff.Text = (string.IsNullOrEmpty(dr["ProjectCoordinatorNumofStaff"].ToString())) ? "0" : dr["ProjectCoordinatorNumofStaff"].ToString();
            txtProjectCoordinatorFTE.Text = (string.IsNullOrEmpty(dr["ProjectCoordinatorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["ProjectCoordinatorFTE"].ToString()).ToString("N2");
            txtOtherNumofStaff.Text = (string.IsNullOrEmpty(dr["OtherNumofStaff"].ToString())) ? "" : dr["OtherNumofStaff"].ToString();
            txtOtherFTE.Text = (string.IsNullOrEmpty(dr["OtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["OtherFTE"].ToString()).ToString("N2");

            txtAdminSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["AdminSubTotalNumofStaff"].ToString())) ? "" : dr["AdminSubTotalNumofStaff"].ToString();

            txtAdminSubTotalFTE.Text = (string.IsNullOrEmpty(dr["AdminSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["AdminSubTotalFTE"].ToString()).ToString("N2");

            txtAdvisorNumofStaff.Text = (string.IsNullOrEmpty(dr["AdvisorNumofStaff"].ToString())) ? "0" : dr["AdvisorNumofStaff"].ToString();
            txtAdvisorFTE.Text = (string.IsNullOrEmpty(dr["AdvisorFTE"].ToString())) ? "" : Convert.ToSingle(dr["AdvisorFTE"].ToString()).ToString("N2");
            txtClinicianNumofStaff.Text = (string.IsNullOrEmpty(dr["ClinicianNumofStaff"].ToString())) ? "0" : dr["ClinicianNumofStaff"].ToString();
            txtClinicianFTE.Text = (string.IsNullOrEmpty(dr["ClinicianFTE"].ToString())) ? "" : Convert.ToSingle(dr["ClinicianFTE"].ToString()).ToString("N2");
            txtCoordinatorNumofStaff.Text = (string.IsNullOrEmpty(dr["CoordinatorNumofStaff"].ToString())) ? "0" : dr["CoordinatorNumofStaff"].ToString();
            txtCoordinatorFTE.Text = (string.IsNullOrEmpty(dr["CoordinatorFTE"].ToString())) ? "" : Convert.ToSingle(dr["CoordinatorFTE"].ToString()).ToString("N2");
            txtEducatorInstructorNumofStaff.Text = (string.IsNullOrEmpty(dr["EducatorInstructorNumofStaff"].ToString())) ? "" : dr["EducatorInstructorNumofStaff"].ToString();
            txtEducatorInstructorFTE.Text = (string.IsNullOrEmpty(dr["EducatorInstructorFTE"].ToString())) ? "0" : Convert.ToSingle(dr["EducatorInstructorFTE"].ToString()).ToString("N2");
            txtHomeVisitorNumofStaff.Text = (string.IsNullOrEmpty(dr["HomeVisitorNumofStaff"].ToString())) ? "0" : dr["HomeVisitorNumofStaff"].ToString();
            txtHomeVisitorFTE.Text = (string.IsNullOrEmpty(dr["HomeVisitorFTE"].ToString())) ? "" : Convert.ToSingle(dr["HomeVisitorFTE"].ToString()).ToString("N2");
            txtSpecialistNumofStaff.Text = (string.IsNullOrEmpty(dr["SpecialistNumofStaff"].ToString())) ? "0" : dr["SpecialistNumofStaff"].ToString();
            txtSpecialistFTE.Text = (string.IsNullOrEmpty(dr["SpecialistFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SpecialistFTE"].ToString()).ToString("N2");
            txtIPSOtherNumofStaff.Text = (string.IsNullOrEmpty(dr["IPSOtherNumofStaff"].ToString())) ? "0" : dr["IPSOtherNumofStaff"].ToString();
            txtIPSOtherFTE.Text = (string.IsNullOrEmpty(dr["IPSOtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["IPSOtherFTE"].ToString()).ToString("N2");

            txtIPSSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["IPSSubTotalNumofStaff"].ToString())) ? "0" : dr["IPSSubTotalNumofStaff"].ToString();
            txtIPSSubTotalFTE.Text = (string.IsNullOrEmpty(dr["IPSSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["IPSSubTotalFTE"].ToString()).ToString("N2");

            txtAideParaprofessionalNumofStaff.Text = (string.IsNullOrEmpty(dr["AideParaprofessionalNumofStaff"].ToString())) ? "0" : dr["AideParaprofessionalNumofStaff"].ToString();
            txtAideParaprofessionalFTE.Text = (string.IsNullOrEmpty(dr["AideParaprofessionalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["AideParaprofessionalFTE"].ToString()).ToString("N2");
            txtSecretaryBookkeeperNumofStaff.Text = (string.IsNullOrEmpty(dr["SecretaryBookkeeperNumofStaff"].ToString())) ? "0" : dr["SecretaryBookkeeperNumofStaff"].ToString();
            txtSecretaryBookkeeperFTE.Text = (string.IsNullOrEmpty(dr["SecretaryBookkeeperFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SecretaryBookkeeperFTE"].ToString()).ToString("N2");
            txtSSOtherNumofStaff.Text = (string.IsNullOrEmpty(dr["SSOtherNumofStaff"].ToString())) ? "0" : dr["SSOtherNumofStaff"].ToString();
            txtSSOtherFTE.Text = (string.IsNullOrEmpty(dr["SSOtherFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SSOtherFTE"].ToString()).ToString("N2");

            txtSSSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["SSSubTotalNumofStaff"].ToString())) ? "0" : dr["SSSubTotalNumofStaff"].ToString();
            txtSSSubTotalFTE.Text = (string.IsNullOrEmpty(dr["SSSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["SSSubTotalFTE"].ToString()).ToString("N2");

            txtFringeBenefitsNumofStaff.Text = (string.IsNullOrEmpty(dr["FringeBenefitsNumofStaff"].ToString())) ? "0" : dr["FringeBenefitsNumofStaff"].ToString();
            txtFringeBenefitsFTE.Text = (string.IsNullOrEmpty(dr["FringeBenefitsFTE"].ToString())) ? "0" : Convert.ToSingle(dr["FringeBenefitsFTE"].ToString()).ToString("N2");

            txtFBSubTotalNumofStaff.Text = (string.IsNullOrEmpty(dr["FBSubTotalNumofStaff"].ToString())) ? "0" : dr["FBSubTotalNumofStaff"].ToString();
            txtFBSubTotalFTE.Text = (string.IsNullOrEmpty(dr["FBSubTotalFTE"].ToString())) ? "0" : Convert.ToSingle(dr["FBSubTotalFTE"].ToString()).ToString("N2");

            txtCSAdvisorRate.Text = (string.IsNullOrEmpty(dr["CSAdvisorRate"].ToString())) ? "0" : dr["CSAdvisorRate"].ToString();
            txtCSClinicianRate.Text = (string.IsNullOrEmpty(dr["CSClinicianRate"].ToString())) ? "0" : dr["CSClinicianRate"].ToString();
            txtCSConsultantRate.Text = (string.IsNullOrEmpty(dr["CSConsultantRate"].ToString())) ? "0" : dr["CSConsultantRate"].ToString();
            txtCSEducatorInstructorRate.Text = (string.IsNullOrEmpty(dr["CSEducatorInstructorRate"].ToString())) ? "0" : dr["CSEducatorInstructorRate"].ToString();
            txtCSHomeVisitorRate.Text = (string.IsNullOrEmpty(dr["CSHomeVisitorRate"].ToString())) ? "0" : dr["CSHomeVisitorRate"].ToString();
            txtCSSpecialistRate.Text = (string.IsNullOrEmpty(dr["CSSpecialistRate"].ToString())) ? "0" : dr["CSSpecialistRate"].ToString();
            txtCSSpeakerRate.Text = (string.IsNullOrEmpty(dr["CSSpeakerRate"].ToString())) ? "0" : dr["CSSpeakerRate"].ToString();
            txtCSSubstituteRate.Text = (string.IsNullOrEmpty(dr["CSSubstituteRate"].ToString())) ? "0" : dr["CSSubstituteRate"].ToString();
            txtCSOtherRate.Text = (string.IsNullOrEmpty(dr["CSOtherRate"].ToString())) ? "0" : dr["CSOtherRate"].ToString();

            txtSupervisoryStaffMileageRate.Text = (string.IsNullOrEmpty(dr["SupervisoryStaffMileageRate"].ToString())) ? "0" : dr["SupervisoryStaffMileageRate"].ToString();
            txtInstructionalStaffMileageRate.Text = (string.IsNullOrEmpty(dr["InstructionalStaffMileageRate"].ToString())) ? "0" : dr["InstructionalStaffMileageRate"].ToString();
            txtTravelOtherMileageRate.Text = (string.IsNullOrEmpty(dr["TravelOtherMileageRate"].ToString())) ? "0" : dr["TravelOtherMileageRate"].ToString();

            txtCSAdvisorHDW.Text = (string.IsNullOrEmpty(dr["CSAdvisorHrWkDayFlat"].ToString())) ? "-1" : dr["CSAdvisorHrWkDayFlat"].ToString();
            txtCSClinicianHDW.Text = (string.IsNullOrEmpty(dr["CSClinicianHrWkDayFlat"].ToString())) ? "-1" : dr["CSClinicianHrWkDayFlat"].ToString();
            txtCSConsultantHDW.Text = (string.IsNullOrEmpty(dr["CSConsultantHrWkDayFlat"].ToString())) ? "-1" : dr["CSConsultantHrWkDayFlat"].ToString();
            txtCSEducatorInstructorHDW.Text = (string.IsNullOrEmpty(dr["CSEducatorInstructorHrWkDayFlat"].ToString())) ? "-1" : dr["CSEducatorInstructorHrWkDayFlat"].ToString();
            txtCSHomeVisitorHDW.Text = (string.IsNullOrEmpty(dr["CSHomeVisitorHrWkDayFlat"].ToString())) ? "-1" : dr["CSHomeVisitorHrWkDayFlat"].ToString();
            txtCSSpecialistHDW.Text = (string.IsNullOrEmpty(dr["CSSpecialistHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpecialistHrWkDayFlat"].ToString();
            txtCSSpeakerHDW.Text = (string.IsNullOrEmpty(dr["CSSpeakerHrWkDayFlat"].ToString())) ? "-1" : dr["CSSpeakerHrWkDayFlat"].ToString();
            txtCSSubstituteHDW.Text = (string.IsNullOrEmpty(dr["CSSubstituteHrWkDayFlat"].ToString())) ? "-1" : dr["CSSubstituteHrWkDayFlat"].ToString();
            txtCSOtherHDW.Text = (string.IsNullOrEmpty(dr["CSOtherHrWkDayFlat"].ToString())) ? "-1" : dr["CSOtherHrWkDayFlat"].ToString();

            txtIndirectCostsSubTotal.Text = Decimal.Parse(txtIndirectCosts.Text).ToString("N0");

            txtGrantTotal.Text = Int32.Parse(dr["GrantTotal"].ToString()).ToString("N2");

            if (AppInfo.FundCode == 391)
            {
                txtNumberOfChildren.Text = (string.IsNullOrEmpty(dr["NumberOfChildren"].ToString())) ? "0" : dr["NumberOfChildren"].ToString();
            }
            else
            {
                txtNumberOfChildren.Text = "0";
            }

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

        if (AppInfo.FundCode == 391)
        {
            if (Session["DocId"] != null)
            {
                lblDocId.Text = "DOC ID:&nbsp;" + Session["DocId"].ToString();
            }
            else
            {
                lblDocId.Visible = false;
            }

            blkNumberOfChildren.Style.Add("display", "block");
        }
        else
        {
            blkNumberOfChildren.Style.Add("display", "none");
        }
    }

    private bool hasValidationWarning(bool isAfterSaved)
    {
        int warningCount = 0;

        //fringe warning
        if (!GlobalFunc.isValidFringe(ds))
        {
            warningCount++;
        }

        dal.UpdateBudgetWarningCount(Int32.Parse(ViewState["BudgetNarrativeID"].ToString()), warningCount);

        return warningCount > 0;
    }

    private bool hasValidationErrors(bool isAfterSaved)
    {
        int errorCount = 0;

        setDefaultStyle();

        lstErrors.Items.Clear();

        List<string> lstErrorBoxes = new List<string>();

        if (!GlobalFunc.isValidFringeNarrativeQuestion(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Please provide a budget narrative for fringe benefits.");
            errorCount++;
        }

        if (!GlobalFunc.isValidBudgetNarrativeQuestions(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Please provide a budget narrative for all line items requested.");
            errorCount++;
        }

        if (!GlobalFunc.isValidProgramAdminCosts(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Please provide the requested Program or Admin costs.");
            errorCount++;
        }

        if (!GlobalFunc.isValidNumOfFTE(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 1-4: Please enter the # of FTEs (Full Time Equivalences) for each line requested.");
            errorCount++;
        }

        if (!GlobalFunc.isValidNumOfStaffFTE(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("The number of FTE should not be greater than the number of Staff.");
            errorCount++;
        }

        if (!GlobalFunc.isValidNumOfStaff(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 1-4: Please enter the # of Staff for each line requested.");
            errorCount++;
        }

        if (!GlobalFunc.isValidMileageRate(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 7: Please enter the mileage rate for each line requested.");
            errorCount++;
        }

        if (!GlobalFunc.isValidContractPaidRate(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 5: Please provide the Rate ($) and Hr/Day/Wk/Yr/Flat Fee for each Contractual Service requested.");
            errorCount++;
        }

        if (!GlobalFunc.isValidIndirectPercent(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 10: Please provide your agency's Indirect Cost Approval Rate.");
            errorCount++;
        }

        if (AppInfo.FundCode == 391 && AppInfo.FiscalYear == 2016 && !GlobalFunc.isValidNumOfStaffPreSchool(lstErrorBoxes, ds))
        {
            lstErrors.Items.Add("Line 2: Total FTES must be equal to or less than number of staff x 0.50");
            errorCount++;
        }

        if (lstErrorBoxes.Count > 0)
        {
            displayErrorHighlight(lstErrorBoxes);
        }

        dal.UpdateBudgetErrorCount(Int32.Parse(ViewState["BudgetNarrativeID"].ToString()), errorCount);

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

        txtIndirectCosts.Attributes.Add("onkeypress", "javascript:CalcColIndirectCostValue(this);");
        txtIndirectCosts.Attributes.Add("onchange", "javascript:CalcColumnIndirectCosts(this);");

        txtTravelOtherMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtTravelOtherMileageRate.ClientID + "'" + ");");
        txtInstructionalStaffMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtInstructionalStaffMileageRate.ClientID + "'" + ");");
        txtSupervisoryStaffMileageRate.Attributes.Add("onchange", "javascript:UpdateToFloatValue(" + "'" + txtSupervisoryStaffMileageRate.ClientID + "'" + ");");

        txtFringeBenefitsNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtFBSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtFringeBenefitsNumofStaff.ClientID + "'" + ");");
        txtSSOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");
        txtSecretaryBookkeeperNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");
        txtAideParaprofessionalNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");


        txtSupervisorDirectorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");
        txtProjectCoordinatorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");
        txtOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtOtherNumofStaff.ClientID + "'" + ");");


        txtAdvisorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtClinicianNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtCoordinatorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSpecialistNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtIPSOtherNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtEducatorInstructorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtHomeVisitorNumofStaff.Attributes.Add("onchange", "javascript:SumColToSubTotalInt(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");




        txtSupervisorDirectorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");
        txtProjectCoordinatorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");
        txtOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                               "'" + txtOtherFTE.ClientID + "'" + ");");

        txtAdvisorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtClinicianFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtCoordinatorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtEducatorInstructorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtHomeVisitorFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtSpecialistFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtIPSOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtAideParaprofessionalFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtSecretaryBookkeeperFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtSSOtherFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtFringeBenefitsFTE.Attributes.Add("onchange", "javascript:SumColToSubTotalFloat(" + "'" + txtFBSubTotalFTE.ClientID + "'" + "," +
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
                                                                                                 "'" + txtFringeBenefitsNumofStaff.ClientID + "'" + ");");
        txtSSOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");
        txtSecretaryBookkeeperNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");
        txtAideParaprofessionalNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtSSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAideParaprofessionalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSecretaryBookkeeperNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSSOtherNumofStaff.ClientID + "'" + ");");


        txtSupervisorDirectorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");
        txtProjectCoordinatorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                 "'" + txtOtherNumofStaff.ClientID + "'" + ");");
        txtOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtAdminSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtSupervisorDirectorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtProjectCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                   "'" + txtOtherNumofStaff.ClientID + "'" + ");");


        txtAdvisorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                     "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtClinicianNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                       "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtCoordinatorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSpecialistNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                         "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtIPSOtherNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtEducatorInstructorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                               "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");
        txtHomeVisitorNumofStaff.Attributes.Add("onkeypress", "javascript:SumColToSubTotalIntKey(" + "'" + txtIPSSubTotalNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtAdvisorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtClinicianNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtCoordinatorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtEducatorInstructorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtHomeVisitorNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtSpecialistNumofStaff.ClientID + "'" + "," +
                                                                                                           "'" + txtIPSOtherNumofStaff.ClientID + "'" + ");");

        txtSupervisorDirectorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");
        txtProjectCoordinatorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                                       "'" + txtOtherFTE.ClientID + "'" + ");");
        txtOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtAdminSubTotalFTE.ClientID + "'" + "," +
                                                                               "'" + txtSupervisorDirectorFTE.ClientID + "'" + "," +
                                                                               "'" + txtProjectCoordinatorFTE.ClientID + "'" + "," +
                                                                               "'" + txtOtherFTE.ClientID + "'" + ");");

        txtAdvisorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtClinicianFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtCoordinatorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtEducatorInstructorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtHomeVisitorFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtSpecialistFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtIPSOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtIPSSubTotalFTE.ClientID + "'" + "," +
                                                                                    "'" + txtAdvisorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtClinicianFTE.ClientID + "'" + "," +
                                                                                    "'" + txtCoordinatorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtEducatorInstructorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtHomeVisitorFTE.ClientID + "'" + "," +
                                                                                    "'" + txtSpecialistFTE.ClientID + "'" + "," +
                                                                                    "'" + txtIPSOtherFTE.ClientID + "'" + ");");
        txtAideParaprofessionalFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtSecretaryBookkeeperFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtSSOtherFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtSSSubTotalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtAideParaprofessionalFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSecretaryBookkeeperFTE.ClientID + "'" + "," +
                                                                                       "'" + txtSSOtherFTE.ClientID + "'" + ");");
        txtFringeBenefitsFTE.Attributes.Add("onkeypress", "javascript:SumColToSubTotalFloatKey(" + "'" + txtFBSubTotalFTE.ClientID + "'" + "," +
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

    private int SaveBudgetNarrativeData(ref string errorMsg)
    {
        int BudgetNarrativeID = 0;


        if (Page.IsValid)
        {
            try
            {
                updateData();

                BudgetNarrativeID = dal.SaveBudgetNarrativeData((ViewState["BudgetNarrativeID"] == null) ? null : ViewState["BudgetNarrativeID"].ToString(),
                                                                         Int32.Parse(Session["GrantApplicantId"].ToString()),
                                                                         Session["Lead Agency Name"].ToString(),
                                                                         "",
                                                                         "",
                                                                         "",
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
                                                                         Decimal.Parse(txtIndirectPercent.Text),
                                                                        txtIndirectCostsDescr.Text,
                                                                        txtInstructionalEquipmentDescr.Text,
                                                                        txtNoninstructionalEquipmentDescr.Text,
                                                                        txtEqOtherDescr.Text,
                                                                        txtAncillaryDescr.Text,
                                                                         Int32.Parse(txtSupervisorDirectorColD.Text),
                                                                         Int32.Parse(txtProjectCoordinatorColD.Text),
                                                                         Int32.Parse(txtStipendColD.Text),
                                                                         Int32.Parse(txtOtherColD.Text),
                                                                         Int32.Parse(txtAdvisorColD.Text),
                                                                         Int32.Parse(txtClinicianColD.Text),
                                                                         Int32.Parse(txtCoordinatorColD.Text),
                                                                         Int32.Parse(txtEducatorInstructorColD.Text),
                                                                         Int32.Parse(txtHomeVisitorColD.Text),
                                                                         Int32.Parse(txtSpecialistColD.Text),
                                                                         Int32.Parse(txtIPSStipendColD.Text),
                                                                         Int32.Parse(txtIPSOtherColD.Text),
                                                                         Int32.Parse(txtAideParaprofessionalColD.Text),
                                                                         Int32.Parse(txtSecretaryBookkeeperColD.Text),
                                                                         Int32.Parse(txtSSOtherColD.Text),
                                                                         Int32.Parse(txtSSStipendColD.Text),
                                                                         Int32.Parse(txtFringeBenefitsColD.Text),
                                                                         Int32.Parse(txtCSAdvisorColD.Text),
                                                                         Int32.Parse(txtCSClinicianColD.Text),
                                                                         Int32.Parse(txtCSConsultantColD.Text),
                                                                         Int32.Parse(txtCSEducatorInstructorColD.Text),
                                                                         Int32.Parse(txtCSHomeVisitorColD.Text),
                                                                         Int32.Parse(txtCSSpecialistColD.Text),
                                                                         Int32.Parse(txtCSSpeakerColD.Text),
                                                                         Int32.Parse(txtCSSubstituteColD.Text),
                                                                         Int32.Parse(txtCSStipendColD.Text),
                                                                         Int32.Parse(txtCSOtherColD.Text),
                                                                         Int32.Parse(txtEducationalInstructionalMaterialsColD.Text),
                                                                         Int32.Parse(txtInstructionalTechnologySoftwareColD.Text),
                                                                         Int32.Parse(txtNonInstructionalSuppliesColD.Text),
                                                                         Int32.Parse(txtSMOtherColD.Text),
                                                                         Int32.Parse(txtSupervisoryStaffColD.Text),
                                                                         Int32.Parse(txtInstructionalStaffColD.Text),
                                                                         Int32.Parse(txtTravelOtherColD.Text),
                                                                         Int32.Parse(txtAdvertisingColD.Text),
                                                                         Int32.Parse(txtEquipmentRentalColD.Text),
                                                                         Int32.Parse(txtMaintenanceRepairsColD.Text),
                                                                         Int32.Parse(txtMembershipSubscriptionsColD.Text),
                                                                         Int32.Parse(txtPrintingReproductionColD.Text),
                                                                         Int32.Parse(txtStaffTrainingColD.Text),
                                                                         Int32.Parse(txtRentalofSpaceColD.Text),
                                                                         Int32.Parse(txtTelephoneUtilitiesColD.Text),
                                                                         Int32.Parse(txtDirectServiceTransportationColD.Text),
                                                                         Int32.Parse(txtOCOtherColD.Text),
                                                                         Int32.Parse(txtProfessionalDevelopOpportunitiesColD.Text),
                                                                         Int32.Parse(txtApplicationFeesColD.Text),
                                                                         Int32.Parse(txtCEUCoursesColD.Text),
                                                                         Int32.Parse(txtCollegeCoursesColD.Text),
                                                                         Int32.Parse(txtCBOtherColD.Text),
                                                                         Int32.Parse(txtInstructionalEquipmentColD.Text),
                                                                         Int32.Parse(txtNoninstructionalEquipmentColD.Text),
                                                                         Int32.Parse(txtEqOtherColD.Text),
                                                                         Int32.Parse(txtAncillaryColD.Text),
                                                                         Int32.Parse(txtSupervisorDirectorColF.Text),
                                                                         Int32.Parse(txtProjectCoordinatorColF.Text),
                                                                         Int32.Parse(txtStipendColF.Text),
                                                                         Int32.Parse(txtOtherColF.Text),
                                                                         Int32.Parse(txtAdvisorColF.Text),
                                                                         Int32.Parse(txtClinicianColF.Text),
                                                                         Int32.Parse(txtCoordinatorColF.Text),
                                                                         Int32.Parse(txtEducatorInstructorColF.Text),
                                                                         Int32.Parse(txtHomeVisitorColF.Text),
                                                                         Int32.Parse(txtSpecialistColF.Text),
                                                                         Int32.Parse(txtIPSStipendColF.Text),
                                                                         Int32.Parse(txtIPSOtherColF.Text),
                                                                         Int32.Parse(txtAideParaprofessionalColF.Text),
                                                                         Int32.Parse(txtSecretaryBookkeeperColF.Text),
                                                                         Int32.Parse(txtSSStipendColF.Text),
                                                                         Int32.Parse(txtSSOtherColF.Text),
                                                                         Int32.Parse(txtFringeBenefitsColF.Text),
                                                                         Int32.Parse(txtCSAdvisorColF.Text),
                                                                         Int32.Parse(txtCSClinicianColF.Text),
                                                                         Int32.Parse(txtCSConsultantColF.Text),
                                                                         Int32.Parse(txtCSEducatorInstructorColF.Text),
                                                                         Int32.Parse(txtCSHomeVisitorColF.Text),
                                                                         Int32.Parse(txtCSSpecialistColF.Text),
                                                                         Int32.Parse(txtCSSpeakerColF.Text),
                                                                         Int32.Parse(txtCSSubstituteColF.Text),
                                                                         Int32.Parse(txtCSStipendColF.Text),
                                                                         Int32.Parse(txtCSOtherColF.Text),
                                                                         Int32.Parse(txtEducationalInstructionalMaterialsColF.Text),
                                                                         Int32.Parse(txtInstructionalTechnologySoftwareColF.Text),
                                                                         Int32.Parse(txtNonInstructionalSuppliesColF.Text),
                                                                         Int32.Parse(txtSMOtherColF.Text),
                                                                         Int32.Parse(txtSupervisoryStaffColF.Text),
                                                                         Int32.Parse(txtInstructionalStaffColF.Text),
                                                                         Int32.Parse(txtTravelOtherColF.Text),
                                                                         Int32.Parse(txtAdvertisingColF.Text),
                                                                         Int32.Parse(txtEquipmentRentalColF.Text),
                                                                         Int32.Parse(txtMaintenanceRepairsColF.Text),
                                                                         Int32.Parse(txtMembershipSubscriptionsColF.Text),
                                                                         Int32.Parse(txtPrintingReproductionColF.Text),
                                                                         Int32.Parse(txtStaffTrainingColF.Text),
                                                                         Int32.Parse(txtRentalofSpaceColF.Text),
                                                                         Int32.Parse(txtTelephoneUtilitiesColF.Text),
                                                                         Int32.Parse(txtDirectServiceTransportationColF.Text),
                                                                         Int32.Parse(txtOCOtherColF.Text),
                                                                         Int32.Parse(txtProfessionalDevelopOpportunitiesColF.Text),
                                                                         Int32.Parse(txtApplicationFeesColF.Text),
                                                                         Int32.Parse(txtCEUCoursesColF.Text),
                                                                         Int32.Parse(txtCollegeCoursesColF.Text),
                                                                         Int32.Parse(txtCBOtherColF.Text),
                                                                         Int32.Parse(txtInstructionalEquipmentColF.Text),
                                                                         Int32.Parse(txtNoninstructionalEquipmentColF.Text),
                                                                         Int32.Parse(txtEqOtherColF.Text),
                                                                         Int32.Parse(txtAncillaryColF.Text),
                                                                         Int32.Parse(txtIndirectCosts.Text),
                                                                         Int32.Parse(txtSupervisorDirectorNumofStaff.Text),
                                                                         Decimal.Parse(txtSupervisorDirectorFTE.Text),
                                                                         Int32.Parse(txtProjectCoordinatorNumofStaff.Text),
                                                                         Decimal.Parse(txtProjectCoordinatorFTE.Text),
                                                                         Int32.Parse(txtOtherNumofStaff.Text),
                                                                         Decimal.Parse(txtOtherFTE.Text),
                                                                         Int32.Parse(txtAdvisorNumofStaff.Text),
                                                                         Decimal.Parse(txtAdvisorFTE.Text),
                                                                         Int32.Parse(txtClinicianNumofStaff.Text),
                                                                         Decimal.Parse(txtClinicianFTE.Text),
                                                                         Int32.Parse(txtCoordinatorNumofStaff.Text),
                                                                         Decimal.Parse(txtCoordinatorFTE.Text),
                                                                         Int32.Parse(txtEducatorInstructorNumofStaff.Text),
                                                                         Decimal.Parse(txtEducatorInstructorFTE.Text),
                                                                         Int32.Parse(txtHomeVisitorNumofStaff.Text),
                                                                         Decimal.Parse(txtHomeVisitorFTE.Text),
                                                                         Int32.Parse(txtSpecialistNumofStaff.Text),
                                                                         Decimal.Parse(txtSpecialistFTE.Text),
                                                                         Int32.Parse(txtIPSOtherNumofStaff.Text),
                                                                         Decimal.Parse(txtIPSOtherFTE.Text),
                                                                         Int32.Parse(txtAideParaprofessionalNumofStaff.Text),
                                                                         Decimal.Parse(txtAideParaprofessionalFTE.Text),
                                                                         Int32.Parse(txtSecretaryBookkeeperNumofStaff.Text),
                                                                         Decimal.Parse(txtSecretaryBookkeeperFTE.Text),
                                                                         Int32.Parse(txtSSOtherNumofStaff.Text),
                                                                         Decimal.Parse(txtSSOtherFTE.Text),
                                                                         Int32.Parse(txtFringeBenefitsNumofStaff.Text),
                                                                         Decimal.Parse(txtFringeBenefitsFTE.Text),
                                                                         Decimal.Parse(txtCSAdvisorRate.Text),
                                                                        txtCSAdvisorHDW.Text,
                                                                         Decimal.Parse(txtCSClinicianRate.Text),
                                                                        txtCSClinicianHDW.Text,
                                                                         Decimal.Parse(txtCSConsultantRate.Text),
                                                                        txtCSConsultantHDW.Text,
                                                                         Decimal.Parse(txtCSEducatorInstructorRate.Text),
                                                                        txtCSEducatorInstructorHDW.Text,
                                                                         Decimal.Parse(txtCSHomeVisitorRate.Text),
                                                                        txtCSHomeVisitorHDW.Text,
                                                                         Decimal.Parse(txtCSSpecialistRate.Text),
                                                                        txtCSSpecialistHDW.Text,
                                                                         Decimal.Parse(txtCSSpeakerRate.Text),
                                                                        txtCSSpeakerHDW.Text,
                                                                         Decimal.Parse(txtCSSubstituteRate.Text),
                                                                        txtCSSubstituteHDW.Text,
                                                                         Decimal.Parse(txtCSOtherRate.Text),
                                                                        txtCSOtherHDW.Text,
                                                                         Decimal.Parse(txtSupervisoryStaffMileageRate.Text),
                                                                         Decimal.Parse(txtInstructionalStaffMileageRate.Text),
                                                                         Decimal.Parse(txtTravelOtherMileageRate.Text),
                                                                        1,
                                                                        Int32.Parse(txtNumberOfChildren.Text));

                //Reload Master Page budget amount
                DataSet pds = dal.GetBudgetAmountTotal(Convert.ToInt32(Session["GrantApplicantId"]));
                DataRow dr = pds.Tables[0].Rows[0];
                Label lblBudgetAmount = (Label)Master.FindControl("lblBudgetAmount");
                if (lblBudgetAmount != null)
                {
                    lblBudgetAmount.Text = Decimal.Parse(dr["BudgetAmountTotal"].ToString()).ToString("N2");
                }

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
        txtIndirectPercent.Text = (string.IsNullOrEmpty(txtIndirectPercent.Text)) ? "0.00" : txtIndirectPercent.Text.Replace(",", "");
        txtSupervisorDirectorColD.Text = (string.IsNullOrEmpty(txtSupervisorDirectorColD.Text)) ? "0" : txtSupervisorDirectorColD.Text.Replace(",", "");
        txtProjectCoordinatorColD.Text = (string.IsNullOrEmpty(txtProjectCoordinatorColD.Text)) ? "0" : txtProjectCoordinatorColD.Text.Replace(",", "");
        txtStipendColD.Text = (string.IsNullOrEmpty(txtStipendColD.Text)) ? "0" : txtStipendColD.Text.Replace(",", "");
        txtOtherColD.Text = (string.IsNullOrEmpty(txtOtherColD.Text)) ? "0" : txtOtherColD.Text.Replace(",", "");
        txtAdvisorColD.Text = (string.IsNullOrEmpty(txtAdvisorColD.Text)) ? "0" : txtAdvisorColD.Text.Replace(",", "");
        txtClinicianColD.Text = (string.IsNullOrEmpty(txtClinicianColD.Text)) ? "0" : txtClinicianColD.Text.Replace(",", "");
        txtCoordinatorColD.Text = (string.IsNullOrEmpty(txtCoordinatorColD.Text)) ? "0" : txtCoordinatorColD.Text.Replace(",", "");
        txtEducatorInstructorColD.Text = (string.IsNullOrEmpty(txtEducatorInstructorColD.Text)) ? "0" : txtEducatorInstructorColD.Text.Replace(",", "");
        txtHomeVisitorColD.Text = (string.IsNullOrEmpty(txtHomeVisitorColD.Text)) ? "0" : txtHomeVisitorColD.Text.Replace(",", "");
        txtSpecialistColD.Text = (string.IsNullOrEmpty(txtSpecialistColD.Text)) ? "0" : txtSpecialistColD.Text.Replace(",", "");
        txtIPSStipendColD.Text = (string.IsNullOrEmpty(txtIPSStipendColD.Text)) ? "0" : txtIPSStipendColD.Text.Replace(",", "");
        txtIPSOtherColD.Text = (string.IsNullOrEmpty(txtIPSOtherColD.Text)) ? "0" : txtIPSOtherColD.Text.Replace(",", "");
        txtAideParaprofessionalColD.Text = (string.IsNullOrEmpty(txtAideParaprofessionalColD.Text)) ? "0" : txtAideParaprofessionalColD.Text.Replace(",", "");
        txtSecretaryBookkeeperColD.Text = (string.IsNullOrEmpty(txtSecretaryBookkeeperColD.Text)) ? "0" : txtSecretaryBookkeeperColD.Text.Replace(",", "");
        txtSSOtherColD.Text = (string.IsNullOrEmpty(txtSSOtherColD.Text)) ? "0" : txtSSOtherColD.Text.Replace(",", "");
        txtSSStipendColD.Text = (string.IsNullOrEmpty(txtSSStipendColD.Text)) ? "0" : txtSSStipendColD.Text.Replace(",", "");
        txtFringeBenefitsColD.Text = (string.IsNullOrEmpty(txtFringeBenefitsColD.Text)) ? "0" : txtFringeBenefitsColD.Text.Replace(",", "");
        txtCSAdvisorColD.Text = (string.IsNullOrEmpty(txtCSAdvisorColD.Text)) ? "0" : txtCSAdvisorColD.Text.Replace(",", "");
        txtCSClinicianColD.Text = (string.IsNullOrEmpty(txtCSClinicianColD.Text)) ? "0" : txtCSClinicianColD.Text.Replace(",", "");
        txtCSConsultantColD.Text = (string.IsNullOrEmpty(txtCSConsultantColD.Text)) ? "0" : txtCSConsultantColD.Text.Replace(",", "");
        txtCSEducatorInstructorColD.Text = (string.IsNullOrEmpty(txtCSEducatorInstructorColD.Text)) ? "0" : txtCSEducatorInstructorColD.Text.Replace(",", "");
        txtCSHomeVisitorColD.Text = (string.IsNullOrEmpty(txtCSHomeVisitorColD.Text)) ? "0" : txtCSHomeVisitorColD.Text.Replace(",", "");
        txtCSSpecialistColD.Text = (string.IsNullOrEmpty(txtCSSpecialistColD.Text)) ? "0" : txtCSSpecialistColD.Text.Replace(",", "");
        txtCSSpeakerColD.Text = (string.IsNullOrEmpty(txtCSSpeakerColD.Text)) ? "0" : txtCSSpeakerColD.Text.Replace(",", "");
        txtCSSubstituteColD.Text = (string.IsNullOrEmpty(txtCSSubstituteColD.Text)) ? "0" : txtCSSubstituteColD.Text.Replace(",", "");
        txtCSStipendColD.Text = (string.IsNullOrEmpty(txtCSStipendColD.Text)) ? "0" : txtCSStipendColD.Text.Replace(",", "");
        txtCSOtherColD.Text = (string.IsNullOrEmpty(txtCSOtherColD.Text)) ? "0" : txtCSOtherColD.Text.Replace(",", "");
        txtEducationalInstructionalMaterialsColD.Text = (string.IsNullOrEmpty(txtEducationalInstructionalMaterialsColD.Text)) ? "0" : txtEducationalInstructionalMaterialsColD.Text.Replace(",", "");
        txtInstructionalTechnologySoftwareColD.Text = (string.IsNullOrEmpty(txtInstructionalTechnologySoftwareColD.Text)) ? "0" : txtInstructionalTechnologySoftwareColD.Text.Replace(",", "");
        txtNonInstructionalSuppliesColD.Text = (string.IsNullOrEmpty(txtNonInstructionalSuppliesColD.Text)) ? "0" : txtNonInstructionalSuppliesColD.Text.Replace(",", "");
        txtSMOtherColD.Text = (string.IsNullOrEmpty(txtSMOtherColD.Text)) ? "0" : txtSMOtherColD.Text.Replace(",", "");
        txtSupervisoryStaffColD.Text = (string.IsNullOrEmpty(txtSupervisoryStaffColD.Text)) ? "0" : txtSupervisoryStaffColD.Text.Replace(",", "");
        txtInstructionalStaffColD.Text = (string.IsNullOrEmpty(txtInstructionalStaffColD.Text)) ? "0" : txtInstructionalStaffColD.Text.Replace(",", "");
        txtTravelOtherColD.Text = (string.IsNullOrEmpty(txtTravelOtherColD.Text)) ? "0" : txtTravelOtherColD.Text.Replace(",", "");
        txtAdvertisingColD.Text = (string.IsNullOrEmpty(txtAdvertisingColD.Text)) ? "0" : txtAdvertisingColD.Text.Replace(",", "");
        txtEquipmentRentalColD.Text = (string.IsNullOrEmpty(txtEquipmentRentalColD.Text)) ? "0" : txtEquipmentRentalColD.Text.Replace(",", "");
        txtMaintenanceRepairsColD.Text = (string.IsNullOrEmpty(txtMaintenanceRepairsColD.Text)) ? "0" : txtMaintenanceRepairsColD.Text.Replace(",", "");
        txtMembershipSubscriptionsColD.Text = (string.IsNullOrEmpty(txtMembershipSubscriptionsColD.Text)) ? "0" : txtMembershipSubscriptionsColD.Text.Replace(",", "");
        txtPrintingReproductionColD.Text = (string.IsNullOrEmpty(txtPrintingReproductionColD.Text)) ? "0" : txtPrintingReproductionColD.Text.Replace(",", "");
        txtStaffTrainingColD.Text = (string.IsNullOrEmpty(txtStaffTrainingColD.Text)) ? "0" : txtStaffTrainingColD.Text.Replace(",", "");
        txtRentalofSpaceColD.Text = (string.IsNullOrEmpty(txtRentalofSpaceColD.Text)) ? "0" : txtRentalofSpaceColD.Text.Replace(",", "");
        txtTelephoneUtilitiesColD.Text = (string.IsNullOrEmpty(txtTelephoneUtilitiesColD.Text)) ? "0" : txtTelephoneUtilitiesColD.Text.Replace(",", "");
        txtDirectServiceTransportationColD.Text = (string.IsNullOrEmpty(txtDirectServiceTransportationColD.Text)) ? "0" : txtDirectServiceTransportationColD.Text.Replace(",", "");
        txtOCOtherColD.Text = (string.IsNullOrEmpty(txtOCOtherColD.Text)) ? "0" : txtOCOtherColD.Text.Replace(",", "");
        txtProfessionalDevelopOpportunitiesColD.Text = (string.IsNullOrEmpty(txtProfessionalDevelopOpportunitiesColD.Text)) ? "0" : txtProfessionalDevelopOpportunitiesColD.Text.Replace(",", "");
        txtApplicationFeesColD.Text = (string.IsNullOrEmpty(txtApplicationFeesColD.Text)) ? "0" : txtApplicationFeesColD.Text.Replace(",", "");
        txtCEUCoursesColD.Text = (string.IsNullOrEmpty(txtCEUCoursesColD.Text)) ? "0" : txtCEUCoursesColD.Text.Replace(",", "");
        txtCollegeCoursesColD.Text = (string.IsNullOrEmpty(txtCollegeCoursesColD.Text)) ? "0" : txtCollegeCoursesColD.Text.Replace(",", "");
        txtCBOtherColD.Text = (string.IsNullOrEmpty(txtCBOtherColD.Text)) ? "0" : txtCBOtherColD.Text.Replace(",", "");
        txtInstructionalEquipmentColD.Text = (string.IsNullOrEmpty(txtInstructionalEquipmentColD.Text)) ? "0" : txtInstructionalEquipmentColD.Text.Replace(",", "");
        txtNoninstructionalEquipmentColD.Text = (string.IsNullOrEmpty(txtNoninstructionalEquipmentColD.Text)) ? "0" : txtNoninstructionalEquipmentColD.Text.Replace(",", "");
        txtEqOtherColD.Text = (string.IsNullOrEmpty(txtEqOtherColD.Text)) ? "0" : txtEqOtherColD.Text.Replace(",", "");
        txtAncillaryColD.Text = (string.IsNullOrEmpty(txtAncillaryColD.Text)) ? "0" : txtAncillaryColD.Text.Replace(",", "");

        txtSupervisorDirectorColF.Text = (string.IsNullOrEmpty(txtSupervisorDirectorColF.Text)) ? "0" : txtSupervisorDirectorColF.Text.Replace(",", "");
        txtProjectCoordinatorColF.Text = (string.IsNullOrEmpty(txtProjectCoordinatorColF.Text)) ? "0" : txtProjectCoordinatorColF.Text.Replace(",", "");
        txtStipendColF.Text = (string.IsNullOrEmpty(txtStipendColF.Text)) ? "0" : txtStipendColF.Text.Replace(",", "");
        txtOtherColF.Text = (string.IsNullOrEmpty(txtOtherColF.Text)) ? "0" : txtOtherColF.Text.Replace(",", "");
        txtAdvisorColF.Text = (string.IsNullOrEmpty(txtAdvisorColF.Text)) ? "0" : txtAdvisorColF.Text.Replace(",", "");
        txtClinicianColF.Text = (string.IsNullOrEmpty(txtClinicianColF.Text)) ? "0" : txtClinicianColF.Text.Replace(",", "");
        txtCoordinatorColF.Text = (string.IsNullOrEmpty(txtCoordinatorColF.Text)) ? "0" : txtCoordinatorColF.Text.Replace(",", "");
        txtEducatorInstructorColF.Text = (string.IsNullOrEmpty(txtEducatorInstructorColF.Text)) ? "0" : txtEducatorInstructorColF.Text.Replace(",", "");
        txtHomeVisitorColF.Text = (string.IsNullOrEmpty(txtHomeVisitorColF.Text)) ? "0" : txtHomeVisitorColF.Text.Replace(",", "");
        txtSpecialistColF.Text = (string.IsNullOrEmpty(txtSpecialistColF.Text)) ? "0" : txtSpecialistColF.Text.Replace(",", "");
        txtIPSStipendColF.Text = (string.IsNullOrEmpty(txtIPSStipendColF.Text)) ? "0" : txtIPSStipendColF.Text.Replace(",", "");
        txtIPSOtherColF.Text = (string.IsNullOrEmpty(txtIPSOtherColF.Text)) ? "0" : txtIPSOtherColF.Text.Replace(",", "");
        txtAideParaprofessionalColF.Text = (string.IsNullOrEmpty(txtAideParaprofessionalColF.Text)) ? "0" : txtAideParaprofessionalColF.Text.Replace(",", "");
        txtSecretaryBookkeeperColF.Text = (string.IsNullOrEmpty(txtSecretaryBookkeeperColF.Text)) ? "0" : txtSecretaryBookkeeperColF.Text.Replace(",", "");
        txtSSStipendColF.Text = (string.IsNullOrEmpty(txtSSStipendColF.Text)) ? "0" : txtSSStipendColF.Text.Replace(",", "");
        txtSSOtherColF.Text = (string.IsNullOrEmpty(txtSSOtherColF.Text)) ? "0" : txtSSOtherColF.Text.Replace(",", "");
        txtFringeBenefitsColF.Text = (string.IsNullOrEmpty(txtFringeBenefitsColF.Text)) ? "0" : txtFringeBenefitsColF.Text.Replace(",", "");
        txtCSAdvisorColF.Text = (string.IsNullOrEmpty(txtCSAdvisorColF.Text)) ? "0" : txtCSAdvisorColF.Text.Replace(",", "");
        txtCSClinicianColF.Text = (string.IsNullOrEmpty(txtCSClinicianColF.Text)) ? "0" : txtCSClinicianColF.Text.Replace(",", "");
        txtCSConsultantColF.Text = (string.IsNullOrEmpty(txtCSConsultantColF.Text)) ? "0" : txtCSConsultantColF.Text.Replace(",", "");
        txtCSEducatorInstructorColF.Text = (string.IsNullOrEmpty(txtCSEducatorInstructorColF.Text)) ? "0" : txtCSEducatorInstructorColF.Text.Replace(",", "");
        txtCSHomeVisitorColF.Text = (string.IsNullOrEmpty(txtCSHomeVisitorColF.Text)) ? "0" : txtCSHomeVisitorColF.Text.Replace(",", "");
        txtCSSpecialistColF.Text = (string.IsNullOrEmpty(txtCSSpecialistColF.Text)) ? "0" : txtCSSpecialistColF.Text.Replace(",", "");
        txtCSSpeakerColF.Text = (string.IsNullOrEmpty(txtCSSpeakerColF.Text)) ? "0" : txtCSSpeakerColF.Text.Replace(",", "");
        txtCSSubstituteColF.Text = (string.IsNullOrEmpty(txtCSSubstituteColF.Text)) ? "0" : txtCSSubstituteColF.Text.Replace(",", "");
        txtCSStipendColF.Text = (string.IsNullOrEmpty(txtCSStipendColF.Text)) ? "0" : txtCSStipendColF.Text.Replace(",", "");
        txtCSOtherColF.Text = (string.IsNullOrEmpty(txtCSOtherColF.Text)) ? "0" : txtCSOtherColF.Text.Replace(",", "");
        txtEducationalInstructionalMaterialsColF.Text = (string.IsNullOrEmpty(txtEducationalInstructionalMaterialsColF.Text)) ? "0" : txtEducationalInstructionalMaterialsColF.Text.Replace(",", "");
        txtInstructionalTechnologySoftwareColF.Text = (string.IsNullOrEmpty(txtInstructionalTechnologySoftwareColF.Text)) ? "0" : txtInstructionalTechnologySoftwareColF.Text.Replace(",", "");
        txtNonInstructionalSuppliesColF.Text = (string.IsNullOrEmpty(txtNonInstructionalSuppliesColF.Text)) ? "0" : txtNonInstructionalSuppliesColF.Text.Replace(",", "");
        txtSMOtherColF.Text = (string.IsNullOrEmpty(txtSMOtherColF.Text)) ? "0" : txtSMOtherColF.Text.Replace(",", "");
        txtSupervisoryStaffColF.Text = (string.IsNullOrEmpty(txtSupervisoryStaffColF.Text)) ? "0" : txtSupervisoryStaffColF.Text.Replace(",", "");
        txtInstructionalStaffColF.Text = (string.IsNullOrEmpty(txtInstructionalStaffColF.Text)) ? "0" : txtInstructionalStaffColF.Text.Replace(",", "");
        txtTravelOtherColF.Text = (string.IsNullOrEmpty(txtTravelOtherColF.Text)) ? "0" : txtTravelOtherColF.Text.Replace(",", "");
        txtAdvertisingColF.Text = (string.IsNullOrEmpty(txtAdvertisingColF.Text)) ? "0" : txtAdvertisingColF.Text.Replace(",", "");
        txtEquipmentRentalColF.Text = (string.IsNullOrEmpty(txtEquipmentRentalColF.Text)) ? "0" : txtEquipmentRentalColF.Text.Replace(",", "");
        txtMaintenanceRepairsColF.Text = (string.IsNullOrEmpty(txtMaintenanceRepairsColF.Text)) ? "0" : txtMaintenanceRepairsColF.Text.Replace(",", "");
        txtMembershipSubscriptionsColF.Text = (string.IsNullOrEmpty(txtMembershipSubscriptionsColF.Text)) ? "0" : txtMembershipSubscriptionsColF.Text.Replace(",", "");
        txtPrintingReproductionColF.Text = (string.IsNullOrEmpty(txtPrintingReproductionColF.Text)) ? "0" : txtPrintingReproductionColF.Text.Replace(",", "");
        txtStaffTrainingColF.Text = (string.IsNullOrEmpty(txtStaffTrainingColF.Text)) ? "0" : txtStaffTrainingColF.Text.Replace(",", "");
        txtRentalofSpaceColF.Text = (string.IsNullOrEmpty(txtRentalofSpaceColF.Text)) ? "0" : txtRentalofSpaceColF.Text.Replace(",", "");
        txtTelephoneUtilitiesColF.Text = (string.IsNullOrEmpty(txtTelephoneUtilitiesColF.Text)) ? "0" : txtTelephoneUtilitiesColF.Text.Replace(",", "");
        txtDirectServiceTransportationColF.Text = (string.IsNullOrEmpty(txtDirectServiceTransportationColF.Text)) ? "0" : txtDirectServiceTransportationColF.Text.Replace(",", "");
        txtOCOtherColF.Text = (string.IsNullOrEmpty(txtOCOtherColF.Text)) ? "0" : txtOCOtherColF.Text.Replace(",", "");
        txtProfessionalDevelopOpportunitiesColF.Text = (string.IsNullOrEmpty(txtProfessionalDevelopOpportunitiesColF.Text)) ? "0" : txtProfessionalDevelopOpportunitiesColF.Text.Replace(",", "");
        txtApplicationFeesColF.Text = (string.IsNullOrEmpty(txtApplicationFeesColF.Text)) ? "0" : txtApplicationFeesColF.Text.Replace(",", "");
        txtCEUCoursesColF.Text = (string.IsNullOrEmpty(txtCEUCoursesColF.Text)) ? "0" : txtCEUCoursesColF.Text.Replace(",", "");
        txtCollegeCoursesColF.Text = (string.IsNullOrEmpty(txtCollegeCoursesColF.Text)) ? "0" : txtCollegeCoursesColF.Text.Replace(",", "");
        txtCBOtherColF.Text = (string.IsNullOrEmpty(txtCBOtherColF.Text)) ? "0" : txtCBOtherColF.Text.Replace(",", "");
        txtInstructionalEquipmentColF.Text = (string.IsNullOrEmpty(txtInstructionalEquipmentColF.Text)) ? "0" : txtInstructionalEquipmentColF.Text.Replace(",", "");
        txtNoninstructionalEquipmentColF.Text = (string.IsNullOrEmpty(txtNoninstructionalEquipmentColF.Text)) ? "0" : txtNoninstructionalEquipmentColF.Text.Replace(",", "");
        txtEqOtherColF.Text = (string.IsNullOrEmpty(txtEqOtherColF.Text)) ? "0" : txtEqOtherColF.Text.Replace(",", "");
        txtAncillaryColF.Text = (string.IsNullOrEmpty(txtAncillaryColF.Text)) ? "0" : txtAncillaryColF.Text.Replace(",", "");

        txtSupervisorDirectorNumofStaff.Text = (string.IsNullOrEmpty(txtSupervisorDirectorNumofStaff.Text)) ? "0" : txtSupervisorDirectorNumofStaff.Text.Replace(",", "");
        txtSupervisorDirectorFTE.Text = (string.IsNullOrEmpty(txtSupervisorDirectorFTE.Text)) ? "0" : txtSupervisorDirectorFTE.Text.Replace(",", "");
        txtProjectCoordinatorNumofStaff.Text = (string.IsNullOrEmpty(txtProjectCoordinatorNumofStaff.Text)) ? "0" : txtProjectCoordinatorNumofStaff.Text.Replace(",", "");
        txtProjectCoordinatorFTE.Text = (string.IsNullOrEmpty(txtProjectCoordinatorFTE.Text)) ? "0" : txtProjectCoordinatorFTE.Text.Replace(",", "");
        txtOtherNumofStaff.Text = (string.IsNullOrEmpty(txtOtherNumofStaff.Text)) ? "0" : txtOtherNumofStaff.Text.Replace(",", "");
        txtOtherFTE.Text = (string.IsNullOrEmpty(txtOtherFTE.Text)) ? "0" : txtOtherFTE.Text.Replace(",", "");
        txtAdvisorNumofStaff.Text = (string.IsNullOrEmpty(txtAdvisorNumofStaff.Text)) ? "0" : txtAdvisorNumofStaff.Text.Replace(",", "");
        txtAdvisorFTE.Text = (string.IsNullOrEmpty(txtAdvisorFTE.Text)) ? "0" : txtAdvisorFTE.Text.Replace(",", "");
        txtClinicianNumofStaff.Text = (string.IsNullOrEmpty(txtClinicianNumofStaff.Text)) ? "0" : txtClinicianNumofStaff.Text.Replace(",", "");
        txtClinicianFTE.Text = (string.IsNullOrEmpty(txtClinicianFTE.Text)) ? "0" : txtClinicianFTE.Text.Replace(",", "");
        txtCoordinatorNumofStaff.Text = (string.IsNullOrEmpty(txtCoordinatorNumofStaff.Text)) ? "0" : txtCoordinatorNumofStaff.Text.Replace(",", "");
        txtCoordinatorFTE.Text = (string.IsNullOrEmpty(txtCoordinatorFTE.Text)) ? "0" : txtCoordinatorFTE.Text.Replace(",", "");
        txtEducatorInstructorNumofStaff.Text = (string.IsNullOrEmpty(txtEducatorInstructorNumofStaff.Text)) ? "0" : txtEducatorInstructorNumofStaff.Text.Replace(",", "");
        txtEducatorInstructorFTE.Text = (string.IsNullOrEmpty(txtEducatorInstructorFTE.Text)) ? "0" : txtEducatorInstructorFTE.Text.Replace(",", "");
        txtHomeVisitorNumofStaff.Text = (string.IsNullOrEmpty(txtHomeVisitorNumofStaff.Text)) ? "0" : txtHomeVisitorNumofStaff.Text.Replace(",", "");
        txtHomeVisitorFTE.Text = (string.IsNullOrEmpty(txtHomeVisitorFTE.Text)) ? "0" : txtHomeVisitorFTE.Text.Replace(",", "");
        txtSpecialistNumofStaff.Text = (string.IsNullOrEmpty(txtSpecialistNumofStaff.Text)) ? "0" : txtSpecialistNumofStaff.Text.Replace(",", "");
        txtSpecialistFTE.Text = (string.IsNullOrEmpty(txtSpecialistFTE.Text)) ? "0" : txtSpecialistFTE.Text.Replace(",", "");
        txtIPSOtherNumofStaff.Text = (string.IsNullOrEmpty(txtIPSOtherNumofStaff.Text)) ? "0" : txtIPSOtherNumofStaff.Text.Replace(",", "");
        txtIPSOtherFTE.Text = (string.IsNullOrEmpty(txtIPSOtherFTE.Text)) ? "0" : txtIPSOtherFTE.Text.Replace(",", "");
        txtAideParaprofessionalNumofStaff.Text = (string.IsNullOrEmpty(txtAideParaprofessionalNumofStaff.Text)) ? "0" : txtAideParaprofessionalNumofStaff.Text.Replace(",", "");
        txtAideParaprofessionalFTE.Text = (string.IsNullOrEmpty(txtAideParaprofessionalFTE.Text)) ? "0" : txtAideParaprofessionalFTE.Text.Replace(",", "");
        txtSecretaryBookkeeperNumofStaff.Text = (string.IsNullOrEmpty(txtSecretaryBookkeeperNumofStaff.Text)) ? "0" : txtSecretaryBookkeeperNumofStaff.Text.Replace(",", "");
        txtSecretaryBookkeeperFTE.Text = (string.IsNullOrEmpty(txtSecretaryBookkeeperFTE.Text)) ? "0" : txtSecretaryBookkeeperFTE.Text.Replace(",", "");
        txtSSOtherNumofStaff.Text = (string.IsNullOrEmpty(txtSSOtherNumofStaff.Text)) ? "0" : txtSSOtherNumofStaff.Text.Replace(",", "");
        txtSSOtherFTE.Text = (string.IsNullOrEmpty(txtSSOtherFTE.Text)) ? "0" : txtSSOtherFTE.Text.Replace(",", "");
        txtFringeBenefitsNumofStaff.Text = (string.IsNullOrEmpty(txtFringeBenefitsNumofStaff.Text)) ? "0" : txtFringeBenefitsNumofStaff.Text.Replace(",", "");
        txtFringeBenefitsFTE.Text = (string.IsNullOrEmpty(txtFringeBenefitsFTE.Text)) ? "0" : txtFringeBenefitsFTE.Text.Replace(",", "");
        txtCSAdvisorRate.Text = (string.IsNullOrEmpty(txtCSAdvisorRate.Text)) ? "0" : txtCSAdvisorRate.Text.Replace(",", "");
        txtCSClinicianRate.Text = (string.IsNullOrEmpty(txtCSClinicianRate.Text)) ? "0" : txtCSClinicianRate.Text.Replace(",", "");
        txtCSConsultantRate.Text = (string.IsNullOrEmpty(txtCSConsultantRate.Text)) ? "0" : txtCSConsultantRate.Text.Replace(",", "");
        txtCSEducatorInstructorRate.Text = (string.IsNullOrEmpty(txtCSEducatorInstructorRate.Text)) ? "0" : txtCSEducatorInstructorRate.Text.Replace(",", "");
        txtCSHomeVisitorRate.Text = (string.IsNullOrEmpty(txtCSHomeVisitorRate.Text)) ? "0" : txtCSHomeVisitorRate.Text.Replace(",", "");
        txtCSSpecialistRate.Text = (string.IsNullOrEmpty(txtCSSpecialistRate.Text)) ? "0" : txtCSSpecialistRate.Text.Replace(",", "");
        txtCSSpeakerRate.Text = (string.IsNullOrEmpty(txtCSSpeakerRate.Text)) ? "0" : txtCSSpeakerRate.Text.Replace(",", "");
        txtCSSubstituteRate.Text = (string.IsNullOrEmpty(txtCSSubstituteRate.Text)) ? "0" : txtCSSubstituteRate.Text.Replace(",", "");
        txtCSOtherRate.Text = (string.IsNullOrEmpty(txtCSOtherRate.Text)) ? "0" : txtCSOtherRate.Text.Replace(",", "");
        txtSupervisoryStaffMileageRate.Text = (string.IsNullOrEmpty(txtSupervisoryStaffMileageRate.Text)) ? "0" : txtSupervisoryStaffMileageRate.Text.Replace(",", "");
        txtInstructionalStaffMileageRate.Text = (string.IsNullOrEmpty(txtInstructionalStaffMileageRate.Text)) ? "0" : txtInstructionalStaffMileageRate.Text.Replace(",", "");
        txtTravelOtherMileageRate.Text = (string.IsNullOrEmpty(txtTravelOtherMileageRate.Text)) ? "0" : txtTravelOtherMileageRate.Text.Replace(",", "");
        txtIndirectCosts.Text = (string.IsNullOrEmpty(txtIndirectCosts.Text)) ? "0" : txtIndirectCosts.Text.Replace(",", "");
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
        txtCBOtherDescr.CssClass = "styleUnHighlight";

        txtAncillary.CssClass = "styleUnHighlight";
        txtAncillaryDescr.CssClass = "styleUnHighlight";
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
            BudgetNarrativeID = SaveBudgetNarrativeData(ref errorMsg);

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
            BudgetNarrativeID = SaveBudgetNarrativeData(ref errorMsg);

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
            BudgetNarrativeID = SaveBudgetNarrativeData(ref errorMsg);


            if (BudgetNarrativeID > -1)
            {
                ViewState["BudgetNarrativeID"] = BudgetNarrativeID;

                BindData(true);
            }
        }

        catch (Exception ex)
        {

        }

        Response.Redirect("Print.aspx?type=LeadAgencyBudget");
    }

    protected void btnCancelSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckList.aspx");
    }

    protected void btnNextPart_Click(object sender, EventArgs e)
    {
        Response.Redirect("BudgetNarrativeSubcontractorHome.aspx");
    }

    private void displayErrorHighlight(List<string> lstBoxes)
    {
        Control ContentPlaceHolder = Form.FindControl("ContentPlaceHolder1");

        for (int i = 0; i < lstBoxes.Count; i++)
        {
            if (!DisabledColumn.ContainsKey(lstBoxes[i]))
            {
                ((WebControl)ContentPlaceHolder.FindControl(lstBoxes[i])).CssClass = "styleHighlight";
            }
        }
    }
}