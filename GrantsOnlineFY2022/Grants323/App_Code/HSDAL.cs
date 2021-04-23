using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

/// <summary>
/// Summary description for HSDAL
/// </summary>
public class HSDAL
{
    public HSDAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool IsPartialSurvey()
    {
        if (HttpContext.Current.Session["PartialSurvey"] != null)
            return true;
        else
            return false;
    }

    public int ConvertInt(string s)
    {
        try
        {
            int k = int.Parse(s);
            return k;
        }
        catch
        {
            return 0;
        }
    }
    public string GetConnectionStringForHeadStartSiteSurvey()
    {
        return ConfigurationManager.ConnectionStrings["GrantRenewalCom"].ToString();
    }

    public string GetConnectionStringForLicensing()
    {
        return ConfigurationManager.ConnectionStrings["Licensing"].ToString();
    }


    public DataSet GetHSLEA()
    {
        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSLEA");
    }

    public bool HSIsRegistered(string hscode)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = hscode;

        return (Int32.Parse((SqlHelper.ExecuteScalar(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspHSIsRegistered", pArray).ToString())) == 1 ? true : false);
    }

    public DataSet GetHSSiteReportInfo(string HeadStartLeadAgencyID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSSiteReportInfofy16", pArray);
    }


    public int HSSavePassword(string hscode, string password)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = hscode;

        pArray[1] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[1].Value = password;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspHSSavePassword", pArray));
    }

    public int HSConfirmPassword(string leaCode, string password)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = leaCode;

        pArray[1] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[1].Value = password;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspHSConfirmPassword", pArray));
    }


    /// Save Head Start Site Survey Report information to database
    public int SaveLEAdbaseSiteSurvey
    (string HeadStartLeadAgencyID
        , string FiscalYear
        , string LeadAgencyName
        , string GranteeAddress
       , string CityTown
       , string ZipCode
       , string Contracts
        , decimal ContractsAmount
       , string Vouchers
       , decimal VouchersAmount
       , string FundingRecieveOther
       , decimal FundingRecievedOtherAmount
       , string FundingRecievedOtherName
       , string FundingRecievedOtherDescr
       , string ChildCareQualityGrant
       , decimal ChildCareQualityAmount
       , string CFCEGrant
       , decimal CFCEAmount
       , string EducationProviderSupport
       , decimal EducationProviderSupportAmount
       , string MentalHealthConsultationServices
       , decimal MentalHealthConsultationServicesAmount
       , string PreschoolInnStemCurriculum
       , decimal PreschoolInnStemCurriculumAmount
       , string UniversalPreKindergartencom
       , decimal UniversalPreKindergartencomAmount
       , string QRISQIG
       , decimal QRISQIGAmountApplied
       , string EECCompetiveOther
       , decimal EECCompetiveOtherAmountApplied
       , string EECCompetiveOtherAmountAppliedName
       , string EECCompetiveOtherAmountAppliedDescr
       , string EarlyChildhoodSpecialEducationAllocation
       , decimal EarlyChildhoodSpecialEducationAllocationAmount
       , string SpecialEducationInclusivePreSchoolGrant
       , decimal SpecialEducationInclusivePreSchoolGrantAmount
       , string UniversalPreKindergarten
       , decimal UniversalPreKindergartenAmount
       , string OtherGrant
       , string OtherGrantName
       , decimal OtherGrantAmount
       , string OtherAmountDescr

       )
    {
        SqlParameter[] pArray = new SqlParameter[42];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.VarChar, 10);
        pArray[1].Value = FiscalYear;

        pArray[2] = new SqlParameter("@LeadAgencyName", SqlDbType.VarChar, 50);
        pArray[2].Value = LeadAgencyName;

        pArray[3] = new SqlParameter("@GranteeAddress", SqlDbType.VarChar, 250);
        pArray[3].Value = GranteeAddress;

        pArray[4] = new SqlParameter("@CityTown", SqlDbType.VarChar, 20);
        pArray[4].Value = CityTown;

        pArray[5] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[5].Value = ZipCode;

        pArray[6] = new SqlParameter("@Contracts", SqlDbType.VarChar, 20);
        pArray[6].Value = Contracts;

        pArray[7] = new SqlParameter("@ContractsAmount", SqlDbType.Decimal);
        pArray[7].Value = ContractsAmount;

        pArray[8] = new SqlParameter("@Vouchers", SqlDbType.VarChar, 10);
        pArray[8].Value = Vouchers;

        pArray[9] = new SqlParameter("@VouchersAmount", SqlDbType.Decimal);
        pArray[9].Value = VouchersAmount;

        pArray[10] = new SqlParameter("@FundingRecieveOther", SqlDbType.VarChar, 10);
        pArray[10].Value = FundingRecieveOther;

        pArray[11] = new SqlParameter("@FundingRecievedOtherAmount", SqlDbType.Decimal);
        pArray[11].Value = FundingRecievedOtherAmount;

        pArray[12] = new SqlParameter("@FundingRecievedOtherName", SqlDbType.VarChar, 50);
        pArray[12].Value = FundingRecievedOtherName;

        pArray[13] = new SqlParameter("@FundingRecievedOtherDescr", SqlDbType.VarChar, -1);
        pArray[13].Value = FundingRecievedOtherDescr;

        pArray[14] = new SqlParameter("@ChildCareQualityGrant", SqlDbType.VarChar, 10);
        pArray[14].Value = ChildCareQualityGrant;

        pArray[15] = new SqlParameter("@ChildCareQualityAmount", SqlDbType.Decimal);
        pArray[15].Value = ChildCareQualityAmount;

        pArray[16] = new SqlParameter("@CFCEGrant", SqlDbType.VarChar, 10);
        pArray[16].Value = CFCEGrant;

        pArray[17] = new SqlParameter("@CFCEAmount", SqlDbType.Decimal);
        pArray[17].Value = CFCEAmount;

        pArray[18] = new SqlParameter("@EducationProviderSupport", SqlDbType.VarChar, 10);
        pArray[18].Value = EducationProviderSupport;

        pArray[19] = new SqlParameter("@EducationProviderSupportAmount", SqlDbType.Decimal);
        pArray[19].Value = EducationProviderSupportAmount;

        pArray[20] = new SqlParameter("@MentalHealthConsultationServices", SqlDbType.VarChar, 10);
        pArray[20].Value = MentalHealthConsultationServices;

        pArray[21] = new SqlParameter("@MentalHealthConsultationServicesAmount", SqlDbType.Decimal);
        pArray[21].Value = MentalHealthConsultationServicesAmount;

        pArray[22] = new SqlParameter("@PreschoolInnStemCurriculum", SqlDbType.VarChar, 10);
        pArray[22].Value = PreschoolInnStemCurriculum;

        pArray[23] = new SqlParameter("@PreschoolInnStemCurriculumAmount", SqlDbType.Decimal);
        pArray[23].Value = PreschoolInnStemCurriculumAmount;

        pArray[24] = new SqlParameter("@UniversalPreKindergartencom", SqlDbType.VarChar, 10);
        pArray[24].Value = UniversalPreKindergartencom;

        pArray[25] = new SqlParameter("@UniversalPreKindergartencomAmount", SqlDbType.Decimal);
        pArray[25].Value = UniversalPreKindergartencomAmount;

        pArray[26] = new SqlParameter("@QRISQIG", SqlDbType.VarChar, 10);
        pArray[26].Value = QRISQIG;

        pArray[27] = new SqlParameter("@QRISQIGAmountApplied", SqlDbType.Decimal);
        pArray[27].Value = QRISQIGAmountApplied;

        pArray[28] = new SqlParameter("@EECCompetiveOther", SqlDbType.VarChar, 10);
        pArray[28].Value = EECCompetiveOther;

        pArray[29] = new SqlParameter("@EECCompetiveOtherAmountApplied", SqlDbType.Decimal);
        pArray[29].Value = EECCompetiveOtherAmountApplied;

        pArray[30] = new SqlParameter("@EECCompetiveOtherAmountAppliedName", SqlDbType.VarChar, 250);
        pArray[30].Value = EECCompetiveOtherAmountAppliedName;

        pArray[31] = new SqlParameter("@EECCompetiveOtherAmountAppliedDescr", SqlDbType.VarChar, -1);
        pArray[31].Value = EECCompetiveOtherAmountAppliedDescr;

        pArray[32] = new SqlParameter("@EarlyChildhoodSpecialEducationAllocation", SqlDbType.VarChar, 10);
        pArray[32].Value = EarlyChildhoodSpecialEducationAllocation;

        pArray[33] = new SqlParameter("@EarlyChildhoodSpecialEducationAllocationAmount", SqlDbType.Decimal);
        pArray[33].Value = EarlyChildhoodSpecialEducationAllocationAmount;

        pArray[34] = new SqlParameter("@SpecialEducationInclusivePreSchoolGrant", SqlDbType.VarChar, 10);
        pArray[34].Value = SpecialEducationInclusivePreSchoolGrant;

        pArray[35] = new SqlParameter("@SpecialEducationInclusivePreSchoolGrantAmount", SqlDbType.Decimal);
        pArray[35].Value = SpecialEducationInclusivePreSchoolGrantAmount;

        pArray[36] = new SqlParameter("@UniversalPreKindergarten", SqlDbType.VarChar, 10);
        pArray[36].Value = UniversalPreKindergarten;

        pArray[37] = new SqlParameter("@UniversalPreKindergartenAmount", SqlDbType.Decimal);
        pArray[37].Value = UniversalPreKindergartenAmount;

        pArray[38] = new SqlParameter("@OtherGrant", SqlDbType.VarChar, 10);
        pArray[38].Value = OtherGrant;

        pArray[39] = new SqlParameter("@OtherGrantName", SqlDbType.VarChar, 50);
        pArray[39].Value = OtherGrantName;

        pArray[40] = new SqlParameter("@OtherGrantAmount", SqlDbType.Decimal);
        pArray[40].Value = OtherGrantAmount;

        pArray[41] = new SqlParameter("@OtherAmountDescr", SqlDbType.VarChar, -1);
        pArray[41].Value = OtherAmountDescr;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveLEAdbaseSiteSurveyfy16", pArray);
    }

