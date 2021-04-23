using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Summary description for GlobalFuncAmendment
/// </summary>
public class GlobalFuncAmendment
{
	public GlobalFuncAmendment()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //amend jwong
    public static bool isValidNumOfFTEAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColD"].ToString()) ? "0" : drNew["SupervisorDirectorColD"].ToString()) > 0 ||
             Int32.Parse(dr["SupervisorDirectorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColF"].ToString()) ? "0" : drNew["SupervisorDirectorColF"].ToString()) > 0)
             && (Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorFTE"].ToString().Trim()) ? "0.00" : drNew["SupervisorDirectorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSupervisorDirectorFTE");

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColD"].ToString()) ? "0" : drNew["ProjectCoordinatorColD"].ToString()) > 0 ||
             Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColF"].ToString()) ? "0" : drNew["ProjectCoordinatorColF"].ToString()) > 0)
             && (Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["ProjectCoordinatorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtProjectCoordinatorFTE");

        if ((Int32.Parse(dr["OtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColD"].ToString()) ? "0" : drNew["OtherColD"].ToString()) > 0 ||
             Int32.Parse(dr["OtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColF"].ToString()) ? "0" : drNew["OtherColF"].ToString()) > 0)
             && (Single.Parse(dr["OtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["OtherFTE"].ToString().Trim()) ? "0.00" : drNew["OtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtOtherFTE");

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColD"].ToString()) ? "0" : drNew["AdvisorColD"].ToString()) > 0 ||
             Int32.Parse(dr["AdvisorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColF"].ToString()) ? "0" : drNew["AdvisorColF"].ToString()) > 0)
             && (Single.Parse(dr["AdvisorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AdvisorFTE"].ToString().Trim()) ? "0.00" : drNew["AdvisorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtAdvisorFTE");

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColD"].ToString()) ? "0" : drNew["ClinicianColD"].ToString()) > 0 ||
             Int32.Parse(dr["ClinicianColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColF"].ToString()) ? "0" : drNew["ClinicianColF"].ToString()) > 0)
             && (Single.Parse(dr["ClinicianFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ClinicianFTE"].ToString().Trim()) ? "0.00" : drNew["ClinicianFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtClinicianFTE");

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColD"].ToString()) ? "0" : drNew["CoordinatorColD"].ToString()) > 0 ||
             Int32.Parse(dr["CoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColF"].ToString()) ? "0" : drNew["CoordinatorColF"].ToString()) > 0)
             && (Single.Parse(dr["CoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["CoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["CoordinatorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtCoordinatorFTE");

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColD"].ToString()) ? "0" : drNew["EducatorInstructorColD"].ToString()) > 0 ||
             Int32.Parse(dr["EducatorInstructorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColF"].ToString()) ? "0" : drNew["EducatorInstructorColF"].ToString()) > 0)
             && (Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorFTE"].ToString().Trim()) ? "0.00" : drNew["EducatorInstructorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtEducatorInstructorFTE");

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColD"].ToString()) ? "0" : drNew["HomeVisitorColD"].ToString()) > 0 ||
             Int32.Parse(dr["HomeVisitorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColF"].ToString()) ? "0" : drNew["HomeVisitorColF"].ToString()) > 0)
             && (Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["HomeVisitorFTE"].ToString().Trim()) ? "0.00" : drNew["HomeVisitorFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtHomeVisitorFTE");

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColD"].ToString()) ? "0" : drNew["SpecialistColD"].ToString()) > 0 ||
             Int32.Parse(dr["SpecialistColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColF"].ToString()) ? "0" : drNew["SpecialistColF"].ToString()) > 0)
             && (Single.Parse(dr["SpecialistFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SpecialistFTE"].ToString().Trim()) ? "0.00" : drNew["SpecialistFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSpecialistFTE");

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColD"].ToString()) ? "0" : drNew["IPSOtherColD"].ToString()) > 0 ||
             Int32.Parse(dr["IPSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColF"].ToString()) ? "0" : drNew["IPSOtherColF"].ToString()) > 0)
             && (Single.Parse(dr["IPSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["IPSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["IPSOtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtIPSOtherFTE");

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColD"].ToString()) ? "0" : drNew["AideParaprofessionalColD"].ToString()) > 0 ||
             Int32.Parse(dr["AideParaprofessionalColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColF"].ToString()) ? "0" : drNew["AideParaprofessionalColF"].ToString()) > 0)
             && (Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalFTE"].ToString().Trim()) ? "0.00" : drNew["AideParaprofessionalFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtAideParaprofessionalFTE");

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColD"].ToString()) ? "0" : drNew["SecretaryBookkeeperColD"].ToString()) > 0 ||
             Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColF"].ToString()) ? "0" : drNew["SecretaryBookkeeperColF"].ToString()) > 0)
             && (Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperFTE"].ToString().Trim()) ? "0.00" : drNew["SecretaryBookkeeperFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSecretaryBookkeeperFTE");

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColD"].ToString()) ? "0" : drNew["SSOtherColD"].ToString()) > 0 ||
             Int32.Parse(dr["SSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColF"].ToString()) ? "0" : drNew["SSOtherColF"].ToString()) > 0)
             && (Single.Parse(dr["SSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["SSOtherFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSSOtherFTE");

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColD"].ToString()) ? "0" : drNew["FringeBenefitsColD"].ToString()) > 0 ||
             Int32.Parse(dr["FringeBenefitsColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColF"].ToString()) ? "0" : drNew["FringeBenefitsColF"].ToString()) > 0)
             && (Single.Parse(dr["FringeBenefitsFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsFTE"].ToString().Trim()) ? "0.00" : drNew["FringeBenefitsFTE"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtFringeBenefitsFTE");

        return errorBoxes.Count <= count;
    }

    public static bool isValidContractPaidRateAmendment(List<string> errorBoxes, DataRow dr)
    {
        int count = errorBoxes.Count;

        if ((!string.IsNullOrEmpty(dr["CSAdvisorRate"].ToString())) && (Int32.Parse(dr["CSAdvisorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSAdvisorHDW");

        if ((!string.IsNullOrEmpty(dr["CSClinicianRate"].ToString())) && (Int32.Parse(dr["CSClinicianHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSClinicianHDW");

        if ((!string.IsNullOrEmpty(dr["CSConsultantRate"].ToString())) && (Int32.Parse(dr["CSConsultantHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSConsultantHDW");

        if ((!string.IsNullOrEmpty(dr["CSEducatorInstructorRate"].ToString())) && (Int32.Parse(dr["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSEducatorInstructorHDW");

        if ((!string.IsNullOrEmpty(dr["CSHomeVisitorRate"].ToString())) && (Int32.Parse(dr["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSHomeVisitorHDW");

        if ((!string.IsNullOrEmpty(dr["CSSpecialistRate"].ToString())) && (Int32.Parse(dr["CSSpecialistHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSpecialistHDW");

        if ((!string.IsNullOrEmpty(dr["CSSpeakerRate"].ToString())) && (Int32.Parse(dr["CSSpeakerHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSpeakerHDW");

        if ((!string.IsNullOrEmpty(dr["CSSubstituteRate"].ToString())) && (Int32.Parse(dr["CSSubstituteHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSSubstituteHDW");

        if ((!string.IsNullOrEmpty(dr["CSOtherRate"].ToString())) && (Int32.Parse(dr["CSOtherHrWkDayFlat"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCSOtherHDW");



        if ((string.IsNullOrEmpty(dr["CSAdvisorRate"].ToString())) && (Int32.Parse(dr["CSAdvisorHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSAdvisorRate");

        if ((string.IsNullOrEmpty(dr["CSClinicianRate"].ToString())) && (Int32.Parse(dr["CSClinicianHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSClinicianRate");

        if ((string.IsNullOrEmpty(dr["CSConsultantRate"].ToString())) && (Int32.Parse(dr["CSConsultantHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSConsultantRate");

        if ((string.IsNullOrEmpty(dr["CSEducatorInstructorRate"].ToString())) && (Int32.Parse(dr["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSEducatorInstructorRate");

        if ((string.IsNullOrEmpty(dr["CSHomeVisitorRate"].ToString())) && (Int32.Parse(dr["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSHomeVisitorRate");

        if ((string.IsNullOrEmpty(dr["CSSpecialistRate"].ToString())) && (Int32.Parse(dr["CSSpecialistHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSSpecialistRate");

        if ((string.IsNullOrEmpty(dr["CSSpeakerRate"].ToString())) && (Int32.Parse(dr["CSSpeakerHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSSpeakerRate");

        if ((string.IsNullOrEmpty(dr["CSSubstituteRate"].ToString())) && (Int32.Parse(dr["CSSubstituteHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSSubstituteRate");

        if ((string.IsNullOrEmpty(dr["CSOtherRate"].ToString())) && (Int32.Parse(dr["CSOtherHrWkDayFlat"].ToString().Trim()) > 0))
            errorBoxes.Add("txtCSOtherRate");

        return errorBoxes.Count <= count;
    }

    public static bool isValidMileageRateAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if ((Int32.Parse(dr["SupervisoryStaffColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffColD"].ToString()) ? "0" : drNew["SupervisoryStaffColD"].ToString()) > 0 ||
            Int32.Parse(dr["SupervisoryStaffColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffColF"].ToString()) ? "0" : drNew["SupervisoryStaffColF"].ToString()) > 0) &&
            (Single.Parse(dr["SupervisoryStaffMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffMileageRate"].ToString().Trim()) ? "0.00" : drNew["SupervisoryStaffMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtSupervisoryStaffMileageRate");

        if ((Int32.Parse(dr["InstructionalStaffColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffColD"].ToString()) ? "0" : drNew["InstructionalStaffColD"].ToString()) > 0 ||
            Int32.Parse(dr["InstructionalStaffColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffColF"].ToString()) ? "0" : drNew["InstructionalStaffColF"].ToString()) > 0) &&
            (Single.Parse(dr["InstructionalStaffMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffMileageRate"].ToString().Trim()) ? "0.00" : drNew["InstructionalStaffMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtInstructionalStaffMileageRate");

        if ((Int32.Parse(dr["TravelOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColD"].ToString()) ? "0" : drNew["TravelOtherColD"].ToString()) > 0 ||
            Int32.Parse(dr["TravelOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColF"].ToString()) ? "0" : drNew["TravelOtherColF"].ToString()) > 0) &&
            (Single.Parse(dr["TravelOtherMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["TravelOtherMileageRate"].ToString().Trim()) ? "0.00" : drNew["TravelOtherMileageRate"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtTravelOtherMileageRate");

        return errorBoxes.Count <= count;
    }

    //amend jwong
    public static bool isValidNumOfStaffFTEAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if (Single.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorFTE"].ToString().Trim()) ? "0.00" : drNew["SupervisorDirectorFTE"].ToString().Trim()))
            errorBoxes.Add("txtSupervisorDirectorFTE");

        if (Single.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["ProjectCoordinatorFTE"].ToString().Trim()))
            errorBoxes.Add("txtProjectCoordinatorFTE");

        if (Single.Parse(dr["OtherNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["OtherNumofStaff"].ToString().Trim()) ? "0.00" : drNew["OtherNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["OtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["OtherFTE"].ToString().Trim()) ? "0.00" : drNew["OtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtOtherFTE");

        if (Single.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AdvisorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["AdvisorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["AdvisorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AdvisorFTE"].ToString().Trim()) ? "0.00" : drNew["AdvisorFTE"].ToString().Trim()))
            errorBoxes.Add("txtAdvisorFTE");

        if (Single.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ClinicianNumofStaff"].ToString().Trim()) ? "0.00" : drNew["ClinicianNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["ClinicianFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ClinicianFTE"].ToString().Trim()) ? "0.00" : drNew["ClinicianFTE"].ToString().Trim()))
            errorBoxes.Add("txtClinicianFTE");

        if (Single.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["CoordinatorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["CoordinatorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["CoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["CoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["CoordinatorFTE"].ToString().Trim()))
            errorBoxes.Add("txtCoordinatorFTE");

        if (Single.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["EducatorInstructorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorFTE"].ToString().Trim()) ? "0.00" : drNew["EducatorInstructorFTE"].ToString().Trim()))
            errorBoxes.Add("txtEducatorInstructorFTE");

        if (Single.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["HomeVisitorNumofStaff"].ToString().Trim()) ? "0.00" : drNew["HomeVisitorNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["HomeVisitorFTE"].ToString().Trim()) ? "0.00" : drNew["HomeVisitorFTE"].ToString().Trim()))
            errorBoxes.Add("txtHomeVisitorFTE");

        if (Single.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SpecialistNumofStaff"].ToString().Trim()) ? "0.00" : drNew["SpecialistNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["SpecialistFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SpecialistFTE"].ToString().Trim()) ? "0.00" : drNew["SpecialistFTE"].ToString().Trim()))
            errorBoxes.Add("txtSpecialistFTE");

        if (Single.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["IPSOtherNumofStaff"].ToString().Trim()) ? "0.00" : drNew["IPSOtherNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["IPSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["IPSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["IPSOtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtIPSOtherFTE");

        if (Single.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) ? "0.00" : drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalFTE"].ToString().Trim()) ? "0.00" : drNew["AideParaprofessionalFTE"].ToString().Trim()))
            errorBoxes.Add("txtAideParaprofessionalFTE");

        if (Single.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) ? "0.00" : drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperFTE"].ToString().Trim()) ? "0.00" : drNew["SecretaryBookkeeperFTE"].ToString().Trim()))
            errorBoxes.Add("txtSecretaryBookkeeperFTE");

        if (Single.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SSOtherNumofStaff"].ToString().Trim()) ? "0.00" : drNew["SSOtherNumofStaff"].ToString().Trim()) <
            Single.Parse(dr["SSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["SSOtherFTE"].ToString().Trim()))
            errorBoxes.Add("txtSSOtherFTE");

        if ((Double.Parse(dr["FringeBenefitsFTE"].ToString().Trim()) + Double.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsFTE"].ToString()) ? "0.00" : drNew["FringeBenefitsFTE"].ToString().Trim())) >
		(Double.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) + Double.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsNumofStaff"].ToString()) ? "0.00" : drNew["FringeBenefitsNumofStaff"].ToString().Trim())))
		{ 
			errorBoxes.Add("txtFringeBenefitsFTE");
		}


        return errorBoxes.Count <= count;
    }

    //amend jwong
    public static bool isValidIndirectPercentAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if (Int32.Parse(dr["IndirectCosts"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IndirectCosts"].ToString()) ? "0" : drNew["IndirectCosts"].ToString()) > 0 &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["IndirectPercent"].ToString().Trim()) ? "0.00" : drNew["IndirectPercent"].ToString().Trim()) == 0.00f &&
             Single.Parse(string.IsNullOrEmpty(dr["IndirectPercent"].ToString().Trim()) ? "0.00" : dr["IndirectPercent"].ToString().Trim()) == 0.00f)) ||
             (!string.IsNullOrEmpty(drNew["IndirectPercent"].ToString().Trim()) && Single.Parse(drNew["IndirectPercent"].ToString().Trim()) == 0.00f))
            errorBoxes.Add("txtIndirectPercent");

        return errorBoxes.Count <= count;
    }

    //amend jwong
    public static bool isValidProgramAdminCostsAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColD"].ToString()) ? "0" : drNew["SupervisorDirectorColD"].ToString()) == 0 &&
            Int32.Parse(dr["SupervisorDirectorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColF"].ToString()) ? "0" : drNew["SupervisorDirectorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) ? "0" : drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["SupervisorDirectorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorFTE"].ToString().Trim()) ? "0.00" : drNew["SupervisorDirectorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSupervisorDirectorColD");
            errorBoxes.Add("txtSupervisorDirectorColF");
            errorBoxes.Add("txtSupervisorDirectorNumofStaff");
            errorBoxes.Add("txtSupervisorDirectorFTE");
        }

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColD"].ToString()) ? "0" : drNew["ProjectCoordinatorColD"].ToString()) == 0 &&
            Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColF"].ToString()) ? "0" : drNew["ProjectCoordinatorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) ? "0" : drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["ProjectCoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["ProjectCoordinatorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtProjectCoordinatorColD");
            errorBoxes.Add("txtProjectCoordinatorColF");
            errorBoxes.Add("txtProjectCoordinatorNumofStaff");
            errorBoxes.Add("txtProjectCoordinatorFTE");
        }

        if ((Int32.Parse(dr["OtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColD"].ToString()) ? "0" : drNew["OtherColD"].ToString()) == 0 &&
            Int32.Parse(dr["OtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColF"].ToString()) ? "0" : drNew["OtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["OtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherNumofStaff"].ToString().Trim()) ? "0" : drNew["OtherNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["OtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["OtherFTE"].ToString().Trim()) ? "0.00" : drNew["OtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtOtherColD");
            errorBoxes.Add("txtOtherColF");
            errorBoxes.Add("txtOtherNumofStaff");
            errorBoxes.Add("txtOtherFTE");
        }

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColD"].ToString()) ? "0" : drNew["AdvisorColD"].ToString()) == 0 &&
            Int32.Parse(dr["AdvisorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColF"].ToString()) ? "0" : drNew["AdvisorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorNumofStaff"].ToString().Trim()) ? "0" : drNew["AdvisorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["AdvisorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AdvisorFTE"].ToString().Trim()) ? "0.00" : drNew["AdvisorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtAdvisorColD");
            errorBoxes.Add("txtAdvisorColF");
            errorBoxes.Add("txtAdvisorNumofStaff");
            errorBoxes.Add("txtAdvisorFTE");
        }

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColD"].ToString()) ? "0" : drNew["ClinicianColD"].ToString()) == 0 &&
            Int32.Parse(dr["ClinicianColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColF"].ToString()) ? "0" : drNew["ClinicianColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianNumofStaff"].ToString().Trim()) ? "0" : drNew["ClinicianNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["ClinicianFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["ClinicianFTE"].ToString().Trim()) ? "0.00" : drNew["ClinicianFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtClinicianColD");
            errorBoxes.Add("txtClinicianColF");
            errorBoxes.Add("txtClinicianNumofStaff");
            errorBoxes.Add("txtClinicianFTE");
        }

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColD"].ToString()) ? "0" : drNew["CoordinatorColD"].ToString()) == 0 &&
            Int32.Parse(dr["CoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColF"].ToString()) ? "0" : drNew["CoordinatorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorNumofStaff"].ToString().Trim()) ? "0" : drNew["CoordinatorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["CoordinatorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["CoordinatorFTE"].ToString().Trim()) ? "0.00" : drNew["CoordinatorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtCoordinatorColD");
            errorBoxes.Add("txtCoordinatorColF");
            errorBoxes.Add("txtCoordinatorNumofStaff");
            errorBoxes.Add("txtCoordinatorFTE");
        }

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColD"].ToString()) ? "0" : drNew["EducatorInstructorColD"].ToString()) == 0 &&
            Int32.Parse(dr["EducatorInstructorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColF"].ToString()) ? "0" : drNew["EducatorInstructorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorNumofStaff"].ToString().Trim()) ? "0" : drNew["EducatorInstructorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["EducatorInstructorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorFTE"].ToString().Trim()) ? "0.00" : drNew["EducatorInstructorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtEducatorInstructorColD");
            errorBoxes.Add("txtEducatorInstructorColF");
            errorBoxes.Add("txtEducatorInstructorNumofStaff");
            errorBoxes.Add("txtEducatorInstructorFTE");
        }

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColD"].ToString()) ? "0" : drNew["HomeVisitorColD"].ToString()) == 0 &&
            Int32.Parse(dr["HomeVisitorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColF"].ToString()) ? "0" : drNew["HomeVisitorColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorNumofStaff"].ToString().Trim()) ? "0" : drNew["HomeVisitorNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["HomeVisitorFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["HomeVisitorFTE"].ToString().Trim()) ? "0.00" : drNew["HomeVisitorFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtHomeVisitorColD");
            errorBoxes.Add("txtHomeVisitorColF");
            errorBoxes.Add("txtHomeVisitorNumofStaff");
            errorBoxes.Add("txtHomeVisitorFTE");
        }

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColD"].ToString()) ? "0" : drNew["SpecialistColD"].ToString()) == 0 &&
            Int32.Parse(dr["SpecialistColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColF"].ToString()) ? "0" : drNew["SpecialistColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistNumofStaff"].ToString().Trim()) ? "0" : drNew["SpecialistNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["SpecialistFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SpecialistFTE"].ToString().Trim()) ? "0.00" : drNew["SpecialistFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSpecialistColD");
            errorBoxes.Add("txtSpecialistColF");
            errorBoxes.Add("txtSpecialistNumofStaff");
            errorBoxes.Add("txtSpecialistFTE");
        }

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColD"].ToString()) ? "0" : drNew["IPSOtherColD"].ToString()) == 0 &&
            Int32.Parse(dr["IPSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColF"].ToString()) ? "0" : drNew["IPSOtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherNumofStaff"].ToString().Trim()) ? "0" : drNew["IPSOtherNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["IPSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["IPSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["IPSOtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtIPSOtherColD");
            errorBoxes.Add("txtIPSOtherColF");
            errorBoxes.Add("txtIPSOtherNumofStaff");
            errorBoxes.Add("txtIPSOtherFTE");
        }

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColD"].ToString()) ? "0" : drNew["AideParaprofessionalColD"].ToString()) == 0 &&
            Int32.Parse(dr["AideParaprofessionalColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColF"].ToString()) ? "0" : drNew["AideParaprofessionalColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) ? "0" : drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["AideParaprofessionalFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalFTE"].ToString().Trim()) ? "0.00" : drNew["AideParaprofessionalFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtAideParaprofessionalColD");
            errorBoxes.Add("txtAideParaprofessionalColF");
            errorBoxes.Add("txtAideParaprofessionalNumofStaff");
            errorBoxes.Add("txtAideParaprofessionalFTE");
        }

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColD"].ToString()) ? "0" : drNew["SecretaryBookkeeperColD"].ToString()) == 0 &&
            Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColF"].ToString()) ? "0" : drNew["SecretaryBookkeeperColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) ? "0" : drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["SecretaryBookkeeperFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperFTE"].ToString().Trim()) ? "0.00" : drNew["SecretaryBookkeeperFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSecretaryBookkeeperColD");
            errorBoxes.Add("txtSecretaryBookkeeperColF");
            errorBoxes.Add("txtSecretaryBookkeeperNumofStaff");
            errorBoxes.Add("txtSecretaryBookkeeperFTE");
        }

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColD"].ToString()) ? "0" : drNew["SSOtherColD"].ToString()) == 0 &&
            Int32.Parse(dr["SSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColF"].ToString()) ? "0" : drNew["SSOtherColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherNumofStaff"].ToString().Trim()) ? "0" : drNew["SSOtherNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["SSOtherFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SSOtherFTE"].ToString().Trim()) ? "0.00" : drNew["SSOtherFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtSSOtherColD");
            errorBoxes.Add("txtSSOtherColF");
            errorBoxes.Add("txtSSOtherNumofStaff");
            errorBoxes.Add("txtSSOtherFTE");
        }

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColD"].ToString()) ? "0" : drNew["FringeBenefitsColD"].ToString()) == 0 &&
            Int32.Parse(dr["FringeBenefitsColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColF"].ToString()) ? "0" : drNew["FringeBenefitsColF"].ToString()) == 0) &&
            ((Int32.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsNumofStaff"].ToString().Trim()) ? "0" : drNew["FringeBenefitsNumofStaff"].ToString().Trim()) != 0) ||
            (Single.Parse(dr["FringeBenefitsFTE"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsFTE"].ToString().Trim()) ? "0.00" : drNew["FringeBenefitsFTE"].ToString().Trim()) > 0.00f)))
        {
            errorBoxes.Add("txtFringeBenefitsColD");
            errorBoxes.Add("txtFringeBenefitsColF");
        }

        //rate
        if ((Int32.Parse(dr["CSAdvisorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSAdvisorColD"].ToString()) ? "0" : drNew["CSAdvisorColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSAdvisorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSAdvisorColF"].ToString()) ? "0" : drNew["CSAdvisorColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSAdvisorRate"].ToString().Trim()) ? "0.00" : drNew["CSAdvisorRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSAdvisorHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSAdvisorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSAdvisorColD");
            errorBoxes.Add("txtCSAdvisorColF");
        }

        if ((Int32.Parse(dr["CSClinicianColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSClinicianColD"].ToString()) ? "0" : drNew["CSClinicianColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSClinicianColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSClinicianColF"].ToString()) ? "0" : drNew["CSClinicianColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSClinicianRate"].ToString().Trim()) ? "0.00" : drNew["CSClinicianRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSClinicianHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSClinicianHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSClinicianColD");
            errorBoxes.Add("txtCSClinicianColF");
        }

        if ((Int32.Parse(dr["CSConsultantColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSConsultantColD"].ToString()) ? "0" : drNew["CSConsultantColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSConsultantColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSConsultantColF"].ToString()) ? "0" : drNew["CSConsultantColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSConsultantRate"].ToString().Trim()) ? "0.00" : drNew["CSConsultantRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSConsultantHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSConsultantHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSConsultantColD");
            errorBoxes.Add("txtCSConsultantColF");
        }

        if ((Int32.Parse(dr["CSEducatorInstructorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSEducatorInstructorColD"].ToString()) ? "0" : drNew["CSEducatorInstructorColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSEducatorInstructorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSEducatorInstructorColF"].ToString()) ? "0" : drNew["CSEducatorInstructorColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSEducatorInstructorRate"].ToString().Trim()) ? "0.00" : drNew["CSEducatorInstructorRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSEducatorInstructorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSEducatorInstructorColD");
            errorBoxes.Add("txtCSEducatorInstructorColF");
        }

        if ((Int32.Parse(dr["CSHomeVisitorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSHomeVisitorColD"].ToString()) ? "0" : drNew["CSHomeVisitorColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSHomeVisitorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSHomeVisitorColF"].ToString()) ? "0" : drNew["CSHomeVisitorColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSHomeVisitorRate"].ToString().Trim()) ? "0.00" : drNew["CSHomeVisitorRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSHomeVisitorHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSHomeVisitorColD");
            errorBoxes.Add("txtCSHomeVisitorColF");
        }

        if ((Int32.Parse(dr["CSSpecialistColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSpecialistColD"].ToString()) ? "0" : drNew["CSSpecialistColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSSpecialistColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSpecialistColF"].ToString()) ? "0" : drNew["CSSpecialistColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSSpecialistRate"].ToString().Trim()) ? "0.00" : drNew["CSSpecialistRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSSpecialistHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSSpecialistHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSpecialistColD");
            errorBoxes.Add("txtCSSpecialistColF");
        }

        if ((Int32.Parse(dr["CSSpeakerColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSpeakerColD"].ToString()) ? "0" : drNew["CSSpeakerColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSSpeakerColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSpeakerColF"].ToString()) ? "0" : drNew["CSSpeakerColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSSpeakerRate"].ToString().Trim()) ? "0.00" : drNew["CSSpeakerRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSSpeakerHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSSpeakerHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSpeakerColD");
            errorBoxes.Add("txtCSSpeakerColF");
        }

        if ((Int32.Parse(dr["CSSubstituteColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSubstituteColD"].ToString()) ? "0" : drNew["CSSubstituteColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSSubstituteColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSSubstituteColF"].ToString()) ? "0" : drNew["CSSubstituteColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSSubstituteRate"].ToString().Trim()) ? "0.00" : drNew["CSSubstituteRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSSubstituteHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSSubstituteHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSSubstituteColD");
            errorBoxes.Add("txtCSSubstituteColF");
        }

        if ((Int32.Parse(dr["CSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSOtherColD"].ToString()) ? "0" : drNew["CSOtherColD"].ToString()) == 0 &&
            Int32.Parse(dr["CSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CSOtherColF"].ToString()) ? "0" : drNew["CSOtherColF"].ToString()) == 0) &&
            ((Single.Parse(string.IsNullOrEmpty(drNew["CSOtherRate"].ToString().Trim()) ? "0.00" : drNew["CSOtherRate"].ToString().Trim()) > 0.00f)))
        //||
        //(Int32.Parse(string.IsNullOrEmpty(drNew["CSOtherHrWkDayFlat"].ToString().Trim()) ? "0" : drNew["CSOtherHrWkDayFlat"].ToString().Trim()) > 0)))
        {
            errorBoxes.Add("txtCSOtherColD");
            errorBoxes.Add("txtCSOtherColF");
        }


        /*
        //indirect costs
        if (Int32.Parse(dr["IndirectCosts"].ToString()) == 0 && (Single.Parse(dr["IndirectPercent"].ToString().Trim()) > 0.00f))
            errorBoxes.Add("txtIndirectCosts");
        */

        //mileage rate
        if ((Int32.Parse(dr["SupervisoryStaffColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffColD"].ToString()) ? "0" : drNew["SupervisoryStaffColD"].ToString()) == 0 &&
            Int32.Parse(dr["SupervisoryStaffColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffColF"].ToString()) ? "0" : drNew["SupervisoryStaffColF"].ToString()) == 0) &&
            (Single.Parse(dr["SupervisoryStaffMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["SupervisoryStaffMileageRate"].ToString().Trim()) ? "0.00" : drNew["SupervisoryStaffMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtSupervisoryStaffColD");
            errorBoxes.Add("txtSupervisoryStaffColF");
        }

        if ((Int32.Parse(dr["InstructionalStaffColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffColD"].ToString()) ? "0" : drNew["InstructionalStaffColD"].ToString()) == 0 &&
            Int32.Parse(dr["InstructionalStaffColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffColF"].ToString()) ? "0" : drNew["InstructionalStaffColF"].ToString()) == 0) &&
            (Single.Parse(dr["InstructionalStaffMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["InstructionalStaffMileageRate"].ToString().Trim()) ? "0.00" : drNew["InstructionalStaffMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtInstructionalStaffColD");
            errorBoxes.Add("txtInstructionalStaffColF");
        }

        //if ((Int32.Parse(dr["TravelOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColD"].ToString()) ? "0" : drNew["TravelOtherColD"].ToString()) == 0 &&
        //    Int32.Parse(dr["TravelOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColF"].ToString()) ? "0" : drNew["TravelOtherColF"].ToString()) == 0) &&
        //    (Single.Parse(dr["TravelOtherMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["TravelOtherMileageRate"].ToString().Trim()) ? "0.00" : drNew["TravelOtherMileageRate"].ToString().Trim()) > 0.00f))
        //{
        //    errorBoxes.Add("txtTravelOtherColD");
        //    errorBoxes.Add("txtTravelOtherColF");
        //}


        return errorBoxes.Count <= count;
    }

    //amend jwong
    public static bool isValidNumOfStaffAmendment(List<string> errorBoxes, DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if ((Int32.Parse(dr["SupervisorDirectorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColD"].ToString()) ? "0" : drNew["SupervisorDirectorColD"].ToString()) > 0 ||
            Int32.Parse(dr["SupervisorDirectorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorColF"].ToString()) ? "0" : drNew["SupervisorDirectorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["SupervisorDirectorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) ? "0" : drNew["SupervisorDirectorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSupervisorDirectorNumofStaff");

        if ((Int32.Parse(dr["ProjectCoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColD"].ToString()) ? "0" : drNew["ProjectCoordinatorColD"].ToString()) > 0 ||
            Int32.Parse(dr["ProjectCoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorColF"].ToString()) ? "0" : drNew["ProjectCoordinatorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["ProjectCoordinatorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) ? "0" : drNew["ProjectCoordinatorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtProjectCoordinatorNumofStaff");

        if ((Int32.Parse(dr["OtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColD"].ToString()) ? "0" : drNew["OtherColD"].ToString()) > 0 ||
            Int32.Parse(dr["OtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherColF"].ToString()) ? "0" : drNew["OtherColF"].ToString()) > 0) &&
            (Int32.Parse(dr["OtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["OtherNumofStaff"].ToString().Trim()) ? "0" : drNew["OtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtOtherNumofStaff");

        if ((Int32.Parse(dr["AdvisorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColD"].ToString()) ? "0" : drNew["AdvisorColD"].ToString()) > 0 ||
            Int32.Parse(dr["AdvisorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorColF"].ToString()) ? "0" : drNew["AdvisorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["AdvisorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["AdvisorNumofStaff"].ToString().Trim()) ? "0" : drNew["AdvisorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtAdvisorNumofStaff");

        if ((Int32.Parse(dr["ClinicianColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColD"].ToString()) ? "0" : drNew["ClinicianColD"].ToString()) > 0 ||
            Int32.Parse(dr["ClinicianColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianColF"].ToString()) ? "0" : drNew["ClinicianColF"].ToString()) > 0) &&
            (Int32.Parse(dr["ClinicianNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["ClinicianNumofStaff"].ToString().Trim()) ? "0" : drNew["ClinicianNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtClinicianNumofStaff");

        if ((Int32.Parse(dr["CoordinatorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColD"].ToString()) ? "0" : drNew["CoordinatorColD"].ToString()) > 0 ||
            Int32.Parse(dr["CoordinatorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorColF"].ToString()) ? "0" : drNew["CoordinatorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["CoordinatorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["CoordinatorNumofStaff"].ToString().Trim()) ? "0" : drNew["CoordinatorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtCoordinatorNumofStaff");

        if ((Int32.Parse(dr["EducatorInstructorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColD"].ToString()) ? "0" : drNew["EducatorInstructorColD"].ToString()) > 0 ||
            Int32.Parse(dr["EducatorInstructorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorColF"].ToString()) ? "0" : drNew["EducatorInstructorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["EducatorInstructorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["EducatorInstructorNumofStaff"].ToString().Trim()) ? "0" : drNew["EducatorInstructorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtEducatorInstructorNumofStaff");

        if ((Int32.Parse(dr["HomeVisitorColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColD"].ToString()) ? "0" : drNew["HomeVisitorColD"].ToString()) > 0 ||
            Int32.Parse(dr["HomeVisitorColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorColF"].ToString()) ? "0" : drNew["HomeVisitorColF"].ToString()) > 0) &&
            (Int32.Parse(dr["HomeVisitorNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["HomeVisitorNumofStaff"].ToString().Trim()) ? "0" : drNew["HomeVisitorNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtHomeVisitorNumofStaff");

        if ((Int32.Parse(dr["SpecialistColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColD"].ToString()) ? "0" : drNew["SpecialistColD"].ToString()) > 0 ||
            Int32.Parse(dr["SpecialistColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistColF"].ToString()) ? "0" : drNew["SpecialistColF"].ToString()) > 0) &&
            (Int32.Parse(dr["SpecialistNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SpecialistNumofStaff"].ToString().Trim()) ? "0" : drNew["SpecialistNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSpecialistNumofStaff");

        if ((Int32.Parse(dr["IPSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColD"].ToString()) ? "0" : drNew["IPSOtherColD"].ToString()) > 0 ||
            Int32.Parse(dr["IPSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherColF"].ToString()) ? "0" : drNew["IPSOtherColF"].ToString()) > 0) &&
            (Int32.Parse(dr["IPSOtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["IPSOtherNumofStaff"].ToString().Trim()) ? "0" : drNew["IPSOtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtIPSOtherNumofStaff");

        if ((Int32.Parse(dr["AideParaprofessionalColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColD"].ToString()) ? "0" : drNew["AideParaprofessionalColD"].ToString()) > 0 ||
            Int32.Parse(dr["AideParaprofessionalColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalColF"].ToString()) ? "0" : drNew["AideParaprofessionalColF"].ToString()) > 0) &&
            (Int32.Parse(dr["AideParaprofessionalNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) ? "0" : drNew["AideParaprofessionalNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtAideParaprofessionalNumofStaff");

        if ((Int32.Parse(dr["SecretaryBookkeeperColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColD"].ToString()) ? "0" : drNew["SecretaryBookkeeperColD"].ToString()) > 0 ||
            Int32.Parse(dr["SecretaryBookkeeperColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperColF"].ToString()) ? "0" : drNew["SecretaryBookkeeperColF"].ToString()) > 0) &&
            (Int32.Parse(dr["SecretaryBookkeeperNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) ? "0" : drNew["SecretaryBookkeeperNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSecretaryBookkeeperNumofStaff");

        if ((Int32.Parse(dr["SSOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColD"].ToString()) ? "0" : drNew["SSOtherColD"].ToString()) > 0 ||
            Int32.Parse(dr["SSOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherColF"].ToString()) ? "0" : drNew["SSOtherColF"].ToString()) > 0) &&
            (Int32.Parse(dr["SSOtherNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["SSOtherNumofStaff"].ToString().Trim()) ? "0" : drNew["SSOtherNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtSSOtherNumofStaff");

        if ((Int32.Parse(dr["FringeBenefitsColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColD"].ToString()) ? "0" : drNew["FringeBenefitsColD"].ToString()) > 0 ||
            Int32.Parse(dr["FringeBenefitsColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsColF"].ToString()) ? "0" : drNew["FringeBenefitsColF"].ToString()) > 0) &&
            (Int32.Parse(dr["FringeBenefitsNumofStaff"].ToString().Trim()) + Int32.Parse(string.IsNullOrEmpty(drNew["FringeBenefitsNumofStaff"].ToString().Trim()) ? "0" : drNew["FringeBenefitsNumofStaff"].ToString().Trim()) == 0))
            errorBoxes.Add("txtFringeBenefitsNumofStaff");


        return errorBoxes.Count <= count;
    }


    public static bool isValidTravelAmendment(List<string> errorBoxes,DataSet ds)
    {
        int count = errorBoxes.Count;

        DataRow dr = ds.Tables[0].Rows[0];
        DataRow drNew = ds.Tables[1].Rows[0];

        if ((Int32.Parse(dr["TravelOtherColD"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColD"].ToString()) ? "0" : drNew["TravelOtherColD"].ToString()) == 0 &&
            Int32.Parse(dr["TravelOtherColF"].ToString()) + Int32.Parse(string.IsNullOrEmpty(drNew["TravelOtherColF"].ToString()) ? "0" : drNew["TravelOtherColF"].ToString()) == 0) &&
            (Single.Parse(dr["TravelOtherMileageRate"].ToString().Trim()) + Single.Parse(string.IsNullOrEmpty(drNew["TravelOtherMileageRate"].ToString().Trim()) ? "0.00" : drNew["TravelOtherMileageRate"].ToString().Trim()) > 0.00f))
        {
            errorBoxes.Add("txtTravelOtherColD");
            errorBoxes.Add("txtTravelOtherColF");
        }

        return errorBoxes.Count <= count;
    }

    public static bool isValidBudgetAmendmentNarrativeQuestions(List<string> errorBoxes, DataRow dr)
    {
        int count = errorBoxes.Count;

        if ((!string.IsNullOrEmpty(dr["SupervisorDirectorColD"].ToString()) || !string.IsNullOrEmpty(dr["SupervisorDirectorColF"].ToString())) && (string.IsNullOrEmpty(dr["SupervisorDirectorDescr"].ToString().Trim())))
            errorBoxes.Add("txtSupervisorDirectorDescr");

        if ((!string.IsNullOrEmpty(dr["ProjectCoordinatorColD"].ToString()) || !string.IsNullOrEmpty(dr["ProjectCoordinatorColF"].ToString())) && (string.IsNullOrEmpty(dr["ProjectCoordinatorDescr"].ToString().Trim())))
            errorBoxes.Add("txtProjectCoordinatorDescr");

        if ((!string.IsNullOrEmpty(dr["StipendColD"].ToString()) || !string.IsNullOrEmpty(dr["StipendColF"].ToString())) && (string.IsNullOrEmpty(dr["StipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtStipendDescr");

        if ((!string.IsNullOrEmpty(dr["OtherColD"].ToString()) || !string.IsNullOrEmpty(dr["OtherColF"].ToString())) && (string.IsNullOrEmpty(dr["OtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtOtherDescr");

        if ((!string.IsNullOrEmpty(dr["AdvisorColD"].ToString()) || !string.IsNullOrEmpty(dr["AdvisorColF"].ToString())) && (string.IsNullOrEmpty(dr["AdvisorDescr"].ToString().Trim())))
            errorBoxes.Add("txtAdvisorDescr");

        if ((!string.IsNullOrEmpty(dr["ClinicianColD"].ToString()) || !string.IsNullOrEmpty(dr["ClinicianColF"].ToString())) && (string.IsNullOrEmpty(dr["ClinicianDescr"].ToString().Trim())))
            errorBoxes.Add("txtClinicianDescr");

        if ((!string.IsNullOrEmpty(dr["CoordinatorColD"].ToString()) || !string.IsNullOrEmpty(dr["CoordinatorColF"].ToString())) && (string.IsNullOrEmpty(dr["CoordinatorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCoordinatorDescr");

        if ((!string.IsNullOrEmpty(dr["EducatorInstructorColD"].ToString()) || !string.IsNullOrEmpty(dr["EducatorInstructorColF"].ToString())) && (string.IsNullOrEmpty(dr["EducatorInstructorDescr"].ToString().Trim())))
            errorBoxes.Add("txtEducatorInstructorDescr");

        if ((!string.IsNullOrEmpty(dr["HomeVisitorColD"].ToString()) || !string.IsNullOrEmpty(dr["HomeVisitorColF"].ToString())) && (string.IsNullOrEmpty(dr["HomeVisitorDescr"].ToString().Trim())))
            errorBoxes.Add("txtHomeVisitorDescr");

        if ((!string.IsNullOrEmpty(dr["SpecialistColD"].ToString()) || !string.IsNullOrEmpty(dr["SpecialistColF"].ToString())) && (string.IsNullOrEmpty(dr["SpecialistDescr"].ToString().Trim())))
            errorBoxes.Add("txtSpecialistDescr");

        if ((!string.IsNullOrEmpty(dr["IPSStipendColD"].ToString()) || !string.IsNullOrEmpty(dr["IPSStipendColF"].ToString())) && (string.IsNullOrEmpty(dr["IPSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtIPSStipendDescr");

        if ((!string.IsNullOrEmpty(dr["IPSOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["IPSOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["IPSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtIPSOtherDescr");

        if ((!string.IsNullOrEmpty(dr["AideParaprofessionalColD"].ToString()) || !string.IsNullOrEmpty(dr["AideParaprofessionalColF"].ToString())) && (string.IsNullOrEmpty(dr["AideParaprofessionalDescr"].ToString().Trim())))
            errorBoxes.Add("txtAideParaprofessionalDescr");

        if ((!string.IsNullOrEmpty(dr["SecretaryBookkeeperColD"].ToString()) || !string.IsNullOrEmpty(dr["SecretaryBookkeeperColF"].ToString())) && (string.IsNullOrEmpty(dr["SecretaryBookkeeperDescr"].ToString().Trim())))
            errorBoxes.Add("txtSecretaryBookkeeperDescr");

        if ((!string.IsNullOrEmpty(dr["SSStipendColD"].ToString()) || !string.IsNullOrEmpty(dr["SSStipendColF"].ToString())) && (string.IsNullOrEmpty(dr["SSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtSSStipendDescr");

        if ((!string.IsNullOrEmpty(dr["SSOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["SSOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["SSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtSSOtherDescr");

        if ((!string.IsNullOrEmpty(dr["FringeBenefitsColD"].ToString()) || !string.IsNullOrEmpty(dr["FringeBenefitsColF"].ToString())) && (string.IsNullOrEmpty(dr["FringeBenefitsDescr"].ToString().Trim())))
            errorBoxes.Add("txtFringeBenefitsDescr");

        if ((!string.IsNullOrEmpty(dr["CSAdvisorColD"].ToString()) || !string.IsNullOrEmpty(dr["CSAdvisorColF"].ToString())) && (string.IsNullOrEmpty(dr["CSAdvisorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSAdvisorDescr");

        if ((!string.IsNullOrEmpty(dr["CSClinicianColD"].ToString()) || !string.IsNullOrEmpty(dr["CSClinicianColF"].ToString())) && (string.IsNullOrEmpty(dr["CSClinicianDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSClinicianDescr");

        if ((!string.IsNullOrEmpty(dr["CSConsultantColD"].ToString()) || !string.IsNullOrEmpty(dr["CSConsultantColF"].ToString())) && (string.IsNullOrEmpty(dr["CSConsultantDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSConsultantDescr");

        if ((!string.IsNullOrEmpty(dr["CSEducatorInstructorColD"].ToString()) || !string.IsNullOrEmpty(dr["CSEducatorInstructorColF"].ToString())) && (string.IsNullOrEmpty(dr["CSEducatorInstructorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSEducatorInstructorDescr");

        if ((!string.IsNullOrEmpty(dr["CSHomeVisitorColD"].ToString()) || !string.IsNullOrEmpty(dr["CSHomeVisitorColF"].ToString())) && (string.IsNullOrEmpty(dr["CSHomeVisitorDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSHomeVisitorDescr");

        if ((!string.IsNullOrEmpty(dr["CSSpecialistColD"].ToString()) || !string.IsNullOrEmpty(dr["CSSpecialistColF"].ToString())) && (string.IsNullOrEmpty(dr["CSSpecialistDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSpecialistDescr");

        if ((!string.IsNullOrEmpty(dr["CSSpeakerColD"].ToString()) || !string.IsNullOrEmpty(dr["CSSpeakerColF"].ToString())) && (string.IsNullOrEmpty(dr["CSSpeakerDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSpeakerDescr");

        if ((!string.IsNullOrEmpty(dr["CSSubstituteColD"].ToString()) || !string.IsNullOrEmpty(dr["CSSubstituteColF"].ToString())) && (string.IsNullOrEmpty(dr["CSSubstituteDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSSubstituteDescr");

        if ((!string.IsNullOrEmpty(dr["CSStipendColD"].ToString()) || !string.IsNullOrEmpty(dr["CSStipendColF"].ToString())) && (string.IsNullOrEmpty(dr["CSStipendDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSStipendDescr");

        if ((!string.IsNullOrEmpty(dr["CSOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["CSOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["CSOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtCSOtherDescr");

        if ((!string.IsNullOrEmpty(dr["EducationalInstructionalMaterialsColD"].ToString()) || !string.IsNullOrEmpty(dr["EducationalInstructionalMaterialsColF"].ToString())) && (string.IsNullOrEmpty(dr["EducationalInstructionalMaterialsDescr"].ToString().Trim())))
            errorBoxes.Add("txtEducationalInstructionalMaterialsDescr");

        if ((!string.IsNullOrEmpty(dr["InstructionalTechnologySoftwareColD"].ToString()) || !string.IsNullOrEmpty(dr["InstructionalTechnologySoftwareColF"].ToString())) && (string.IsNullOrEmpty(dr["InstructionalTechnologySoftwareDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalTechnologySoftwareDescr");

        if ((!string.IsNullOrEmpty(dr["NonInstructionalSuppliesColD"].ToString()) || !string.IsNullOrEmpty(dr["NonInstructionalSuppliesColF"].ToString())) && (string.IsNullOrEmpty(dr["NonInstructionalSuppliesDescr"].ToString().Trim())))
            errorBoxes.Add("txtNonInstructionalSuppliesDescr");

        if ((!string.IsNullOrEmpty(dr["SMOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["SMOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["SMOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtSMOtherDescr");

        if ((!string.IsNullOrEmpty(dr["SupervisoryStaffColD"].ToString()) || !string.IsNullOrEmpty(dr["SupervisoryStaffColF"].ToString())) && (string.IsNullOrEmpty(dr["SupervisoryStaffDescr"].ToString().Trim())))
            errorBoxes.Add("txtSupervisoryStaffDescr");

        if ((!string.IsNullOrEmpty(dr["InstructionalStaffColD"].ToString()) || !string.IsNullOrEmpty(dr["InstructionalStaffColF"].ToString())) && (string.IsNullOrEmpty(dr["InstructionalStaffDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalStaffDescr");

        if ((!string.IsNullOrEmpty(dr["TravelOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["TravelOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["TraveOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtTravelOtherDescr");

        if ((!string.IsNullOrEmpty(dr["AdvertisingColD"].ToString()) || !string.IsNullOrEmpty(dr["AdvertisingColF"].ToString())) && (string.IsNullOrEmpty(dr["AdvertisingDescr"].ToString().Trim())))
            errorBoxes.Add("txtAdvertisingDescr");

        if ((!string.IsNullOrEmpty(dr["EquipmentRentalColD"].ToString()) || !string.IsNullOrEmpty(dr["EquipmentRentalColF"].ToString())) && (string.IsNullOrEmpty(dr["EquipmentRentalDescr"].ToString().Trim())))
            errorBoxes.Add("txtEquipmentRentalDescr");

        if ((!string.IsNullOrEmpty(dr["MaintenanceRepairsColD"].ToString()) || !string.IsNullOrEmpty(dr["MaintenanceRepairsColF"].ToString())) && (string.IsNullOrEmpty(dr["MaintenanceRepairsDescr"].ToString().Trim())))
            errorBoxes.Add("txtMaintenanceRepairsDescr");

        if ((!string.IsNullOrEmpty(dr["MembershipSubscriptionsColD"].ToString()) || !string.IsNullOrEmpty(dr["MembershipSubscriptionsColF"].ToString())) && (string.IsNullOrEmpty(dr["MembershipSubscriptionsDescr"].ToString().Trim())))
            errorBoxes.Add("txtMembershipSubscriptionsDescr");

        if ((!string.IsNullOrEmpty(dr["PrintingReproductionColD"].ToString()) || !string.IsNullOrEmpty(dr["PrintingReproductionColF"].ToString())) && (string.IsNullOrEmpty(dr["PrintingReproductionDescr"].ToString().Trim())))
            errorBoxes.Add("txtPrintingReproductionDescr");

        if ((!string.IsNullOrEmpty(dr["StaffTrainingColD"].ToString()) || !string.IsNullOrEmpty(dr["StaffTrainingColF"].ToString())) && (string.IsNullOrEmpty(dr["StaffTrainingDescr"].ToString().Trim())))
            errorBoxes.Add("txtStaffTrainingDescr");

        if ((!string.IsNullOrEmpty(dr["RentalofSpaceColD"].ToString()) || !string.IsNullOrEmpty(dr["RentalofSpaceColF"].ToString())) && (string.IsNullOrEmpty(dr["RentalofSpaceDescr"].ToString().Trim())))
            errorBoxes.Add("txtRentalofSpaceDescr");

        if ((!string.IsNullOrEmpty(dr["TelephoneUtilitiesColD"].ToString()) || !string.IsNullOrEmpty(dr["TelephoneUtilitiesColF"].ToString())) && (string.IsNullOrEmpty(dr["TelephoneUtilitiesDescr"].ToString().Trim())))
            errorBoxes.Add("txtTelephoneUtilitiesDescr");

        if ((!string.IsNullOrEmpty(dr["DirectServiceTransportationColD"].ToString()) || !string.IsNullOrEmpty(dr["DirectServiceTransportationColF"].ToString())) && (string.IsNullOrEmpty(dr["DirectServiceTransportationDescr"].ToString().Trim())))
            errorBoxes.Add("txtDirectServiceTransportationDescr");

        if ((!string.IsNullOrEmpty(dr["OCOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["OCOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["OCOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtOCOtherDescr");

        if ((!string.IsNullOrEmpty(dr["ProfessionalDevelopOpportunitiesColD"].ToString()) || !string.IsNullOrEmpty(dr["ProfessionalDevelopOpportunitiesColF"].ToString())) && (string.IsNullOrEmpty(dr["ProfessionalDevelopOpportunitiesDescr"].ToString().Trim())))
            errorBoxes.Add("txtProfessionalDevelopOpportunitiesDescr");

        if ((!string.IsNullOrEmpty(dr["ApplicationFeesColD"].ToString()) || !string.IsNullOrEmpty(dr["ApplicationFeesColF"].ToString())) && (string.IsNullOrEmpty(dr["ApplicationFeesDescr"].ToString().Trim())))
            errorBoxes.Add("txtApplicationFeesDescr");

        if ((!string.IsNullOrEmpty(dr["CEUCoursesColD"].ToString()) || !string.IsNullOrEmpty(dr["CEUCoursesColF"].ToString())) && (string.IsNullOrEmpty(dr["CEUCoursesDescr"].ToString().Trim())))
            errorBoxes.Add("txtCEUCoursesDescr");

        if ((!string.IsNullOrEmpty(dr["CollegeCoursesColD"].ToString()) || !string.IsNullOrEmpty(dr["CollegeCoursesColF"].ToString())) && (string.IsNullOrEmpty(dr["CollegeCoursesDescr"].ToString().Trim())))
            errorBoxes.Add("txtCollegeCoursesDescr");

        if ((!string.IsNullOrEmpty(dr["CBOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["CBOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["CBOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtCBOtherDescr");

        if ((!string.IsNullOrEmpty(dr["InstructionalEquipmentColD"].ToString()) || !string.IsNullOrEmpty(dr["InstructionalEquipmentColF"].ToString())) && (string.IsNullOrEmpty(dr["InstructionalEquipmentDescr"].ToString().Trim())))
            errorBoxes.Add("txtInstructionalEquipmentDescr");

        if ((!string.IsNullOrEmpty(dr["NoninstructionalEquipmentColD"].ToString()) || !string.IsNullOrEmpty(dr["NoninstructionalEquipmentColF"].ToString())) && (string.IsNullOrEmpty(dr["NoninstructionalEquipmentDescr"].ToString().Trim())))
            errorBoxes.Add("txtNoninstructionalEquipmentDescr");

        if ((!string.IsNullOrEmpty(dr["EqOtherColD"].ToString()) || !string.IsNullOrEmpty(dr["EqOtherColF"].ToString())) && (string.IsNullOrEmpty(dr["EqOtherDescr"].ToString().Trim())))
            errorBoxes.Add("txtEqOtherDescr");

        if ((!string.IsNullOrEmpty(dr["AncillaryColD"].ToString()) || !string.IsNullOrEmpty(dr["AncillaryColF"].ToString())) && (string.IsNullOrEmpty(dr["AncillaryDescr"].ToString().Trim())))
            errorBoxes.Add("txtAncillaryDescr");

        if ((!string.IsNullOrEmpty(dr["IndirectCosts"].ToString()) || (!string.IsNullOrEmpty(dr["IndirectPercent"].ToString()))) && (string.IsNullOrEmpty(dr["IndirectCostsDescr"].ToString().Trim())))
            errorBoxes.Add("txtIndirectCostsDescr");

        return errorBoxes.Count <= count;
    }

    public static bool isValidBudgetAmendmentSummaryEECAdminLimit(DataSet ds, int eligAmount, out float amount)
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
                        + Int32.Parse(dr["AncillarySubTotalColF"].ToString())
                        + Int32.Parse(dr["IndirectCosts"].ToString());

        float adminlimit = AppInfo.EECAdminLimitPerc * 0.01f;

        if (Math.Round(eligAmount * adminlimit, 0) < GrantAdmin)
        {
            amount = GrantAdmin - (int)Math.Round((eligAmount * adminlimit), 0);

            return false;
        }

        return true;
    }

    public static bool isValidBudgetAmendmentSummaryEligibilityAmount(int AllocFund, DataSet ds)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        int GrandTotal = Int32.Parse(dr["GrantTotal"].ToString());

        if (AllocFund != GrandTotal)
        {
            return false;
        }

        return true;
    }
}
