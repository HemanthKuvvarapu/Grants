using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Amendment
/// </summary>
public class Amendment
{
	public Amendment()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GrantRenewalCom"].ToString();
    }

    public string GetConnStringForLicensing()
    {
        return ConfigurationManager.ConnectionStrings["Licensing"].ToString();
    }

    //amend jwong
    public int SaveAmendmentSubmitDate(int GrantApplicantId, int Version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = Version;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveAmendmentSubmitDate", pArray);
    }

    //amend jwong
    public DataSet GetAmendmentSubmitData(int GrantApplicantId, int Version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = Version;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantAmendmentHeaderInfo", pArray);
    }

    //amend jwong
    public DataSet GetCoverPageAmendmentData(string GrantApplicantId, string version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetCoverSheetDataAmendment", pArray);
    }

    //amend jwong
    public int SaveAgencySuperContactAmendmentInfo(int GrantApplicantId, string ContactName, string ContactEmail, string ContactPhone, string ContactTitle, string version)
    {
        SqlParameter[] pArray = new SqlParameter[6];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@ContactName", SqlDbType.VarChar, 100);
        pArray[1].Value = ContactName;

        pArray[2] = new SqlParameter("@ContactEmail", SqlDbType.VarChar, 100);
        pArray[2].Value = ContactEmail;

        pArray[3] = new SqlParameter("@ContactPhone", SqlDbType.VarChar, 50);
        pArray[3].Value = ContactPhone;

        pArray[4] = new SqlParameter("@ContactTitle", SqlDbType.VarChar, 100);
        pArray[4].Value = ContactTitle;

        pArray[5] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[5].Value = version;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveSuperContactAmendmentInfo", pArray);
    }

    //amend jwong
    public int DeleteAmendmentData(int SCID, int version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@SCID", SqlDbType.Int);
        pArray[0].Value = SCID;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteAmendmentData", pArray);
    }

    public int DeleteSubcontractorAmendmentData(int SCID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@SCID", SqlDbType.Int);
        pArray[0].Value = SCID;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteSubcontractorAmendmentData", pArray);
    }

    //new jwong
    public int UpdateBudgetAmendmentErrorCount(int budgetNarrativeId, int version, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@budgetNarrativeID", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[2].Value = errorCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateBudgetAmendmentErrorCount", pArray);
    }

    //new jwong
    public int UpdateBudgetAmendmentWarningCount(int budgetNarrativeId, int version, int warningCount)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@budgetNarrativeID", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@WarningCount", SqlDbType.Int);
        pArray[2].Value = warningCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateBudgetAmendmentWarningCount", pArray);
    }

    /*new jwong*/
    public DataSet GetBudgetNarrativeDataAmendment(int budgetNarrativeId, int version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@budgetNarrativeID", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetNarrativeDataAmendment", pArray);
    }

    //new jwong
    public DataSet GetBudgetAmendmentSummary(int GrantApplicantId, int version)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetAmendmentSummary", pArray);
    }

    //amendment
    public int SaveBudgetNarrativeDataAmendment(int budgetNarrativeID,
                                                int GrantApplicantId,
                                                string SupervisorDirectorDescr,
                                                string ProjectCoordinatorDescr,
                                                string StipendDescr,
                                                string OtherDescr,
                                                string AdvisorDescr,
                                                string ClinicianDescr,
                                                string CoordinatorDescr,
                                                string EducatorInstructorDescr,
                                                string HomeVisitorDescr,
                                                string SpecialistDescr,
                                                string IPSStipendDescr,
                                                string IPSOtherDescr,
                                                string AideParaprofessionalDescr,
                                                string SecretaryBookkeeperDescr,
                                                string SSStipendDescr,
                                                string SSOtherDescr,
                                                string FringeBenefitsDescr,
                                                string CSAdvisorDescr,
                                                string CSClinicianDescr,
                                                string CSConsultantDescr,
                                                string CSEducatorInstructorDescr,
                                                string CSHomeVisitorDescr,
                                                string CSSpecialistDescr,
                                                string CSSpeakerDescr,
                                                string CSSubstituteDescr,
                                                string CSStipendDescr,
                                                string CSOtherDescr,
                                                string EducationalInstructionalMaterialsDescr,
                                                string InstructionalTechnologySoftwareDescr,
                                                string NonInstructionalSuppliesDescr,
                                                string SMOtherDescr,
                                                string SupervisoryStaffDescr,
                                                string InstructionalStaffDescr,
                                                string TraveOtherDescr,
                                                string AdvertisingDescr,
                                                string EquipmentRentalDescr,
                                                string MaintenanceRepairsDescr,
                                                string MembershipSubscriptionsDescr,
                                                string PrintingReproductionDescr,
                                                string StaffTrainingDescr,
                                                string RentalofSpaceDescr,
                                                string TelephoneUtilitiesDescr,
                                                string DirectServiceTransportationDescr,
                                                string OCOtherDescr,
                                                string ProfessionalDevelopOpportunitiesDescr,
                                                string ApplicationFeesDescr,
                                                string CEUCoursesDescr,
                                                string CollegeCoursesDescr,
                                                string CBOtherDescr,
                                                string IndirectPercent,
                                                string IndirectCostsDescr,
                                                string InstructionalEquipmentDescr,
                                                string NoninstructionalEquipmentDescr,
                                                string EqOtherDescr,
                                                string AncillaryDescr,
                                                string SupervisorDirectorColD,
                                                string ProjectCoordinatorColD,
                                                string StipendColD,
                                                string OtherColD,
                                                string AdvisorColD,
                                                string ClinicianColD,
                                                string CoordinatorColD,
                                                string EducatorInstructorColD,
                                                string HomeVisitorColD,
                                                string SpecialistColD,
                                                string IPSStipendColD,
                                                string IPSOtherColD,
                                                string AideParaprofessionalColD,
                                                string SecretaryBookkeeperColD,
                                                string SSOtherColD,
                                                string SSStipendColD,
                                                string FringeBenefitsColD,
                                                string CSAdvisorColD,
                                                string CSClinicianColD,
                                                string CSConsultantColD,
                                                string CSEducatorInstructorColD,
                                                string CSHomeVisitorColD,
                                                string CSSpecialistColD,
                                                string CSSpeakerColD,
                                                string CSSubstituteColD,
                                                string CSStipendColD,
                                                string CSOtherColD,
                                                string EducationalInstructionalMaterialsColD,
                                                string InstructionalTechnologySoftwareColD,
                                                string NonInstructionalSuppliesColD,
                                                string SMOtherColD,
                                                string SupervisoryStaffColD,
                                                string InstructionalStaffColD,
                                                string TravelOtherColD,
                                                string AdvertisingColD,
                                                string EquipmentRentalColD,
                                                string MaintenanceRepairsColD,
                                                string MembershipSubscriptionsColD,
                                                string PrintingReproductionColD,
                                                string StaffTrainingColD,
                                                string RentalofSpaceColD,
                                                string TelephoneUtilitiesColD,
                                                string DirectServiceTransportationColD,
                                                string OCOtherColD,
                                                string ProfessionalDevelopOpportunitiesColD,
                                                string ApplicationFeesColD,
                                                string CEUCoursesColD,
                                                string CollegeCoursesColD,
                                                string CBOtherColD,
                                                string InstructionalEquipmentColD,
                                                string NoninstructionalEquipmentColD,
                                                string EqOtherColD,
                                                string AncillaryColD,
                                                string SupervisorDirectorColF,
                                                string ProjectCoordinatorColF,
                                                string StipendColF,
                                                string OtherColF,
                                                string AdvisorColF,
                                                string ClinicianColF,
                                                string CoordinatorColF,
                                                string EducatorInstructorColF,
                                                string HomeVisitorColF,
                                                string SpecialistColF,
                                                string IPSStipendColF,
                                                string IPSOtherColF,
                                                string AideParaprofessionalColF,
                                                string SecretaryBookkeeperColF,
                                                string SSStipendColF,
                                                string SSOtherColF,
                                                string FringeBenefitsColF,
                                                string CSAdvisorColF,
                                                string CSClinicianColF,
                                                string CSConsultantColF,
                                                string CSEducatorInstructorColF,
                                                string CSHomeVisitorColF,
                                                string CSSpecialistColF,
                                                string CSSpeakerColF,
                                                string CSSubstituteColF,
                                                string CSStipendColF,
                                                string CSOtherColF,
                                                string EducationalInstructionalMaterialsColF,
                                                string InstructionalTechnologySoftwareColF,
                                                string NonInstructionalSuppliesColF,
                                                string SMOtherColF,
                                                string SupervisoryStaffColF,
                                                string InstructionalStaffColF,
                                                string TravelOtherColF,
                                                string AdvertisingColF,
                                                string EquipmentRentalColF,
                                                string MaintenanceRepairsColF,
                                                string MembershipSubscriptionsColF,
                                                string PrintingReproductionColF,
                                                string StaffTrainingColF,
                                                string RentalofSpaceColF,
                                                string TelephoneUtilitiesColF,
                                                string DirectServiceTransportationColF,
                                                string OCOtherColF,
                                                string ProfessionalDevelopOpportunitiesColF,
                                                string ApplicationFeesColF,
                                                string CEUCoursesColF,
                                                string CollegeCoursesColF,
                                                string CBOtherColF,
                                                string InstructionalEquipmentColF,
                                                string NoninstructionalEquipmentColF,
                                                string EqOtherColF,
                                                string AncillaryColF,
                                                string IndirectCosts,
                                                string SupervisorDirectorNumofStaff,
                                                string SupervisorDirectorFTE,
                                                string ProjectCoordinatorNumofStaff,
                                                string ProjectCoordinatorFTE,
                                                string OtherNumofStaff,
                                                string OtherFTE,
                                                string AdvisorNumofStaff,
                                                string AdvisorFTE,
                                                string ClinicianNumofStaff,
                                                string ClinicianFTE,
                                                string CoordinatorNumofStaff,
                                                string CoordinatorFTE,
                                                string EducatorInstructorNumofStaff,
                                                string EducatorInstructorFTE,
                                                string HomeVisitorNumofStaff,
                                                string HomeVisitorFTE,
                                                string SpecialistNumofStaff,
                                                string SpecialistFTE,
                                                string IPSOtherNumofStaff,
                                                string IPSOtherFTE,
                                                string AideParaprofessionalNumofStaff,
                                                string AideParaprofessionalFTE,
                                                string SecretaryBookkeeperNumofStaff,
                                                string SecretaryBookkeeperFTE,
                                                string SSOtherNumofStaff,
                                                string SSOtherFTE,
                                                string FringeBenefitsNumofStaff,
                                                string FringeBenefitsFTE,
                                                string CSAdvisorRate,
                                                string CSAdvisorHrWkDayFlat,
                                                string CSClinicianRate,
                                                string CSClinicianHrWkDayFlat,
                                                string CSConsultantRate,
                                                string CSConsultantHrWkDayFlat,
                                                string CSEducatorInstructorRate,
                                                string CSEducatorInstructorHrWkDayFlat,
                                                string CSHomeVisitorRate,
                                                string CSHomeVisitorHrWkDayFlat,
                                                string CSSpecialistRate,
                                                string CSSpecialistHrWkDayFlat,
                                                string CSSpeakerRate,
                                                string CSSpeakerHrWkDayFlat,
                                                string CSSubstituteRate,
                                                string CSSubstituteHrWkDayFlat,
                                                string CSOtherRate,
                                                string CSOtherHrWkDayFlat,
                                                string SupervisoryStaffMileageRate,
                                                string InstructionalStaffMileageRate,
                                                string TravelOtherMileageRate,
                                                int isLeadAgency,
                                                int version)
    {
        SqlParameter[] pArray = new SqlParameter[274];
        pArray[0] = new SqlParameter("@BudgetNarrativeID", SqlDbType.Int);
        //pArray[0].Direction = ParameterDirection.InputOutput;
        pArray[0].Value = budgetNarrativeID;

        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;

        pArray[2] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[2].Value = version;

        pArray[6] = new SqlParameter("@SupervisorDirectorDescr", SqlDbType.Text);
        pArray[6].Value = SupervisorDirectorDescr;

        pArray[7] = new SqlParameter("@IsLeadAgency", SqlDbType.TinyInt);
        pArray[7].Value = isLeadAgency;

        pArray[8] = new SqlParameter("@ProjectCoordinatorDescr", SqlDbType.Text);
        pArray[8].Value = ProjectCoordinatorDescr;

        pArray[9] = new SqlParameter("@StipendDescr", SqlDbType.Text);
        pArray[9].Value = StipendDescr;

        pArray[10] = new SqlParameter("@OtherDescr", SqlDbType.Text);
        pArray[10].Value = OtherDescr;

        pArray[11] = new SqlParameter("@AdvisorDescr", SqlDbType.Text);
        pArray[11].Value = AdvisorDescr;

        pArray[12] = new SqlParameter("@ClinicianDescr", SqlDbType.Text);
        pArray[12].Value = ClinicianDescr;

        pArray[14] = new SqlParameter("@CoordinatorDescr", SqlDbType.Text);
        pArray[14].Value = CoordinatorDescr;

        pArray[16] = new SqlParameter("@EducatorInstructorDescr", SqlDbType.Text);
        pArray[16].Value = EducatorInstructorDescr;

        pArray[18] = new SqlParameter("@HomeVisitorDescr", SqlDbType.Text);
        pArray[18].Value = HomeVisitorDescr;

        pArray[20] = new SqlParameter("@SpecialistDescr", SqlDbType.Text);
        pArray[20].Value = SpecialistDescr;

        pArray[22] = new SqlParameter("@IPSStipendDescr", SqlDbType.Text);
        pArray[22].Value = IPSStipendDescr;

        pArray[24] = new SqlParameter("@IPSOtherDescr", SqlDbType.Text);
        pArray[24].Value = IPSOtherDescr;

        pArray[26] = new SqlParameter("@AideParaprofessionalDescr", SqlDbType.Text);
        pArray[26].Value = AideParaprofessionalDescr;

        pArray[28] = new SqlParameter("@SecretaryBookkeeperDescr", SqlDbType.Text);
        pArray[28].Value = SecretaryBookkeeperDescr;

        pArray[30] = new SqlParameter("@SSStipendDescr", SqlDbType.Text);
        pArray[30].Value = SSStipendDescr;

        pArray[32] = new SqlParameter("@SSOtherDescr", SqlDbType.Text);
        pArray[32].Value = SSOtherDescr;

        pArray[34] = new SqlParameter("@FringeBenefitsDescr", SqlDbType.Text);
        pArray[34].Value = FringeBenefitsDescr;

        pArray[36] = new SqlParameter("@CSAdvisorDescr", SqlDbType.Text);
        pArray[36].Value = CSAdvisorDescr;

        pArray[38] = new SqlParameter("@CSClinicianDescr", SqlDbType.Text);
        pArray[38].Value = CSClinicianDescr;

        pArray[40] = new SqlParameter("@CSConsultantDescr", SqlDbType.Text);
        pArray[40].Value = CSConsultantDescr;

        pArray[42] = new SqlParameter("@CSEducatorInstructorDescr", SqlDbType.Text);
        pArray[42].Value = CSEducatorInstructorDescr;

        pArray[44] = new SqlParameter("@CSHomeVisitorDescr", SqlDbType.Text);
        pArray[44].Value = CSHomeVisitorDescr;

        pArray[46] = new SqlParameter("@CSSpecialistDescr", SqlDbType.Text);
        pArray[46].Value = CSSpecialistDescr;

        pArray[48] = new SqlParameter("@CSSpeakerDescr", SqlDbType.Text);
        pArray[48].Value = CSSpeakerDescr;

        pArray[50] = new SqlParameter("@CSSubstituteDescr", SqlDbType.Text);
        pArray[50].Value = CSSubstituteDescr;

        pArray[52] = new SqlParameter("@CSStipendDescr", SqlDbType.Text);
        pArray[52].Value = CSStipendDescr;

        pArray[54] = new SqlParameter("@CSOtherDescr", SqlDbType.Text);
        pArray[54].Value = CSOtherDescr;

        pArray[56] = new SqlParameter("@EducationalInstructionalMaterialsDescr", SqlDbType.Text);
        pArray[56].Value = EducationalInstructionalMaterialsDescr;

        pArray[58] = new SqlParameter("@InstructionalTechnologySoftwareDescr", SqlDbType.Text);
        pArray[58].Value = InstructionalTechnologySoftwareDescr;

        pArray[60] = new SqlParameter("@NonInstructionalSuppliesDescr", SqlDbType.Text);
        pArray[60].Value = NonInstructionalSuppliesDescr;

        pArray[62] = new SqlParameter("@SMOtherDescr", SqlDbType.Text);
        pArray[62].Value = SMOtherDescr;

        pArray[64] = new SqlParameter("@SupervisoryStaffDescr", SqlDbType.Text);
        pArray[64].Value = SupervisoryStaffDescr;

        pArray[66] = new SqlParameter("@InstructionalStaffDescr", SqlDbType.Text);
        pArray[66].Value = InstructionalStaffDescr;

        pArray[68] = new SqlParameter("@TraveOtherDescr", SqlDbType.Text);
        pArray[68].Value = TraveOtherDescr;

        pArray[70] = new SqlParameter("@AdvertisingDescr", SqlDbType.Text);
        pArray[70].Value = AdvertisingDescr;

        pArray[72] = new SqlParameter("@EquipmentRentalDescr", SqlDbType.Text);
        pArray[72].Value = EquipmentRentalDescr;

        pArray[74] = new SqlParameter("@MaintenanceRepairsDescr", SqlDbType.Text);
        pArray[74].Value = MaintenanceRepairsDescr;

        pArray[76] = new SqlParameter("@MembershipSubscriptionsDescr", SqlDbType.Text);
        pArray[76].Value = MembershipSubscriptionsDescr;

        pArray[78] = new SqlParameter("@PrintingReproductionDescr", SqlDbType.Text);
        pArray[78].Value = PrintingReproductionDescr;

        pArray[80] = new SqlParameter("@StaffTrainingDescr", SqlDbType.Text);
        pArray[80].Value = StaffTrainingDescr;

        pArray[82] = new SqlParameter("@RentalofSpaceDescr", SqlDbType.Text);
        pArray[82].Value = RentalofSpaceDescr;

        pArray[84] = new SqlParameter("@TelephoneUtilitiesDescr", SqlDbType.Text);
        pArray[84].Value = TelephoneUtilitiesDescr;

        pArray[86] = new SqlParameter("@DirectServiceTransportationDescr", SqlDbType.Text);
        pArray[86].Value = DirectServiceTransportationDescr;

        pArray[88] = new SqlParameter("@OCOtherDescr", SqlDbType.Text);
        pArray[88].Value = OCOtherDescr;

        pArray[90] = new SqlParameter("@ProfessionalDevelopOpportunitiesDescr", SqlDbType.Text);
        pArray[90].Value = ProfessionalDevelopOpportunitiesDescr;

        pArray[92] = new SqlParameter("@ApplicationFeesDescr", SqlDbType.Text);
        pArray[92].Value = ApplicationFeesDescr;

        pArray[94] = new SqlParameter("@CEUCoursesDescr", SqlDbType.Text);
        pArray[94].Value = CEUCoursesDescr;

        pArray[96] = new SqlParameter("@CollegeCoursesDescr", SqlDbType.Text);
        pArray[96].Value = CollegeCoursesDescr;

        pArray[98] = new SqlParameter("@CBOtherDescr", SqlDbType.Text);
        pArray[98].Value = CBOtherDescr;

        if (!string.IsNullOrEmpty(IndirectPercent))
        {
            pArray[99] = new SqlParameter("@IndirectPercent", SqlDbType.Decimal);
            pArray[99].Value = IndirectPercent;
        }

        pArray[102] = new SqlParameter("@InstructionalEquipmentDescr", SqlDbType.Text);
        pArray[102].Value = InstructionalEquipmentDescr;

        pArray[104] = new SqlParameter("@NoninstructionalEquipmentDescr", SqlDbType.Text);
        pArray[104].Value = NoninstructionalEquipmentDescr;

        pArray[105] = new SqlParameter("@EqOtherDescr", SqlDbType.Text);
        pArray[105].Value = EqOtherDescr;

        pArray[106] = new SqlParameter("@AncillaryDescr", SqlDbType.Text);
        pArray[106].Value = AncillaryDescr;

        if (!string.IsNullOrEmpty(IndirectCosts))
        {
            pArray[107] = new SqlParameter("@IndirectCosts", SqlDbType.Int);
            pArray[107].Value = IndirectCosts;
        }

        if (!string.IsNullOrEmpty(SupervisorDirectorColD))
        {
            pArray[111] = new SqlParameter("@SupervisorDirectorColD", SqlDbType.Int);
            pArray[111].Value = SupervisorDirectorColD;
        }

        if (!string.IsNullOrEmpty(ProjectCoordinatorColD))
        {
            pArray[112] = new SqlParameter("@ProjectCoordinatorColD", SqlDbType.Int);
            pArray[112].Value = ProjectCoordinatorColD;
        }

        if (!string.IsNullOrEmpty(StipendColD))
        {
            pArray[113] = new SqlParameter("@StipendColD", SqlDbType.Int);
            pArray[113].Value = StipendColD;
        }

        if (!string.IsNullOrEmpty(OtherColD))
        {
            pArray[114] = new SqlParameter("@OtherColD", SqlDbType.Int);
            pArray[114].Value = OtherColD;
        }

        if (!string.IsNullOrEmpty(AdvisorColD))
        {
            pArray[115] = new SqlParameter("@AdvisorColD", SqlDbType.Int);
            pArray[115].Value = AdvisorColD;
        }

        if (!string.IsNullOrEmpty(ClinicianColD))
        {
            pArray[116] = new SqlParameter("@ClinicianColD", SqlDbType.Int);
            pArray[116].Value = ClinicianColD;
        }

        if (!string.IsNullOrEmpty(CoordinatorColD))
        {
            pArray[117] = new SqlParameter("@CoordinatorColD", SqlDbType.Int);
            pArray[117].Value = CoordinatorColD;
        }

        if (!string.IsNullOrEmpty(EducatorInstructorColD))
        {
            pArray[118] = new SqlParameter("@EducatorInstructorColD", SqlDbType.Int);
            pArray[118].Value = EducatorInstructorColD;
        }

        if (!string.IsNullOrEmpty(HomeVisitorColD))
        {
            pArray[119] = new SqlParameter("@HomeVisitorColD", SqlDbType.Int);
            pArray[119].Value = HomeVisitorColD;
        }

        if (!string.IsNullOrEmpty(SpecialistColD))
        {
            pArray[120] = new SqlParameter("@SpecialistColD", SqlDbType.Int);
            pArray[120].Value = SpecialistColD;
        }

        if (!string.IsNullOrEmpty(IPSStipendColD))
        {
            pArray[121] = new SqlParameter("@IPSStipendColD", SqlDbType.Int);
            pArray[121].Value = IPSStipendColD;
        }

        if (!string.IsNullOrEmpty(IPSOtherColD))
        {
            pArray[122] = new SqlParameter("@IPSOtherColD", SqlDbType.Int);
            pArray[122].Value = IPSOtherColD;
        }

        if (!string.IsNullOrEmpty(AideParaprofessionalColD))
        {
            pArray[123] = new SqlParameter("@AideParaprofessionalColD", SqlDbType.Int);
            pArray[123].Value = AideParaprofessionalColD;
        }

        if (!string.IsNullOrEmpty(SecretaryBookkeeperColD))
        {
            pArray[124] = new SqlParameter("@SecretaryBookkeeperColD", SqlDbType.Int);
            pArray[124].Value = SecretaryBookkeeperColD;
        }

        if (!string.IsNullOrEmpty(SSOtherColD))
        {
            pArray[125] = new SqlParameter("@SSOtherColD", SqlDbType.Int);
            pArray[125].Value = SSOtherColD;
        }

        if (!string.IsNullOrEmpty(SSStipendColD))
        {
            pArray[126] = new SqlParameter("@SSStipendColD", SqlDbType.Int);
            pArray[126].Value = SSStipendColD;
        }

        if (!string.IsNullOrEmpty(FringeBenefitsColD))
        {
            pArray[127] = new SqlParameter("@FringeBenefitsColD", SqlDbType.Int);
            pArray[127].Value = FringeBenefitsColD;
        }

        if (!string.IsNullOrEmpty(CSAdvisorColD))
        {
            pArray[128] = new SqlParameter("@CSAdvisorColD", SqlDbType.Int);
            pArray[128].Value = CSAdvisorColD;
        }

        if (!string.IsNullOrEmpty(CSClinicianColD))
        {
            pArray[129] = new SqlParameter("@CSClinicianColD", SqlDbType.Int);
            pArray[129].Value = CSClinicianColD;
        }

        if (!string.IsNullOrEmpty(CSConsultantColD))
        {
            pArray[130] = new SqlParameter("@CSConsultantColD", SqlDbType.Int);
            pArray[130].Value = CSConsultantColD;
        }

        if (!string.IsNullOrEmpty(CSEducatorInstructorColD))
        {
            pArray[131] = new SqlParameter("@CSEducatorInstructorColD", SqlDbType.Int);
            pArray[131].Value = CSEducatorInstructorColD;
        }

        if (!string.IsNullOrEmpty(CSHomeVisitorColD))
        {
            pArray[132] = new SqlParameter("@CSHomeVisitorColD", SqlDbType.Int);
            pArray[132].Value = CSHomeVisitorColD;
        }

        if (!string.IsNullOrEmpty(CSSpecialistColD))
        {
            pArray[133] = new SqlParameter("@CSSpecialistColD", SqlDbType.Int);
            pArray[133].Value = CSSpecialistColD;
        }

        if (!string.IsNullOrEmpty(CSSpeakerColD))
        {
            pArray[134] = new SqlParameter("@CSSpeakerColD", SqlDbType.Int);
            pArray[134].Value = CSSpeakerColD;
        }

        if (!string.IsNullOrEmpty(CSSubstituteColD))
        {
            pArray[135] = new SqlParameter("@CSSubstituteColD", SqlDbType.Int);
            pArray[135].Value = CSSubstituteColD;
        }

        if (!string.IsNullOrEmpty(CSStipendColD))
        {
            pArray[136] = new SqlParameter("@CSStipendColD", SqlDbType.Int);
            pArray[136].Value = CSStipendColD;
        }

        if (!string.IsNullOrEmpty(CSOtherColD))
        {
            pArray[137] = new SqlParameter("@CSOtherColD", SqlDbType.Int);
            pArray[137].Value = CSOtherColD;
        }

        if (!string.IsNullOrEmpty(EducationalInstructionalMaterialsColD))
        {
            pArray[138] = new SqlParameter("@EducationalInstructionalMaterialsColD", SqlDbType.Int);
            pArray[138].Value = EducationalInstructionalMaterialsColD;
        }

        if (!string.IsNullOrEmpty(InstructionalTechnologySoftwareColD))
        {
            pArray[139] = new SqlParameter("@InstructionalTechnologySoftwareColD", SqlDbType.Int);
            pArray[139].Value = InstructionalTechnologySoftwareColD;
        }

        if (!string.IsNullOrEmpty(NonInstructionalSuppliesColD))
        {
            pArray[140] = new SqlParameter("@NonInstructionalSuppliesColD", SqlDbType.Int);
            pArray[140].Value = NonInstructionalSuppliesColD;
        }

        if (!string.IsNullOrEmpty(SMOtherColD))
        {
            pArray[141] = new SqlParameter("@SMOtherColD", SqlDbType.Int);
            pArray[141].Value = SMOtherColD;
        }

        if (!string.IsNullOrEmpty(SupervisoryStaffColD))
        {
            pArray[142] = new SqlParameter("@SupervisoryStaffColD", SqlDbType.Int);
            pArray[142].Value = SupervisoryStaffColD;
        }

        if (!string.IsNullOrEmpty(InstructionalStaffColD))
        {
            pArray[143] = new SqlParameter("@InstructionalStaffColD", SqlDbType.Int);
            pArray[143].Value = InstructionalStaffColD;
        }

        if (!string.IsNullOrEmpty(TravelOtherColD))
        {
            pArray[144] = new SqlParameter("@TravelOtherColD", SqlDbType.Int);
            pArray[144].Value = TravelOtherColD;
        }

        if (!string.IsNullOrEmpty(AdvertisingColD))
        {
            pArray[145] = new SqlParameter("@AdvertisingColD", SqlDbType.Int);
            pArray[145].Value = AdvertisingColD;
        }

        if (!string.IsNullOrEmpty(EquipmentRentalColD))
        {
            pArray[146] = new SqlParameter("@EquipmentRentalColD", SqlDbType.Int);
            pArray[146].Value = EquipmentRentalColD;
        }

        if (!string.IsNullOrEmpty(MaintenanceRepairsColD))
        {
            pArray[147] = new SqlParameter("@MaintenanceRepairsColD", SqlDbType.Int);
            pArray[147].Value = MaintenanceRepairsColD;
        }

        if (!string.IsNullOrEmpty(MembershipSubscriptionsColD))
        {
            pArray[148] = new SqlParameter("@MembershipSubscriptionsColD", SqlDbType.Int);
            pArray[148].Value = MembershipSubscriptionsColD;
        }

        if (!string.IsNullOrEmpty(PrintingReproductionColD))
        {
            pArray[149] = new SqlParameter("@PrintingReproductionColD", SqlDbType.Int);
            pArray[149].Value = PrintingReproductionColD;
        }

        if (!string.IsNullOrEmpty(StaffTrainingColD))
        {
            pArray[150] = new SqlParameter("@StaffTrainingColD", SqlDbType.Int);
            pArray[150].Value = StaffTrainingColD;
        }

        if (!string.IsNullOrEmpty(RentalofSpaceColD))
        {
            pArray[151] = new SqlParameter("@RentalofSpaceColD", SqlDbType.Int);
            pArray[151].Value = RentalofSpaceColD;
        }

        if (!string.IsNullOrEmpty(TelephoneUtilitiesColD))
        {
            pArray[152] = new SqlParameter("@TelephoneUtilitiesColD", SqlDbType.Int);
            pArray[152].Value = TelephoneUtilitiesColD;
        }

        if (!string.IsNullOrEmpty(DirectServiceTransportationColD))
        {
            pArray[153] = new SqlParameter("@DirectServiceTransportationColD", SqlDbType.Int);
            pArray[153].Value = DirectServiceTransportationColD;
        }

        if (!string.IsNullOrEmpty(OCOtherColD))
        {
            pArray[154] = new SqlParameter("@OCOtherColD", SqlDbType.Int);
            pArray[154].Value = OCOtherColD;
        }

        if (!string.IsNullOrEmpty(ProfessionalDevelopOpportunitiesColD))
        {
            pArray[155] = new SqlParameter("@ProfessionalDevelopOpportunitiesColD", SqlDbType.Int);
            pArray[155].Value = ProfessionalDevelopOpportunitiesColD;
        }

        if (!string.IsNullOrEmpty(ApplicationFeesColD))
        {
            pArray[156] = new SqlParameter("@ApplicationFeesColD", SqlDbType.Int);
            pArray[156].Value = ApplicationFeesColD;
        }

        if (!string.IsNullOrEmpty(CEUCoursesColD))
        {
            pArray[157] = new SqlParameter("@CEUCoursesColD", SqlDbType.Int);
            pArray[157].Value = CEUCoursesColD;
        }

        if (!string.IsNullOrEmpty(CollegeCoursesColD))
        {
            pArray[158] = new SqlParameter("@CollegeCoursesColD", SqlDbType.Int);
            pArray[158].Value = CollegeCoursesColD;
        }

        if (!string.IsNullOrEmpty(CBOtherColD))
        {
            pArray[159] = new SqlParameter("@CBOtherColD", SqlDbType.Int);
            pArray[159].Value = CBOtherColD;
        }

        if (!string.IsNullOrEmpty(InstructionalEquipmentColD))
        {
            pArray[160] = new SqlParameter("@InstructionalEquipmentColD", SqlDbType.Int);
            pArray[160].Value = InstructionalEquipmentColD;
        }

        if (!string.IsNullOrEmpty(NoninstructionalEquipmentColD))
        {
            pArray[161] = new SqlParameter("@NoninstructionalEquipmentColD", SqlDbType.Int);
            pArray[161].Value = NoninstructionalEquipmentColD;
        }

        if (!string.IsNullOrEmpty(EqOtherColD))
        {
            pArray[162] = new SqlParameter("@EqOtherColD", SqlDbType.Int);
            pArray[162].Value = EqOtherColD;
        }

        if (!string.IsNullOrEmpty(AncillaryColD))
        {
            pArray[163] = new SqlParameter("@AncillaryColD", SqlDbType.Int);
            pArray[163].Value = AncillaryColD;
        }

        if (!string.IsNullOrEmpty(IndirectCostsDescr))
        {
            pArray[164] = new SqlParameter("@IndirectCostsDescr", SqlDbType.Text);
            pArray[164].Value = IndirectCostsDescr;
        }

        if (!string.IsNullOrEmpty(SupervisorDirectorColF))
        {
            pArray[165] = new SqlParameter("@SupervisorDirectorColF", SqlDbType.Int);
            pArray[165].Value = SupervisorDirectorColF;
        }

        if (!string.IsNullOrEmpty(ProjectCoordinatorColF))
        {
            pArray[166] = new SqlParameter("@ProjectCoordinatorColF", SqlDbType.Int);
            pArray[166].Value = ProjectCoordinatorColF;
        }

        if (!string.IsNullOrEmpty(StipendColF))
        {
            pArray[167] = new SqlParameter("@StipendColF", SqlDbType.Int);
            pArray[167].Value = StipendColF;
        }

        if (!string.IsNullOrEmpty(OtherColF))
        {
            pArray[168] = new SqlParameter("@OtherColF", SqlDbType.Int);
            pArray[168].Value = OtherColF;
        }

        if (!string.IsNullOrEmpty(AdvisorColF))
        {
            pArray[169] = new SqlParameter("@AdvisorColF", SqlDbType.Int);
            pArray[169].Value = AdvisorColF;
        }

        if (!string.IsNullOrEmpty(ClinicianColF))
        {
            pArray[170] = new SqlParameter("@ClinicianColF", SqlDbType.Int);
            pArray[170].Value = ClinicianColF;
        }

        if (!string.IsNullOrEmpty(CoordinatorColF))
        {
            pArray[171] = new SqlParameter("@CoordinatorColF", SqlDbType.Int);
            pArray[171].Value = CoordinatorColF;
        }

        if (!string.IsNullOrEmpty(EducatorInstructorColF))
        {
            pArray[172] = new SqlParameter("@EducatorInstructorColF", SqlDbType.Int);
            pArray[172].Value = EducatorInstructorColF;
        }

        if (!string.IsNullOrEmpty(HomeVisitorColF))
        {
            pArray[173] = new SqlParameter("@HomeVisitorColF", SqlDbType.Int);
            pArray[173].Value = HomeVisitorColF;
        }

        if (!string.IsNullOrEmpty(SpecialistColF))
        {
            pArray[174] = new SqlParameter("@SpecialistColF", SqlDbType.Int);
            pArray[174].Value = SpecialistColF;
        }

        if (!string.IsNullOrEmpty(IPSStipendColF))
        {
            pArray[175] = new SqlParameter("@IPSStipendColF", SqlDbType.Int);
            pArray[175].Value = IPSStipendColF;
        }

        if (!string.IsNullOrEmpty(IPSOtherColF))
        {
            pArray[176] = new SqlParameter("@IPSOtherColF", SqlDbType.Int);
            pArray[176].Value = IPSOtherColF;
        }

        if (!string.IsNullOrEmpty(AideParaprofessionalColF))
        {
            pArray[177] = new SqlParameter("@AideParaprofessionalColF", SqlDbType.Int);
            pArray[177].Value = AideParaprofessionalColF;
        }

        if (!string.IsNullOrEmpty(SecretaryBookkeeperColF))
        {
            pArray[178] = new SqlParameter("@SecretaryBookkeeperColF", SqlDbType.Int);
            pArray[178].Value = SecretaryBookkeeperColF;
        }

        if (!string.IsNullOrEmpty(SSStipendColF))
        {
            pArray[179] = new SqlParameter("@SSStipendColF", SqlDbType.Int);
            pArray[179].Value = SSStipendColF;
        }

        if (!string.IsNullOrEmpty(SSOtherColF))
        {
            pArray[180] = new SqlParameter("@SSOtherColF", SqlDbType.Int);
            pArray[180].Value = SSOtherColF;
        }

        if (!string.IsNullOrEmpty(FringeBenefitsColF))
        {
            pArray[181] = new SqlParameter("@FringeBenefitsColF", SqlDbType.Int);
            pArray[181].Value = FringeBenefitsColF;
        }

        if (!string.IsNullOrEmpty(CSAdvisorColF))
        {
            pArray[182] = new SqlParameter("@CSAdvisorColF", SqlDbType.Int);
            pArray[182].Value = CSAdvisorColF;
        }

        if (!string.IsNullOrEmpty(CSClinicianColF))
        {
            pArray[183] = new SqlParameter("@CSClinicianColF", SqlDbType.Int);
            pArray[183].Value = CSClinicianColF;
        }

        if (!string.IsNullOrEmpty(CSConsultantColF))
        {
            pArray[184] = new SqlParameter("@CSConsultantColF", SqlDbType.Int);
            pArray[184].Value = CSConsultantColF;
        }

        if (!string.IsNullOrEmpty(CSEducatorInstructorColF))
        {
            pArray[185] = new SqlParameter("@CSEducatorInstructorColF", SqlDbType.Int);
            pArray[185].Value = CSEducatorInstructorColF;
        }

        if (!string.IsNullOrEmpty(CSHomeVisitorColF))
        {
            pArray[186] = new SqlParameter("@CSHomeVisitorColF", SqlDbType.Int);
            pArray[186].Value = CSHomeVisitorColF;
        }

        if (!string.IsNullOrEmpty(CSSpecialistColF))
        {
            pArray[187] = new SqlParameter("@CSSpecialistColF", SqlDbType.Int);
            pArray[187].Value = CSSpecialistColF;
        }

        if (!string.IsNullOrEmpty(CSSpeakerColF))
        {
            pArray[188] = new SqlParameter("@CSSpeakerColF", SqlDbType.Int);
            pArray[188].Value = CSSpeakerColF;
        }

        if (!string.IsNullOrEmpty(CSSubstituteColF))
        {
            pArray[189] = new SqlParameter("@CSSubstituteColF", SqlDbType.Int);
            pArray[189].Value = CSSubstituteColF;
        }

        if (!string.IsNullOrEmpty(CSStipendColF))
        {
            pArray[190] = new SqlParameter("@CSStipendColF", SqlDbType.Int);
            pArray[190].Value = CSStipendColF;
        }

        if (!string.IsNullOrEmpty(CSOtherColF))
        {
            pArray[191] = new SqlParameter("@CSOtherColF", SqlDbType.Int);
            pArray[191].Value = CSOtherColF;
        }

        if (!string.IsNullOrEmpty(EducationalInstructionalMaterialsColF))
        {
            pArray[192] = new SqlParameter("@EducationalInstructionalMaterialsColF", SqlDbType.Int);
            pArray[192].Value = EducationalInstructionalMaterialsColF;
        }

        if (!string.IsNullOrEmpty(InstructionalTechnologySoftwareColF))
        {
            pArray[193] = new SqlParameter("@InstructionalTechnologySoftwareColF", SqlDbType.Int);
            pArray[193].Value = InstructionalTechnologySoftwareColF;
        }

        if (!string.IsNullOrEmpty(NonInstructionalSuppliesColF))
        {
            pArray[194] = new SqlParameter("@NonInstructionalSuppliesColF", SqlDbType.Int);
            pArray[194].Value = NonInstructionalSuppliesColF;
        }

        if (!string.IsNullOrEmpty(SMOtherColF))
        {
            pArray[195] = new SqlParameter("@SMOtherColF", SqlDbType.Int);
            pArray[195].Value = SMOtherColF;
        }

        if (!string.IsNullOrEmpty(SupervisoryStaffColF))
        {
            pArray[196] = new SqlParameter("@SupervisoryStaffColF", SqlDbType.Int);
            pArray[196].Value = SupervisoryStaffColF;
        }

        if (!string.IsNullOrEmpty(InstructionalStaffColF))
        {
            pArray[197] = new SqlParameter("@InstructionalStaffColF", SqlDbType.Int);
            pArray[197].Value = InstructionalStaffColF;
        }

        if (!string.IsNullOrEmpty(TravelOtherColF))
        {
            pArray[198] = new SqlParameter("@TravelOtherColF", SqlDbType.Int);
            pArray[198].Value = TravelOtherColF;
        }

        if (!string.IsNullOrEmpty(AdvertisingColF))
        {
            pArray[199] = new SqlParameter("@AdvertisingColF", SqlDbType.Int);
            pArray[199].Value = AdvertisingColF;
        }

        if (!string.IsNullOrEmpty(EquipmentRentalColF))
        {
            pArray[200] = new SqlParameter("@EquipmentRentalColF", SqlDbType.Int);
            pArray[200].Value = EquipmentRentalColF;
        }

        if (!string.IsNullOrEmpty(MaintenanceRepairsColF))
        {
            pArray[201] = new SqlParameter("@MaintenanceRepairsColF", SqlDbType.Int);
            pArray[201].Value = MaintenanceRepairsColF;
        }

        if (!string.IsNullOrEmpty(MembershipSubscriptionsColF))
        {
            pArray[202] = new SqlParameter("@MembershipSubscriptionsColF", SqlDbType.Int);
            pArray[202].Value = MembershipSubscriptionsColF;
        }

        if (!string.IsNullOrEmpty(PrintingReproductionColF))
        {
            pArray[203] = new SqlParameter("@PrintingReproductionColF", SqlDbType.Int);
            pArray[203].Value = PrintingReproductionColF;
        }

        if (!string.IsNullOrEmpty(StaffTrainingColF))
        {
            pArray[204] = new SqlParameter("@StaffTrainingColF", SqlDbType.Int);
            pArray[204].Value = StaffTrainingColF;
        }

        if (!string.IsNullOrEmpty(RentalofSpaceColF))
        {
            pArray[205] = new SqlParameter("@RentalofSpaceColF", SqlDbType.Int);
            pArray[205].Value = RentalofSpaceColF;
        }

        if (!string.IsNullOrEmpty(TelephoneUtilitiesColF))
        {
            pArray[206] = new SqlParameter("@TelephoneUtilitiesColF", SqlDbType.Int);
            pArray[206].Value = TelephoneUtilitiesColF;
        }

        if (!string.IsNullOrEmpty(DirectServiceTransportationColF))
        {
            pArray[207] = new SqlParameter("@DirectServiceTransportationColF", SqlDbType.Int);
            pArray[207].Value = DirectServiceTransportationColF;
        }

        if (!string.IsNullOrEmpty(OCOtherColF))
        {
            pArray[208] = new SqlParameter("@OCOtherColF", SqlDbType.Int);
            pArray[208].Value = OCOtherColF;
        }

        if (!string.IsNullOrEmpty(ProfessionalDevelopOpportunitiesColF))
        {
            pArray[209] = new SqlParameter("@ProfessionalDevelopOpportunitiesColF", SqlDbType.Int);
            pArray[209].Value = ProfessionalDevelopOpportunitiesColF;
        }

        if (!string.IsNullOrEmpty(ApplicationFeesColF))
        {
            pArray[210] = new SqlParameter("@ApplicationFeesColF", SqlDbType.Int);
            pArray[210].Value = ApplicationFeesColF;
        }

        if (!string.IsNullOrEmpty(CEUCoursesColF))
        {
            pArray[211] = new SqlParameter("@CEUCoursesColF", SqlDbType.Int);
            pArray[211].Value = CEUCoursesColF;
        }

        if (!string.IsNullOrEmpty(CollegeCoursesColF))
        {
            pArray[212] = new SqlParameter("@CollegeCoursesColF", SqlDbType.Int);
            pArray[212].Value = CollegeCoursesColF;
        }

        if (!string.IsNullOrEmpty(CBOtherColF))
        {
            pArray[213] = new SqlParameter("@CBOtherColF", SqlDbType.Int);
            pArray[213].Value = CBOtherColF;
        }

        if (!string.IsNullOrEmpty(InstructionalEquipmentColF))
        {
            pArray[214] = new SqlParameter("@InstructionalEquipmentColF", SqlDbType.Int);
            pArray[214].Value = InstructionalEquipmentColF;
        }

        if (!string.IsNullOrEmpty(NoninstructionalEquipmentColF))
        {
            pArray[215] = new SqlParameter("@NoninstructionalEquipmentColF", SqlDbType.Int);
            pArray[215].Value = NoninstructionalEquipmentColF;
        }

        if (!string.IsNullOrEmpty(EqOtherColF))
        {
            pArray[216] = new SqlParameter("@EqOtherColF", SqlDbType.Int);
            pArray[216].Value = EqOtherColF;
        }

        if (!string.IsNullOrEmpty(AncillaryColF))
        {
            pArray[217] = new SqlParameter("@AncillaryColF", SqlDbType.Int);
            pArray[217].Value = AncillaryColF;
        }

        if (!string.IsNullOrEmpty(SupervisorDirectorNumofStaff))
        {
            pArray[219] = new SqlParameter("@SupervisorDirectorNumofStaff", SqlDbType.Int);
            pArray[219].Value = SupervisorDirectorNumofStaff;
        }

        if (!string.IsNullOrEmpty(SupervisorDirectorFTE))
        {
            pArray[220] = new SqlParameter("@SupervisorDirectorFTE", SqlDbType.Decimal);
            pArray[220].Value = SupervisorDirectorFTE;
        }

        if (!string.IsNullOrEmpty(ProjectCoordinatorNumofStaff))
        {
            pArray[221] = new SqlParameter("@ProjectCoordinatorNumofStaff", SqlDbType.Int);
            pArray[221].Value = ProjectCoordinatorNumofStaff;
        }

        if (!string.IsNullOrEmpty(ProjectCoordinatorFTE))
        {
            pArray[222] = new SqlParameter("@ProjectCoordinatorFTE", SqlDbType.Decimal);
            pArray[222].Value = ProjectCoordinatorFTE;
        }

        if (!string.IsNullOrEmpty(OtherNumofStaff))
        {
            pArray[223] = new SqlParameter("@OtherNumofStaff", SqlDbType.Int);
            pArray[223].Value = OtherNumofStaff;
        }

        if (!string.IsNullOrEmpty(OtherFTE))
        {
            pArray[224] = new SqlParameter("@OtherFTE", SqlDbType.Decimal);
            pArray[224].Value = OtherFTE;
        }

        if (!string.IsNullOrEmpty(AdvisorNumofStaff))
        {
            pArray[225] = new SqlParameter("@AdvisorNumofStaff", SqlDbType.Int);
            pArray[225].Value = AdvisorNumofStaff;
        }

        if (!string.IsNullOrEmpty(AdvisorFTE))
        {
            pArray[226] = new SqlParameter("@AdvisorFTE", SqlDbType.Decimal);
            pArray[226].Value = AdvisorFTE;
        }

        if (!string.IsNullOrEmpty(ClinicianNumofStaff))
        {
            pArray[227] = new SqlParameter("@ClinicianNumofStaff", SqlDbType.Int);
            pArray[227].Value = ClinicianNumofStaff;
        }

        if (!string.IsNullOrEmpty(ClinicianFTE))
        {
            pArray[228] = new SqlParameter("@ClinicianFTE", SqlDbType.Decimal);
            pArray[228].Value = ClinicianFTE;
        }

        if (!string.IsNullOrEmpty(CoordinatorNumofStaff))
        {
            pArray[229] = new SqlParameter("@CoordinatorNumofStaff", SqlDbType.Int);
            pArray[229].Value = CoordinatorNumofStaff;
        }

        if (!string.IsNullOrEmpty(CoordinatorFTE))
        {
            pArray[230] = new SqlParameter("@CoordinatorFTE", SqlDbType.Decimal);
            pArray[230].Value = CoordinatorFTE;
        }

        if (!string.IsNullOrEmpty(EducatorInstructorNumofStaff))
        {
            pArray[231] = new SqlParameter("@EducatorInstructorNumofStaff", SqlDbType.Int);
            pArray[231].Value = EducatorInstructorNumofStaff;
        }

        if (!string.IsNullOrEmpty(EducatorInstructorFTE))
        {
            pArray[232] = new SqlParameter("@EducatorInstructorFTE", SqlDbType.Decimal);
            pArray[232].Value = EducatorInstructorFTE;
        }

        if (!string.IsNullOrEmpty(HomeVisitorNumofStaff))
        {
            pArray[233] = new SqlParameter("@HomeVisitorNumofStaff", SqlDbType.Int);
            pArray[233].Value = HomeVisitorNumofStaff;
        }

        if (!string.IsNullOrEmpty(HomeVisitorFTE))
        {
            pArray[234] = new SqlParameter("@HomeVisitorFTE", SqlDbType.Decimal);
            pArray[234].Value = HomeVisitorFTE;
        }

        if (!string.IsNullOrEmpty(SpecialistNumofStaff))
        {
            pArray[235] = new SqlParameter("@SpecialistNumofStaff", SqlDbType.Int);
            pArray[235].Value = SpecialistNumofStaff;
        }

        if (!string.IsNullOrEmpty(SpecialistFTE))
        {
            pArray[236] = new SqlParameter("@SpecialistFTE", SqlDbType.Decimal);
            pArray[236].Value = SpecialistFTE;
        }

        if (!string.IsNullOrEmpty(IPSOtherNumofStaff))
        {
            pArray[237] = new SqlParameter("@IPSOtherNumofStaff", SqlDbType.Int);
            pArray[237].Value = IPSOtherNumofStaff;
        }

        if (!string.IsNullOrEmpty(IPSOtherFTE))
        {
            pArray[238] = new SqlParameter("@IPSOtherFTE", SqlDbType.Decimal);
            pArray[238].Value = IPSOtherFTE;
        }

        if (!string.IsNullOrEmpty(AideParaprofessionalNumofStaff))
        {
            pArray[239] = new SqlParameter("@AideParaprofessionalNumofStaff", SqlDbType.Int);
            pArray[239].Value = AideParaprofessionalNumofStaff;
        }

        if (!string.IsNullOrEmpty(AideParaprofessionalFTE))
        {
            pArray[240] = new SqlParameter("@AideParaprofessionalFTE", SqlDbType.Decimal);
            pArray[240].Value = AideParaprofessionalFTE;
        }

        if (!string.IsNullOrEmpty(SecretaryBookkeeperNumofStaff))
        {
            pArray[241] = new SqlParameter("@SecretaryBookkeeperNumofStaff", SqlDbType.Int);
            pArray[241].Value = SecretaryBookkeeperNumofStaff;
        }

        if (!string.IsNullOrEmpty(SecretaryBookkeeperFTE))
        {
            pArray[242] = new SqlParameter("@SecretaryBookkeeperFTE", SqlDbType.Decimal);
            pArray[242].Value = SecretaryBookkeeperFTE;
        }

        if (!string.IsNullOrEmpty(SSOtherNumofStaff))
        {
            pArray[243] = new SqlParameter("@SSOtherNumofStaff", SqlDbType.Int);
            pArray[243].Value = SSOtherNumofStaff;
        }

        if (!string.IsNullOrEmpty(SSOtherFTE))
        {
            pArray[244] = new SqlParameter("@SSOtherFTE", SqlDbType.Decimal);
            pArray[244].Value = SSOtherFTE;
        }

        if (!string.IsNullOrEmpty(FringeBenefitsNumofStaff))
        {
            pArray[245] = new SqlParameter("@FringeBenefitsNumofStaff", SqlDbType.Int);
            pArray[245].Value = FringeBenefitsNumofStaff;
        }

        if (!string.IsNullOrEmpty(FringeBenefitsFTE))
        {
            pArray[246] = new SqlParameter("@FringeBenefitsFTE", SqlDbType.Decimal);
            pArray[246].Value = FringeBenefitsFTE;
        }

        if (!string.IsNullOrEmpty(CSAdvisorRate))
        {
            pArray[247] = new SqlParameter("@CSAdvisorRate", SqlDbType.Decimal);
            pArray[247].Value = CSAdvisorRate;
        }

        if (!string.IsNullOrEmpty(CSAdvisorHrWkDayFlat))
        {
            pArray[248] = new SqlParameter("@CSAdvisorHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[248].Value = CSAdvisorHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSClinicianRate))
        {
            pArray[249] = new SqlParameter("@CSClinicianRate", SqlDbType.Decimal);
            pArray[249].Value = CSClinicianRate;
        }

        if (!string.IsNullOrEmpty(CSClinicianHrWkDayFlat))
        {
            pArray[250] = new SqlParameter("@CSClinicianHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[250].Value = CSClinicianHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSConsultantRate))
        {
            pArray[251] = new SqlParameter("@CSConsultantRate", SqlDbType.Decimal);
            pArray[251].Value = CSConsultantRate;
        }

        if (!string.IsNullOrEmpty(CSConsultantHrWkDayFlat))
        {
            pArray[252] = new SqlParameter("@CSConsultantHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[252].Value = CSConsultantHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSEducatorInstructorRate))
        {
            pArray[253] = new SqlParameter("@CSEducatorInstructorRate", SqlDbType.Decimal);
            pArray[253].Value = CSEducatorInstructorRate;
        }

        if (!string.IsNullOrEmpty(CSEducatorInstructorHrWkDayFlat))
        {
            pArray[254] = new SqlParameter("@CSEducatorInstructorHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[254].Value = CSEducatorInstructorHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSHomeVisitorRate))
        {
            pArray[255] = new SqlParameter("@CSHomeVisitorRate", SqlDbType.Decimal);
            pArray[255].Value = CSHomeVisitorRate;
        }

        if (!string.IsNullOrEmpty(CSHomeVisitorHrWkDayFlat))
        {
            pArray[256] = new SqlParameter("@CSHomeVisitorHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[256].Value = CSHomeVisitorHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSSpecialistRate))
        {
            pArray[257] = new SqlParameter("@CSSpecialistRate", SqlDbType.Decimal);
            pArray[257].Value = CSSpecialistRate;
        }

        if (!string.IsNullOrEmpty(CSSpecialistHrWkDayFlat))
        {
            pArray[258] = new SqlParameter("@CSSpecialistHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[258].Value = CSSpecialistHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSSpeakerRate))
        {
            pArray[259] = new SqlParameter("@CSSpeakerRate", SqlDbType.Decimal);
            pArray[259].Value = CSSpeakerRate;
        }

        if (!string.IsNullOrEmpty(CSSpeakerHrWkDayFlat))
        {
            pArray[260] = new SqlParameter("@CSSpeakerHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[260].Value = CSSpeakerHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSSubstituteRate))
        {
            pArray[261] = new SqlParameter("@CSSubstituteRate", SqlDbType.Decimal);
            pArray[261].Value = CSSubstituteRate;
        }

        if (!string.IsNullOrEmpty(CSSubstituteHrWkDayFlat))
        {
            pArray[262] = new SqlParameter("@CSSubstituteHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[262].Value = CSSubstituteHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(CSOtherRate))
        {
            pArray[263] = new SqlParameter("@CSOtherRate", SqlDbType.Decimal);
            pArray[263].Value = CSOtherRate;
        }

        if (!string.IsNullOrEmpty(CSOtherHrWkDayFlat))
        {
            pArray[264] = new SqlParameter("@CSOtherHrWkDayFlat", SqlDbType.VarChar, 50);
            pArray[264].Value = CSOtherHrWkDayFlat;
        }

        if (!string.IsNullOrEmpty(SupervisoryStaffMileageRate))
        {
            pArray[265] = new SqlParameter("@SupervisoryStaffMileageRate", SqlDbType.Decimal);
            pArray[265].Value = SupervisoryStaffMileageRate;
        }

        if (!string.IsNullOrEmpty(InstructionalStaffMileageRate))
        {
            pArray[266] = new SqlParameter("@InstructionalStaffMileageRate", SqlDbType.Decimal);
            pArray[266].Value = InstructionalStaffMileageRate;
        }

        if (!string.IsNullOrEmpty(TravelOtherMileageRate))
        {
            pArray[267] = new SqlParameter("@TravelOtherMileageRate", SqlDbType.Decimal);
            pArray[267].Value = TravelOtherMileageRate;
        }

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveBudgetNarrativeDataAmendment", pArray);

        return budgetNarrativeID;
    }

    //amend jwong
    public DataSet GetLeadAgencyAmendmentInfo(int GrantApplicantID, int version)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[2].Value = 1;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetAmendmentInfo", pArray);

    }

    //amend jwong
    public DataSet GetSubContractorsAmendmentInfo(int GrantApplicantID, int version)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[2].Value = 0;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetAmendmentInfo", pArray);

    }

    //amend jwong
    public DataSet GetAvailLeadAgencyAmendmentList(int GrantApplicantID, int version)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[2].Value = 1;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAvailAmendmentList", pArray);
    }

    //amend jwong
    public DataSet GetAvailSubContractorsAmendmentList(int GrantApplicantID, int version)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@Version", SqlDbType.Int);
        pArray[1].Value = version;

        pArray[2] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[2].Value = 0;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAvailAmendmentList", pArray);
    }

    public DataSet GetLatestBudgetNarrativeAmendment(int GrantApplicantID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetLatestBudgetNarrativeAmendment", pArray);
    }
}
