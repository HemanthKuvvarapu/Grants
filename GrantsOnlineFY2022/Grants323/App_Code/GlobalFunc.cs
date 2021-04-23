using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for GlobalFunc
/// </summary>
public class GlobalFunc
{
    public GlobalFunc()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static bool isValidRequiredForms(List<string> errorBoxes, DataSet ds1, DataSet ds2)
    {
        DataRow row;

        int count = errorBoxes.Count;

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            row = ds1.Tables[0].Rows[i];

            if (row["IsRequired"].ToString() == "1" && string.IsNullOrEmpty(row["FileName"].ToString()))
            {
                errorBoxes.Add(row["FileNum"].ToString());
            }
        }

        return errorBoxes.Count <= count;
    }

    public static bool isValidBudgetSummaryProviderTransfer(int grantApplicantId, float eligAmount, float UPKPerc)
    {
        DAL dal = new DAL();
        DataSet dsSubcontractors = dal.GetBudgetNarrativeData(grantApplicantId, 0);

        int SubcontractorsTotal = 0;

        for (int i = 0; i < dsSubcontractors.Tables[0].Rows.Count; i++)
        {
            SubcontractorsTotal += Convert.ToInt32(dsSubcontractors.Tables[0].Rows[i]["GrantTotal"].ToString());
        }

        if (eligAmount * UPKPerc > SubcontractorsTotal)
        {
            return false;
        }

        return true;
    }

    public static bool isValidBudgetSummaryEECAdminLimit(DataSet ds, int eligAmount, out float amount)
    {
        amount = 0.0f;

        DataRow dr = ds.Tables[0].Rows[0];

        int GrantAdmin = Int32.Parse(dr["AdminSubTotalColF"].ToString())
                        + Int32.Parse(dr["IPSSubTotalColF"].ToString())
                        + Int32.Parse(dr["SSSubTotalColF"].ToString())
                        + Int32.Parse(dr["FBSubTotalColF"].ToString())
                        + Int32.Parse(dr["CSSubTotalColF"].ToString())
                        + Int32.Parse(dr["SMSubTotalColF"].ToString())
                        + Int32.Parse(dr["TravelSubTotalColF"].ToString())
                        + Int32.Parse(dr["OCSubTotalColF"].ToString())
                        + Int32.Parse(dr["CBSubTotalColF"].ToString())
                        + Int32.Parse(dr["EqSubTotalColF"].ToString())
                        + Int32.Parse(dr["IndirectCosts"].ToString());

        if (Math.Round(eligAmount * (AppInfo.EECAdminLimitPerc * 0.01f), 0) < GrantAdmin)
        {
            amount = GrantAdmin - (int)Math.Round((eligAmount * (AppInfo.EECAdminLimitPerc * 0.01f)), 0);

            return false;
        }

        return true;
    }

    public static bool isValidBudgetSummaryAncillaryServices(DataSet ds, int eligAmount, out double amount)
    {
        amount = 0.0f;

        DataRow dr = ds.Tables[0].Rows[0];

        int ancillaryServices = Int32.Parse(dr["AncillarySubTotal"].ToString());

        if (ancillaryServices > Math.Round(eligAmount * 0.05f))
        {
            amount = ancillaryServices - Math.Round(eligAmount * 0.05f);

            return false;
        }

        return true;
    }

    public static bool isValidBudgetSummaryEligibilityAmount(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        int GrandTotal = Int32.Parse(dr["GrantTotal"].ToString());

        if (AllocFund != GrandTotal)
        {
            return false;
        }

        return true;
    }

    public static bool isValidBudgetUpToEligibilityAmount(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        int GrandTotal = Int32.Parse(dr["GrantTotal"].ToString());

        if (AllocFund < GrandTotal)
        {
            return false;
        }

        return true;
    }

    public static bool isValidFringeNarrativeQuestion(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if (string.IsNullOrEmpty(dr["FringeBenefitsDescr"].ToString().Trim()))
        {
            errorBoxes.Add("txtFringeBenefitsDescr");
        }

        return errorBoxes.Count <= count;
    }

    public static bool isValidBudgetNarrativeQuestions(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];


        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) > 0 || Int32.Parse(dr["SupervisorDirectorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SupervisorDirectorDescr"].ToString().Trim())))
            errorBoxes.Add("txtSupervisorDirectorDescr");

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["ProjectCoordinatorDescr"].ToString().Trim())))
            errorBoxes.Add("txtProjectCoordinatorDescr");

        if ((Int32.Parse(dr["StipendColD"].ToString()) > 0 || Int32.Parse(dr["StipendColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["StipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtStipendDescr");

        if ((Int32.Parse(dr["OtherColD"].ToString()) > 0 || Int32.Parse(dr["OtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["OtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtOtherDescr");

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) > 0 || Int32.Parse(dr["AdvisorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["AdvisorDescr"].ToString().Trim())))
            errorBoxes.Add("txtAdvisorDescr");

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) > 0 || Int32.Parse(dr["ClinicianColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["ClinicianDescr"].ToString().Trim())))
            errorBoxes.Add("txtClinicianDescr");

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["CoordinatorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CoordinatorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCoordinatorDescr");

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["EducatorInstructorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["EducatorInstructorDescr"].ToString().Trim())))
            errorBoxes.Add("txtEducatorInstructorDescr");

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["HomeVisitorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["HomeVisitorDescr"].ToString().Trim())))
            errorBoxes.Add("txtHomeVisitorDescr");

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) > 0 || Int32.Parse(dr["SpecialistColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SpecialistDescr"].ToString().Trim())))
            errorBoxes.Add("txtSpecialistDescr");

        if ((Int32.Parse(dr["IPSStipendColD"].ToString()) > 0 || Int32.Parse(dr["IPSStipendColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["IPSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtIPSStipendDescr");

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) > 0 || Int32.Parse(dr["IPSOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["IPSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtIPSOtherDescr");

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) > 0 || Int32.Parse(dr["AideParaprofessionalColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["AideParaprofessionalDescr"].ToString().Trim())))
            errorBoxes.Add("txtAideParaprofessionalDescr");

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) > 0 || Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SecretaryBookkeeperDescr"].ToString().Trim())))
            errorBoxes.Add("txtSecretaryBookkeeperDescr");

        if ((Int32.Parse(dr["SSStipendColD"].ToString()) > 0 || Int32.Parse(dr["SSStipendColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtSSStipendDescr");

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) > 0 || Int32.Parse(dr["SSOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtSSOtherDescr");

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) > 0 || Int32.Parse(dr["FringeBenefitsColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["FringeBenefitsDescr"].ToString().Trim())))
            errorBoxes.Add("txtFringeBenefitsDescr");

        if ((Int32.Parse(dr["CSAdvisorColD"].ToString()) > 0 || Int32.Parse(dr["CSAdvisorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSAdvisorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSAdvisorDescr");

        if ((Int32.Parse(dr["CSClinicianColD"].ToString()) > 0 || Int32.Parse(dr["CSClinicianColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSClinicianDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSClinicianDescr");

        if ((Int32.Parse(dr["CSConsultantColD"].ToString()) > 0 || Int32.Parse(dr["CSConsultantColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSConsultantDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSConsultantDescr");

        if ((Int32.Parse(dr["CSEducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["CSEducatorInstructorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSEducatorInstructorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSEducatorInstructorDescr");

        if ((Int32.Parse(dr["CSHomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["CSHomeVisitorColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSHomeVisitorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSHomeVisitorDescr");

        if ((Int32.Parse(dr["CSSpecialistColD"].ToString()) > 0 || Int32.Parse(dr["CSSpecialistColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSSpecialistDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSpecialistDescr");

        if ((Int32.Parse(dr["CSSpeakerColD"].ToString()) > 0 || Int32.Parse(dr["CSSpeakerColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSSpeakerDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSpeakerDescr");

        if ((Int32.Parse(dr["CSSubstituteColD"].ToString()) > 0 || Int32.Parse(dr["CSSubstituteColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSSubstituteDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSubstituteDescr");

        if ((Int32.Parse(dr["CSStipendColD"].ToString()) > 0 || Int32.Parse(dr["CSStipendColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSStipendDescr");

        if ((Int32.Parse(dr["CSOtherColD"].ToString()) > 0 || Int32.Parse(dr["CSOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSOtherDescr");

        if ((Int32.Parse(dr["EducationalInstructionalMaterialsColD"].ToString()) > 0 || Int32.Parse(dr["EducationalInstructionalMaterialsColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["EducationalInstructionalMaterialsDescr"].ToString().Trim())))
            errorBoxes.Add("txtEducationalInstructionalMaterialsDescr");

        if ((Int32.Parse(dr["InstructionalTechnologySoftwareColD"].ToString()) > 0 || Int32.Parse(dr["InstructionalTechnologySoftwareColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["InstructionalTechnologySoftwareDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalTechnologySoftwareDescr");

        if ((Int32.Parse(dr["NonInstructionalSuppliesColD"].ToString()) > 0 || Int32.Parse(dr["NonInstructionalSuppliesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["NonInstructionalSuppliesDescr"].ToString().Trim())))
            errorBoxes.Add("txtNonInstructionalSuppliesDescr");

        if ((Int32.Parse(dr["SMOtherColD"].ToString()) > 0 || Int32.Parse(dr["SMOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SMOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtSMOtherDescr");

        if ((Int32.Parse(dr["SupervisoryStaffColD"].ToString()) > 0 || Int32.Parse(dr["SupervisoryStaffColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["SupervisoryStaffDescr"].ToString().Trim())))
            errorBoxes.Add("txtSupervisoryStaffDescr");

        if ((Int32.Parse(dr["InstructionalStaffColD"].ToString()) > 0 || Int32.Parse(dr["InstructionalStaffColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["InstructionalStaffDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalStaffDescr");

        if ((Int32.Parse(dr["TravelOtherColD"].ToString()) > 0 || Int32.Parse(dr["TravelOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["TraveOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtTravelOtherDescr");

        if ((Int32.Parse(dr["AdvertisingColD"].ToString()) > 0 || Int32.Parse(dr["AdvertisingColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["AdvertisingDescr"].ToString().Trim())))
            errorBoxes.Add("txtAdvertisingDescr");

        if ((Int32.Parse(dr["EquipmentRentalColD"].ToString()) > 0 || Int32.Parse(dr["EquipmentRentalColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["EquipmentRentalDescr"].ToString().Trim())))
            errorBoxes.Add("txtEquipmentRentalDescr");

        if ((Int32.Parse(dr["MaintenanceRepairsColD"].ToString()) > 0 || Int32.Parse(dr["MaintenanceRepairsColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["MaintenanceRepairsDescr"].ToString().Trim())))
            errorBoxes.Add("txtMaintenanceRepairsDescr");

        if ((Int32.Parse(dr["MembershipSubscriptionsColD"].ToString()) > 0 || Int32.Parse(dr["MembershipSubscriptionsColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["MembershipSubscriptionsDescr"].ToString().Trim())))
            errorBoxes.Add("txtMembershipSubscriptionsDescr");

        if ((Int32.Parse(dr["PrintingReproductionColD"].ToString()) > 0 || Int32.Parse(dr["PrintingReproductionColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["PrintingReproductionDescr"].ToString().Trim())))
            errorBoxes.Add("txtPrintingReproductionDescr");

        if ((Int32.Parse(dr["StaffTrainingColD"].ToString()) > 0 || Int32.Parse(dr["StaffTrainingColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["StaffTrainingDescr"].ToString().Trim())))
            errorBoxes.Add("txtStaffTrainingDescr");

        if ((Int32.Parse(dr["RentalofSpaceColD"].ToString()) > 0 || Int32.Parse(dr["RentalofSpaceColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["RentalofSpaceDescr"].ToString().Trim())))
            errorBoxes.Add("txtRentalofSpaceDescr");

        if ((Int32.Parse(dr["TelephoneUtilitiesColD"].ToString()) > 0 || Int32.Parse(dr["TelephoneUtilitiesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["TelephoneUtilitiesDescr"].ToString().Trim())))
            errorBoxes.Add("txtTelephoneUtilitiesDescr");

        if ((Int32.Parse(dr["DirectServiceTransportationColD"].ToString()) > 0 || Int32.Parse(dr["DirectServiceTransportationColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["DirectServiceTransportationDescr"].ToString().Trim())))
            errorBoxes.Add("txtDirectServiceTransportationDescr");

        if ((Int32.Parse(dr["OCOtherColD"].ToString()) > 0 || Int32.Parse(dr["OCOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["OCOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtOCOtherDescr");

        if ((Int32.Parse(dr["ProfessionalDevelopOpportunitiesColD"].ToString()) > 0 || Int32.Parse(dr["ProfessionalDevelopOpportunitiesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["ProfessionalDevelopOpportunitiesDescr"].ToString().Trim())))
            errorBoxes.Add("txtProfessionalDevelopOpportunitiesDescr");

        if ((Int32.Parse(dr["ApplicationFeesColD"].ToString()) > 0 || Int32.Parse(dr["ApplicationFeesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["ApplicationFeesDescr"].ToString().Trim())))
            errorBoxes.Add("txtApplicationFeesDescr");

        if ((Int32.Parse(dr["CEUCoursesColD"].ToString()) > 0 || Int32.Parse(dr["CEUCoursesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CEUCoursesDescr"].ToString().Trim())))
            errorBoxes.Add("txtCEUCoursesDescr");

        if ((Int32.Parse(dr["CollegeCoursesColD"].ToString()) > 0 || Int32.Parse(dr["CollegeCoursesColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CollegeCoursesDescr"].ToString().Trim())))
            errorBoxes.Add("txtCollegeCoursesDescr");

        if ((Int32.Parse(dr["CBOtherColD"].ToString()) > 0 || Int32.Parse(dr["CBOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["CBOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtCBOtherDescr");

        if ((Int32.Parse(dr["InstructionalEquipmentColD"].ToString()) > 0 || Int32.Parse(dr["InstructionalEquipmentColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["InstructionalEquipmentDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalEquipmentDescr");

        if ((Int32.Parse(dr["NoninstructionalEquipmentColD"].ToString()) > 0 || Int32.Parse(dr["NoninstructionalEquipmentColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["NoninstructionalEquipmentDescr"].ToString().Trim())))
            errorBoxes.Add("txtNoninstructionalEquipmentDescr");

        if ((Int32.Parse(dr["EqOtherColD"].ToString()) > 0 || Int32.Parse(dr["EqOtherColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["EqOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtEqOtherDescr");

        if ((Int32.Parse(dr["AncillaryColD"].ToString()) > 0 || Int32.Parse(dr["AncillaryColF"].ToString()) > 0) && (string.IsNullOrEmpty(dr["AncillaryDescr"].ToString().Trim())))
            errorBoxes.Add("txtAncillaryDescr");

        if ((Int32.Parse(dr["IndirectCosts"].ToString()) > 0) && (string.IsNullOrEmpty(dr["IndirectCostsDescr"].ToString().Trim())))
            errorBoxes.Add("txtIndirectCostsDescr");

        return errorBoxes.Count <= count;
    }

    public static bool isValidProgramAdminCosts(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) == 0 && Int32.Parse(dr["SupervisorDirectorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSupervisorDirectorColD");
            errorBoxes.Add("txtSupervisorDirectorColF");
        }

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) == 0 && Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtProjectCoordinatorColD");
            errorBoxes.Add("txtProjectCoordinatorColF");
        }

        if ((Int32.Parse(dr["OtherColD"].ToString()) == 0 && Int32.Parse(dr["OtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["OtherNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["OtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtOtherColD");
            errorBoxes.Add("txtOtherColF");
        }

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) == 0 && Int32.Parse(dr["AdvisorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["AdvisorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtAdvisorColD");
            errorBoxes.Add("txtAdvisorColF");
        }

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) == 0 && Int32.Parse(dr["ClinicianColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["ClinicianFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtClinicianColD");
            errorBoxes.Add("txtClinicianColF");
        }

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) == 0 && Int32.Parse(dr["CoordinatorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["CoordinatorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtCoordinatorColD");
            errorBoxes.Add("txtCoordinatorColF");
        }

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) == 0 && Int32.Parse(dr["EducatorInstructorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtEducatorInstructorColD");
            errorBoxes.Add("txtEducatorInstructorColF");
        }

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) == 0 && Int32.Parse(dr["HomeVisitorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtHomeVisitorColD");
            errorBoxes.Add("txtHomeVisitorColF");
        }

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) == 0 && Int32.Parse(dr["SpecialistColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["SpecialistFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSpecialistColD");
            errorBoxes.Add("txtSpecialistColF");
        }

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) == 0 && Int32.Parse(dr["IPSOtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["IPSOtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtIPSOtherColD");
            errorBoxes.Add("txtIPSOtherColF");
        }

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) == 0 && Int32.Parse(dr["AideParaprofessionalColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtAideParaprofessionalColD");
            errorBoxes.Add("txtAideParaprofessionalColF");
        }

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) == 0 && Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSecretaryBookkeeperColD");
            errorBoxes.Add("txtSecretaryBookkeeperColF");
        }

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) == 0 && Int32.Parse(dr["SSOtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["SSOtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSSOtherColD");
            errorBoxes.Add("txtSSOtherColF");
        }

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) == 0 && Int32.Parse(dr["FringeBenefitsColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) != 0) || (Single.Parse(dr["FringeBenefitsFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtFringeBenefitsColD");
            errorBoxes.Add("txtFringeBenefitsColF");
        }

        //rate
        if ((Int32.Parse(dr["CSAdvisorColD"].ToString()) == 0 && Int32.Parse(dr["CSAdvisorColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSAdvisorRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSAdvisorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSAdvisorColD");
            errorBoxes.Add("txtCSAdvisorColF");
        }

        if ((Int32.Parse(dr["CSClinicianColD"].ToString()) == 0 && Int32.Parse(dr["CSClinicianColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSClinicianRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSClinicianHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSClinicianColD");
            errorBoxes.Add("txtCSClinicianColF");
        }

        if ((Int32.Parse(dr["CSConsultantColD"].ToString()) == 0 && Int32.Parse(dr["CSConsultantColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSConsultantRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSConsultantHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSConsultantColD");
            errorBoxes.Add("txtCSConsultantColF");
        }

        if ((Int32.Parse(dr["CSEducatorInstructorColD"].ToString()) == 0 && Int32.Parse(dr["CSEducatorInstructorColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSEducatorInstructorRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSEducatorInstructorColD");
            errorBoxes.Add("txtCSEducatorInstructorColF");
        }

        if ((Int32.Parse(dr["CSHomeVisitorColD"].ToString()) == 0 && Int32.Parse(dr["CSHomeVisitorColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSHomeVisitorRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSHomeVisitorColD");
            errorBoxes.Add("txtCSHomeVisitorColF");
        }

        if ((Int32.Parse(dr["CSSpecialistColD"].ToString()) == 0 && Int32.Parse(dr["CSSpecialistColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSSpecialistRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSSpecialistHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSpecialistColD");
            errorBoxes.Add("txtCSSpecialistColF");
        }

        if ((Int32.Parse(dr["CSSpeakerColD"].ToString()) == 0 && Int32.Parse(dr["CSSpeakerColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSSpeakerRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSSpeakerHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSpeakerColD");
            errorBoxes.Add("txtCSSpeakerColF");
        }

        if ((Int32.Parse(dr["CSSubstituteColD"].ToString()) == 0 && Int32.Parse(dr["CSSubstituteColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSSubstituteRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSSubstituteHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSubstituteColD");
            errorBoxes.Add("txtCSSubstituteColF");
        }

        if ((Int32.Parse(dr["CSOtherColD"].ToString()) == 0 && Int32.Parse(dr["CSOtherColF"].ToString()) == 0) &&
            ((Single.Parse(dr["CSOtherRate"].ToString().Trim()) > 0.00f) || (Int32.Parse(dr["CSOtherHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSOtherColD");
            errorBoxes.Add("txtCSOtherColF");
        }

        //indirect costs
        if (Int32.Parse(dr["IndirectCosts"].ToString()) == 0 && (Single.Parse(dr["IndirectPercent"].ToString().Trim()) > 0.00f))
            errorBoxes.Add("txtIndirectCosts");

        //mileage rate
        if ((Int32.Parse(dr["SupervisoryStaffColD"].ToString()) == 0 && Int32.Parse(dr["SupervisoryStaffColF"].ToString()) == 0) &&
            (Single.Parse(dr["SupervisoryStaffMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtSupervisoryStaffColD");
            errorBoxes.Add("txtSupervisoryStaffColF");
        }

        if ((Int32.Parse(dr["InstructionalStaffColD"].ToString()) == 0 && Int32.Parse(dr["InstructionalStaffColF"].ToString()) == 0) &&
            (Single.Parse(dr["InstructionalStaffMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtInstructionalStaffColD");
            errorBoxes.Add("txtInstructionalStaffColF");
        }

        if ((Int32.Parse(dr["TravelOtherColD"].ToString()) == 0 && Int32.Parse(dr["TravelOtherColF"].ToString()) == 0) &&
            (Single.Parse(dr["TravelOtherMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtTravelOtherColD");
            errorBoxes.Add("txtTravelOtherColF");
        }

        return errorBoxes.Count <= count;
    }

    public static bool isValidNumOfStaff(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) > 0 || Int32.Parse(dr["SupervisorDirectorColF"].ToString()) > 0) && (Int32.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSupervisorDirectorNumofStaff");

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) > 0) && (Int32.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtProjectCoordinatorNumofStaff");

        if ((Int32.Parse(dr["OtherColD"].ToString()) > 0 || Int32.Parse(dr["OtherColF"].ToString()) > 0) && (Int32.Parse(dr["OtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtOtherNumofStaff");

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) > 0 || Int32.Parse(dr["AdvisorColF"].ToString()) > 0) && (Int32.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtAdvisorNumofStaff");

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) > 0 || Int32.Parse(dr["ClinicianColF"].ToString()) > 0) && (Int32.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtClinicianNumofStaff");

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["CoordinatorColF"].ToString()) > 0) && (Int32.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCoordinatorNumofStaff");

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["EducatorInstructorColF"].ToString()) > 0) && (Int32.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtEducatorInstructorNumofStaff");

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["HomeVisitorColF"].ToString()) > 0) && (Int32.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtHomeVisitorNumofStaff");

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) > 0 || Int32.Parse(dr["SpecialistColF"].ToString()) > 0) && (Int32.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSpecialistNumofStaff");

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) > 0 || Int32.Parse(dr["IPSOtherColF"].ToString()) > 0) && (Int32.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtIPSOtherNumofStaff");

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) > 0 || Int32.Parse(dr["AideParaprofessionalColF"].ToString()) > 0) && (Int32.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtAideParaprofessionalNumofStaff");

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) > 0 || Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) > 0) && (Int32.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSecretaryBookkeeperNumofStaff");

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) > 0 || Int32.Parse(dr["SSOtherColF"].ToString()) > 0) && (Int32.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSSOtherNumofStaff");

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) > 0 || Int32.Parse(dr["FringeBenefitsColF"].ToString()) > 0) && (Int32.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtFringeBenefitsNumofStaff");

        return errorBoxes.Count <= count;
    }

    public static bool isValidNumOfStaffFTE(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if (Single.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) < Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()))
            errorBoxes.Add("txtSupervisorDirectorFTE");

        if (Single.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) < Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()))
            errorBoxes.Add("txtProjectCoordinatorFTE");

        if (Single.Parse(dr["OtherNumofStaff"].ToString().Trim()) < Single.Parse(dr["OtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtOtherFTE");

        if (Single.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) < Single.Parse(dr["AdvisorFTE"].ToString().Trim()))
            errorBoxes.Add("txtAdvisorFTE");

        if (Single.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) < Single.Parse(dr["ClinicianFTE"].ToString().Trim()))
            errorBoxes.Add("txtClinicianFTE");

        if (Single.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) < Single.Parse(dr["CoordinatorFTE"].ToString().Trim()))
            errorBoxes.Add("txtCoordinatorFTE");

        if (Single.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) < Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()))
            errorBoxes.Add("txtEducatorInstructorFTE");

        if (Single.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) < Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()))
            errorBoxes.Add("txtHomeVisitorFTE");

        if (Single.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) < Single.Parse(dr["SpecialistFTE"].ToString().Trim()))
            errorBoxes.Add("txtSpecialistFTE");

        if (Single.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) < Single.Parse(dr["IPSOtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtIPSOtherFTE");

        if (Single.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) < Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()))
            errorBoxes.Add("txtAideParaprofessionalFTE");

        if (Single.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) < Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()))
            errorBoxes.Add("txtSecretaryBookkeeperFTE");

        if (Single.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) < Single.Parse(dr["SSOtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtSSOtherFTE");

        if (Single.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) < Single.Parse(dr["FringeBenefitsFTE"].ToString().Trim()))
            errorBoxes.Add("txtFringeBenefitsFTE");


        return errorBoxes.Count <= count;
    }

    public static bool isValidIndirectPercent(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if (Int32.Parse(dr["IndirectCosts"].ToString()) > 0 && (Single.Parse(dr["IndirectPercent"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtIndirectPercent");

        return errorBoxes.Count <= count;
    }

    public static bool isValidMileageRate(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["SupervisoryStaffColD"].ToString()) > 0 || Int32.Parse(dr["SupervisoryStaffColF"].ToString()) > 0) && (Single.Parse(dr["SupervisoryStaffMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSupervisoryStaffMileageRate");

        if ((Int32.Parse(dr["InstructionalStaffColD"].ToString()) > 0 || Int32.Parse(dr["InstructionalStaffColF"].ToString()) > 0) && (Single.Parse(dr["InstructionalStaffMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtInstructionalStaffMileageRate");

        if ((Int32.Parse(dr["TravelOtherColD"].ToString()) > 0 || Int32.Parse(dr["TravelOtherColF"].ToString()) > 0) && (Single.Parse(dr["TravelOtherMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtTravelOtherMileageRate");

        return errorBoxes.Count <= count;
    }

    public static bool isValidContractPaidRate(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["CSAdvisorColD"].ToString()) > 0 || Int32.Parse(dr["CSAdvisorColF"].ToString()) > 0) && (Single.Parse(dr["CSAdvisorRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSAdvisorRate");

        if ((Int32.Parse(dr["CSAdvisorColD"].ToString()) > 0 || Int32.Parse(dr["CSAdvisorColF"].ToString()) > 0) && (Int32.Parse(dr["CSAdvisorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSAdvisorHDW");


        if ((Int32.Parse(dr["CSClinicianColD"].ToString()) > 0 || Int32.Parse(dr["CSClinicianColF"].ToString()) > 0) && (Single.Parse(dr["CSClinicianRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSClinicianRate");

        if ((Int32.Parse(dr["CSClinicianColD"].ToString()) > 0 || Int32.Parse(dr["CSClinicianColF"].ToString()) > 0) && (Int32.Parse(dr["CSClinicianHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSClinicianHDW");


        if ((Int32.Parse(dr["CSConsultantColD"].ToString()) > 0 || Int32.Parse(dr["CSConsultantColF"].ToString()) > 0) && (Single.Parse(dr["CSConsultantRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSConsultantRate");

        if ((Int32.Parse(dr["CSConsultantColD"].ToString()) > 0 || Int32.Parse(dr["CSConsultantColF"].ToString()) > 0) && (Int32.Parse(dr["CSConsultantHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSConsultantHDW");


        if ((Int32.Parse(dr["CSEducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["CSEducatorInstructorColF"].ToString()) > 0) && (Single.Parse(dr["CSEducatorInstructorRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSEducatorInstructorRate");

        if ((Int32.Parse(dr["CSEducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["CSEducatorInstructorColF"].ToString()) > 0) && (Int32.Parse(dr["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSEducatorInstructorHDW");


        if ((Int32.Parse(dr["CSHomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["CSHomeVisitorColF"].ToString()) > 0) && (Single.Parse(dr["CSHomeVisitorRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSHomeVisitorRate");

        if ((Int32.Parse(dr["CSHomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["CSHomeVisitorColF"].ToString()) > 0) && (Int32.Parse(dr["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSHomeVisitorHDW");


        if ((Int32.Parse(dr["CSSpecialistColD"].ToString()) > 0 || Int32.Parse(dr["CSSpecialistColF"].ToString()) > 0) && (Single.Parse(dr["CSSpecialistRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSSpecialistRate");

        if ((Int32.Parse(dr["CSSpecialistColD"].ToString()) > 0 || Int32.Parse(dr["CSSpecialistColF"].ToString()) > 0) && (Int32.Parse(dr["CSSpecialistHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSpecialistHDW");


        if ((Int32.Parse(dr["CSSpeakerColD"].ToString()) > 0 || Int32.Parse(dr["CSSpeakerColF"].ToString()) > 0) && (Single.Parse(dr["CSSpeakerRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSSpeakerRate");

        if ((Int32.Parse(dr["CSSpeakerColD"].ToString()) > 0 || Int32.Parse(dr["CSSpeakerColF"].ToString()) > 0) && (Int32.Parse(dr["CSSpeakerHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSpeakerHDW");


        if ((Int32.Parse(dr["CSSubstituteColD"].ToString()) > 0 || Int32.Parse(dr["CSSubstituteColF"].ToString()) > 0) && (Single.Parse(dr["CSSubstituteRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSSubstituteRate");

        if ((Int32.Parse(dr["CSSubstituteColD"].ToString()) > 0 || Int32.Parse(dr["CSSubstituteColF"].ToString()) > 0) && (Int32.Parse(dr["CSSubstituteHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSubstituteHDW");


        if ((Int32.Parse(dr["CSOtherColD"].ToString()) > 0 || Int32.Parse(dr["CSOtherColF"].ToString()) > 0) && (Single.Parse(dr["CSOtherRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCSOtherRate");

        if ((Int32.Parse(dr["CSOtherColD"].ToString()) > 0 || Int32.Parse(dr["CSOtherColF"].ToString()) > 0) && (Int32.Parse(dr["CSOtherHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSOtherHDW");

        return errorBoxes.Count <= count;
    }

    public static bool isValidFringe(DataRow dr)
    {
        int fringeTotal = Int32.Parse(dr["FBSubTotal"].ToString());
        int adminTotal = Int32.Parse(dr["AdminSubTotal"].ToString());
        int IPTotal = Int32.Parse(dr["IPSSubTotal"].ToString());
        int SSTotal = Int32.Parse(dr["SSSubTotal"].ToString());

        if (fringeTotal > Math.Round((Single)(adminTotal + IPTotal + SSTotal) * .35f))
        {
            return false;
        }

        return true;
    }

    public static bool isValidFringe(DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        int fringeTotal = Int32.Parse(dr["FBSubTotal"].ToString());
        int adminTotal = Int32.Parse(dr["AdminSubTotal"].ToString());
        int IPTotal = Int32.Parse(dr["IPSSubTotal"].ToString());
        int SSTotal = Int32.Parse(dr["SSSubTotal"].ToString());

        if (fringeTotal > Math.Round((Single)(adminTotal + IPTotal + SSTotal) * .35f))
        {
            return false;
        }

        return true;
    }

    public static bool isValidNumOfFTE(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) > 0 || Int32.Parse(dr["SupervisorDirectorColF"].ToString()) > 0) && (Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSupervisorDirectorFTE");

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) > 0) && (Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtProjectCoordinatorFTE");

        if ((Int32.Parse(dr["OtherColD"].ToString()) > 0 || Int32.Parse(dr["OtherColF"].ToString()) > 0) && (Single.Parse(dr["OtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtOtherFTE");

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) > 0 || Int32.Parse(dr["AdvisorColF"].ToString()) > 0) && (Single.Parse(dr["AdvisorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtAdvisorFTE");

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) > 0 || Int32.Parse(dr["ClinicianColF"].ToString()) > 0) && (Single.Parse(dr["ClinicianFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtClinicianFTE");

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) > 0 || Int32.Parse(dr["CoordinatorColF"].ToString()) > 0) && (Single.Parse(dr["CoordinatorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCoordinatorFTE");

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) > 0 || Int32.Parse(dr["EducatorInstructorColF"].ToString()) > 0) && (Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtEducatorInstructorFTE");

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) > 0 || Int32.Parse(dr["HomeVisitorColF"].ToString()) > 0) && (Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtHomeVisitorFTE");

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) > 0 || Int32.Parse(dr["SpecialistColF"].ToString()) > 0) && (Single.Parse(dr["SpecialistFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSpecialistFTE");

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) > 0 || Int32.Parse(dr["IPSOtherColF"].ToString()) > 0) && (Single.Parse(dr["IPSOtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtIPSOtherFTE");

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) > 0 || Int32.Parse(dr["AideParaprofessionalColF"].ToString()) > 0) && (Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtAideParaprofessionalFTE");

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) > 0 || Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) > 0) && (Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSecretaryBookkeeperFTE");

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) > 0 || Int32.Parse(dr["SSOtherColF"].ToString()) > 0) && (Single.Parse(dr["SSOtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSSOtherFTE");

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) > 0 || Int32.Parse(dr["FringeBenefitsColF"].ToString()) > 0) && (Single.Parse(dr["FringeBenefitsFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtFringeBenefitsFTE");

        return errorBoxes.Count <= count;
    }

    public static bool isValidProjectedDeliverables(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if (string.IsNullOrEmpty(dr["Q1a"].ToString()))
            errorBoxes.Add("txt1a");

        if (string.IsNullOrEmpty(dr["Q1b"].ToString()))
            errorBoxes.Add("txt1b");

        if (string.IsNullOrEmpty(dr["Q1c"].ToString()))
            errorBoxes.Add("txt1c");

        if (string.IsNullOrEmpty(dr["Q1d"].ToString()))
            errorBoxes.Add("txt1d");

        if (string.IsNullOrEmpty(dr["Q1e"].ToString()))
            errorBoxes.Add("txt1e");

        if (string.IsNullOrEmpty(dr["Q1f"].ToString()))
            errorBoxes.Add("txt1f");

        if (string.IsNullOrEmpty(dr["Q1g"].ToString()))
            errorBoxes.Add("txt1g");

        if (string.IsNullOrEmpty(dr["Q1h"].ToString()))
            errorBoxes.Add("txt1h");

        if (string.IsNullOrEmpty(dr["Q1i"].ToString()))
            errorBoxes.Add("txt1i");

        if (string.IsNullOrEmpty(dr["Q1j"].ToString()))
            errorBoxes.Add("txt1j");


        if (string.IsNullOrEmpty(dr["Q2a"].ToString()))
            errorBoxes.Add("txt2a");

        if (string.IsNullOrEmpty(dr["Q2b"].ToString()))
            errorBoxes.Add("txt2b");

        if (string.IsNullOrEmpty(dr["Q2c"].ToString()))
            errorBoxes.Add("txt2c");

        if (string.IsNullOrEmpty(dr["Q2d"].ToString()))
            errorBoxes.Add("txt2d");

        if (string.IsNullOrEmpty(dr["Q2e"].ToString()))
            errorBoxes.Add("txt2e");

        if (string.IsNullOrEmpty(dr["Q2f"].ToString()))
            errorBoxes.Add("txt2f");

        if (string.IsNullOrEmpty(dr["Q2g"].ToString()))
            errorBoxes.Add("txt2g");

        if (string.IsNullOrEmpty(dr["Q2h"].ToString()))
            errorBoxes.Add("txt2h");

        if (string.IsNullOrEmpty(dr["Q2i"].ToString()))
            errorBoxes.Add("txt2i");


        if (string.IsNullOrEmpty(dr["Q3a"].ToString()))
            errorBoxes.Add("txt3a");

        if (string.IsNullOrEmpty(dr["Q3b"].ToString()))
            errorBoxes.Add("txt3b");

        if (string.IsNullOrEmpty(dr["Q3c"].ToString()))
            errorBoxes.Add("txt3c");

        //if (string.IsNullOrEmpty(dr["Q3d"].ToString()))
        //    errorBoxes.Add("txt3d");

        //if (string.IsNullOrEmpty(dr["Q3e"].ToString()))
        //    errorBoxes.Add("txt3e");

        //if (string.IsNullOrEmpty(dr["Q3f"].ToString()))
        //    errorBoxes.Add("txt3f");

        //if (string.IsNullOrEmpty(dr["Q3g"].ToString()))
        //    errorBoxes.Add("txt3g");

        //if (string.IsNullOrEmpty(dr["Q3h"].ToString()))
        //    errorBoxes.Add("txt3h");

        //if (string.IsNullOrEmpty(dr["Q3i"].ToString()))
        //    errorBoxes.Add("txt3i");


        //if (string.IsNullOrEmpty(dr["Q4a"].ToString()))
        //    errorBoxes.Add("txt4a");

        //if (string.IsNullOrEmpty(dr["Q4b"].ToString()))
        //    errorBoxes.Add("txt4b");

        //if (string.IsNullOrEmpty(dr["Q4c"].ToString()))
        //    errorBoxes.Add("txt4c");

        //if (string.IsNullOrEmpty(dr["Q4d"].ToString()))
        //    errorBoxes.Add("txt4d");

        //if (string.IsNullOrEmpty(dr["Q4e"].ToString()))
        //    errorBoxes.Add("txt4e");

        //if (string.IsNullOrEmpty(dr["Q4f"].ToString()))
        //    errorBoxes.Add("txt4f");

        //if (string.IsNullOrEmpty(dr["Q4g"].ToString()))
        //    errorBoxes.Add("txt4g");

        //if (string.IsNullOrEmpty(dr["Q4h"].ToString()))
        //    errorBoxes.Add("txt4h");


        //if (string.IsNullOrEmpty(dr["Q5a"].ToString()))
        //    errorBoxes.Add("txt5a");

        //if (string.IsNullOrEmpty(dr["Q5b"].ToString()))
        //    errorBoxes.Add("txt5b");

        //if (string.IsNullOrEmpty(dr["Q5c"].ToString()))
        //    errorBoxes.Add("txt5c");

        //if (string.IsNullOrEmpty(dr["Q5d"].ToString()))
        //    errorBoxes.Add("txt5d");



        //if (string.IsNullOrEmpty(dr["Q6a"].ToString()))
        //    errorBoxes.Add("txt6a");

        //if (string.IsNullOrEmpty(dr["Q6b"].ToString()))
        //    errorBoxes.Add("txt6b");

        //if (string.IsNullOrEmpty(dr["Q8a"].ToString()))
        //    errorBoxes.Add("txt8a");

        //if (string.IsNullOrEmpty(dr["Q8b"].ToString()))
        //    errorBoxes.Add("txt8b");

        //if (string.IsNullOrEmpty(dr["Q9a"].ToString()))
        //    errorBoxes.Add("txt9a");

        //if (string.IsNullOrEmpty(dr["Q9b"].ToString()))
        //    errorBoxes.Add("txt9b");

        //if (string.IsNullOrEmpty(dr["Q9c"].ToString()))
        //    errorBoxes.Add("txt9c");

        //if (string.IsNullOrEmpty(dr["Q9d"].ToString()))
        //    errorBoxes.Add("txt9d");

        //if (string.IsNullOrEmpty(dr["Q9e"].ToString()))
        //    errorBoxes.Add("txt9e");



        if (string.IsNullOrEmpty(dr["Q1adescr"].ToString()))
            errorBoxes.Add("txt1adescr");

        if (string.IsNullOrEmpty(dr["Q1bdescr"].ToString()))
            errorBoxes.Add("txt1bdescr");

        if (string.IsNullOrEmpty(dr["Q1cdescr"].ToString()))
            errorBoxes.Add("txt1cdescr");

        if (string.IsNullOrEmpty(dr["Q1ddescr"].ToString()))
            errorBoxes.Add("txt1ddescr");

        if (string.IsNullOrEmpty(dr["Q1edescr"].ToString()))
            errorBoxes.Add("txt1edescr");

        if (string.IsNullOrEmpty(dr["Q1fdescr"].ToString()))
            errorBoxes.Add("txt1fdescr");

        if (string.IsNullOrEmpty(dr["Q1gdescr"].ToString()))
            errorBoxes.Add("txt1gdescr");

        if (string.IsNullOrEmpty(dr["Q1hdescr"].ToString()))
            errorBoxes.Add("txt1hdescr");

        if (string.IsNullOrEmpty(dr["Q1idescr"].ToString()))
            errorBoxes.Add("txt1idescr");

        if (string.IsNullOrEmpty(dr["Q1jdescr"].ToString()))
            errorBoxes.Add("txt1jdescr");


        if (string.IsNullOrEmpty(dr["Q2adescr"].ToString()))
            errorBoxes.Add("txt2adescr");

        if (string.IsNullOrEmpty(dr["Q2bdescr"].ToString()))
            errorBoxes.Add("txt2bdescr");

        if (string.IsNullOrEmpty(dr["Q2cdescr"].ToString()))
            errorBoxes.Add("txt2cdescr");

        if (string.IsNullOrEmpty(dr["Q2ddescr"].ToString()))
            errorBoxes.Add("txt2ddescr");

        if (string.IsNullOrEmpty(dr["Q2edescr"].ToString()))
            errorBoxes.Add("txt2edescr");

        if (string.IsNullOrEmpty(dr["Q2fdescr"].ToString()))
            errorBoxes.Add("txt2fdescr");

        if (string.IsNullOrEmpty(dr["Q2gdescr"].ToString()))
            errorBoxes.Add("txt2gdescr");

        if (string.IsNullOrEmpty(dr["Q2hdescr"].ToString()))
            errorBoxes.Add("txt2hdescr");

        if (string.IsNullOrEmpty(dr["Q2idescr"].ToString()))
            errorBoxes.Add("txt2idescr");


        if (string.IsNullOrEmpty(dr["Q3adescr"].ToString()))
            errorBoxes.Add("txt3adescr");

        if (string.IsNullOrEmpty(dr["Q3bdescr"].ToString()))
            errorBoxes.Add("txt3bdescr");

        if (string.IsNullOrEmpty(dr["Q3cdescr"].ToString()))
            errorBoxes.Add("txt3cdescr");

        //if (string.IsNullOrEmpty(dr["Q3ddescr"].ToString()))
        //    errorBoxes.Add("txt3ddescr");

        //if (string.IsNullOrEmpty(dr["Q3edescr"].ToString()))
        //    errorBoxes.Add("txt3edescr");

        //if (string.IsNullOrEmpty(dr["Q3fdescr"].ToString()))
        //    errorBoxes.Add("txt3fdescr");

        //if (string.IsNullOrEmpty(dr["Q3gdescr"].ToString()))
        //    errorBoxes.Add("txt3gdescr");

        //if (string.IsNullOrEmpty(dr["Q3hdescr"].ToString()))
        //    errorBoxes.Add("txt3hdescr");

        //if (string.IsNullOrEmpty(dr["Q3idescr"].ToString()))
        //    errorBoxes.Add("txt3idescr");


        //if (string.IsNullOrEmpty(dr["Q4adescr"].ToString()))
        //    errorBoxes.Add("txt4adescr");

        //if (string.IsNullOrEmpty(dr["Q4bdescr"].ToString()))
        //    errorBoxes.Add("txt4bdescr");

        //if (string.IsNullOrEmpty(dr["Q4cdescr"].ToString()))
        //    errorBoxes.Add("txt4cdescr");

        //if (string.IsNullOrEmpty(dr["Q4ddescr"].ToString()))
        //    errorBoxes.Add("txt4ddescr");



        //if (string.IsNullOrEmpty(dr["Q5adescr"].ToString()))
        //    errorBoxes.Add("txt5adescr");

        //if (string.IsNullOrEmpty(dr["Q5bdescr"].ToString()))
        //    errorBoxes.Add("txt5bdescr");

        //if (string.IsNullOrEmpty(dr["Q5cdescr"].ToString()))
        //    errorBoxes.Add("txt5cdescr");

        //if (string.IsNullOrEmpty(dr["Q5ddescr"].ToString()))
        //    errorBoxes.Add("txt5ddescr");



        //if (string.IsNullOrEmpty(dr["Q6adescr"].ToString()))
        //    errorBoxes.Add("txt6adescr");

        //if (string.IsNullOrEmpty(dr["Q6bdescr"].ToString()))
        //    errorBoxes.Add("txt6bdescr");


        //if (string.IsNullOrEmpty(dr["Q8adescr"].ToString()))
        //    errorBoxes.Add("txt8adescr");

        //if (string.IsNullOrEmpty(dr["Q8bdescr"].ToString()))
        //    errorBoxes.Add("txt8bdescr");

        //if (string.IsNullOrEmpty(dr["Q9adescr"].ToString()))
        //    errorBoxes.Add("txt9adescr");

        //if (string.IsNullOrEmpty(dr["Q9bdescr"].ToString()))
        //    errorBoxes.Add("txt9bdescr");

        //if (string.IsNullOrEmpty(dr["Q9cdescr"].ToString()))
        //    errorBoxes.Add("txt9cdescr");

        //if (string.IsNullOrEmpty(dr["Q9ddescr"].ToString()))
        //    errorBoxes.Add("txt9ddescr");

        //if (string.IsNullOrEmpty(dr["Q9edescr"].ToString()))
        //    errorBoxes.Add("txt9edescr");

        return errorBoxes.Count <= count;
    }


    public static bool isValidNarrativeQuestions(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;
        Dictionary<string, string> questions = new Dictionary<string,string>();

        for (int i = 0; i < AppInfo.NUM_NARRATIVE_QUESTIONS; i++)
        {
            questions.Add((i + 1).ToString(), (i + 1).ToString());
        }

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];

            questions.Remove(dr["Num"].ToString());
        }

        foreach (string key in questions.Keys)
        {
            errorBoxes.Add("txtA" + key);
        }

        return errorBoxes.Count <= count;
    }

    //preschool only
    public static bool isValidNumOfStaffPreSchool(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];

        if ((Int32.Parse(dr["EducatorInstructorNumofStaff"].ToString()) * 0.5f) < Single.Parse(dr["EducatorInstructorFTE"].ToString()))
        {
            errorBoxes.Add("txtEducatorInstructorNumofStaff");
            errorBoxes.Add("txtEducatorInstructorFTE");
        }

        if ((Int32.Parse(dr["AideParaprofessionalNumofStaff"].ToString()) * 0.5f) < Single.Parse(dr["AideParaprofessionalFTE"].ToString()))
        {
            errorBoxes.Add("txtAideParaprofessionalNumofStaff");
            errorBoxes.Add("txtAideParaprofessionalFTE");
        }

        return errorBoxes.Count <= count;
    }

    public static bool IsValidTravel(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        if ((AllocFund * 0.05f) < Single.Parse(dr["TravelSubTotal"].ToString()))
        {
            return false;
        }

        return true;
    }

    public static bool IsValidSuppliesMaterials(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        if ((AllocFund * 0.05f) < Single.Parse(dr["SMSubTotal"].ToString()))
        {
            return false;
        }

        return true;
    }

    public static bool IsValidCapacityBuilding(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        if ((AllocFund * 0.05f) < Single.Parse(dr["CBSubTotal"].ToString()))
        {
            return false;
        }

        return true;
    }
}