    public int UpdateHSReportStatus(string HeadStartLeadAgencyID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.VarChar, 12);
        pArray[0].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSReportStatus", pArray);
    }

    //public int UpdateHSCenterBaseSitetbl(int HeadStartLeadAgencyID)
    //{
    //    SqlParameter[] pArray = new SqlParameter[1];
    //    pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
    //    pArray[0].Value = HeadStartLeadAgencyID;

    //    return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSCenterBaseSitetbl", pArray);
    //}

    //public int UpdateHSFCCtbl(int HeadStartLeadAgencyID)
    //{
    //    SqlParameter[] pArray = new SqlParameter[1];
    //    pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
    //    pArray[0].Value = HeadStartLeadAgencyID;

    //    return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSFCCtbl", pArray);
    //}

    //public int UpdateHSHometbl(int HeadStartLeadAgencyID)
    //{
    //    SqlParameter[] pArray = new SqlParameter[1];
    //    pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
    //    pArray[0].Value = HeadStartLeadAgencyID;

    //    return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSHometbl", pArray);
    //}

    public DataSet GetHSCenterBaseSiteSurvey(int HeadStartLeadAgencyID, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSCenterBaseSiteSurvey", pArray);
    }

    public DataSet GetHSCenterBaseSiteSurveyinfo(int HeadStartCBLeadAgencyIDNumber, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@HeadStartCBLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartCBLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSCenterBaseSiteSurveyinfo", pArray);
    }

    public int SaveHSCenterbaseSitSurvey
      (
        int HeadStartLeadAgencyID
        , int TotalCbPrograms
        , string ProgramNumber
        , string HeadStartFacilityName
        , string Address
        , string City
        , string ZipCode
        , int EECLicensedCapacity
        , int NumberChildrenFundedACF
        , int NumberChildrenFundedNonACF
        , int NumberDualLanguageLearners
        , string NAEYCAccredited
        , int TotalNumberClassrooms
        , int FullDayClasses
        , int FullYearClasses
        , int NumberClassroomTeachers
        , int NumberHighSchoolTeachers
        , int NumberSomeCollegeTeachers
        , int CDATeachers
        , int NumberAAASDegreedTeachers
        , int NumberBABSDegreedTeachers
        , int AdvanceDegreedTeachers
        , int NumberUPKClassrooms
        , int NumberUPKChildrenClassroom
        , string QRISParticipation
        , string QRISSelfAssessedLevel
        , string QRISGrantedLevel
        , string Comments
        , int FiscalYear
        , string Accreditation
        , string AccreditationNumber
        , string AccreditationEarnDate
        , string AccreditationExpDate
        )

    {
        SqlParameter[] pArray = new SqlParameter[35];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@TotalCbPrograms", SqlDbType.Int);
        pArray[1].Value = TotalCbPrograms;

        pArray[2] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[2].Value = ProgramNumber;

        pArray[3] = new SqlParameter("@HeadStartFacilityName", SqlDbType.VarChar, 150);
        pArray[3].Value = HeadStartFacilityName;

        pArray[4] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[4].Value = Address;

        pArray[5] = new SqlParameter("@City", SqlDbType.VarChar, 50);
        pArray[5].Value = City;

        pArray[6] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[6].Value = ZipCode;

        pArray[7] = new SqlParameter("@EECLicensedCapacity", SqlDbType.Int);
        pArray[7].Value = EECLicensedCapacity;

        pArray[8] = new SqlParameter("@NumberChildrenFundedACF", SqlDbType.Int);
        pArray[8].Value = NumberChildrenFundedACF;

        pArray[9] = new SqlParameter("@NumberChildrenFundedNonACF", SqlDbType.Int);
        pArray[9].Value = NumberChildrenFundedNonACF;

        pArray[10] = new SqlParameter("@NumberDualLanguageLearners", SqlDbType.Int);
        pArray[10].Value = NumberDualLanguageLearners;

        pArray[11] = new SqlParameter("@NAEYCAccredited", SqlDbType.VarChar, 10);
        pArray[11].Value = NAEYCAccredited;

        pArray[12] = new SqlParameter("@TotalNumberClassrooms", SqlDbType.Int);
        pArray[12].Value = TotalNumberClassrooms;

        pArray[13] = new SqlParameter("@FullDayClasses", SqlDbType.Int);
        pArray[13].Value = FullDayClasses;

        pArray[14] = new SqlParameter("@FullYearClasses", SqlDbType.Int);
        pArray[14].Value = FullYearClasses;

        pArray[15] = new SqlParameter("@NumberClassroomTeachers", SqlDbType.Int);
        pArray[15].Value = NumberClassroomTeachers;

        pArray[16] = new SqlParameter("@NumberHighSchoolTeachers", SqlDbType.Int);
        pArray[16].Value = NumberHighSchoolTeachers;

        pArray[17] = new SqlParameter("@NumberSomeCollegeTeachers", SqlDbType.Int);
        pArray[17].Value = NumberSomeCollegeTeachers;

        pArray[18] = new SqlParameter("@CDATeachers", SqlDbType.Int);
        pArray[18].Value = CDATeachers;

        pArray[19] = new SqlParameter("@NumberAAASDegreedTeachers", SqlDbType.Int);
        pArray[19].Value = NumberAAASDegreedTeachers;

        pArray[20] = new SqlParameter("@NumberBABSDegreedTeachers", SqlDbType.Int);
        pArray[20].Value = NumberBABSDegreedTeachers;

        pArray[21] = new SqlParameter("@AdvanceDegreedTeachers", SqlDbType.Int);
        pArray[21].Value = AdvanceDegreedTeachers;

        pArray[22] = new SqlParameter("@NumberUPKClassrooms", SqlDbType.Int);
        pArray[22].Value = NumberUPKClassrooms;

        pArray[23] = new SqlParameter("@NumberUPKChildrenClassroom", SqlDbType.Int);
        pArray[23].Value = NumberUPKChildrenClassroom;

        pArray[24] = new SqlParameter("@QRISParticipation", SqlDbType.VarChar, 10);
        pArray[24].Value = QRISParticipation;

        pArray[25] = new SqlParameter("@QRISSelfAssessedLevel", SqlDbType.VarChar, 20);
        pArray[25].Value = QRISSelfAssessedLevel;

        pArray[26] = new SqlParameter("@QRISGrantedLevel", SqlDbType.VarChar, 20);
        pArray[26].Value = QRISGrantedLevel;

        pArray[27] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[27].Value = Comments;

        pArray[28] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[28].Value = FiscalYear;

        pArray[29] = new SqlParameter("@Accreditation", SqlDbType.Int);
        pArray[29].Value = Accreditation;

        pArray[30] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar, -1);
        pArray[30].Value = AccreditationNumber;

        pArray[31] = new SqlParameter("@AccreditationEarnDate", SqlDbType.VarChar, -1);
        pArray[31].Value = AccreditationEarnDate;

        pArray[32] = new SqlParameter("@AccreditationExpDate", SqlDbType.VarChar, -1);
        pArray[32].Value = AccreditationExpDate;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveHSCenterbaseSitSurvey", pArray);
    }

    public int UpdateHSCenterBaseSiteSurvey
        (
        int HeadStartCBLeadAgencyIDNumber
        , string ProgramNumber
        , string HeadStartFacilityName
        , string Address
        , string City
        , string ZipCode
        , int EECLicensedCapacity
        , int NumberChildrenFundedACF
        , int NumberChildrenFundedNonACF
        , int NumberDualLanguageLearners
        , string NAEYCAccredited
        , int TotalNumberClassrooms
        , int FullDayClasses
        , int FullYearClasses
        , int NumberClassroomTeachers
        , int NumberHighSchoolTeachers
        , int NumberSomeCollegeTeachers
        , int CDATeachers
        , int NumberAAASDegreedTeachers
        , int NumberBABSDegreedTeachers
        , int AdvanceDegreedTeachers
        , int NumberUPKClassrooms
        , int NumberUPKChildrenClassroom
        , string QRISParticipation
        , string QRISSelfAssessedLevel
        , string QRISGrantedLevel
        , string Comments
        , int TotalCbPrograms
        , int HeadStartLeadAgencyID
        , string Accreditation
        , string AccreditationNumber
        , string AccreditationEarnDate
        , string AccreditationExpDate
        )
    {
        SqlParameter[] pArray = new SqlParameter[35];
        pArray[0] = new SqlParameter("@HeadStartCBLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartCBLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[1].Value = ProgramNumber;

        pArray[2] = new SqlParameter("@HeadStartFacilityName", SqlDbType.VarChar, 150);
        pArray[2].Value = HeadStartFacilityName;

        pArray[3] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[3].Value = Address;

        pArray[4] = new SqlParameter("@City", SqlDbType.VarChar, 50);
        pArray[4].Value = City;

        pArray[5] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[5].Value = ZipCode;

        pArray[6] = new SqlParameter("@EECLicensedCapacity", SqlDbType.Int);
        pArray[6].Value = EECLicensedCapacity;

        pArray[7] = new SqlParameter("@NumberChildrenFundedACF", SqlDbType.Int);
        pArray[7].Value = NumberChildrenFundedACF;

        pArray[8] = new SqlParameter("@NumberChildrenFundedNonACF", SqlDbType.Int);
        pArray[8].Value = NumberChildrenFundedNonACF;

        pArray[9] = new SqlParameter("@NumberDualLanguageLearners", SqlDbType.Int);
        pArray[9].Value = NumberDualLanguageLearners;

        pArray[10] = new SqlParameter("@NAEYCAccredited", SqlDbType.VarChar, 10);
        pArray[10].Value = NAEYCAccredited;

        pArray[11] = new SqlParameter("@TotalNumberClassrooms", SqlDbType.Int);
        pArray[11].Value = TotalNumberClassrooms;

        pArray[12] = new SqlParameter("@FullDayClasses", SqlDbType.Int);
        pArray[12].Value = FullDayClasses;

        pArray[13] = new SqlParameter("@FullYearClasses", SqlDbType.Int);
        pArray[13].Value = FullYearClasses;

        pArray[14] = new SqlParameter("@NumberClassroomTeachers", SqlDbType.Int);
        pArray[14].Value = NumberClassroomTeachers;

        pArray[15] = new SqlParameter("@NumberHighSchoolTeachers", SqlDbType.Int);
        pArray[15].Value = NumberHighSchoolTeachers;

        pArray[16] = new SqlParameter("@NumberSomeCollegeTeachers", SqlDbType.Int);
        pArray[16].Value = NumberSomeCollegeTeachers;

        pArray[17] = new SqlParameter("@CDATeachers", SqlDbType.Int);
        pArray[17].Value = CDATeachers;

        pArray[18] = new SqlParameter("@NumberAAASDegreedTeachers", SqlDbType.Int);
        pArray[18].Value = NumberAAASDegreedTeachers;

        pArray[19] = new SqlParameter("@NumberBABSDegreedTeachers", SqlDbType.Int);
        pArray[19].Value = NumberBABSDegreedTeachers;

        pArray[20] = new SqlParameter("@AdvanceDegreedTeachers", SqlDbType.Int);
        pArray[20].Value = AdvanceDegreedTeachers;

        pArray[21] = new SqlParameter("@NumberUPKClassrooms", SqlDbType.Int);
        pArray[21].Value = NumberUPKClassrooms;

        pArray[22] = new SqlParameter("@NumberUPKChildrenClassroom", SqlDbType.Int);
        pArray[22].Value = NumberUPKChildrenClassroom;

        pArray[23] = new SqlParameter("@QRISParticipation", SqlDbType.VarChar, 10);
        pArray[23].Value = QRISParticipation;

        pArray[24] = new SqlParameter("@QRISSelfAssessedLevel", SqlDbType.VarChar, 20);
        pArray[24].Value = QRISSelfAssessedLevel;

        pArray[25] = new SqlParameter("@QRISGrantedLevel", SqlDbType.VarChar, 20);
        pArray[25].Value = QRISGrantedLevel;

        pArray[26] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[26].Value = Comments;

        pArray[27] = new SqlParameter("@TotalCbPrograms", SqlDbType.Int);
        pArray[27].Value = TotalCbPrograms;

        pArray[28] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[28].Value = HeadStartLeadAgencyID;

        if (NAEYCAccredited == "Yes")
        {
            pArray[29] = new SqlParameter("@Accreditation", SqlDbType.VarChar, -1);
            pArray[29].Value = Accreditation;

            pArray[30] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar, -1);
            pArray[30].Value = AccreditationNumber;

            pArray[31] = new SqlParameter("@AccreditationEarnDate", SqlDbType.VarChar, -1);
            pArray[31].Value = AccreditationEarnDate;

            pArray[32] = new SqlParameter("@AccreditationExpDate", SqlDbType.VarChar, -1);
            pArray[32].Value = AccreditationExpDate;
        }

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSCenterBaseSiteSurvey", pArray);
    }

    public int DeleteHSCenterBaseSurvey(int HeadStartCBLeadAgencyIDNumber)
    {

        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartCBLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartCBLeadAgencyIDNumber;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspDeleteHSCenterBaseSurvey", pArray);
    }

    public DataSet GetHSFamilyChildcareSiteSurvey(int HeadStartLeadAgencyID, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSFamilyChildcareSiteSurvey", pArray);
    }

    public DataSet GetHSFamilyChildcareSiteSurveyinfo(int HeadStartFCCLeadAgencyIDNumber, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@HeadStartFCCLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartFCCLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSFamilyChildcareSiteSurveyinfo", pArray);
    }

    public int SaveHSFamilyChildCareSitSurvey
        (
        int HeadStartLeadAgencyID
        , int TotalFCCProvider
        , string ProgramNumber
        , string FamilyChildCareProviderName
        , string Address
        , string ZipCode
        , int LicensedCapacity
        , int NumberChildrenEnrolledProgram
        , int NumberChildrenFundedACFFam
        , int NumberChildrenFundedNonACFFam
        , int NumberDualLanguageLearnersFam
        , int NumberProvidersHome
        , int NumberAssistantHome
        , int NumberHighSchoolProvidersHome
        , int NumberSomeCollegeProvidersHome
        , int NumberCDAProvidersHome
        , int NumberAAASDegreedProvidersHome
        , int NumberBABSDegreedProvidersHome
        , int NumberAdvanceDegreedProvidersHome
        , string UPKProvider
        , int NumberChildrenReceivingUPKFundingHome
        , string QRISParticipationFam
        , string QRISSelfAssessedLevelFam
        , string CommentsFam
        , int FiscalYear
        , string NAEYCAccredited
        , string Accreditation
        , string AccreditationNumber
        , string AccreditationEarnDate
        , string AccreditationExpDate
  )
    {
        SqlParameter[] pArray = new SqlParameter[35];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID ", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@TotalFCCProvider", SqlDbType.Int);
        pArray[1].Value = TotalFCCProvider;

        pArray[2] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[2].Value = ProgramNumber;

        pArray[3] = new SqlParameter("@FamilyChildCareProviderName", SqlDbType.VarChar, 250);
        pArray[3].Value = FamilyChildCareProviderName;

        pArray[4] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[4].Value = Address;

        pArray[5] = new SqlParameter("@ZipCode ", SqlDbType.VarChar, 50);
        pArray[5].Value = ZipCode;

        pArray[6] = new SqlParameter("@LicensedCapacity ", SqlDbType.Int);
        pArray[6].Value = LicensedCapacity;

        pArray[7] = new SqlParameter("@NumberChildrenEnrolledProgram", SqlDbType.Int);
        pArray[7].Value = NumberChildrenEnrolledProgram;

        pArray[8] = new SqlParameter("@NumberChildrenFundedACFFam", SqlDbType.Int);
        pArray[8].Value = NumberChildrenFundedACFFam;

        pArray[9] = new SqlParameter("@NumberChildrenFundedNonACFFam", SqlDbType.Int);
        pArray[9].Value = NumberChildrenFundedNonACFFam;

        pArray[10] = new SqlParameter("@NumberDualLanguageLearnersFam", SqlDbType.Int);
        pArray[10].Value = NumberDualLanguageLearnersFam;

        pArray[11] = new SqlParameter("@NumberProvidersHome", SqlDbType.VarChar, 10);
        pArray[11].Value = NumberProvidersHome;

        pArray[12] = new SqlParameter("@NumberAssistantHome", SqlDbType.Int);
        pArray[12].Value = NumberAssistantHome;

        pArray[13] = new SqlParameter("@NumberHighSchoolProvidersHome", SqlDbType.Int);
        pArray[13].Value = NumberHighSchoolProvidersHome;

        pArray[14] = new SqlParameter("@NumberSomeCollegeProvidersHome", SqlDbType.Int);
        pArray[14].Value = NumberSomeCollegeProvidersHome;

        pArray[15] = new SqlParameter("@NumberCDAProvidersHome", SqlDbType.Int);
        pArray[15].Value = NumberCDAProvidersHome;

        pArray[16] = new SqlParameter("@NumberAAASDegreedProvidersHome", SqlDbType.Int);
        pArray[16].Value = NumberAAASDegreedProvidersHome;

        pArray[17] = new SqlParameter("@NumberBABSDegreedProvidersHome", SqlDbType.Int);
        pArray[17].Value = NumberBABSDegreedProvidersHome;

        pArray[18] = new SqlParameter("@NumberAdvanceDegreedProvidersHome", SqlDbType.Int);
        pArray[18].Value = NumberAdvanceDegreedProvidersHome;

        pArray[19] = new SqlParameter("@UPKProvider", SqlDbType.VarChar, 10);
        pArray[19].Value = UPKProvider;

        pArray[20] = new SqlParameter("@NumberChildrenReceivingUPKFundingHome", SqlDbType.Int);
        pArray[20].Value = NumberChildrenReceivingUPKFundingHome;

        pArray[21] = new SqlParameter("@QRISParticipationFam", SqlDbType.VarChar, 10);
        pArray[21].Value = QRISParticipationFam;

        pArray[22] = new SqlParameter("@QRISSelfAssessedLevelFam", SqlDbType.VarChar, 10);
        pArray[22].Value = QRISSelfAssessedLevelFam;

        pArray[23] = new SqlParameter("@CommentsFam", SqlDbType.VarChar, -1);
        pArray[23].Value = CommentsFam;

        pArray[24] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[24].Value = FiscalYear;

        pArray[25] = new SqlParameter("@NAEYCAccredited", SqlDbType.VarChar, 10);
        pArray[25].Value = NAEYCAccredited;

        pArray[29] = new SqlParameter("@Accreditation", SqlDbType.Int);
        pArray[29].Value = Accreditation;

        pArray[30] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar, -1);
        pArray[30].Value = AccreditationNumber;

        pArray[31] = new SqlParameter("@AccreditationEarnDate", SqlDbType.VarChar, -1);
        pArray[31].Value = AccreditationEarnDate;

        pArray[32] = new SqlParameter("@AccreditationExpDate", SqlDbType.VarChar, -1);
        pArray[32].Value = AccreditationExpDate;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveHSFamilyChildCareSitSurvey", pArray);
    }
    public int UpdateHSFamilyChildCareSiteSurvey
        (
        int HeadStartFCCLeadAgencyIDNumber
        , string ProgramNumber
        , string FamilyChildCareProviderName
        , string Address
        , string ZipCode
        , int LicensedCapacity
        , int NumberChildrenEnrolledProgram
        , int NumberChildrenFundedACFFam
        , int NumberChildrenFundedNonACFFam
        , int NumberDualLanguageLearnersFam
        , int NumberProvidersHome
        , int NumberAssistantHome
        , int NumberHighSchoolProvidersHome
        , int NumberSomeCollegeProvidersHome
        , int NumberCDAProvidersHome
        , int NumberAAASDegreedProvidersHome
        , int NumberBABSDegreedProvidersHome
        , int NumberAdvanceDegreedProvidersHome
        , string UPKProvider
        , int NumberChildrenReceivingUPKFundingHome
        , string QRISParticipationFam
        , string QRISSelfAssessedLevelFam
        , string CommentsFam
        , int TotalFCCProvider
        , int HeadStartLeadAgencyID
        , string NAEYCAccredited
        , string Accreditation
        , string AccreditationNumber
        , string AccreditationEarnDate
        , string AccreditationExpDate
  )
    {
        SqlParameter[] pArray = new SqlParameter[35];

        pArray[0] = new SqlParameter("@HeadStartFCCLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartFCCLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[1].Value = ProgramNumber;

        pArray[2] = new SqlParameter("@FamilyChildCareProviderName", SqlDbType.VarChar, 250);
        pArray[2].Value = FamilyChildCareProviderName;

        pArray[3] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[3].Value = Address;

        pArray[4] = new SqlParameter("@ZipCode ", SqlDbType.VarChar, 50);
        pArray[4].Value = ZipCode;

        pArray[5] = new SqlParameter("@LicensedCapacity ", SqlDbType.Int);
        pArray[5].Value = LicensedCapacity;

        pArray[6] = new SqlParameter("@NumberChildrenEnrolledProgram", SqlDbType.Int);
        pArray[6].Value = NumberChildrenEnrolledProgram;

        pArray[7] = new SqlParameter("@NumberChildrenFundedACFFam", SqlDbType.Int);
        pArray[7].Value = NumberChildrenFundedACFFam;

        pArray[8] = new SqlParameter("@NumberChildrenFundedNonACFFam", SqlDbType.Int);
        pArray[8].Value = NumberChildrenFundedNonACFFam;

        pArray[9] = new SqlParameter("@NumberDualLanguageLearnersFam", SqlDbType.Int);
        pArray[9].Value = NumberDualLanguageLearnersFam;


        pArray[10] = new SqlParameter("@NumberProvidersHome", SqlDbType.VarChar, 10);
        pArray[10].Value = NumberProvidersHome;


        pArray[11] = new SqlParameter("@NumberAssistantHome", SqlDbType.Int);
        pArray[11].Value = NumberAssistantHome;

        pArray[12] = new SqlParameter("@NumberHighSchoolProvidersHome", SqlDbType.Int);
        pArray[12].Value = NumberHighSchoolProvidersHome;

        pArray[13] = new SqlParameter("@NumberSomeCollegeProvidersHome", SqlDbType.Int);
        pArray[13].Value = NumberSomeCollegeProvidersHome;

        pArray[14] = new SqlParameter("@NumberCDAProvidersHome", SqlDbType.Int);
        pArray[14].Value = NumberCDAProvidersHome;

        pArray[15] = new SqlParameter("@NumberAAASDegreedProvidersHome", SqlDbType.Int);
        pArray[15].Value = NumberAAASDegreedProvidersHome;

        pArray[16] = new SqlParameter("@NumberBABSDegreedProvidersHome", SqlDbType.Int);
        pArray[16].Value = NumberBABSDegreedProvidersHome;

        pArray[17] = new SqlParameter("@NumberAdvanceDegreedProvidersHome", SqlDbType.Int);
        pArray[17].Value = NumberAdvanceDegreedProvidersHome;

        pArray[18] = new SqlParameter("@UPKProvider", SqlDbType.VarChar, 10);
        pArray[18].Value = UPKProvider;

        pArray[19] = new SqlParameter("@NumberChildrenReceivingUPKFundingHome", SqlDbType.Int);
        pArray[19].Value = NumberChildrenReceivingUPKFundingHome;

        pArray[20] = new SqlParameter("@QRISParticipationFam", SqlDbType.VarChar, 10);
        pArray[20].Value = QRISParticipationFam;

        pArray[21] = new SqlParameter("@QRISSelfAssessedLevelFam", SqlDbType.VarChar, 10);
        pArray[21].Value = QRISSelfAssessedLevelFam;

        pArray[22] = new SqlParameter("@CommentsFam", SqlDbType.VarChar, -1);
        pArray[22].Value = CommentsFam;

        pArray[23] = new SqlParameter("@TotalFCCProvider", SqlDbType.Int);
        pArray[23].Value = TotalFCCProvider;

        pArray[24] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[24].Value = HeadStartLeadAgencyID;

        pArray[29] = new SqlParameter("@NAEYCAccredited", SqlDbType.VarChar, 10);
        pArray[29].Value = NAEYCAccredited;


        if (NAEYCAccredited == "Yes")
        {
            pArray[25] = new SqlParameter("@Accreditation", SqlDbType.VarChar, -1);
            pArray[25].Value = Accreditation;

            pArray[26] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar, -1);
            pArray[26].Value = AccreditationNumber;

            pArray[27] = new SqlParameter("@AccreditationEarnDate", SqlDbType.VarChar, -1);
            pArray[27].Value = AccreditationEarnDate;

            pArray[28] = new SqlParameter("@AccreditationExpDate", SqlDbType.VarChar, -1);
            pArray[28].Value = AccreditationExpDate;
        }

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSFamilyChildCareSiteSurvey", pArray);
    }

    public int DeleteHSFamilyChidcareSurvey(int HeadStartFCCLeadAgencyIDNumber)
    {

        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartFCCLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartFCCLeadAgencyIDNumber;



        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspDeleteHSFamilyChidcareSurvey", pArray);

    }

    public DataSet GetHSHomeBaseSiteSurvey(int HeadStartLeadAgencyID, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSHomeBaseSiteSurvey", pArray);
    }

    public DataSet GetHSHomeBaseSiteSurveyinfo(int HSHBSiteID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HSHBSiteID", SqlDbType.Int);
        pArray[0].Value = HSHBSiteID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSHomeBaseSiteSurveyinfo", pArray);
    }
    public int SaveHSHomebaseSitSurvey
        (
        int HeadStartLeadAgencyID
        , int TotalHBVisits
        , string ProgramName
        , string Address
        , string CommunitiesServed
        , string ZipCode
        , string StaffDegreeLevel
        , int FundedCapacityHeadstart
        , int FundedCapacityEarlyHeadStart
        , int NumberDualLanguageLearnersHome
        , string Comments
        , int fiscalYear
        )


    {
        SqlParameter[] pArray = new SqlParameter[12];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID ", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@TotalHBVisits", SqlDbType.Int);
        pArray[1].Value = TotalHBVisits;

        pArray[2] = new SqlParameter("@ProgramName", SqlDbType.VarChar, 250);
        pArray[2].Value = ProgramName;

        pArray[3] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[3].Value = Address;

        pArray[4] = new SqlParameter("@CommunitiesServed", SqlDbType.VarChar, 250);
        pArray[4].Value = CommunitiesServed;

        pArray[5] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[5].Value = ZipCode;

        pArray[6] = new SqlParameter("@StaffDegreeLevel ", SqlDbType.VarChar, 50);
        pArray[6].Value = StaffDegreeLevel;

        pArray[7] = new SqlParameter("@FundedCapacityHeadstart", SqlDbType.Int);
        pArray[7].Value = FundedCapacityHeadstart;

        pArray[8] = new SqlParameter("@NumberDualLanguageLearnersHome", SqlDbType.Int);
        pArray[8].Value = NumberDualLanguageLearnersHome;

        pArray[9] = new SqlParameter("@FundedCapacityEarlyHeadStart", SqlDbType.Int);
        pArray[9].Value = FundedCapacityEarlyHeadStart;

        pArray[10] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[10].Value = Comments;

        pArray[11] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[11].Value = fiscalYear;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveHSHomebaseSitSurvey", pArray);
    }
    public int UpdateHSHomeBaseSiteSurvey
        (
        int HSHBSiteID
        , string ProgramName
        , string Address
        , string CommunitiesServed
        , string ZipCode
        , string StaffDegreeLevel
        , int FundedCapacityHeadstart
        , int FundedCapacityEarlyHeadStart
        , int NumberDualLanguageLearnersHome
        , string Comments
        , int TotalHBVisits
        , int HeadStartLeadAgencyID
        )
    {
        SqlParameter[] pArray = new SqlParameter[12];
        pArray[0] = new SqlParameter("@HSHBSiteID ", SqlDbType.Int);
        pArray[0].Value = HSHBSiteID;

        pArray[1] = new SqlParameter("@ProgramName", SqlDbType.VarChar, 250);
        pArray[1].Value = ProgramName;

        pArray[2] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[2].Value = Address;

        pArray[3] = new SqlParameter("@CommunitiesServed", SqlDbType.VarChar, 250);
        pArray[3].Value = CommunitiesServed;

        pArray[4] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[4].Value = ZipCode;

        pArray[5] = new SqlParameter("@StaffDegreeLevel ", SqlDbType.VarChar, 50);
        pArray[5].Value = StaffDegreeLevel;

        pArray[6] = new SqlParameter("@FundedCapacityHeadstart", SqlDbType.Int);
        pArray[6].Value = FundedCapacityHeadstart;

        pArray[7] = new SqlParameter("@NumberDualLanguageLearnersHome", SqlDbType.Int);
        pArray[7].Value = NumberDualLanguageLearnersHome;

        pArray[8] = new SqlParameter("@FundedCapacityEarlyHeadStart", SqlDbType.Int);
        pArray[8].Value = FundedCapacityEarlyHeadStart;

        pArray[9] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[9].Value = Comments;

        pArray[10] = new SqlParameter("@TotalHBVisits", SqlDbType.Int);
        pArray[10].Value = TotalHBVisits;

        pArray[11] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[11].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSHomeBaseSiteSurvey", pArray);
    }

    public int DeleteHSHomeBaseSurvey(int HSHBSiteID)
    {

        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HSHBSiteID", SqlDbType.Int);
        pArray[0].Value = HSHBSiteID;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspDeleteHSHomeBaseSurvey", pArray);
    }


    public DataSet GetHSLocallyDesignedOption(int HeadStartLeadAgencyID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSLocallyDesignedOption", pArray);
    }

    public DataSet GetHSLocallyDesignedOptioninfo(int HeadStartLDOSLeadAgencyIDNumber)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLDOSLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartLDOSLeadAgencyIDNumber;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSLocallyDesignedOptioninfo", pArray);
    }
    public int SaveHSLocallyDesignedOption
        (
        int HeadStartLeadAgencyID
        , int TotalLDOSPrograms
        , string ProgramNumber
        , string HeadStartFacilityName
        , string Address
        , string CommunitiesServed
        , string ZipCode
        , int NumberChildrenLDOSServed
        , string Comments

        )
    {
        SqlParameter[] pArray = new SqlParameter[9];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID ", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@TotalLDOSPrograms", SqlDbType.Int);
        pArray[1].Value = TotalLDOSPrograms;

        pArray[2] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[2].Value = ProgramNumber;

        pArray[3] = new SqlParameter("@HeadStartFacilityName", SqlDbType.VarChar, 150);
        pArray[3].Value = HeadStartFacilityName;

        pArray[4] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[4].Value = Address;

        pArray[5] = new SqlParameter("@City", SqlDbType.VarChar, 250);
        pArray[5].Value = CommunitiesServed;

        pArray[6] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[6].Value = ZipCode;

        pArray[7] = new SqlParameter("@NumberChildrenLDOSServed", SqlDbType.Int);
        pArray[7].Value = NumberChildrenLDOSServed;

        pArray[8] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[8].Value = Comments;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveHSLocallyDesignedOption", pArray);
    }
    public int UpdateHSLocallyDesignedOption
        (

        int HeadStartLDOSLeadAgencyIDNumber
        , string ProgramNumber
        , string HeadStartFacilityName
        , string Address
        , string City
        , string ZipCode
        , int NumberChildrenLDOSServed
        , string Comments
        , int TotalLDOSPrograms
        , int HeadStartLeadAgencyID

        )
    {
        SqlParameter[] pArray = new SqlParameter[10];
        pArray[0] = new SqlParameter("@HeadStartLDOSLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartLDOSLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@ProgramNumber", SqlDbType.VarChar, 150);
        pArray[1].Value = ProgramNumber;

        pArray[2] = new SqlParameter("@HeadStartFacilityName", SqlDbType.VarChar, 150);
        pArray[2].Value = HeadStartFacilityName;

        pArray[3] = new SqlParameter("@Address", SqlDbType.VarChar, 250);
        pArray[3].Value = Address;

        pArray[4] = new SqlParameter("@City", SqlDbType.VarChar, 150);
        pArray[4].Value = City;

        pArray[5] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
        pArray[5].Value = ZipCode;

        pArray[6] = new SqlParameter("@NumberChildrenLDOSServed", SqlDbType.Int);
        pArray[6].Value = NumberChildrenLDOSServed;

        pArray[7] = new SqlParameter("@Comments", SqlDbType.VarChar, -1);
        pArray[7].Value = Comments;

        pArray[8] = new SqlParameter("@TotalLDOSPrograms", SqlDbType.Int);
        pArray[8].Value = TotalLDOSPrograms;

        pArray[9] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[9].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSLocallyDesignedOption", pArray);
    }

    public int DeleteHSLocallyDesignedOption(int HeadStartLDOSLeadAgencyIDNumber, int HeadStartLeadAgencyID)
    {

        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@HeadStartLDOSLeadAgencyIDNumber", SqlDbType.Int);
        pArray[0].Value = HeadStartLDOSLeadAgencyIDNumber;

        pArray[1] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[1].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspDeleteHSLocallyDesignedOption", pArray);
    }

    public DataSet GetMajorTowns()
    {
        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetMajorTowns");
    }


    public DataSet CFCEDELGetReportDisplayFY13Admin(string CFCEID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@CFCEID", SqlDbType.VarChar, 12);
        pArray[0].Value = CFCEID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspCFCEDELGetReportDisplayFY13Admin", pArray);
    }
    public int UpdateHSApplicationStatus(int GrantApplicantId, string applicationStatus)
    {
        SqlParameter[] pArray = new SqlParameter[6];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@HeadStartLeadAgency", SqlDbType.Int);
        pArray[1].Value = (applicationStatus.IndexOf("HeadStartLeadAgency") > -1 ? 1 : 0);

        pArray[2] = new SqlParameter("@CenterBaseSurvey", SqlDbType.Int);
        pArray[2].Value = (applicationStatus.IndexOf("CenterBaseSurvey") > -1 ? 1 : 0);

        pArray[3] = new SqlParameter("@FamilyChildCareSurvey", SqlDbType.Int);
        pArray[3].Value = (applicationStatus.IndexOf("FamilyChildCareSurvey") > -1 ? 1 : 0);

        pArray[4] = new SqlParameter("@HomeBasedSurvey", SqlDbType.Int);
        pArray[4].Value = (applicationStatus.IndexOf("HomeBasedSurvey") > -1 ? 1 : 0);

        pArray[5] = new SqlParameter("@HSLocallyDesignedOption", SqlDbType.Int);
        pArray[5].Value = (applicationStatus.IndexOf("HSLocallyDesignedOption") > -1 ? 1 : 0);

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspUpdateHSApplicationStatus", pArray);
    }

    public DataSet GetHSDeliverablesForm(int HeadStartLeadAgencyID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSDeliverablesForm", pArray);
    }

    public int SaveHSDeliverableForms(int HeadStartLeadAgencyID, byte[] HSDelivableFile, string filename, string filetype)
    {
        SqlParameter[] pArray = new SqlParameter[4];
        pArray[0] = new SqlParameter("@HeadStartLeadAgencyID", SqlDbType.Int);
        pArray[0].Value = HeadStartLeadAgencyID;

        pArray[1] = new SqlParameter("@HSDelivableFile", SqlDbType.Image);
        pArray[1].Value = HSDelivableFile;

        pArray[2] = new SqlParameter("@HSDelivableName", SqlDbType.VarChar, 150);
        pArray[2].Value = filename;

        pArray[3] = new SqlParameter("@HSDelivableFiletype", SqlDbType.VarChar, 10);
        pArray[3].Value = filetype;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveHSDeliverableForms", pArray);
    }



    public DataSet GetHSApplicantStatusData(int GrantApplicantId, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[0].Value = FiscalYear;

        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;


        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetHSApplicantStatusData", pArray);

    }

    public DataSet GetCFCEFeedBack(int CFCEID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@CFCEID", SqlDbType.Int);
        pArray[0].Value = CFCEID;

        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetCFCEFeedBack", pArray);
    }
    public int SaveCFCEFeedBack
        (int CFCEID
        , string CFCEFeedBackComments)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@CFCEID", SqlDbType.Int);
        pArray[0].Value = CFCEID;

        pArray[1] = new SqlParameter("@CFCEFeedBackComments", SqlDbType.VarChar, -1);
        pArray[1].Value = CFCEFeedBackComments;

        return SqlHelper.ExecuteNonQuery(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspSaveCFCEFeedBack", pArray);
    }

    public DataSet GetCFCEContactInformationDataAll()
    {
        return SqlHelper.ExecuteDataset(GetConnectionStringForHeadStartSiteSurvey(), CommandType.StoredProcedure, "uspGetCFCEContactInformationDataAll");
    }

}

