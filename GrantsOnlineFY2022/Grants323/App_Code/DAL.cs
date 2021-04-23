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
/// Summary description for DAL
/// </summary>
public class DAL
{
    public DAL()
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

    public DataSet GetAllCCRR()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllCCRR");
    }


    public DataSet GetAllCFCEAgency()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllCFCEAgency");
    }

    public DataSet GetAllHeadStartAgency()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllHeadStartAgency");
    }

    public DataSet GetLeadAgencyName(int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[0].Value = fundCode;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.VarChar, 20);
        pArray[1].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetLeadAgencyName", pArray);
    }

    public string GetPartInstruction(int fundCode, int fiscalYear, string part)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[0].Value = fundCode;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        pArray[2] = new SqlParameter("@Part", SqlDbType.VarChar);
        pArray[2].Value = part;

        DataSet ds = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetPartInstruction", pArray);

        return ds.Tables[0].Rows[0]["Content"].ToString();

    }

    public int SavePassword(int grantApplicantId, int fundCode, int fiscalYear, string password)
    {
        SqlParameter[] pArray = new SqlParameter[4];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Direction = ParameterDirection.InputOutput;
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        pArray[2] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[2].Value = password;

        pArray[3] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[3].Value = fundCode;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePassword", pArray);

        return Int32.Parse(pArray[0].Value.ToString());
    }

    public int ConfirmPassword(int leaCode, string password)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = leaCode;

        pArray[1] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[1].Value = password;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspConfirmPassword", pArray));
    }

    public bool UserIsRegistered(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return (Int32.Parse((SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspUserIsRegistered", pArray).ToString())) == 1 ? true : false);
    }


    public Boolean IsNewRegistration(int CCRRId, int siteTypeId)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@SiteTypeId", SqlDbType.TinyInt);
        pArray[0].Value = siteTypeId;

        pArray[1] = new SqlParameter("@CCRRId", SqlDbType.Int);
        pArray[1].Value = CCRRId;

        return (Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspIsNewRegistration", pArray)) == 1 ? true : false);
    }

    public int SavePassword(int siteTypeId, int CCRRId, string password)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@SiteTypeId", SqlDbType.TinyInt);
        pArray[0].Value = siteTypeId;

        pArray[1] = new SqlParameter("@CCRRId", SqlDbType.Int);
        pArray[1].Value = CCRRId;

        pArray[2] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[2].Value = password;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSavePassword", pArray));
    }

    #region New Functions
    public DataSet GetLookupLanguage()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "lookup.uspGetLanguage");
    }

    public DataSet GetGrantLanguage(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantLanguage", pArray);
    }

    public DataSet GetGrantApplicant(int grantApplicantId, int fundCode)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[1].Value = fundCode;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantApplicant", pArray);
    }

    public int SaveGrantApplicant(int grantTypeId, string userName, string password, string agencyName, string address1, string address2
            , string city, string state, string zipcode, string phone, string fax, string email, string webAddress, DataTable dtContacts)
    {
        SqlParameter[] pArray = new SqlParameter[14];

        pArray[0] = new SqlParameter("@Username", SqlDbType.VarChar, 20);
        pArray[0].Value = userName;

        pArray[1] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[1].Value = password;

        pArray[2] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 100);
        pArray[2].Value = agencyName;

        pArray[3] = new SqlParameter("@Address1", SqlDbType.VarChar, 100);
        pArray[3].Value = address1;

        pArray[4] = new SqlParameter("@Address2", SqlDbType.VarChar, 100);
        pArray[4].Value = address2;

        pArray[5] = new SqlParameter("@City", SqlDbType.VarChar, 100);
        pArray[5].Value = city;

        pArray[6] = new SqlParameter("@State", SqlDbType.VarChar, 100);
        pArray[6].Value = state;

        pArray[7] = new SqlParameter("@Zipcode", SqlDbType.VarChar, 100);
        pArray[7].Value = zipcode;

        pArray[8] = new SqlParameter("@Phone", SqlDbType.VarChar, 100);
        pArray[8].Value = phone;

        pArray[9] = new SqlParameter("@Fax", SqlDbType.VarChar, 100);
        pArray[9].Value = fax;

        pArray[10] = new SqlParameter("@Email", SqlDbType.VarChar, 100);
        pArray[10].Value = email;

        pArray[11] = new SqlParameter("@WebAddress", SqlDbType.VarChar, 100);
        pArray[11].Value = webAddress;

        pArray[12] = new SqlParameter("@GrantContactsTableType", SqlDbType.Structured);
        pArray[12].Value = dtContacts;
        pArray[12].TypeName = "dbo.GrantContactsTableType";

        pArray[13] = new SqlParameter("@GrantTypeId", SqlDbType.Int);
        pArray[13].Value = grantTypeId;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveGrantApplicant", pArray));

    }

    public int UpdateGrantApplicant(int grantApplicantId, string userName, string agencyName, string address1, string address2
            , string city, string state, string zipcode, string phone, string fax, string email, string webAddress, DataTable dtContacts)
    {
        SqlParameter[] pArray = new SqlParameter[13];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Username", SqlDbType.VarChar, 20);
        pArray[1].Value = userName;

        pArray[2] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 100);
        pArray[2].Value = agencyName;

        pArray[3] = new SqlParameter("@Address1", SqlDbType.VarChar, 100);
        pArray[3].Value = address1;

        pArray[4] = new SqlParameter("@Address2", SqlDbType.VarChar, 100);
        pArray[4].Value = address2;

        pArray[5] = new SqlParameter("@City", SqlDbType.VarChar, 100);
        pArray[5].Value = city;

        pArray[6] = new SqlParameter("@State", SqlDbType.VarChar, 100);
        pArray[6].Value = state;

        pArray[7] = new SqlParameter("@Zipcode", SqlDbType.VarChar, 100);
        pArray[7].Value = zipcode;

        pArray[8] = new SqlParameter("@Phone", SqlDbType.VarChar, 100);
        pArray[8].Value = phone;

        pArray[9] = new SqlParameter("@Fax", SqlDbType.VarChar, 100);
        pArray[9].Value = fax;

        pArray[10] = new SqlParameter("@Email", SqlDbType.VarChar, 100);
        pArray[10].Value = email;

        pArray[11] = new SqlParameter("@WebAddress", SqlDbType.VarChar, 100);
        pArray[11].Value = webAddress;

        pArray[12] = new SqlParameter("@GrantContactsTableType", SqlDbType.Structured);
        pArray[12].Value = dtContacts;
        pArray[12].TypeName = "dbo.GrantContactsTableType";

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateGrantApplicant", pArray));

    }

    public int SaveGrantLanguage(int grantApplicantId, DataTable dtLanguage)
    {
        SqlParameter[] pArray = new SqlParameter[6];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@GrantLanguagesTableType", SqlDbType.Structured);
        pArray[1].Value = dtLanguage;
        pArray[1].TypeName = "dbo.GrantLanguagesTableType";

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveGrantLanguage", pArray));
    }

    public int SaveHeadStartTowns(int grantApplicantId, DataTable dtTowns)
    {


        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@GrantRegionTownsTableType", SqlDbType.Structured);
        pArray[1].Value = dtTowns;
        pArray[1].TypeName = "dbo.GrantRegionTownsTableType";

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveHeadStartTowns", pArray));
    }

    public int SaveGrantProposal(int grantApplicantId, string CityTowns,
                     string CensusHouseholds,
                     string CensusChildren0to5,
                     string CensusChildren,
                     string EnglishLanguageLearner,
                     string FirstLanguageNotEnglish,
                     string StudentsWithDisabilities,
                     string ChildrenWithDisabilities,
                     string HighNeeds,
                     string LicensePrograms,
                     string AvgProvidersFamilies,
                     string MedChildrenPerMonth,
                     string MedFamiliesPerMonth,
                     string EconomicallyDisadvantaged)
    {
        SqlParameter[] pArray = new SqlParameter[16];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[2] = new SqlParameter("@CityTowns", SqlDbType.Text);
        pArray[2].Value = CityTowns;

        pArray[3] = new SqlParameter("@TotalCensusHouseholds", SqlDbType.Int);
        pArray[3].Value = CensusHouseholds;

        pArray[4] = new SqlParameter("@TotalCensusChildren0to5", SqlDbType.Int);
        pArray[4].Value = CensusChildren0to5;

        pArray[5] = new SqlParameter("@TotalCensusChildren", SqlDbType.Int);
        pArray[5].Value = CensusChildren;

        pArray[6] = new SqlParameter("@TotalEnglishLanguageLearner", SqlDbType.Int);
        pArray[6].Value = EnglishLanguageLearner;

        pArray[7] = new SqlParameter("@TotalFirstLanguageNotEnglish", SqlDbType.Int);
        pArray[7].Value = FirstLanguageNotEnglish;

        pArray[8] = new SqlParameter("@TotalStudentsWithDisabilities", SqlDbType.Int);
        pArray[8].Value = StudentsWithDisabilities;

        pArray[9] = new SqlParameter("@TotalHighNeeds", SqlDbType.Int);
        pArray[9].Value = HighNeeds;

        pArray[10] = new SqlParameter("@TotalLicensePrograms", SqlDbType.Int);
        pArray[10].Value = LicensePrograms;

        pArray[11] = new SqlParameter("@TotalChildrenWithDisabilities", SqlDbType.Int);
        pArray[11].Value = ChildrenWithDisabilities;

        pArray[12] = new SqlParameter("@TotalAvgProvidersFamilies", SqlDbType.Int);
        pArray[12].Value = AvgProvidersFamilies;

        pArray[13] = new SqlParameter("@TotalMedFamiliesPerMonth", SqlDbType.Int);
        pArray[13].Value = MedFamiliesPerMonth;

        pArray[14] = new SqlParameter("@TotalMedChildrenPerMonth", SqlDbType.Int);
        pArray[14].Value = MedChildrenPerMonth;

        pArray[15] = new SqlParameter("@TotalEconomicallyDisadvantaged", SqlDbType.Int);
        pArray[15].Value = EconomicallyDisadvantaged;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveGrantProposal", pArray));
    }

    //public DataSet GetAllGrantProposals(int grantApplicantId)
    //{
    //    SqlParameter[] pArray = new SqlParameter[1];
    //    pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
    //    pArray[0].Value = grantApplicantId;

    //    return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "[uspGetProposalsByApplicantId]", pArray);
    //}

    //public int DeleteGrantProposal(int grantProposalId)
    //{
    //    SqlParameter[] pArray = new SqlParameter[1];
    //    pArray[0] = new SqlParameter("@GrantProposalId", SqlDbType.Int);
    //    pArray[0].Value = grantProposalId;


    //    return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteGrantProposal", pArray);
    //}
    #endregion


    public int UpdateCCRRApplicant(int CCRRApplicantId, string AgencyName, string BusinessName, string EIN, string VendorCode,
        string Address1, string Address2, string City, string State, string Zipcode, string Phone, string Fax, string Email, string WebAddress,
        string DirectorFirstName, string DirectorLastName, string DirectorTitle, string DirectorPhone, string DirectorEmail,
        string ContactFirstName, string ContactLastName, string ContactTitle, string ContactPhone, string ContactEmail)
    {
        SqlParameter[] pArray = new SqlParameter[24];
        pArray[0] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 100);
        pArray[0].Value = AgencyName;

        pArray[1] = new SqlParameter("@BusinessName", SqlDbType.VarChar, 100);
        pArray[1].Value = BusinessName;

        pArray[2] = new SqlParameter("@EIN", SqlDbType.VarChar, 20);
        pArray[2].Value = EIN;

        pArray[3] = new SqlParameter("@VendorCode", SqlDbType.VarChar, 20);
        pArray[3].Value = VendorCode;

        pArray[4] = new SqlParameter("@Address1", SqlDbType.VarChar, 100);
        pArray[4].Value = Address1;

        pArray[5] = new SqlParameter("@Address2", SqlDbType.VarChar, 100);
        pArray[5].Value = Address2;

        pArray[6] = new SqlParameter("@City", SqlDbType.VarChar, 50);
        pArray[6].Value = City;

        pArray[7] = new SqlParameter("@State", SqlDbType.VarChar, 2);
        pArray[7].Value = State;

        pArray[8] = new SqlParameter("@Zipcode", SqlDbType.VarChar, 10);
        pArray[8].Value = Zipcode;

        pArray[9] = new SqlParameter("@Phone", SqlDbType.VarChar, 20);
        pArray[9].Value = Phone;

        pArray[10] = new SqlParameter("@Fax", SqlDbType.VarChar, 20);
        pArray[10].Value = Fax;

        pArray[11] = new SqlParameter("@Email", SqlDbType.VarChar, 200);
        pArray[11].Value = Email;

        pArray[12] = new SqlParameter("@WebAddress", SqlDbType.VarChar, 200);
        pArray[12].Value = WebAddress;

        pArray[13] = new SqlParameter("@DirectorFirstName", SqlDbType.VarChar, 50);
        pArray[13].Value = DirectorFirstName;

        pArray[14] = new SqlParameter("@DirectorLastName", SqlDbType.VarChar, 50);
        pArray[14].Value = DirectorLastName;

        pArray[15] = new SqlParameter("@DirectorTitle", SqlDbType.VarChar, 50);
        pArray[15].Value = DirectorTitle;

        pArray[16] = new SqlParameter("@DirectorPhone", SqlDbType.VarChar, 20);
        pArray[16].Value = DirectorPhone;

        pArray[17] = new SqlParameter("@DirectorEmail", SqlDbType.VarChar, 200);
        pArray[17].Value = DirectorEmail;

        pArray[18] = new SqlParameter("@ContactFirstName", SqlDbType.VarChar, 50);
        pArray[18].Value = ContactFirstName;

        pArray[19] = new SqlParameter("@ContactLastName", SqlDbType.VarChar, 50);
        pArray[19].Value = ContactLastName;

        pArray[20] = new SqlParameter("@ContactTitle", SqlDbType.VarChar, 50);
        pArray[20].Value = ContactTitle;

        pArray[21] = new SqlParameter("@ContactPhone", SqlDbType.VarChar, 20);
        pArray[21].Value = ContactPhone;

        pArray[22] = new SqlParameter("@ContactEmail", SqlDbType.VarChar, 200);
        pArray[22].Value = ContactEmail;

        pArray[23] = new SqlParameter("@CCRRApplicantId", SqlDbType.Int);
        pArray[23].Value = CCRRApplicantId;


        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateCCRRApplicant", pArray);
    }

    public int ConfirmUsernamePassword(string Username, string Password, int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[4];
        pArray[0] = new SqlParameter("@Username", SqlDbType.VarChar, 20);
        pArray[0].Value = Username;

        pArray[1] = new SqlParameter("@Password", SqlDbType.VarChar, 20);
        pArray[1].Value = Password;

        pArray[2] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[2].Value = fundCode;

        pArray[3] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[3].Value = fiscalYear;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspConfirmUsernamePassword", pArray));
    }

    public int IsAgencyRegistered(string agencyName, int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 100);
        pArray[0].Value = agencyName;

        pArray[1] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[1].Value = fundCode;

        pArray[2] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[2].Value = fiscalYear;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspCheckRegisteredAgencyName", pArray));
    }

    public int GetUserNamePwd(string AgencyName, string Username, int grantTypeId)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 100);
        pArray[0].Value = AgencyName;

        pArray[1] = new SqlParameter("@Username", SqlDbType.VarChar, 20);
        pArray[1].Value = Username;

        pArray[2] = new SqlParameter("@GrantTypeId", SqlDbType.Int);
        pArray[2].Value = grantTypeId;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspGetUserNamePwd", pArray);
    }

    public int DeleteRegistration(int RFRId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@RFRId", SqlDbType.Int);
        pArray[0].Value = RFRId;


        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteRegistration", pArray);
    }

    public DataSet GetCCRRInfo(int RFRId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@RFRId", SqlDbType.Int);
        pArray[0].Value = RFRId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetCCRRInfo", pArray);
    }

    public int SaveContactInfo(int RFRId, string contactName, string contactPhone, string contactEmail)
    {
        SqlParameter[] pArray = new SqlParameter[4];
        pArray[0] = new SqlParameter("@RFRId", SqlDbType.Int);
        pArray[0].Value = RFRId;

        pArray[1] = new SqlParameter("@ContactName", SqlDbType.VarChar, 50);
        pArray[1].Value = contactName;

        pArray[2] = new SqlParameter("@ContactPhone", SqlDbType.VarChar, 20);
        pArray[2].Value = contactPhone;

        pArray[3] = new SqlParameter("@ContactEmail", SqlDbType.VarChar, 100);
        pArray[3].Value = contactEmail;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveContactInfo", pArray);
    }

    public DataSet GetRegions(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetRegions", pArray);
    }
    public DataSet GetAllTowns()
    {
        string sqlString = @"SELECT gt.CityTownId
	                        , gt.CCRRRegionId
	                        , ct.Town 
	                        , Region = r.Description
                        FROM dbo.GrantTown gt 
	                        JOIN LM2010.lookup.CityTown ct ON gt.CityTownId = ct.CityTownID
	                        JOIN LM2010.lookup.Region r ON gt.CCRRRegionId = r.RegionId
                        ORDER BY r.Description, ct.Town";
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, sqlString);
    }

    public DataSet GetGrantRegions(int grantApplicantId)
    {
        string sqlString = @"SELECT DISTINCT p.RegionId , Region = r.Description
FROM dbo.GrantProposal p
	JOIN LM2010.lookup.Region r ON p.RegionId = r.RegionId 
WHERE GrantApplicantId = " + grantApplicantId.ToString() + " ORDER BY p.RegionId";
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, sqlString);
    }

    public DataSet GetAllProposals(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspHeadStartGetGrantTowns", pArray);
    }

    public DataSet GetAllCommunitiesServed(int grantApplicantId, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllCommunitiesServed", pArray);
    }

    public DataSet GetAllCommunitiesServed(int grantApplicantId, int fiscalYear, int fundCode, int isTownFunding)
    {
        SqlParameter[] pArray = new SqlParameter[4];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        pArray[2] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[2].Value = fundCode;

        pArray[3] = new SqlParameter("@IsTownFunding", SqlDbType.Int);
        pArray[3].Value = isTownFunding;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllCommunitiesServed", pArray);
    }

    public DataSet GetCommunitiesTotalDataPoint(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetCommunitiesTotalDataPoint", pArray);
    }

    public DataSet GetProposalById(int proposalId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantProposalId", SqlDbType.Int);
        pArray[0].Value = proposalId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantProposalById", pArray);

    }

    public DataSet GetBudgetNarrative(int ProposalId, int ServiceLevel)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@ProposalId", SqlDbType.Int);
        pArray[0].Value = ProposalId;

        pArray[1] = new SqlParameter("@ServiceLevel", SqlDbType.TinyInt);
        pArray[1].Value = ServiceLevel;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetNarrative", pArray);
    }
    public int SaveBudgetNarrative(int BudgetGroupId, string Administrators, string InstructionalStaff,
        string SupportStaff, string FringeBenefits, string ContractualServices, string SuppliesMaterials, string Travel,
        string Other, string IndirectCosts, string Equipment)
    {

        SqlParameter[] pArray = new SqlParameter[12];
        pArray[0] = new SqlParameter("@BudgetGroupId", SqlDbType.Int);
        pArray[0].Value = BudgetGroupId;

        pArray[1] = new SqlParameter("@ServiceLevel", SqlDbType.Int);
        pArray[1].Value = 0;

        pArray[2] = new SqlParameter("@Administrators", SqlDbType.VarChar, 800);
        pArray[2].Value = Administrators;

        pArray[3] = new SqlParameter("@InstructionalStaff", SqlDbType.VarChar, 800);
        pArray[3].Value = InstructionalStaff;

        pArray[4] = new SqlParameter("@SupportStaff", SqlDbType.VarChar, 800);
        pArray[4].Value = SupportStaff;

        pArray[5] = new SqlParameter("@FringeBenefits", SqlDbType.VarChar, 800);
        pArray[5].Value = FringeBenefits;

        pArray[6] = new SqlParameter("@ContractualServices", SqlDbType.VarChar, 800);
        pArray[6].Value = ContractualServices;

        pArray[7] = new SqlParameter("@SuppliesMaterials", SqlDbType.VarChar, 800);
        pArray[7].Value = SuppliesMaterials;

        pArray[8] = new SqlParameter("@Travel", SqlDbType.VarChar, 800);
        pArray[8].Value = Travel;

        pArray[9] = new SqlParameter("@Other", SqlDbType.VarChar, 800);
        pArray[9].Value = Other;

        pArray[10] = new SqlParameter("@IndirectCosts", SqlDbType.VarChar, 800);
        pArray[10].Value = IndirectCosts;

        pArray[11] = new SqlParameter("@Equipment", SqlDbType.VarChar, 800);
        pArray[11].Value = Equipment;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveBudgetNarrative", pArray);
    }

    public DataSet GetBudgetDetail(int ProposalId, int ServiceLevel)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@ProposalId", SqlDbType.Int);
        pArray[0].Value = ProposalId;

        pArray[1] = new SqlParameter("@ServiceLevel", SqlDbType.TinyInt);
        pArray[1].Value = ServiceLevel;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetDetail", pArray);
    }

    public DataSet GetBudgetPos(int ProposalId, int ServiceLevel)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@ProposalId", SqlDbType.Int);
        pArray[0].Value = ProposalId;

        pArray[1] = new SqlParameter("@ServiceLevel", SqlDbType.TinyInt);
        pArray[1].Value = ServiceLevel;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetPos", pArray);
    }

    public DataSet GetBudgetPosNarrative(int ProposalId, int ServiceLevel)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@ProposalId", SqlDbType.Int);
        pArray[0].Value = ProposalId;

        pArray[1] = new SqlParameter("@ServiceLevel", SqlDbType.TinyInt);
        pArray[1].Value = ServiceLevel;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetPOSNarrative", pArray);
    }

    public DataSet GetAllApplicants()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllCCRRApplicants");
    }

    public DataSet GetAdminView(int FundCode, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[0].Value = FundCode;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAdminView", pArray);

    }

    public DataSet GetAdminGrantSummaryPDF(int FundCode, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[0].Value = FundCode;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAdminGrantSummaryPDF", pArray);

    }

    public DataSet GetAdminViewShowData(string type, int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@type", SqlDbType.VarChar, 50);
        pArray[0].Value = type;

        pArray[1] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[1].Value = fundCode;

        pArray[2] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[2].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAdminViewShowData", pArray);
    }

    public DataSet GetSelectedTownList(int serviceLevel)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@ServiceLevel", SqlDbType.Int);
        pArray[0].Value = serviceLevel;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetSelectedTownList", pArray);
    }

    public int HSUpdateApplicationStatus(int GrantApplicantId, string applicationStatus)
    {
        SqlParameter[] pArray = new SqlParameter[12];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@ContactInfoPart1Done", SqlDbType.Int);
        pArray[1].Value = (applicationStatus.IndexOf("part1") > -1 ? 1 : 0);

        pArray[2] = new SqlParameter("@CommServedPart2Done", SqlDbType.Int);
        pArray[2].Value = (applicationStatus.IndexOf("part2") > -1 ? 1 : 0);

        pArray[3] = new SqlParameter("@LanguageServedPart3Done", SqlDbType.Int);
        pArray[3].Value = (applicationStatus.IndexOf("part3") > -1 ? 1 : 0);

        pArray[4] = new SqlParameter("@LeadAgencyBudgetPart4Done", SqlDbType.Int);
        pArray[4].Value = (applicationStatus.IndexOf("part4") > -1 ? 1 : 0);

        pArray[5] = new SqlParameter("@SubcontractorBudgetPart5Done", SqlDbType.Int);
        pArray[5].Value = (applicationStatus.IndexOf("part5") > -1 ? 1 : 0);

        pArray[6] = new SqlParameter("@BudgetSummaryPart6Done", SqlDbType.Int);
        pArray[6].Value = (applicationStatus.IndexOf("part6") > -1 ? 1 : 0);

        pArray[7] = new SqlParameter("@NarrativeQuestionsPart7Done", SqlDbType.Int);
        pArray[7].Value = (applicationStatus.IndexOf("part7") > -1 ? 1 : 0);

        pArray[8] = new SqlParameter("@ProjectedDeliverablesPart8Done", SqlDbType.Int);
        pArray[8].Value = (applicationStatus.IndexOf("part8") > -1 ? 1 : 0);

        pArray[9] = new SqlParameter("@RequiredGrantFormsPart9Done", SqlDbType.Int);
        pArray[9].Value = (applicationStatus.IndexOf("part9") > -1 ? 1 : 0);


        pArray[10] = new SqlParameter("@ChecklistPart10Done", SqlDbType.Int);
        pArray[10].Value = (applicationStatus.IndexOf("part10") > -1 ? 1 : 0);


        pArray[11] = new SqlParameter("@CoverPagePart11Done", SqlDbType.Int);
        pArray[11].Value = (applicationStatus.IndexOf("part11") > -1 ? 1 : 0);

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspHSUpdateApplicationStatus", pArray);
    }

    public DataSet GetHSApplicantStatusData(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetHSApplicantStatusData", pArray);

    }

    public int SaveMiscDocsPrinted(int GrantApplicantId, int MiscDocsPrinted)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@MiscDocsPrinted", SqlDbType.TinyInt);
        pArray[1].Value = MiscDocsPrinted;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveMiscDocsValue", pArray);
    }

    public DataSet GetNarrativeData(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetNarrativeData", pArray);

    }

    public DataSet GetGrantPartStatus(int grantApplicantId, string partNum)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@PartNum", SqlDbType.VarChar);
        pArray[1].Value = partNum;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantPartStatus", pArray);

    }

    public int SaveNarrativeData(int grantApplicantId, string ans, int num)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Ans", SqlDbType.Text);
        pArray[1].Value = ans;

        pArray[2] = new SqlParameter("@Num", SqlDbType.Int);
        pArray[2].Value = num;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveNarrativeData", pArray);
    }

    public DataSet GetCoverPageData(string GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetCoverSheetData", pArray);
    }


    public int SaveAgencySuperContactInfo(int GrantApplicantId, string GrantContactName, string GrantContactEmail, string GrantContactPhone, string TaxId)
    {
        SqlParameter[] pArray = new SqlParameter[5];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@GrantContactName", SqlDbType.VarChar, 100);
        pArray[1].Value = GrantContactName;

        pArray[2] = new SqlParameter("@GrantContactEmail", SqlDbType.VarChar, 100);
        pArray[2].Value = GrantContactEmail;

        pArray[3] = new SqlParameter("@GrantContactPhone", SqlDbType.VarChar, 20);
        pArray[3].Value = GrantContactPhone;

        pArray[4] = new SqlParameter("@TaxId", SqlDbType.VarChar, 20);
        pArray[4].Value = TaxId;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveSuperContactInfo", pArray);
    }

    public DataSet GetProjectedDeliverables(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetProjectedDeliverables", pArray);

    }

    public DataSet GetAllDistrictData(int grantApplicantId, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllDistrictData", pArray);

    }

    public int SaveProjectedDeliverables(int GrantApplicantId,
                                         SortedList<string, string> txtList, SortedList<string, string> descrList
                                         )
    {
        SqlParameter[] pArray = new SqlParameter[txtList.Count + descrList.Count + 1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        int count = 1;

        foreach (string key in txtList.Keys)
        {
            pArray[count] = new SqlParameter("@" + key, SqlDbType.VarChar);
            pArray[count].Value = txtList[key];
            count++;
        }

        foreach (string key in descrList.Keys)
        {
            pArray[count] = new SqlParameter("@" + key, SqlDbType.VarChar);
            pArray[count].Value = descrList[key];
            count++;
        }

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveProjectedDeliverables", pArray);
    }

    public DataSet GetPDFCheckList(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetCheckList", pArray);
    }

    public DataSet GetOrgId(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetOrgId", pArray);
    }

    public DataSet GetDocId(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetDocId", pArray);
    }

    public int SavePDFCheckList(int GrantApplicantId,
           int A1, int A2, int A3, int A4,
           int A5, int A6, int A7, int A8,
           int A12, int A13, int A14, int A15, int A16, int A17,
           int A18, 
            int A22, int A23, int A24, int A25, int A26,
           int E2, int E3, int E4,
           int E5, int E6, int E7, int E8,
           int E12, int E13, int E14, int E15, int E16, int E17,
           int E18, int E22, int E23, int E24, int E25, int E26,
           int F18, int F19)
    {
        SqlParameter[] pArray = new SqlParameter[47];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@A1", SqlDbType.Int);
        pArray[1].Value = A1;

        pArray[2] = new SqlParameter("@A2", SqlDbType.Int);
        pArray[2].Value = A2;

        pArray[3] = new SqlParameter("@A3", SqlDbType.Int);
        pArray[3].Value = A3;

        pArray[4] = new SqlParameter("@A4", SqlDbType.Int);
        pArray[4].Value = A4;

        pArray[5] = new SqlParameter("@A5", SqlDbType.Int);
        pArray[5].Value = A5;

        pArray[6] = new SqlParameter("@A6", SqlDbType.Int);
        pArray[6].Value = A6;

        pArray[7] = new SqlParameter("@A7", SqlDbType.Int);
        pArray[7].Value = A7;

        pArray[8] = new SqlParameter("@A8", SqlDbType.Int);
        pArray[8].Value = A8;

        pArray[9] = new SqlParameter("@A12", SqlDbType.Int);
        pArray[9].Value = A12;

        pArray[10] = new SqlParameter("@A13", SqlDbType.Int);
        pArray[10].Value = A13;

        pArray[11] = new SqlParameter("@A14", SqlDbType.Int);
        pArray[11].Value = A14;

        pArray[12] = new SqlParameter("@A15", SqlDbType.Int);
        pArray[12].Value = A15;

        pArray[13] = new SqlParameter("@A16", SqlDbType.Int);
        pArray[13].Value = A16;

        pArray[14] = new SqlParameter("@A17", SqlDbType.Int);
        pArray[14].Value = A17;

        pArray[15] = new SqlParameter("@A18", SqlDbType.Int);
        pArray[15].Value = A18;

        pArray[16] = new SqlParameter("@A22", SqlDbType.Int);
        pArray[16].Value = A22;

        pArray[17] = new SqlParameter("@A23", SqlDbType.Int);
        pArray[17].Value = A23;

        pArray[18] = new SqlParameter("@A24", SqlDbType.Int);
        pArray[18].Value = A24;

        pArray[19] = new SqlParameter("@A25", SqlDbType.Int);
        pArray[19].Value = A25;

        pArray[20] = new SqlParameter("@A26", SqlDbType.Int);
        pArray[20].Value = A26;


        //pArray[21] = new SqlParameter("@A27", SqlDbType.Int);
        //pArray[21].Value = A27;

        //pArray[22] = new SqlParameter("@A28", SqlDbType.Int);
        //pArray[22].Value = A28;


        pArray[23] = new SqlParameter("@E2", SqlDbType.Int);
        pArray[23].Value = E2;

        pArray[24] = new SqlParameter("@E3", SqlDbType.Int);
        pArray[24].Value = E3;

        pArray[25] = new SqlParameter("@E4", SqlDbType.Int);
        pArray[25].Value = E4;

        pArray[26] = new SqlParameter("@E5", SqlDbType.Int);
        pArray[26].Value = E5;

        pArray[27] = new SqlParameter("@E6", SqlDbType.Int);
        pArray[27].Value = E6;

        pArray[28] = new SqlParameter("@E7", SqlDbType.Int);
        pArray[28].Value = E7;

        pArray[29] = new SqlParameter("@E8", SqlDbType.Int);
        pArray[29].Value = E8;

        pArray[30] = new SqlParameter("@E12", SqlDbType.Int);
        pArray[30].Value = E12;

        pArray[31] = new SqlParameter("@E13", SqlDbType.Int);
        pArray[31].Value = E13;

        pArray[32] = new SqlParameter("@E14", SqlDbType.Int);
        pArray[32].Value = E14;

        pArray[33] = new SqlParameter("@E15", SqlDbType.Int);
        pArray[33].Value = E15;

        pArray[34] = new SqlParameter("@E16", SqlDbType.Int);
        pArray[34].Value = E16;

        pArray[35] = new SqlParameter("@E17", SqlDbType.Int);
        pArray[35].Value = E17;

        pArray[36] = new SqlParameter("@E18", SqlDbType.Int);
        pArray[36].Value = E18;

        pArray[37] = new SqlParameter("@E22", SqlDbType.Int);
        pArray[37].Value = E22;

        pArray[38] = new SqlParameter("@E23", SqlDbType.Int);
        pArray[38].Value = E23;

        pArray[39] = new SqlParameter("@E24", SqlDbType.Int);
        pArray[39].Value = E24;

        pArray[40] = new SqlParameter("@E25", SqlDbType.Int);
        pArray[40].Value = E25;

        pArray[41] = new SqlParameter("@E26", SqlDbType.Int);
        pArray[41].Value = E26;

        //pArray[42] = new SqlParameter("@E27", SqlDbType.Int);
        //pArray[42].Value = E27;

        pArray[43] = new SqlParameter("@F18", SqlDbType.Int);
        pArray[43].Value = F18;

        pArray[44] = new SqlParameter("@F19", SqlDbType.Int);
        pArray[44].Value = F19;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePDFCheckList", pArray);

    }

    public int SaveHeadStartSubcontractorsCount(int GrantApplicantId, int Subcontractors)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@Subcontractors", SqlDbType.Int);
        pArray[1].Value = Subcontractors;

        return Int32.Parse(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveHeadStartSubcontractorsCount", pArray).ToString());

    }


    public int DeleteSubcontractorData(int SCID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@SCID", SqlDbType.Int);
        pArray[0].Value = SCID;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteSubcontractorData", pArray);
    }

    public int SaveHeadStartBudgetNarrativeSubcontractorData(
    int BudgetNarrativeID,
    int GrantApplicantId,
    string SubContractorsName,
    int SupervisorDirector,
    string SupervisorDirectorDescr,
    int ProjectCoordinator,
    string ProjectCoordinatorDescr,
    int Stipend,
    string StipendDescr,
    int Other,
    string OtherDescr,
    int Advisor,
    string AdvisorDescr,
    int Clinician,
    string ClinicianDescr,
    int Coordinator,
    string CoordinatorDescr,
    int EducatorInstructor,
    string EducatorInstructorDescr,
    int HomeVisitor,
    string HomeVisitorDescr,
    int Specialist,
    string SpecialistDescr,
    int IPSStipend,
    string IPSStipendDescr,
    int IPSOther,
    string IPSOtherDescr,
    int AideParaprofessional,
    string AideParaprofessionalDescr,
    int SecretaryBookkeeper,
    string SecretaryBookkeeperDescr,
    int SSStipend,
    string SSStipendDescr,
    int SSOther,
    string SSOtherDescr,
    int FringeBenefits,
    string FringeBenefitsDescr,
    int CSAdvisor,
    string CSAdvisorDescr,
    int CSClinician,
    string CSClinicianDescr,
    int CSConsultant,
    string CSConsultantDescr,
    int CSEducatorInstructor,
    string CSEducatorInstructorDescr,
    int CSHomeVisitor,
    string CSHomeVisitorDescr,
    int CSSpecialist,
    string CSSpecialistDescr,
    int CSSpeaker,
    string CSSpeakerDescr,
    int CSSubstitute,
    string CSSubstituteDescr,
    int CSStipend,
    string CSStipendDescr,
    int CSOther,
    string CSOtherDescr,
    int EducationalInstructionalMaterials,
    string EducationalInstructionalMaterialsDescr,
    int InstructionalTechnologySoftware,
    string InstructionalTechnologySoftwareDescr,
    int NonInstructionalSupplies,
    string NonInstructionalSuppliesDescr,
    int SMOther,
    string SMOtherDescr,
    int SupervisoryStaff,
    string SupervisoryStaffDescr,
    int InstructionalStaff,
    string InstructionalStaffDescr,
    int TravelOther,
    string TraveOtherDescr,
    int Advertising,
    string AdvertisingDescr,
    int EquipmentRental,
    string EquipmentRentalDescr,
    int MaintenanceRepairs,
    string MaintenanceRepairsDescr,
    int MembershipSubscriptions,
    string MembershipSubscriptionsDescr,
    int PrintingReproduction,
    string PrintingReproductionDescr,
    int StaffTraining,
    string StaffTrainingDescr,
    int RentalofSpace,
    string RentalofSpaceDescr,
    int TelephoneUtilities,
    string TelephoneUtilitiesDescr,
    int DirectServiceTransportation,
    string DirectServiceTransportationDescr,
    int OCOther,
    string OCOtherDescr,
    int ProfessionalDevelopOpportunities,
    string ProfessionalDevelopOpportunitiesDescr,
    int ApplicationFees,
    string ApplicationFeesDescr,
    int CEUCourses,
    string CEUCoursesDescr,
    int CollegeCourses,
    string CollegeCoursesDescr,
    int CBOther,
    string CBOtherDescr,
    decimal IndirectPercent,
    int IndirectCosts,
    int InstructionalEquipment,
    string InstructionalEquipmentDescr,
    int NoninstructionalEquipment,
    string NoninstructionalEquipmentDescr,
    int EqOther,
    string EqOtherDescr,
    int SupervisorDirectorColD,
    int ProjectCoordinatorColD,
    int StipendColD,
    int OtherColD,
    int AdvisorColD,
    int ClinicianColD,
    int CoordinatorColD,
    int EducatorInstructorColD,
    int HomeVisitorColD,
    int SpecialistColD,
    int IPSStipendColD,
    int IPSOtherColD,
    int AideParaprofessionalColD,
    int SecretaryBookkeeperColD,
    int SSOtherColD,
    int SSStipendColD,
    int FringeBenefitsColD,
    int CSAdvisorColD,
    int CSClinicianColD,
    int CSConsultantColD,
    int CSEducatorInstructorColD,
    int CSHomeVisitorColD,
    int CSSpecialistColD,
    int CSSpeakerColD,
    int CSSubstituteColD,
    int CSStipendColD,
    int CSOtherColD,
    int EducationalInstructionalMaterialsColD,
    int InstructionalTechnologySoftwareColD,
    int NonInstructionalSuppliesColD,
    int SMOtherColD,
    int SupervisoryStaffColD,
    int InstructionalStaffColD,
    int TravelOtherColD,
    int AdvertisingColD,
    int EquipmentRentalColD,
    int MaintenanceRepairsColD,
    int MembershipSubscriptionsColD,
    int PrintingReproductionColD,
    int StaffTrainingColD,
    int RentalofSpaceColD,
    int TelephoneUtilitiesColD,
    int DirectServiceTransportationColD,
    int OCOtherColD,
    int ProfessionalDevelopOpportunitiesColD,
    int ApplicationFeesColD,
    int CEUCoursesColD,
    int CollegeCoursesColD,
    int CBOtherColD,
    int InstructionalEquipmentColD,
    int NoninstructionalEquipmentColD,
    int EqOtherColD,
    int SupervisorDirectorColF,
    int ProjectCoordinatorColF,
    int StipendColF,
    int OtherColF,
    int AdvisorColF,
    int ClinicianColF,
    int CoordinatorColF,
    int EducatorInstructorColF,
    int HomeVisitorColF,
    int SpecialistColF,
    int IPSStipendColF,
    int IPSOtherColF,
    int AideParaprofessionalColF,
    int SecretaryBookkeeperColF,
    int SSStipendColF,
    int SSOtherColF,
    int FringeBenefitsColF,
    int CSAdvisorColF,
    int CSClinicianColF,
    int CSConsultantColF,
    int CSEducatorInstructorColF,
    int CSHomeVisitorColF,
    int CSSpecialistColF,
    int CSSpeakerColF,
    int CSSubstituteColF,
    int CSStipendColF,
    int CSOtherColF,
    int EducationalInstructionalMaterialsColF,
    int InstructionalTechnologySoftwareColF,
    int NonInstructionalSuppliesColF,
    int SMOtherColF,
    int SupervisoryStaffColF,
    int InstructionalStaffColF,
    int TravelOtherColF,
    int AdvertisingColF,
    int EquipmentRentalColF,
    int MaintenanceRepairsColF,
    int MembershipSubscriptionsColF,
    int PrintingReproductionColF,
    int StaffTrainingColF,
    int RentalofSpaceColF,
    int TelephoneUtilitiesColF,
    int DirectServiceTransportationColF,
    int OCOtherColF,
    int ProfessionalDevelopOpportunitiesColF,
    int ApplicationFeesColF,
    int CEUCoursesColF,
    int CollegeCoursesColF,
    int CBOtherColF,
    int InstructionalEquipmentColF,
    int NoninstructionalEquipmentColF,
    int EqOtherColF,
    int SupervisorDirectorNumofStaff,
    decimal SupervisorDirectorFTE,
    int ProjectCoordinatorNumofStaff,
    decimal ProjectCoordinatorFTE,
    int OtherNumofStaff,
    decimal OtherFTE,
    int AdvisorNumofStaff,
    decimal AdvisorFTE,
    int ClinicianNumofStaff,
    decimal ClinicianFTE,
    int CoordinatorNumofStaff,
    decimal CoordinatorFTE,
    int EducatorInstructorNumofStaff,
    decimal EducatorInstructorFTE,
    int HomeVisitorNumofStaff,
    decimal HomeVisitorFTE,
    int SpecialistNumofStaff,
    decimal SpecialistFTE,
    int IPSOtherNumofStaff,
    decimal IPSOtherFTE,
    int AideParaprofessionalNumofStaff,
    decimal AideParaprofessionalFTE,
    int SecretaryBookkeeperNumofStaff,
    decimal SecretaryBookkeeperFTE,
    int SSOtherNumofStaff,
    decimal SSOtherFTE,
    int FringeBenefitsNumofStaff,
    decimal FringeBenefitsFTE,
    decimal CSAdvisorRate,
    string CSAdvisorHrWkDayFlat,
    decimal CSClinicianRate,
    string CSClinicianHrWkDayFlat,
    decimal CSConsultantRate,
    string CSConsultantHrWkDayFlat,
    decimal CSEducatorInstructorRate,
    string CSEducatorInstructorHrWkDayFlat,
    decimal CSHomeVisitorRate,
    string CSHomeVisitorHrWkDayFlat,
    decimal CSSpecialistRate,
    string CSSpecialistHrWkDayFlat,
    decimal CSSpeakerRate,
    string CSSpeakerHrWkDayFlat,
    decimal CSSubstituteRate,
    string CSSubstituteHrWkDayFlat,
    decimal CSOtherRate,
    string CSOtherHrWkDayFlat,
    decimal SupervisoryStaffMileageRate,
    decimal InstructionalStaffMileageRate,
    decimal TravelOtherMileageRate,
    int GrantTotal
    )
    {
        SqlParameter[] pArray = new SqlParameter[263];

        pArray[0] = new SqlParameter("@BudgetNarrativeID ", SqlDbType.Int);
        pArray[0].Value = BudgetNarrativeID;
        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;
        pArray[2] = new SqlParameter("@SubContractorsName", SqlDbType.VarChar, 200);
        pArray[2].Value = SubContractorsName;
        pArray[3] = new SqlParameter("@SupervisorDirector", SqlDbType.Int);
        pArray[3].Value = SupervisorDirector;
        pArray[4] = new SqlParameter("@SupervisorDirectorDescr", SqlDbType.Text);
        pArray[4].Value = SupervisorDirectorDescr;
        pArray[5] = new SqlParameter("@ProjectCoordinator", SqlDbType.Int);
        pArray[5].Value = ProjectCoordinator;
        pArray[6] = new SqlParameter("@ProjectCoordinatorDescr", SqlDbType.Text);
        pArray[6].Value = ProjectCoordinatorDescr;
        pArray[7] = new SqlParameter("@Stipend", SqlDbType.Int);
        pArray[7].Value = Stipend;
        pArray[8] = new SqlParameter("@StipendDescr", SqlDbType.Text);
        pArray[8].Value = StipendDescr;
        pArray[9] = new SqlParameter("@Other", SqlDbType.Int);
        pArray[9].Value = Other;
        pArray[10] = new SqlParameter("@OtherDescr", SqlDbType.Text);
        pArray[10].Value = OtherDescr;
        pArray[11] = new SqlParameter("@Advisor", SqlDbType.Int);
        pArray[11].Value = Advisor;
        pArray[12] = new SqlParameter("@AdvisorDescr", SqlDbType.Text);
        pArray[12].Value = AdvisorDescr;
        pArray[13] = new SqlParameter("@Clinician", SqlDbType.Int);
        pArray[13].Value = Clinician;
        pArray[14] = new SqlParameter("@ClinicianDescr", SqlDbType.Text);
        pArray[14].Value = ClinicianDescr;
        pArray[15] = new SqlParameter("@Coordinator", SqlDbType.Int);
        pArray[15].Value = Coordinator;
        pArray[16] = new SqlParameter("@CoordinatorDescr", SqlDbType.Text);
        pArray[16].Value = CoordinatorDescr;
        pArray[17] = new SqlParameter("@EducatorInstructor", SqlDbType.Int);
        pArray[17].Value = EducatorInstructor;
        pArray[18] = new SqlParameter("@EducatorInstructorDescr", SqlDbType.Text);
        pArray[18].Value = EducatorInstructorDescr;
        pArray[19] = new SqlParameter("@HomeVisitor", SqlDbType.Int);
        pArray[19].Value = HomeVisitor;
        pArray[20] = new SqlParameter("@HomeVisitorDescr", SqlDbType.Text);
        pArray[20].Value = HomeVisitorDescr;
        pArray[21] = new SqlParameter("@Specialist", SqlDbType.Int);
        pArray[21].Value = Specialist;
        pArray[22] = new SqlParameter("@SpecialistDescr", SqlDbType.Text);
        pArray[22].Value = SpecialistDescr;
        pArray[23] = new SqlParameter("@IPSStipend", SqlDbType.Int);
        pArray[23].Value = IPSStipend;
        pArray[24] = new SqlParameter("@IPSStipendDescr", SqlDbType.Text);
        pArray[24].Value = IPSStipendDescr;
        pArray[25] = new SqlParameter("@IPSOther", SqlDbType.Int);
        pArray[25].Value = IPSOther;
        pArray[26] = new SqlParameter("@IPSOtherDescr", SqlDbType.Text);
        pArray[26].Value = IPSOtherDescr;
        pArray[27] = new SqlParameter("@AideParaprofessional", SqlDbType.Int);
        pArray[27].Value = AideParaprofessional;
        pArray[28] = new SqlParameter("@AideParaprofessionalDescr", SqlDbType.Text);
        pArray[28].Value = AideParaprofessionalDescr;
        pArray[29] = new SqlParameter("@SecretaryBookkeeper", SqlDbType.Int);
        pArray[29].Value = SecretaryBookkeeper;
        pArray[30] = new SqlParameter("@SecretaryBookkeeperDescr", SqlDbType.Text);
        pArray[30].Value = SecretaryBookkeeperDescr;
        pArray[31] = new SqlParameter("@SSStipend", SqlDbType.Int);
        pArray[31].Value = SSStipend;
        pArray[32] = new SqlParameter("@SSStipendDescr", SqlDbType.Text);
        pArray[32].Value = SSStipendDescr;
        pArray[33] = new SqlParameter("@SSOther", SqlDbType.Int);
        pArray[33].Value = SSOther;
        pArray[34] = new SqlParameter("@SSOtherDescr", SqlDbType.Text);
        pArray[34].Value = SSOtherDescr;
        pArray[35] = new SqlParameter("@FringeBenefits", SqlDbType.Int);
        pArray[35].Value = FringeBenefits;
        pArray[36] = new SqlParameter("@FringeBenefitsDescr", SqlDbType.Text);
        pArray[36].Value = FringeBenefitsDescr;
        pArray[37] = new SqlParameter("@CSAdvisor", SqlDbType.Int);
        pArray[37].Value = CSAdvisor;
        pArray[38] = new SqlParameter("@CSAdvisorDescr", SqlDbType.Text);
        pArray[38].Value = CSAdvisorDescr;
        pArray[39] = new SqlParameter("@CSClinician", SqlDbType.Int);
        pArray[39].Value = CSClinician;
        pArray[40] = new SqlParameter("@CSClinicianDescr", SqlDbType.Text);
        pArray[40].Value = CSClinicianDescr;
        pArray[41] = new SqlParameter("@CSConsultant", SqlDbType.Int);
        pArray[41].Value = CSConsultant;
        pArray[42] = new SqlParameter("@CSConsultantDescr", SqlDbType.Text);
        pArray[42].Value = CSConsultantDescr;
        pArray[43] = new SqlParameter("@CSEducatorInstructor", SqlDbType.Int);
        pArray[43].Value = CSEducatorInstructor;
        pArray[44] = new SqlParameter("@CSEducatorInstructorDescr", SqlDbType.Text);
        pArray[44].Value = CSEducatorInstructorDescr;
        pArray[45] = new SqlParameter("@CSHomeVisitor", SqlDbType.Int);
        pArray[45].Value = CSHomeVisitor;
        pArray[46] = new SqlParameter("@CSHomeVisitorDescr", SqlDbType.Text);
        pArray[46].Value = CSHomeVisitorDescr;
        pArray[47] = new SqlParameter("@CSSpecialist", SqlDbType.Int);
        pArray[47].Value = CSSpecialist;
        pArray[48] = new SqlParameter("@CSSpecialistDescr", SqlDbType.Text);
        pArray[48].Value = CSSpecialistDescr;
        pArray[49] = new SqlParameter("@CSSpeaker", SqlDbType.Int);
        pArray[49].Value = CSSpeaker;
        pArray[50] = new SqlParameter("@CSSpeakerDescr", SqlDbType.Text);
        pArray[50].Value = CSSpeakerDescr;
        pArray[51] = new SqlParameter("@CSSubstitute", SqlDbType.Int);
        pArray[51].Value = CSSubstitute;
        pArray[52] = new SqlParameter("@CSSubstituteDescr", SqlDbType.Text);
        pArray[52].Value = CSSubstituteDescr;
        pArray[53] = new SqlParameter("@CSStipend", SqlDbType.Int);
        pArray[53].Value = CSStipend;
        pArray[54] = new SqlParameter("@CSStipendDescr", SqlDbType.Text);
        pArray[54].Value = CSStipendDescr;
        pArray[55] = new SqlParameter("@CSOther", SqlDbType.Int);
        pArray[55].Value = CSOther;
        pArray[56] = new SqlParameter("@CSOtherDescr", SqlDbType.Text);
        pArray[56].Value = CSOtherDescr;
        pArray[57] = new SqlParameter("@EducationalInstructionalMaterials", SqlDbType.Int);
        pArray[57].Value = EducationalInstructionalMaterials;
        pArray[58] = new SqlParameter("@EducationalInstructionalMaterialsDescr", SqlDbType.Text);
        pArray[58].Value = EducationalInstructionalMaterialsDescr;
        pArray[59] = new SqlParameter("@InstructionalTechnologySoftware", SqlDbType.Int);
        pArray[59].Value = InstructionalTechnologySoftware;
        pArray[60] = new SqlParameter("@InstructionalTechnologySoftwareDescr", SqlDbType.Text);
        pArray[60].Value = InstructionalTechnologySoftwareDescr;
        pArray[61] = new SqlParameter("@NonInstructionalSupplies", SqlDbType.Int);
        pArray[61].Value = NonInstructionalSupplies;
        pArray[62] = new SqlParameter("@NonInstructionalSuppliesDescr", SqlDbType.Text);
        pArray[62].Value = NonInstructionalSuppliesDescr;
        pArray[63] = new SqlParameter("@SMOther", SqlDbType.Int);
        pArray[63].Value = SMOther;
        pArray[64] = new SqlParameter("@SMOtherDescr", SqlDbType.Text);
        pArray[64].Value = SMOtherDescr;
        pArray[65] = new SqlParameter("@SupervisoryStaff", SqlDbType.Int);
        pArray[65].Value = SupervisoryStaff;
        pArray[66] = new SqlParameter("@SupervisoryStaffDescr", SqlDbType.Text);
        pArray[66].Value = SupervisoryStaffDescr;
        pArray[67] = new SqlParameter("@InstructionalStaff", SqlDbType.Int);
        pArray[67].Value = InstructionalStaff;
        pArray[68] = new SqlParameter("@InstructionalStaffDescr", SqlDbType.Text);
        pArray[68].Value = InstructionalStaffDescr;
        pArray[69] = new SqlParameter("@TravelOther", SqlDbType.Int);
        pArray[69].Value = TravelOther;
        pArray[70] = new SqlParameter("@TraveOtherDescr", SqlDbType.Text);
        pArray[70].Value = TraveOtherDescr;
        pArray[71] = new SqlParameter("@Advertising", SqlDbType.Int);
        pArray[71].Value = Advertising;
        pArray[72] = new SqlParameter("@AdvertisingDescr", SqlDbType.Text);
        pArray[72].Value = AdvertisingDescr;
        pArray[73] = new SqlParameter("@EquipmentRental", SqlDbType.Int);
        pArray[73].Value = EquipmentRental;
        pArray[74] = new SqlParameter("@EquipmentRentalDescr", SqlDbType.Text);
        pArray[74].Value = EquipmentRentalDescr;
        pArray[75] = new SqlParameter("@MaintenanceRepairs", SqlDbType.Int);
        pArray[75].Value = MaintenanceRepairs;
        pArray[76] = new SqlParameter("@MaintenanceRepairsDescr", SqlDbType.Text);
        pArray[76].Value = MaintenanceRepairsDescr;
        pArray[77] = new SqlParameter("@MembershipSubscriptions", SqlDbType.Int);
        pArray[77].Value = MembershipSubscriptions;
        pArray[78] = new SqlParameter("@MembershipSubscriptionsDescr", SqlDbType.Text);
        pArray[78].Value = MembershipSubscriptionsDescr;
        pArray[79] = new SqlParameter("@PrintingReproduction", SqlDbType.Int);
        pArray[79].Value = PrintingReproduction;
        pArray[80] = new SqlParameter("@PrintingReproductionDescr", SqlDbType.Text);
        pArray[80].Value = PrintingReproductionDescr;
        pArray[81] = new SqlParameter("@StaffTraining", SqlDbType.Int);
        pArray[81].Value = StaffTraining;
        pArray[82] = new SqlParameter("@StaffTrainingDescr", SqlDbType.Text);
        pArray[82].Value = StaffTrainingDescr;
        pArray[83] = new SqlParameter("@RentalofSpace", SqlDbType.Int);
        pArray[83].Value = RentalofSpace;
        pArray[84] = new SqlParameter("@RentalofSpaceDescr", SqlDbType.Text);
        pArray[84].Value = RentalofSpaceDescr;
        pArray[85] = new SqlParameter("@TelephoneUtilities", SqlDbType.Int);
        pArray[85].Value = TelephoneUtilities;
        pArray[86] = new SqlParameter("@TelephoneUtilitiesDescr", SqlDbType.Text);
        pArray[86].Value = TelephoneUtilitiesDescr;
        pArray[87] = new SqlParameter("@DirectServiceTransportation", SqlDbType.Int);
        pArray[87].Value = DirectServiceTransportation;
        pArray[88] = new SqlParameter("@DirectServiceTransportationDescr", SqlDbType.Text);
        pArray[88].Value = DirectServiceTransportationDescr;
        pArray[89] = new SqlParameter("@OCOther", SqlDbType.Int);
        pArray[89].Value = OCOther;
        pArray[90] = new SqlParameter("@OCOtherDescr", SqlDbType.Text);
        pArray[90].Value = OCOtherDescr;
        pArray[91] = new SqlParameter("@ProfessionalDevelopOpportunities", SqlDbType.Int);
        pArray[91].Value = ProfessionalDevelopOpportunities;
        pArray[92] = new SqlParameter("@ProfessionalDevelopOpportunitiesDescr", SqlDbType.Text);
        pArray[92].Value = ProfessionalDevelopOpportunitiesDescr;
        pArray[93] = new SqlParameter("@ApplicationFees", SqlDbType.Int);
        pArray[93].Value = ApplicationFees;
        pArray[94] = new SqlParameter("@ApplicationFeesDescr", SqlDbType.Text);
        pArray[94].Value = ApplicationFeesDescr;
        pArray[95] = new SqlParameter("@CEUCourses", SqlDbType.Int);
        pArray[95].Value = CEUCourses;
        pArray[96] = new SqlParameter("@CEUCoursesDescr", SqlDbType.Text);
        pArray[96].Value = CEUCoursesDescr;
        pArray[97] = new SqlParameter("@CollegeCourses", SqlDbType.Int);
        pArray[97].Value = CollegeCourses;
        pArray[98] = new SqlParameter("@CollegeCoursesDescr", SqlDbType.Text);
        pArray[98].Value = CollegeCoursesDescr;
        pArray[99] = new SqlParameter("@CBOther", SqlDbType.Int);
        pArray[99].Value = CBOther;
        pArray[100] = new SqlParameter("@CBOtherDescr", SqlDbType.Text);
        pArray[100].Value = CBOtherDescr;
        pArray[101] = new SqlParameter("@IndirectPercent", SqlDbType.Decimal);
        pArray[101].Value = IndirectPercent;
        pArray[102] = new SqlParameter("@IndirectCosts", SqlDbType.Int);
        pArray[102].Value = IndirectCosts;
        pArray[103] = new SqlParameter("@InstructionalEquipment", SqlDbType.Int);
        pArray[103].Value = InstructionalEquipment;
        pArray[104] = new SqlParameter("@InstructionalEquipmentDescr", SqlDbType.Text);
        pArray[104].Value = InstructionalEquipmentDescr;
        pArray[105] = new SqlParameter("@NoninstructionalEquipment", SqlDbType.Int);
        pArray[105].Value = NoninstructionalEquipment;
        pArray[106] = new SqlParameter("@NoninstructionalEquipmentDescr", SqlDbType.Text);
        pArray[106].Value = NoninstructionalEquipmentDescr;
        pArray[107] = new SqlParameter("@EqOther", SqlDbType.Int);
        pArray[107].Value = EqOther;
        pArray[108] = new SqlParameter("@EqOtherDescr", SqlDbType.Text);
        pArray[108].Value = EqOtherDescr;
        pArray[109] = new SqlParameter("@SupervisorDirectorColD", SqlDbType.Int);
        pArray[109].Value = SupervisorDirectorColD;
        pArray[110] = new SqlParameter("@ProjectCoordinatorColD", SqlDbType.Int);
        pArray[110].Value = ProjectCoordinatorColD;
        pArray[111] = new SqlParameter("@StipendColD", SqlDbType.Int);
        pArray[111].Value = StipendColD;
        pArray[112] = new SqlParameter("@OtherColD", SqlDbType.Int);
        pArray[112].Value = OtherColD;
        pArray[113] = new SqlParameter("@AdvisorColD", SqlDbType.Int);
        pArray[113].Value = AdvisorColD;
        pArray[114] = new SqlParameter("@ClinicianColD", SqlDbType.Int);
        pArray[114].Value = ClinicianColD;
        pArray[115] = new SqlParameter("@CoordinatorColD", SqlDbType.Int);
        pArray[115].Value = CoordinatorColD;
        pArray[116] = new SqlParameter("@EducatorInstructorColD", SqlDbType.Int);
        pArray[116].Value = EducatorInstructorColD;
        pArray[117] = new SqlParameter("@HomeVisitorColD", SqlDbType.Int);
        pArray[117].Value = HomeVisitorColD;
        pArray[118] = new SqlParameter("@SpecialistColD", SqlDbType.Int);
        pArray[118].Value = SpecialistColD;
        pArray[119] = new SqlParameter("@IPSStipendColD", SqlDbType.Int);
        pArray[119].Value = IPSStipendColD;
        pArray[120] = new SqlParameter("@IPSOtherColD", SqlDbType.Int);
        pArray[120].Value = IPSOtherColD;
        pArray[121] = new SqlParameter("@AideParaprofessionalColD", SqlDbType.Int);
        pArray[121].Value = AideParaprofessionalColD;
        pArray[122] = new SqlParameter("@SecretaryBookkeeperColD", SqlDbType.Int);
        pArray[122].Value = SecretaryBookkeeperColD;
        pArray[123] = new SqlParameter("@SSOtherColD", SqlDbType.Int);
        pArray[123].Value = SSOtherColD;
        pArray[124] = new SqlParameter("@SSStipendColD", SqlDbType.Int);
        pArray[124].Value = SSStipendColD;
        pArray[125] = new SqlParameter("@FringeBenefitsColD", SqlDbType.Int);
        pArray[125].Value = FringeBenefitsColD;
        pArray[126] = new SqlParameter("@CSAdvisorColD", SqlDbType.Int);
        pArray[126].Value = CSAdvisorColD;
        pArray[127] = new SqlParameter("@CSClinicianColD", SqlDbType.Int);
        pArray[127].Value = CSClinicianColD;
        pArray[128] = new SqlParameter("@CSConsultantColD", SqlDbType.Int);
        pArray[128].Value = CSConsultantColD;
        pArray[129] = new SqlParameter("@CSEducatorInstructorColD", SqlDbType.Int);
        pArray[129].Value = CSEducatorInstructorColD;
        pArray[130] = new SqlParameter("@CSHomeVisitorColD", SqlDbType.Int);
        pArray[130].Value = CSHomeVisitorColD;
        pArray[131] = new SqlParameter("@CSSpecialistColD", SqlDbType.Int);
        pArray[131].Value = CSSpecialistColD;
        pArray[132] = new SqlParameter("@CSSpeakerColD", SqlDbType.Int);
        pArray[132].Value = CSSpeakerColD;
        pArray[133] = new SqlParameter("@CSSubstituteColD", SqlDbType.Int);
        pArray[133].Value = CSSubstituteColD;
        pArray[134] = new SqlParameter("@CSStipendColD", SqlDbType.Int);
        pArray[134].Value = CSStipendColD;
        pArray[135] = new SqlParameter("@CSOtherColD", SqlDbType.Int);
        pArray[135].Value = CSOtherColD;
        pArray[136] = new SqlParameter("@EducationalInstructionalMaterialsColD", SqlDbType.Int);
        pArray[136].Value = EducationalInstructionalMaterialsColD;
        pArray[137] = new SqlParameter("@InstructionalTechnologySoftwareColD", SqlDbType.Int);
        pArray[137].Value = InstructionalTechnologySoftwareColD;
        pArray[138] = new SqlParameter("@NonInstructionalSuppliesColD", SqlDbType.Int);
        pArray[138].Value = NonInstructionalSuppliesColD;
        pArray[139] = new SqlParameter("@SMOtherColD", SqlDbType.Int);
        pArray[139].Value = SMOtherColD;
        pArray[140] = new SqlParameter("@SupervisoryStaffColD", SqlDbType.Int);
        pArray[140].Value = SupervisoryStaffColD;
        pArray[141] = new SqlParameter("@InstructionalStaffColD", SqlDbType.Int);
        pArray[141].Value = InstructionalStaffColD;
        pArray[142] = new SqlParameter("@TravelOtherColD", SqlDbType.Int);
        pArray[142].Value = TravelOtherColD;
        pArray[143] = new SqlParameter("@AdvertisingColD", SqlDbType.Int);
        pArray[143].Value = AdvertisingColD;
        pArray[144] = new SqlParameter("@EquipmentRentalColD", SqlDbType.Int);
        pArray[144].Value = EquipmentRentalColD;
        pArray[145] = new SqlParameter("@MaintenanceRepairsColD", SqlDbType.Int);
        pArray[145].Value = MaintenanceRepairsColD;
        pArray[146] = new SqlParameter("@MembershipSubscriptionsColD", SqlDbType.Int);
        pArray[146].Value = MembershipSubscriptionsColD;
        pArray[147] = new SqlParameter("@PrintingReproductionColD", SqlDbType.Int);
        pArray[147].Value = PrintingReproductionColD;
        pArray[148] = new SqlParameter("@StaffTrainingColD", SqlDbType.Int);
        pArray[148].Value = StaffTrainingColD;
        pArray[149] = new SqlParameter("@RentalofSpaceColD", SqlDbType.Int);
        pArray[149].Value = RentalofSpaceColD;
        pArray[150] = new SqlParameter("@TelephoneUtilitiesColD", SqlDbType.Int);
        pArray[150].Value = TelephoneUtilitiesColD;
        pArray[151] = new SqlParameter("@DirectServiceTransportationColD", SqlDbType.Int);
        pArray[151].Value = DirectServiceTransportationColD;
        pArray[152] = new SqlParameter("@OCOtherColD", SqlDbType.Int);
        pArray[152].Value = OCOtherColD;
        pArray[153] = new SqlParameter("@ProfessionalDevelopOpportunitiesColD", SqlDbType.Int);
        pArray[153].Value = ProfessionalDevelopOpportunitiesColD;
        pArray[154] = new SqlParameter("@ApplicationFeesColD", SqlDbType.Int);
        pArray[154].Value = ApplicationFeesColD;
        pArray[155] = new SqlParameter("@CEUCoursesColD", SqlDbType.Int);
        pArray[155].Value = CEUCoursesColD;
        pArray[156] = new SqlParameter("@CollegeCoursesColD", SqlDbType.Int);
        pArray[156].Value = CollegeCoursesColD;
        pArray[157] = new SqlParameter("@CBOtherColD", SqlDbType.Int);
        pArray[157].Value = CBOtherColD;
        pArray[158] = new SqlParameter("@InstructionalEquipmentColD", SqlDbType.Int);
        pArray[158].Value = InstructionalEquipmentColD;
        pArray[159] = new SqlParameter("@NoninstructionalEquipmentColD", SqlDbType.Int);
        pArray[159].Value = NoninstructionalEquipmentColD;
        pArray[160] = new SqlParameter("@EqOtherColD", SqlDbType.Int);
        pArray[160].Value = EqOtherColD;
        pArray[161] = new SqlParameter("@SupervisorDirectorColF", SqlDbType.Int);
        pArray[161].Value = SupervisorDirectorColF;
        pArray[162] = new SqlParameter("@ProjectCoordinatorColF", SqlDbType.Int);
        pArray[162].Value = ProjectCoordinatorColF;
        pArray[163] = new SqlParameter("@StipendColF", SqlDbType.Int);
        pArray[163].Value = StipendColF;
        pArray[164] = new SqlParameter("@OtherColF", SqlDbType.Int);
        pArray[164].Value = OtherColF;
        pArray[165] = new SqlParameter("@AdvisorColF", SqlDbType.Int);
        pArray[165].Value = AdvisorColF;
        pArray[166] = new SqlParameter("@ClinicianColF", SqlDbType.Int);
        pArray[166].Value = ClinicianColF;
        pArray[167] = new SqlParameter("@CoordinatorColF", SqlDbType.Int);
        pArray[167].Value = CoordinatorColF;
        pArray[168] = new SqlParameter("@EducatorInstructorColF", SqlDbType.Int);
        pArray[168].Value = EducatorInstructorColF;
        pArray[169] = new SqlParameter("@HomeVisitorColF", SqlDbType.Int);
        pArray[169].Value = HomeVisitorColF;
        pArray[170] = new SqlParameter("@SpecialistColF", SqlDbType.Int);
        pArray[170].Value = SpecialistColF;
        pArray[171] = new SqlParameter("@IPSStipendColF", SqlDbType.Int);
        pArray[171].Value = IPSStipendColF;
        pArray[172] = new SqlParameter("@IPSOtherColF", SqlDbType.Int);
        pArray[172].Value = IPSOtherColF;
        pArray[173] = new SqlParameter("@AideParaprofessionalColF", SqlDbType.Int);
        pArray[173].Value = AideParaprofessionalColF;
        pArray[174] = new SqlParameter("@SecretaryBookkeeperColF", SqlDbType.Int);
        pArray[174].Value = SecretaryBookkeeperColF;
        pArray[175] = new SqlParameter("@SSStipendColF", SqlDbType.Int);
        pArray[175].Value = SSStipendColF;
        pArray[176] = new SqlParameter("@SSOtherColF", SqlDbType.Int);
        pArray[176].Value = SSOtherColF;
        pArray[177] = new SqlParameter("@FringeBenefitsColF", SqlDbType.Int);
        pArray[177].Value = FringeBenefitsColF;
        pArray[178] = new SqlParameter("@CSAdvisorColF", SqlDbType.Int);
        pArray[178].Value = CSAdvisorColF;
        pArray[179] = new SqlParameter("@CSClinicianColF", SqlDbType.Int);
        pArray[179].Value = CSClinicianColF;
        pArray[180] = new SqlParameter("@CSConsultantColF", SqlDbType.Int);
        pArray[180].Value = CSConsultantColF;
        pArray[181] = new SqlParameter("@CSEducatorInstructorColF", SqlDbType.Int);
        pArray[181].Value = CSEducatorInstructorColF;
        pArray[182] = new SqlParameter("@CSHomeVisitorColF", SqlDbType.Int);
        pArray[182].Value = CSHomeVisitorColF;
        pArray[183] = new SqlParameter("@CSSpecialistColF", SqlDbType.Int);
        pArray[183].Value = CSSpecialistColF;
        pArray[184] = new SqlParameter("@CSSpeakerColF", SqlDbType.Int);
        pArray[184].Value = CSSpeakerColF;
        pArray[185] = new SqlParameter("@CSSubstituteColF", SqlDbType.Int);
        pArray[185].Value = CSSubstituteColF;
        pArray[186] = new SqlParameter("@CSStipendColF", SqlDbType.Int);
        pArray[186].Value = CSStipendColF;
        pArray[187] = new SqlParameter("@CSOtherColF", SqlDbType.Int);
        pArray[187].Value = CSOtherColF;
        pArray[188] = new SqlParameter("@EducationalInstructionalMaterialsColF", SqlDbType.Int);
        pArray[188].Value = EducationalInstructionalMaterialsColF;
        pArray[189] = new SqlParameter("@InstructionalTechnologySoftwareColF", SqlDbType.Int);
        pArray[189].Value = InstructionalTechnologySoftwareColF;
        pArray[190] = new SqlParameter("@NonInstructionalSuppliesColF", SqlDbType.Int);
        pArray[190].Value = NonInstructionalSuppliesColF;
        pArray[191] = new SqlParameter("@SMOtherColF", SqlDbType.Int);
        pArray[191].Value = SMOtherColF;
        pArray[192] = new SqlParameter("@SupervisoryStaffColF", SqlDbType.Int);
        pArray[192].Value = SupervisoryStaffColF;
        pArray[193] = new SqlParameter("@InstructionalStaffColF", SqlDbType.Int);
        pArray[193].Value = InstructionalStaffColF;
        pArray[194] = new SqlParameter("@TravelOtherColF", SqlDbType.Int);
        pArray[194].Value = TravelOtherColF;
        pArray[195] = new SqlParameter("@AdvertisingColF", SqlDbType.Int);
        pArray[195].Value = AdvertisingColF;
        pArray[196] = new SqlParameter("@EquipmentRentalColF", SqlDbType.Int);
        pArray[196].Value = EquipmentRentalColF;
        pArray[197] = new SqlParameter("@MaintenanceRepairsColF", SqlDbType.Int);
        pArray[197].Value = MaintenanceRepairsColF;
        pArray[198] = new SqlParameter("@MembershipSubscriptionsColF", SqlDbType.Int);
        pArray[198].Value = MembershipSubscriptionsColF;
        pArray[199] = new SqlParameter("@PrintingReproductionColF", SqlDbType.Int);
        pArray[199].Value = PrintingReproductionColF;
        pArray[200] = new SqlParameter("@StaffTrainingColF", SqlDbType.Int);
        pArray[200].Value = StaffTrainingColF;
        pArray[201] = new SqlParameter("@RentalofSpaceColF", SqlDbType.Int);
        pArray[201].Value = RentalofSpaceColF;
        pArray[202] = new SqlParameter("@TelephoneUtilitiesColF", SqlDbType.Int);
        pArray[202].Value = TelephoneUtilitiesColF;
        pArray[203] = new SqlParameter("@DirectServiceTransportationColF", SqlDbType.Int);
        pArray[203].Value = DirectServiceTransportationColF;
        pArray[204] = new SqlParameter("@OCOtherColF", SqlDbType.Int);
        pArray[204].Value = OCOtherColF;
        pArray[205] = new SqlParameter("@ProfessionalDevelopOpportunitiesColF", SqlDbType.Int);
        pArray[205].Value = ProfessionalDevelopOpportunitiesColF;
        pArray[206] = new SqlParameter("@ApplicationFeesColF", SqlDbType.Int);
        pArray[206].Value = ApplicationFeesColF;
        pArray[207] = new SqlParameter("@CEUCoursesColF", SqlDbType.Int);
        pArray[207].Value = CEUCoursesColF;
        pArray[208] = new SqlParameter("@CollegeCoursesColF", SqlDbType.Int);
        pArray[208].Value = CollegeCoursesColF;
        pArray[209] = new SqlParameter("@CBOtherColF", SqlDbType.Int);
        pArray[209].Value = CBOtherColF;
        pArray[210] = new SqlParameter("@InstructionalEquipmentColF", SqlDbType.Int);
        pArray[210].Value = InstructionalEquipmentColF;
        pArray[211] = new SqlParameter("@NoninstructionalEquipmentColF", SqlDbType.Int);
        pArray[211].Value = NoninstructionalEquipmentColF;
        pArray[212] = new SqlParameter("@EqOtherColF", SqlDbType.Int);
        pArray[212].Value = EqOtherColF;
        pArray[213] = new SqlParameter("@SupervisorDirectorNumofStaff", SqlDbType.Int);
        pArray[213].Value = SupervisorDirectorNumofStaff;
        pArray[214] = new SqlParameter("@SupervisorDirectorFTE", SqlDbType.Decimal);
        pArray[214].Value = SupervisorDirectorFTE;
        pArray[215] = new SqlParameter("@ProjectCoordinatorNumofStaff", SqlDbType.Int);
        pArray[215].Value = ProjectCoordinatorNumofStaff;
        pArray[216] = new SqlParameter("@ProjectCoordinatorFTE", SqlDbType.Decimal);
        pArray[216].Value = ProjectCoordinatorFTE;
        pArray[217] = new SqlParameter("@OtherNumofStaff", SqlDbType.Int);
        pArray[217].Value = OtherNumofStaff;
        pArray[218] = new SqlParameter("@OtherFTE", SqlDbType.Decimal);
        pArray[218].Value = OtherFTE;
        pArray[219] = new SqlParameter("@AdvisorNumofStaff", SqlDbType.Int);
        pArray[219].Value = AdvisorNumofStaff;
        pArray[220] = new SqlParameter("@AdvisorFTE", SqlDbType.Decimal);
        pArray[220].Value = AdvisorFTE;
        pArray[221] = new SqlParameter("@ClinicianNumofStaff", SqlDbType.Int);
        pArray[221].Value = ClinicianNumofStaff;
        pArray[222] = new SqlParameter("@ClinicianFTE", SqlDbType.Decimal);
        pArray[222].Value = ClinicianFTE;
        pArray[223] = new SqlParameter("@CoordinatorNumofStaff", SqlDbType.Int);
        pArray[223].Value = CoordinatorNumofStaff;
        pArray[224] = new SqlParameter("@CoordinatorFTE", SqlDbType.Decimal);
        pArray[224].Value = CoordinatorFTE;
        pArray[225] = new SqlParameter("@EducatorInstructorNumofStaff", SqlDbType.Int);
        pArray[225].Value = EducatorInstructorNumofStaff;
        pArray[226] = new SqlParameter("@EducatorInstructorFTE", SqlDbType.Decimal);
        pArray[226].Value = EducatorInstructorFTE;
        pArray[227] = new SqlParameter("@HomeVisitorNumofStaff", SqlDbType.Int);
        pArray[227].Value = HomeVisitorNumofStaff;
        pArray[228] = new SqlParameter("@HomeVisitorFTE", SqlDbType.Decimal);
        pArray[228].Value = HomeVisitorFTE;
        pArray[229] = new SqlParameter("@SpecialistNumofStaff", SqlDbType.Int);
        pArray[229].Value = SpecialistNumofStaff;
        pArray[230] = new SqlParameter("@SpecialistFTE", SqlDbType.Decimal);
        pArray[230].Value = SpecialistFTE;
        pArray[231] = new SqlParameter("@IPSOtherNumofStaff", SqlDbType.Int);
        pArray[231].Value = IPSOtherNumofStaff;
        pArray[232] = new SqlParameter("@IPSOtherFTE", SqlDbType.Decimal);
        pArray[232].Value = IPSOtherFTE;
        pArray[233] = new SqlParameter("@AideParaprofessionalNumofStaff", SqlDbType.Int);
        pArray[233].Value = AideParaprofessionalNumofStaff;
        pArray[234] = new SqlParameter("@AideParaprofessionalFTE", SqlDbType.Decimal);
        pArray[234].Value = AideParaprofessionalFTE;
        pArray[235] = new SqlParameter("@SecretaryBookkeeperNumofStaff", SqlDbType.Int);
        pArray[235].Value = SecretaryBookkeeperNumofStaff;
        pArray[236] = new SqlParameter("@SecretaryBookkeeperFTE", SqlDbType.Decimal);
        pArray[236].Value = SecretaryBookkeeperFTE;
        pArray[237] = new SqlParameter("@SSOtherNumofStaff", SqlDbType.Int);
        pArray[237].Value = SSOtherNumofStaff;
        pArray[238] = new SqlParameter("@SSOtherFTE", SqlDbType.Decimal);
        pArray[238].Value = SSOtherFTE;
        pArray[239] = new SqlParameter("@FringeBenefitsNumofStaff", SqlDbType.Int);
        pArray[239].Value = FringeBenefitsNumofStaff;
        pArray[240] = new SqlParameter("@FringeBenefitsFTE", SqlDbType.Decimal);
        pArray[240].Value = FringeBenefitsFTE;
        pArray[241] = new SqlParameter("@CSAdvisorRate", SqlDbType.Decimal);
        pArray[241].Value = CSAdvisorRate;
        pArray[242] = new SqlParameter("@CSAdvisorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[242].Value = CSAdvisorHrWkDayFlat;
        pArray[243] = new SqlParameter("@CSClinicianRate", SqlDbType.Decimal);
        pArray[243].Value = CSClinicianRate;
        pArray[244] = new SqlParameter("@CSClinicianHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[244].Value = CSClinicianHrWkDayFlat;
        pArray[245] = new SqlParameter("@CSConsultantRate", SqlDbType.Decimal);
        pArray[245].Value = CSConsultantRate;
        pArray[246] = new SqlParameter("@CSConsultantHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[246].Value = CSConsultantHrWkDayFlat;
        pArray[247] = new SqlParameter("@CSEducatorInstructorRate", SqlDbType.Decimal);
        pArray[247].Value = CSEducatorInstructorRate;
        pArray[248] = new SqlParameter("@CSEducatorInstructorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[248].Value = CSEducatorInstructorHrWkDayFlat;
        pArray[249] = new SqlParameter("@CSHomeVisitorRate", SqlDbType.Decimal);
        pArray[249].Value = CSHomeVisitorRate;
        pArray[250] = new SqlParameter("@CSHomeVisitorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[250].Value = CSHomeVisitorHrWkDayFlat;
        pArray[251] = new SqlParameter("@CSSpecialistRate", SqlDbType.Decimal);
        pArray[251].Value = CSSpecialistRate;
        pArray[252] = new SqlParameter("@CSSpecialistHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[252].Value = CSSpecialistHrWkDayFlat;
        pArray[253] = new SqlParameter("@CSSpeakerRate", SqlDbType.Decimal);
        pArray[253].Value = CSSpeakerRate;
        pArray[254] = new SqlParameter("@CSSpeakerHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[254].Value = CSSpeakerHrWkDayFlat;
        pArray[255] = new SqlParameter("@CSSubstituteRate", SqlDbType.Decimal);
        pArray[255].Value = CSSubstituteRate;
        pArray[256] = new SqlParameter("@CSSubstituteHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[256].Value = CSSubstituteHrWkDayFlat;
        pArray[257] = new SqlParameter("@CSOtherRate", SqlDbType.Decimal);
        pArray[257].Value = CSOtherRate;
        pArray[258] = new SqlParameter("@CSOtherHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[258].Value = CSOtherHrWkDayFlat;
        pArray[259] = new SqlParameter("@SupervisoryStaffMileageRate", SqlDbType.Decimal);
        pArray[259].Value = SupervisoryStaffMileageRate;
        pArray[260] = new SqlParameter("@InstructionalStaffMileageRate", SqlDbType.Decimal);
        pArray[260].Value = InstructionalStaffMileageRate;
        pArray[261] = new SqlParameter("@TravelOtherMileageRate", SqlDbType.Decimal);
        pArray[261].Value = TravelOtherMileageRate;
        pArray[262] = new SqlParameter("@GrantTotal", SqlDbType.Int);
        pArray[262].Value = GrantTotal;



        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveHeadStartBudgetNarrativeSubcontractorData", pArray);
    }


    public int UpdateHeadStartBudgetNarrativeSubcontractorData(
    int BudgetNarrativeID,
    int GrantApplicantId,
    string SubContractorsName,
    decimal SupervisorDirector,
    string SupervisorDirectorDescr,
    decimal ProjectCoordinator,
    string ProjectCoordinatorDescr,
    decimal Stipend,
    string StipendDescr,
    decimal Other,
    string OtherDescr,
    decimal Advisor,
    string AdvisorDescr,
    decimal Clinician,
    string ClinicianDescr,
    decimal Coordinator,
    string CoordinatorDescr,
    decimal EducatorInstructor,
    string EducatorInstructorDescr,
    decimal HomeVisitor,
    string HomeVisitorDescr,
    decimal Specialist,
    string SpecialistDescr,
    decimal IPSStipend,
    string IPSStipendDescr,
    decimal IPSOther,
    string IPSOtherDescr,
    decimal AideParaprofessional,
    string AideParaprofessionalDescr,
    decimal SecretaryBookkeeper,
    string SecretaryBookkeeperDescr,
    decimal SSStipend,
    string SSStipendDescr,
    decimal SSOther,
    string SSOtherDescr,
    decimal FringeBenefits,
    string FringeBenefitsDescr,
    decimal CSAdvisor,
    string CSAdvisorDescr,
    decimal CSClinician,
    string CSClinicianDescr,
    decimal CSConsultant,
    string CSConsultantDescr,
    decimal CSEducatorInstructor,
    string CSEducatorInstructorDescr,
    decimal CSHomeVisitor,
    string CSHomeVisitorDescr,
    decimal CSSpecialist,
    string CSSpecialistDescr,
    decimal CSSpeaker,
    string CSSpeakerDescr,
    decimal CSSubstitute,
    string CSSubstituteDescr,
    decimal CSStipend,
    string CSStipendDescr,
    decimal CSOther,
    string CSOtherDescr,
    decimal EducationalInstructionalMaterials,
    string EducationalInstructionalMaterialsDescr,
    decimal InstructionalTechnologySoftware,
    string InstructionalTechnologySoftwareDescr,
    decimal NonInstructionalSupplies,
    string NonInstructionalSuppliesDescr,
    decimal SMOther,
    string SMOtherDescr,
    decimal SupervisoryStaff,
    string SupervisoryStaffDescr,
    decimal InstructionalStaff,
    string InstructionalStaffDescr,
    decimal TravelOther,
    string TraveOtherDescr,
    decimal Advertising,
    string AdvertisingDescr,
    decimal EquipmentRental,
    string EquipmentRentalDescr,
    decimal MaintenanceRepairs,
    string MaintenanceRepairsDescr,
    decimal MembershipSubscriptions,
    string MembershipSubscriptionsDescr,
    decimal PrintingReproduction,
    string PrintingReproductionDescr,
    decimal StaffTraining,
    string StaffTrainingDescr,
    decimal RentalofSpace,
    string RentalofSpaceDescr,
    decimal TelephoneUtilities,
    string TelephoneUtilitiesDescr,
    decimal DirectServiceTransportation,
    string DirectServiceTransportationDescr,
    decimal OCOther,
    string OCOtherDescr,
    decimal ProfessionalDevelopOpportunities,
    string ProfessionalDevelopOpportunitiesDescr,
    decimal ApplicationFees,
    string ApplicationFeesDescr,
    decimal CEUCourses,
    string CEUCoursesDescr,
    decimal CollegeCourses,
    string CollegeCoursesDescr,
    decimal CBOther,
    string CBOtherDescr,
    decimal IndirectPercent,
    decimal IndirectCosts,
    decimal InstructionalEquipment,
    string InstructionalEquipmentDescr,
    decimal NoninstructionalEquipment,
    string NoninstructionalEquipmentDescr,
    decimal EqOther,
    string EqOtherDescr,
    decimal SubContractsProgramCoordination,
    string SubContractsProgramCoordinationDescr,
    decimal SubContractsIndividual,
    string SubContractsIndividualDescr,
    decimal SupervisorDirectorColD,
    decimal ProjectCoordinatorColD,
    decimal StipendColD,
    decimal OtherColD,
    decimal AdvisorColD,
    decimal ClinicianColD,
    decimal CoordinatorColD,
    decimal EducatorInstructorColD,
    decimal HomeVisitorColD,
    decimal SpecialistColD,
    decimal IPSStipendColD,
    decimal IPSOtherColD,
    decimal AideParaprofessionalColD,
    decimal SecretaryBookkeeperColD,
    decimal SSOtherColD,
    decimal SSStipendColD,
    decimal FringeBenefitsColD,
    decimal CSAdvisorColD,
    decimal CSClinicianColD,
    decimal CSConsultantColD,
    decimal CSEducatorInstructorColD,
    decimal CSHomeVisitorColD,
    decimal CSSpecialistColD,
    decimal CSSpeakerColD,
    decimal CSSubstituteColD,
    decimal CSStipendColD,
    decimal CSOtherColD,
    decimal EducationalInstructionalMaterialsColD,
    decimal InstructionalTechnologySoftwareColD,
    decimal NonInstructionalSuppliesColD,
    decimal SMOtherColD,
    decimal SupervisoryStaffColD,
    decimal InstructionalStaffColD,
    decimal TravelOtherColD,
    decimal AdvertisingColD,
    decimal EquipmentRentalColD,
    decimal MaintenanceRepairsColD,
    decimal MembershipSubscriptionsColD,
    decimal PrintingReproductionColD,
    decimal StaffTrainingColD,
    decimal RentalofSpaceColD,
    decimal TelephoneUtilitiesColD,
    decimal DirectServiceTransportationColD,
    decimal OCOtherColD,
    decimal ProfessionalDevelopOpportunitiesColD,
    decimal ApplicationFeesColD,
    decimal CEUCoursesColD,
    decimal CollegeCoursesColD,
    decimal CBOtherColD,
    decimal InstructionalEquipmentColD,
    decimal NoninstructionalEquipmentColD,
    decimal EqOtherColD,
    decimal SubContractsProgramCoordinationColD,
    decimal SubContractsIndividualColD,
    decimal SupervisorDirectorColF,
    decimal ProjectCoordinatorColF,
    decimal StipendColF,
    decimal OtherColF,
    decimal AdvisorColF,
    decimal ClinicianColF,
    decimal CoordinatorColF,
    decimal EducatorInstructorColF,
    decimal HomeVisitorColF,
    decimal SpecialistColF,
    decimal IPSStipendColF,
    decimal IPSOtherColF,
    decimal AideParaprofessionalColF,
    decimal SecretaryBookkeeperColF,
    decimal SSStipendColF,
    decimal SSOtherColF,
    decimal FringeBenefitsColF,
    decimal CSAdvisorColF,
    decimal CSClinicianColF,
    decimal CSConsultantColF,
    decimal CSEducatorInstructorColF,
    decimal CSHomeVisitorColF,
    decimal CSSpecialistColF,
    decimal CSSpeakerColF,
    decimal CSSubstituteColF,
    decimal CSStipendColF,
    decimal CSOtherColF,
    decimal EducationalInstructionalMaterialsColF,
    decimal InstructionalTechnologySoftwareColF,
    decimal NonInstructionalSuppliesColF,
    decimal SMOtherColF,
    decimal SupervisoryStaffColF,
    decimal InstructionalStaffColF,
    decimal TravelOtherColF,
    decimal AdvertisingColF,
    decimal EquipmentRentalColF,
    decimal MaintenanceRepairsColF,
    decimal MembershipSubscriptionsColF,
    decimal PrintingReproductionColF,
    decimal StaffTrainingColF,
    decimal RentalofSpaceColF,
    decimal TelephoneUtilitiesColF,
    decimal DirectServiceTransportationColF,
    decimal OCOtherColF,
    decimal ProfessionalDevelopOpportunitiesColF,
    decimal ApplicationFeesColF,
    decimal CEUCoursesColF,
    decimal CollegeCoursesColF,
    decimal CBOtherColF,
    decimal InstructionalEquipmentColF,
    decimal NoninstructionalEquipmentColF,
    decimal EqOtherColF,
    decimal SubContractsProgramCoordinationColF,
    decimal SubContractsIndividualColF,
    int SupervisorDirectorNumofStaff,
    decimal SupervisorDirectorFTE,
    int ProjectCoordinatorNumofStaff,
    decimal ProjectCoordinatorFTE,
    int OtherNumofStaff,
    decimal OtherFTE,
    int AdvisorNumofStaff,
    decimal AdvisorFTE,
    int ClinicianNumofStaff,
    decimal ClinicianFTE,
    int CoordinatorNumofStaff,
    decimal CoordinatorFTE,
    int EducatorInstructorNumofStaff,
    decimal EducatorInstructorFTE,
    int HomeVisitorNumofStaff,
    decimal HomeVisitorFTE,
    int SpecialistNumofStaff,
    decimal SpecialistFTE,
    int IPSOtherNumofStaff,
    decimal IPSOtherFTE,
    int AideParaprofessionalNumofStaff,
    decimal AideParaprofessionalFTE,
    int SecretaryBookkeeperNumofStaff,
    decimal SecretaryBookkeeperFTE,
    int SSOtherNumofStaff,
    decimal SSOtherFTE,
    int FringeBenefitsNumofStaff,
    decimal FringeBenefitsFTE,
    decimal CSAdvisorRate,
    string CSAdvisorHrWkDayFlat,
    decimal CSClinicianRate,
    string CSClinicianHrWkDayFlat,
    decimal CSConsultantRate,
    string CSConsultantHrWkDayFlat,
    decimal CSEducatorInstructorRate,
    string CSEducatorInstructorHrWkDayFlat,
    decimal CSHomeVisitorRate,
    string CSHomeVisitorHrWkDayFlat,
    decimal CSSpecialistRate,
    string CSSpecialistHrWkDayFlat,
    decimal CSSpeakerRate,
    string CSSpeakerHrWkDayFlat,
    decimal CSSubstituteRate,
    string CSSubstituteHrWkDayFlat,
    decimal CSOtherRate,
    string CSOtherHrWkDayFlat,
    decimal SupervisoryStaffMileageRate,
    decimal InstructionalStaffMileageRate,
    decimal TravelOtherMileageRate,
    decimal SubContractsIndividualRate,
    string SubContractsIndividualHrWkDayFlat,
    decimal GrantTotal
    )
    {
        SqlParameter[] pArray = new SqlParameter[263];

        pArray[0] = new SqlParameter("@BudgetNarrativeID ", SqlDbType.Int);
        pArray[0].Value = BudgetNarrativeID;
        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;
        pArray[2] = new SqlParameter("@SubContractorsName", SqlDbType.VarChar, 200);
        pArray[2].Value = SubContractorsName;
        pArray[3] = new SqlParameter("@SupervisorDirector", SqlDbType.Int);
        pArray[3].Value = SupervisorDirector;
        pArray[4] = new SqlParameter("@SupervisorDirectorDescr", SqlDbType.Text);
        pArray[4].Value = SupervisorDirectorDescr;
        pArray[5] = new SqlParameter("@ProjectCoordinator", SqlDbType.Int);
        pArray[5].Value = ProjectCoordinator;
        pArray[6] = new SqlParameter("@ProjectCoordinatorDescr", SqlDbType.Text);
        pArray[6].Value = ProjectCoordinatorDescr;
        pArray[7] = new SqlParameter("@Stipend", SqlDbType.Int);
        pArray[7].Value = Stipend;
        pArray[8] = new SqlParameter("@StipendDescr", SqlDbType.Text);
        pArray[8].Value = StipendDescr;
        pArray[9] = new SqlParameter("@Other", SqlDbType.Int);
        pArray[9].Value = Other;
        pArray[10] = new SqlParameter("@OtherDescr", SqlDbType.Text);
        pArray[10].Value = OtherDescr;
        pArray[11] = new SqlParameter("@Advisor", SqlDbType.Int);
        pArray[11].Value = Advisor;
        pArray[12] = new SqlParameter("@AdvisorDescr", SqlDbType.Text);
        pArray[12].Value = AdvisorDescr;
        pArray[13] = new SqlParameter("@Clinician", SqlDbType.Int);
        pArray[13].Value = Clinician;
        pArray[14] = new SqlParameter("@ClinicianDescr", SqlDbType.Text);
        pArray[14].Value = ClinicianDescr;
        pArray[15] = new SqlParameter("@Coordinator", SqlDbType.Int);
        pArray[15].Value = Coordinator;
        pArray[16] = new SqlParameter("@CoordinatorDescr", SqlDbType.Text);
        pArray[16].Value = CoordinatorDescr;
        pArray[17] = new SqlParameter("@EducatorInstructor", SqlDbType.Int);
        pArray[17].Value = EducatorInstructor;
        pArray[18] = new SqlParameter("@EducatorInstructorDescr", SqlDbType.Text);
        pArray[18].Value = EducatorInstructorDescr;
        pArray[19] = new SqlParameter("@HomeVisitor", SqlDbType.Int);
        pArray[19].Value = HomeVisitor;
        pArray[20] = new SqlParameter("@HomeVisitorDescr", SqlDbType.Text);
        pArray[20].Value = HomeVisitorDescr;
        pArray[21] = new SqlParameter("@Specialist", SqlDbType.Int);
        pArray[21].Value = Specialist;
        pArray[22] = new SqlParameter("@SpecialistDescr", SqlDbType.Text);
        pArray[22].Value = SpecialistDescr;
        pArray[23] = new SqlParameter("@IPSStipend", SqlDbType.Int);
        pArray[23].Value = IPSStipend;
        pArray[24] = new SqlParameter("@IPSStipendDescr", SqlDbType.Text);
        pArray[24].Value = IPSStipendDescr;
        pArray[25] = new SqlParameter("@IPSOther", SqlDbType.Int);
        pArray[25].Value = IPSOther;
        pArray[26] = new SqlParameter("@IPSOtherDescr", SqlDbType.Text);
        pArray[26].Value = IPSOtherDescr;
        pArray[27] = new SqlParameter("@AideParaprofessional", SqlDbType.Int);
        pArray[27].Value = AideParaprofessional;
        pArray[28] = new SqlParameter("@AideParaprofessionalDescr", SqlDbType.Text);
        pArray[28].Value = AideParaprofessionalDescr;
        pArray[29] = new SqlParameter("@SecretaryBookkeeper", SqlDbType.Int);
        pArray[29].Value = SecretaryBookkeeper;
        pArray[30] = new SqlParameter("@SecretaryBookkeeperDescr", SqlDbType.Text);
        pArray[30].Value = SecretaryBookkeeperDescr;
        pArray[31] = new SqlParameter("@SSStipend", SqlDbType.Int);
        pArray[31].Value = SSStipend;
        pArray[32] = new SqlParameter("@SSStipendDescr", SqlDbType.Text);
        pArray[32].Value = SSStipendDescr;
        pArray[33] = new SqlParameter("@SSOther", SqlDbType.Int);
        pArray[33].Value = SSOther;
        pArray[34] = new SqlParameter("@SSOtherDescr", SqlDbType.Text);
        pArray[34].Value = SSOtherDescr;
        pArray[35] = new SqlParameter("@FringeBenefits", SqlDbType.Int);
        pArray[35].Value = FringeBenefits;
        pArray[36] = new SqlParameter("@FringeBenefitsDescr", SqlDbType.Text);
        pArray[36].Value = FringeBenefitsDescr;
        pArray[37] = new SqlParameter("@CSAdvisor", SqlDbType.Int);
        pArray[37].Value = CSAdvisor;
        pArray[38] = new SqlParameter("@CSAdvisorDescr", SqlDbType.Text);
        pArray[38].Value = CSAdvisorDescr;
        pArray[39] = new SqlParameter("@CSClinician", SqlDbType.Int);
        pArray[39].Value = CSClinician;
        pArray[40] = new SqlParameter("@CSClinicianDescr", SqlDbType.Text);
        pArray[40].Value = CSClinicianDescr;
        pArray[41] = new SqlParameter("@CSConsultant", SqlDbType.Int);
        pArray[41].Value = CSConsultant;
        pArray[42] = new SqlParameter("@CSConsultantDescr", SqlDbType.Text);
        pArray[42].Value = CSConsultantDescr;
        pArray[43] = new SqlParameter("@CSEducatorInstructor", SqlDbType.Int);
        pArray[43].Value = CSEducatorInstructor;
        pArray[44] = new SqlParameter("@CSEducatorInstructorDescr", SqlDbType.Text);
        pArray[44].Value = CSEducatorInstructorDescr;
        pArray[45] = new SqlParameter("@CSHomeVisitor", SqlDbType.Int);
        pArray[45].Value = CSHomeVisitor;
        pArray[46] = new SqlParameter("@CSHomeVisitorDescr", SqlDbType.Text);
        pArray[46].Value = CSHomeVisitorDescr;
        pArray[47] = new SqlParameter("@CSSpecialist", SqlDbType.Int);
        pArray[47].Value = CSSpecialist;
        pArray[48] = new SqlParameter("@CSSpecialistDescr", SqlDbType.Text);
        pArray[48].Value = CSSpecialistDescr;
        pArray[49] = new SqlParameter("@CSSpeaker", SqlDbType.Int);
        pArray[49].Value = CSSpeaker;
        pArray[50] = new SqlParameter("@CSSpeakerDescr", SqlDbType.Text);
        pArray[50].Value = CSSpeakerDescr;
        pArray[51] = new SqlParameter("@CSSubstitute", SqlDbType.Int);
        pArray[51].Value = CSSubstitute;
        pArray[52] = new SqlParameter("@CSSubstituteDescr", SqlDbType.Text);
        pArray[52].Value = CSSubstituteDescr;
        pArray[53] = new SqlParameter("@CSStipend", SqlDbType.Int);
        pArray[53].Value = CSStipend;
        pArray[54] = new SqlParameter("@CSStipendDescr", SqlDbType.Text);
        pArray[54].Value = CSStipendDescr;
        pArray[55] = new SqlParameter("@CSOther", SqlDbType.Int);
        pArray[55].Value = CSOther;
        pArray[56] = new SqlParameter("@CSOtherDescr", SqlDbType.Text);
        pArray[56].Value = CSOtherDescr;
        pArray[57] = new SqlParameter("@EducationalInstructionalMaterials", SqlDbType.Int);
        pArray[57].Value = EducationalInstructionalMaterials;
        pArray[58] = new SqlParameter("@EducationalInstructionalMaterialsDescr", SqlDbType.Text);
        pArray[58].Value = EducationalInstructionalMaterialsDescr;
        pArray[59] = new SqlParameter("@InstructionalTechnologySoftware", SqlDbType.Int);
        pArray[59].Value = InstructionalTechnologySoftware;
        pArray[60] = new SqlParameter("@InstructionalTechnologySoftwareDescr", SqlDbType.Text);
        pArray[60].Value = InstructionalTechnologySoftwareDescr;
        pArray[61] = new SqlParameter("@NonInstructionalSupplies", SqlDbType.Int);
        pArray[61].Value = NonInstructionalSupplies;
        pArray[62] = new SqlParameter("@NonInstructionalSuppliesDescr", SqlDbType.Text);
        pArray[62].Value = NonInstructionalSuppliesDescr;
        pArray[63] = new SqlParameter("@SMOther", SqlDbType.Int);
        pArray[63].Value = SMOther;
        pArray[64] = new SqlParameter("@SMOtherDescr", SqlDbType.Text);
        pArray[64].Value = SMOtherDescr;
        pArray[65] = new SqlParameter("@SupervisoryStaff", SqlDbType.Int);
        pArray[65].Value = SupervisoryStaff;
        pArray[66] = new SqlParameter("@SupervisoryStaffDescr", SqlDbType.Text);
        pArray[66].Value = SupervisoryStaffDescr;
        pArray[67] = new SqlParameter("@InstructionalStaff", SqlDbType.Int);
        pArray[67].Value = InstructionalStaff;
        pArray[68] = new SqlParameter("@InstructionalStaffDescr", SqlDbType.Text);
        pArray[68].Value = InstructionalStaffDescr;
        pArray[69] = new SqlParameter("@TravelOther", SqlDbType.Int);
        pArray[69].Value = TravelOther;
        pArray[70] = new SqlParameter("@TraveOtherDescr", SqlDbType.Text);
        pArray[70].Value = TraveOtherDescr;
        pArray[71] = new SqlParameter("@Advertising", SqlDbType.Int);
        pArray[71].Value = Advertising;
        pArray[72] = new SqlParameter("@AdvertisingDescr", SqlDbType.Text);
        pArray[72].Value = AdvertisingDescr;
        pArray[73] = new SqlParameter("@EquipmentRental", SqlDbType.Int);
        pArray[73].Value = EquipmentRental;
        pArray[74] = new SqlParameter("@EquipmentRentalDescr", SqlDbType.Text);
        pArray[74].Value = EquipmentRentalDescr;
        pArray[75] = new SqlParameter("@MaintenanceRepairs", SqlDbType.Int);
        pArray[75].Value = MaintenanceRepairs;
        pArray[76] = new SqlParameter("@MaintenanceRepairsDescr", SqlDbType.Text);
        pArray[76].Value = MaintenanceRepairsDescr;
        pArray[77] = new SqlParameter("@MembershipSubscriptions", SqlDbType.Int);
        pArray[77].Value = MembershipSubscriptions;
        pArray[78] = new SqlParameter("@MembershipSubscriptionsDescr", SqlDbType.Text);
        pArray[78].Value = MembershipSubscriptionsDescr;
        pArray[79] = new SqlParameter("@PrintingReproduction", SqlDbType.Int);
        pArray[79].Value = PrintingReproduction;
        pArray[80] = new SqlParameter("@PrintingReproductionDescr", SqlDbType.Text);
        pArray[80].Value = PrintingReproductionDescr;
        pArray[81] = new SqlParameter("@StaffTraining", SqlDbType.Int);
        pArray[81].Value = StaffTraining;
        pArray[82] = new SqlParameter("@StaffTrainingDescr", SqlDbType.Text);
        pArray[82].Value = StaffTrainingDescr;
        pArray[83] = new SqlParameter("@RentalofSpace", SqlDbType.Int);
        pArray[83].Value = RentalofSpace;
        pArray[84] = new SqlParameter("@RentalofSpaceDescr", SqlDbType.Text);
        pArray[84].Value = RentalofSpaceDescr;
        pArray[85] = new SqlParameter("@TelephoneUtilities", SqlDbType.Int);
        pArray[85].Value = TelephoneUtilities;
        pArray[86] = new SqlParameter("@TelephoneUtilitiesDescr", SqlDbType.Text);
        pArray[86].Value = TelephoneUtilitiesDescr;
        pArray[87] = new SqlParameter("@DirectServiceTransportation", SqlDbType.Int);
        pArray[87].Value = DirectServiceTransportation;
        pArray[88] = new SqlParameter("@DirectServiceTransportationDescr", SqlDbType.Text);
        pArray[88].Value = DirectServiceTransportationDescr;
        pArray[89] = new SqlParameter("@OCOther", SqlDbType.Int);
        pArray[89].Value = OCOther;
        pArray[90] = new SqlParameter("@OCOtherDescr", SqlDbType.Text);
        pArray[90].Value = OCOtherDescr;
        pArray[91] = new SqlParameter("@ProfessionalDevelopOpportunities", SqlDbType.Int);
        pArray[91].Value = ProfessionalDevelopOpportunities;
        pArray[92] = new SqlParameter("@ProfessionalDevelopOpportunitiesDescr", SqlDbType.Text);
        pArray[92].Value = ProfessionalDevelopOpportunitiesDescr;
        pArray[93] = new SqlParameter("@ApplicationFees", SqlDbType.Int);
        pArray[93].Value = ApplicationFees;
        pArray[94] = new SqlParameter("@ApplicationFeesDescr", SqlDbType.Text);
        pArray[94].Value = ApplicationFeesDescr;
        pArray[95] = new SqlParameter("@CEUCourses", SqlDbType.Int);
        pArray[95].Value = CEUCourses;
        pArray[96] = new SqlParameter("@CEUCoursesDescr", SqlDbType.Text);
        pArray[96].Value = CEUCoursesDescr;
        pArray[97] = new SqlParameter("@CollegeCourses", SqlDbType.Int);
        pArray[97].Value = CollegeCourses;
        pArray[98] = new SqlParameter("@CollegeCoursesDescr", SqlDbType.Text);
        pArray[98].Value = CollegeCoursesDescr;
        pArray[99] = new SqlParameter("@CBOther", SqlDbType.Int);
        pArray[99].Value = CBOther;
        pArray[100] = new SqlParameter("@CBOtherDescr", SqlDbType.Text);
        pArray[100].Value = CBOtherDescr;
        pArray[101] = new SqlParameter("@IndirectPercent", SqlDbType.Decimal);
        pArray[101].Value = IndirectPercent;
        pArray[102] = new SqlParameter("@IndirectCosts", SqlDbType.Int);
        pArray[102].Value = IndirectCosts;
        pArray[103] = new SqlParameter("@InstructionalEquipment", SqlDbType.Int);
        pArray[103].Value = InstructionalEquipment;
        pArray[104] = new SqlParameter("@InstructionalEquipmentDescr", SqlDbType.Text);
        pArray[104].Value = InstructionalEquipmentDescr;
        pArray[105] = new SqlParameter("@NoninstructionalEquipment", SqlDbType.Int);
        pArray[105].Value = NoninstructionalEquipment;
        pArray[106] = new SqlParameter("@NoninstructionalEquipmentDescr", SqlDbType.Text);
        pArray[106].Value = NoninstructionalEquipmentDescr;
        pArray[107] = new SqlParameter("@EqOther", SqlDbType.Int);
        pArray[107].Value = EqOther;
        pArray[108] = new SqlParameter("@EqOtherDescr", SqlDbType.Text);
        pArray[108].Value = EqOtherDescr;
        pArray[109] = new SqlParameter("@SupervisorDirectorColD", SqlDbType.Int);
        pArray[109].Value = SupervisorDirectorColD;
        pArray[110] = new SqlParameter("@ProjectCoordinatorColD", SqlDbType.Int);
        pArray[110].Value = ProjectCoordinatorColD;
        pArray[111] = new SqlParameter("@StipendColD", SqlDbType.Int);
        pArray[111].Value = StipendColD;
        pArray[112] = new SqlParameter("@OtherColD", SqlDbType.Int);
        pArray[112].Value = OtherColD;
        pArray[113] = new SqlParameter("@AdvisorColD", SqlDbType.Int);
        pArray[113].Value = AdvisorColD;
        pArray[114] = new SqlParameter("@ClinicianColD", SqlDbType.Int);
        pArray[114].Value = ClinicianColD;
        pArray[115] = new SqlParameter("@CoordinatorColD", SqlDbType.Int);
        pArray[115].Value = CoordinatorColD;
        pArray[116] = new SqlParameter("@EducatorInstructorColD", SqlDbType.Int);
        pArray[116].Value = EducatorInstructorColD;
        pArray[117] = new SqlParameter("@HomeVisitorColD", SqlDbType.Int);
        pArray[117].Value = HomeVisitorColD;
        pArray[118] = new SqlParameter("@SpecialistColD", SqlDbType.Int);
        pArray[118].Value = SpecialistColD;
        pArray[119] = new SqlParameter("@IPSStipendColD", SqlDbType.Int);
        pArray[119].Value = IPSStipendColD;
        pArray[120] = new SqlParameter("@IPSOtherColD", SqlDbType.Int);
        pArray[120].Value = IPSOtherColD;
        pArray[121] = new SqlParameter("@AideParaprofessionalColD", SqlDbType.Int);
        pArray[121].Value = AideParaprofessionalColD;
        pArray[122] = new SqlParameter("@SecretaryBookkeeperColD", SqlDbType.Int);
        pArray[122].Value = SecretaryBookkeeperColD;
        pArray[123] = new SqlParameter("@SSOtherColD", SqlDbType.Int);
        pArray[123].Value = SSOtherColD;
        pArray[124] = new SqlParameter("@SSStipendColD", SqlDbType.Int);
        pArray[124].Value = SSStipendColD;
        pArray[125] = new SqlParameter("@FringeBenefitsColD", SqlDbType.Int);
        pArray[125].Value = FringeBenefitsColD;
        pArray[126] = new SqlParameter("@CSAdvisorColD", SqlDbType.Int);
        pArray[126].Value = CSAdvisorColD;
        pArray[127] = new SqlParameter("@CSClinicianColD", SqlDbType.Int);
        pArray[127].Value = CSClinicianColD;
        pArray[128] = new SqlParameter("@CSConsultantColD", SqlDbType.Int);
        pArray[128].Value = CSConsultantColD;
        pArray[129] = new SqlParameter("@CSEducatorInstructorColD", SqlDbType.Int);
        pArray[129].Value = CSEducatorInstructorColD;
        pArray[130] = new SqlParameter("@CSHomeVisitorColD", SqlDbType.Int);
        pArray[130].Value = CSHomeVisitorColD;
        pArray[131] = new SqlParameter("@CSSpecialistColD", SqlDbType.Int);
        pArray[131].Value = CSSpecialistColD;
        pArray[132] = new SqlParameter("@CSSpeakerColD", SqlDbType.Int);
        pArray[132].Value = CSSpeakerColD;
        pArray[133] = new SqlParameter("@CSSubstituteColD", SqlDbType.Int);
        pArray[133].Value = CSSubstituteColD;
        pArray[134] = new SqlParameter("@CSStipendColD", SqlDbType.Int);
        pArray[134].Value = CSStipendColD;
        pArray[135] = new SqlParameter("@CSOtherColD", SqlDbType.Int);
        pArray[135].Value = CSOtherColD;
        pArray[136] = new SqlParameter("@EducationalInstructionalMaterialsColD", SqlDbType.Int);
        pArray[136].Value = EducationalInstructionalMaterialsColD;
        pArray[137] = new SqlParameter("@InstructionalTechnologySoftwareColD", SqlDbType.Int);
        pArray[137].Value = InstructionalTechnologySoftwareColD;
        pArray[138] = new SqlParameter("@NonInstructionalSuppliesColD", SqlDbType.Int);
        pArray[138].Value = NonInstructionalSuppliesColD;
        pArray[139] = new SqlParameter("@SMOtherColD", SqlDbType.Int);
        pArray[139].Value = SMOtherColD;
        pArray[140] = new SqlParameter("@SupervisoryStaffColD", SqlDbType.Int);
        pArray[140].Value = SupervisoryStaffColD;
        pArray[141] = new SqlParameter("@InstructionalStaffColD", SqlDbType.Int);
        pArray[141].Value = InstructionalStaffColD;
        pArray[142] = new SqlParameter("@TravelOtherColD", SqlDbType.Int);
        pArray[142].Value = TravelOtherColD;
        pArray[143] = new SqlParameter("@AdvertisingColD", SqlDbType.Int);
        pArray[143].Value = AdvertisingColD;
        pArray[144] = new SqlParameter("@EquipmentRentalColD", SqlDbType.Int);
        pArray[144].Value = EquipmentRentalColD;
        pArray[145] = new SqlParameter("@MaintenanceRepairsColD", SqlDbType.Int);
        pArray[145].Value = MaintenanceRepairsColD;
        pArray[146] = new SqlParameter("@MembershipSubscriptionsColD", SqlDbType.Int);
        pArray[146].Value = MembershipSubscriptionsColD;
        pArray[147] = new SqlParameter("@PrintingReproductionColD", SqlDbType.Int);
        pArray[147].Value = PrintingReproductionColD;
        pArray[148] = new SqlParameter("@StaffTrainingColD", SqlDbType.Int);
        pArray[148].Value = StaffTrainingColD;
        pArray[149] = new SqlParameter("@RentalofSpaceColD", SqlDbType.Int);
        pArray[149].Value = RentalofSpaceColD;
        pArray[150] = new SqlParameter("@TelephoneUtilitiesColD", SqlDbType.Int);
        pArray[150].Value = TelephoneUtilitiesColD;
        pArray[151] = new SqlParameter("@DirectServiceTransportationColD", SqlDbType.Int);
        pArray[151].Value = DirectServiceTransportationColD;
        pArray[152] = new SqlParameter("@OCOtherColD", SqlDbType.Int);
        pArray[152].Value = OCOtherColD;
        pArray[153] = new SqlParameter("@ProfessionalDevelopOpportunitiesColD", SqlDbType.Int);
        pArray[153].Value = ProfessionalDevelopOpportunitiesColD;
        pArray[154] = new SqlParameter("@ApplicationFeesColD", SqlDbType.Int);
        pArray[154].Value = ApplicationFeesColD;
        pArray[155] = new SqlParameter("@CEUCoursesColD", SqlDbType.Int);
        pArray[155].Value = CEUCoursesColD;
        pArray[156] = new SqlParameter("@CollegeCoursesColD", SqlDbType.Int);
        pArray[156].Value = CollegeCoursesColD;
        pArray[157] = new SqlParameter("@CBOtherColD", SqlDbType.Int);
        pArray[157].Value = CBOtherColD;
        pArray[158] = new SqlParameter("@InstructionalEquipmentColD", SqlDbType.Int);
        pArray[158].Value = InstructionalEquipmentColD;
        pArray[159] = new SqlParameter("@NoninstructionalEquipmentColD", SqlDbType.Int);
        pArray[159].Value = NoninstructionalEquipmentColD;
        pArray[160] = new SqlParameter("@EqOtherColD", SqlDbType.Int);
        pArray[160].Value = EqOtherColD;
        pArray[161] = new SqlParameter("@SupervisorDirectorColF", SqlDbType.Int);
        pArray[161].Value = SupervisorDirectorColF;
        pArray[162] = new SqlParameter("@ProjectCoordinatorColF", SqlDbType.Int);
        pArray[162].Value = ProjectCoordinatorColF;
        pArray[163] = new SqlParameter("@StipendColF", SqlDbType.Int);
        pArray[163].Value = StipendColF;
        pArray[164] = new SqlParameter("@OtherColF", SqlDbType.Int);
        pArray[164].Value = OtherColF;
        pArray[165] = new SqlParameter("@AdvisorColF", SqlDbType.Int);
        pArray[165].Value = AdvisorColF;
        pArray[166] = new SqlParameter("@ClinicianColF", SqlDbType.Int);
        pArray[166].Value = ClinicianColF;
        pArray[167] = new SqlParameter("@CoordinatorColF", SqlDbType.Int);
        pArray[167].Value = CoordinatorColF;
        pArray[168] = new SqlParameter("@EducatorInstructorColF", SqlDbType.Int);
        pArray[168].Value = EducatorInstructorColF;
        pArray[169] = new SqlParameter("@HomeVisitorColF", SqlDbType.Int);
        pArray[169].Value = HomeVisitorColF;
        pArray[170] = new SqlParameter("@SpecialistColF", SqlDbType.Int);
        pArray[170].Value = SpecialistColF;
        pArray[171] = new SqlParameter("@IPSStipendColF", SqlDbType.Int);
        pArray[171].Value = IPSStipendColF;
        pArray[172] = new SqlParameter("@IPSOtherColF", SqlDbType.Int);
        pArray[172].Value = IPSOtherColF;
        pArray[173] = new SqlParameter("@AideParaprofessionalColF", SqlDbType.Int);
        pArray[173].Value = AideParaprofessionalColF;
        pArray[174] = new SqlParameter("@SecretaryBookkeeperColF", SqlDbType.Int);
        pArray[174].Value = SecretaryBookkeeperColF;
        pArray[175] = new SqlParameter("@SSStipendColF", SqlDbType.Int);
        pArray[175].Value = SSStipendColF;
        pArray[176] = new SqlParameter("@SSOtherColF", SqlDbType.Int);
        pArray[176].Value = SSOtherColF;
        pArray[177] = new SqlParameter("@FringeBenefitsColF", SqlDbType.Int);
        pArray[177].Value = FringeBenefitsColF;
        pArray[178] = new SqlParameter("@CSAdvisorColF", SqlDbType.Int);
        pArray[178].Value = CSAdvisorColF;
        pArray[179] = new SqlParameter("@CSClinicianColF", SqlDbType.Int);
        pArray[179].Value = CSClinicianColF;
        pArray[180] = new SqlParameter("@CSConsultantColF", SqlDbType.Int);
        pArray[180].Value = CSConsultantColF;
        pArray[181] = new SqlParameter("@CSEducatorInstructorColF", SqlDbType.Int);
        pArray[181].Value = CSEducatorInstructorColF;
        pArray[182] = new SqlParameter("@CSHomeVisitorColF", SqlDbType.Int);
        pArray[182].Value = CSHomeVisitorColF;
        pArray[183] = new SqlParameter("@CSSpecialistColF", SqlDbType.Int);
        pArray[183].Value = CSSpecialistColF;
        pArray[184] = new SqlParameter("@CSSpeakerColF", SqlDbType.Int);
        pArray[184].Value = CSSpeakerColF;
        pArray[185] = new SqlParameter("@CSSubstituteColF", SqlDbType.Int);
        pArray[185].Value = CSSubstituteColF;
        pArray[186] = new SqlParameter("@CSStipendColF", SqlDbType.Int);
        pArray[186].Value = CSStipendColF;
        pArray[187] = new SqlParameter("@CSOtherColF", SqlDbType.Int);
        pArray[187].Value = CSOtherColF;
        pArray[188] = new SqlParameter("@EducationalInstructionalMaterialsColF", SqlDbType.Int);
        pArray[188].Value = EducationalInstructionalMaterialsColF;
        pArray[189] = new SqlParameter("@InstructionalTechnologySoftwareColF", SqlDbType.Int);
        pArray[189].Value = InstructionalTechnologySoftwareColF;
        pArray[190] = new SqlParameter("@NonInstructionalSuppliesColF", SqlDbType.Int);
        pArray[190].Value = NonInstructionalSuppliesColF;
        pArray[191] = new SqlParameter("@SMOtherColF", SqlDbType.Int);
        pArray[191].Value = SMOtherColF;
        pArray[192] = new SqlParameter("@SupervisoryStaffColF", SqlDbType.Int);
        pArray[192].Value = SupervisoryStaffColF;
        pArray[193] = new SqlParameter("@InstructionalStaffColF", SqlDbType.Int);
        pArray[193].Value = InstructionalStaffColF;
        pArray[194] = new SqlParameter("@TravelOtherColF", SqlDbType.Int);
        pArray[194].Value = TravelOtherColF;
        pArray[195] = new SqlParameter("@AdvertisingColF", SqlDbType.Int);
        pArray[195].Value = AdvertisingColF;
        pArray[196] = new SqlParameter("@EquipmentRentalColF", SqlDbType.Int);
        pArray[196].Value = EquipmentRentalColF;
        pArray[197] = new SqlParameter("@MaintenanceRepairsColF", SqlDbType.Int);
        pArray[197].Value = MaintenanceRepairsColF;
        pArray[198] = new SqlParameter("@MembershipSubscriptionsColF", SqlDbType.Int);
        pArray[198].Value = MembershipSubscriptionsColF;
        pArray[199] = new SqlParameter("@PrintingReproductionColF", SqlDbType.Int);
        pArray[199].Value = PrintingReproductionColF;
        pArray[200] = new SqlParameter("@StaffTrainingColF", SqlDbType.Int);
        pArray[200].Value = StaffTrainingColF;
        pArray[201] = new SqlParameter("@RentalofSpaceColF", SqlDbType.Int);
        pArray[201].Value = RentalofSpaceColF;
        pArray[202] = new SqlParameter("@TelephoneUtilitiesColF", SqlDbType.Int);
        pArray[202].Value = TelephoneUtilitiesColF;
        pArray[203] = new SqlParameter("@DirectServiceTransportationColF", SqlDbType.Int);
        pArray[203].Value = DirectServiceTransportationColF;
        pArray[204] = new SqlParameter("@OCOtherColF", SqlDbType.Int);
        pArray[204].Value = OCOtherColF;
        pArray[205] = new SqlParameter("@ProfessionalDevelopOpportunitiesColF", SqlDbType.Int);
        pArray[205].Value = ProfessionalDevelopOpportunitiesColF;
        pArray[206] = new SqlParameter("@ApplicationFeesColF", SqlDbType.Int);
        pArray[206].Value = ApplicationFeesColF;
        pArray[207] = new SqlParameter("@CEUCoursesColF", SqlDbType.Int);
        pArray[207].Value = CEUCoursesColF;
        pArray[208] = new SqlParameter("@CollegeCoursesColF", SqlDbType.Int);
        pArray[208].Value = CollegeCoursesColF;
        pArray[209] = new SqlParameter("@CBOtherColF", SqlDbType.Int);
        pArray[209].Value = CBOtherColF;
        pArray[210] = new SqlParameter("@InstructionalEquipmentColF", SqlDbType.Int);
        pArray[210].Value = InstructionalEquipmentColF;
        pArray[211] = new SqlParameter("@NoninstructionalEquipmentColF", SqlDbType.Int);
        pArray[211].Value = NoninstructionalEquipmentColF;
        pArray[212] = new SqlParameter("@EqOtherColF", SqlDbType.Int);
        pArray[212].Value = EqOtherColF;
        pArray[213] = new SqlParameter("@SupervisorDirectorNumofStaff", SqlDbType.Int);
        pArray[213].Value = SupervisorDirectorNumofStaff;
        pArray[214] = new SqlParameter("@SupervisorDirectorFTE", SqlDbType.Decimal);
        pArray[214].Value = SupervisorDirectorFTE;
        pArray[215] = new SqlParameter("@ProjectCoordinatorNumofStaff", SqlDbType.Int);
        pArray[215].Value = ProjectCoordinatorNumofStaff;
        pArray[216] = new SqlParameter("@ProjectCoordinatorFTE", SqlDbType.Decimal);
        pArray[216].Value = ProjectCoordinatorFTE;
        pArray[217] = new SqlParameter("@OtherNumofStaff", SqlDbType.Int);
        pArray[217].Value = OtherNumofStaff;
        pArray[218] = new SqlParameter("@OtherFTE", SqlDbType.Decimal);
        pArray[218].Value = OtherFTE;
        pArray[219] = new SqlParameter("@AdvisorNumofStaff", SqlDbType.Int);
        pArray[219].Value = AdvisorNumofStaff;
        pArray[220] = new SqlParameter("@AdvisorFTE", SqlDbType.Decimal);
        pArray[220].Value = AdvisorFTE;
        pArray[221] = new SqlParameter("@ClinicianNumofStaff", SqlDbType.Int);
        pArray[221].Value = ClinicianNumofStaff;
        pArray[222] = new SqlParameter("@ClinicianFTE", SqlDbType.Decimal);
        pArray[222].Value = ClinicianFTE;
        pArray[223] = new SqlParameter("@CoordinatorNumofStaff", SqlDbType.Int);
        pArray[223].Value = CoordinatorNumofStaff;
        pArray[224] = new SqlParameter("@CoordinatorFTE", SqlDbType.Decimal);
        pArray[224].Value = CoordinatorFTE;
        pArray[225] = new SqlParameter("@EducatorInstructorNumofStaff", SqlDbType.Int);
        pArray[225].Value = EducatorInstructorNumofStaff;
        pArray[226] = new SqlParameter("@EducatorInstructorFTE", SqlDbType.Decimal);
        pArray[226].Value = EducatorInstructorFTE;
        pArray[227] = new SqlParameter("@HomeVisitorNumofStaff", SqlDbType.Int);
        pArray[227].Value = HomeVisitorNumofStaff;
        pArray[228] = new SqlParameter("@HomeVisitorFTE", SqlDbType.Decimal);
        pArray[228].Value = HomeVisitorFTE;
        pArray[229] = new SqlParameter("@SpecialistNumofStaff", SqlDbType.Int);
        pArray[229].Value = SpecialistNumofStaff;
        pArray[230] = new SqlParameter("@SpecialistFTE", SqlDbType.Decimal);
        pArray[230].Value = SpecialistFTE;
        pArray[231] = new SqlParameter("@IPSOtherNumofStaff", SqlDbType.Int);
        pArray[231].Value = IPSOtherNumofStaff;
        pArray[232] = new SqlParameter("@IPSOtherFTE", SqlDbType.Decimal);
        pArray[232].Value = IPSOtherFTE;
        pArray[233] = new SqlParameter("@AideParaprofessionalNumofStaff", SqlDbType.Int);
        pArray[233].Value = AideParaprofessionalNumofStaff;
        pArray[234] = new SqlParameter("@AideParaprofessionalFTE", SqlDbType.Decimal);
        pArray[234].Value = AideParaprofessionalFTE;
        pArray[235] = new SqlParameter("@SecretaryBookkeeperNumofStaff", SqlDbType.Int);
        pArray[235].Value = SecretaryBookkeeperNumofStaff;
        pArray[236] = new SqlParameter("@SecretaryBookkeeperFTE", SqlDbType.Decimal);
        pArray[236].Value = SecretaryBookkeeperFTE;
        pArray[237] = new SqlParameter("@SSOtherNumofStaff", SqlDbType.Int);
        pArray[237].Value = SSOtherNumofStaff;
        pArray[238] = new SqlParameter("@SSOtherFTE", SqlDbType.Decimal);
        pArray[238].Value = SSOtherFTE;
        pArray[239] = new SqlParameter("@FringeBenefitsNumofStaff", SqlDbType.Int);
        pArray[239].Value = FringeBenefitsNumofStaff;
        pArray[240] = new SqlParameter("@FringeBenefitsFTE", SqlDbType.Decimal);
        pArray[240].Value = FringeBenefitsFTE;
        pArray[241] = new SqlParameter("@CSAdvisorRate", SqlDbType.Decimal);
        pArray[241].Value = CSAdvisorRate;
        pArray[242] = new SqlParameter("@CSAdvisorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[242].Value = CSAdvisorHrWkDayFlat;
        pArray[243] = new SqlParameter("@CSClinicianRate", SqlDbType.Decimal);
        pArray[243].Value = CSClinicianRate;
        pArray[244] = new SqlParameter("@CSClinicianHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[244].Value = CSClinicianHrWkDayFlat;
        pArray[245] = new SqlParameter("@CSConsultantRate", SqlDbType.Decimal);
        pArray[245].Value = CSConsultantRate;
        pArray[246] = new SqlParameter("@CSConsultantHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[246].Value = CSConsultantHrWkDayFlat;
        pArray[247] = new SqlParameter("@CSEducatorInstructorRate", SqlDbType.Decimal);
        pArray[247].Value = CSEducatorInstructorRate;
        pArray[248] = new SqlParameter("@CSEducatorInstructorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[248].Value = CSEducatorInstructorHrWkDayFlat;
        pArray[249] = new SqlParameter("@CSHomeVisitorRate", SqlDbType.Decimal);
        pArray[249].Value = CSHomeVisitorRate;
        pArray[250] = new SqlParameter("@CSHomeVisitorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[250].Value = CSHomeVisitorHrWkDayFlat;
        pArray[251] = new SqlParameter("@CSSpecialistRate", SqlDbType.Decimal);
        pArray[251].Value = CSSpecialistRate;
        pArray[252] = new SqlParameter("@CSSpecialistHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[252].Value = CSSpecialistHrWkDayFlat;
        pArray[253] = new SqlParameter("@CSSpeakerRate", SqlDbType.Decimal);
        pArray[253].Value = CSSpeakerRate;
        pArray[254] = new SqlParameter("@CSSpeakerHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[254].Value = CSSpeakerHrWkDayFlat;
        pArray[255] = new SqlParameter("@CSSubstituteRate", SqlDbType.Decimal);
        pArray[255].Value = CSSubstituteRate;
        pArray[256] = new SqlParameter("@CSSubstituteHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[256].Value = CSSubstituteHrWkDayFlat;
        pArray[257] = new SqlParameter("@CSOtherRate", SqlDbType.Decimal);
        pArray[257].Value = CSOtherRate;
        pArray[258] = new SqlParameter("@CSOtherHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[258].Value = CSOtherHrWkDayFlat;
        pArray[259] = new SqlParameter("@SupervisoryStaffMileageRate", SqlDbType.Decimal);
        pArray[259].Value = SupervisoryStaffMileageRate;
        pArray[260] = new SqlParameter("@InstructionalStaffMileageRate", SqlDbType.Decimal);
        pArray[260].Value = InstructionalStaffMileageRate;
        pArray[261] = new SqlParameter("@TravelOtherMileageRate", SqlDbType.Decimal);
        pArray[261].Value = TravelOtherMileageRate;
        pArray[262] = new SqlParameter("@GrantTotal", SqlDbType.Int);
        pArray[262].Value = GrantTotal;


        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateHeadStartBudgetNarrativeSubcontractorData", pArray);
    }














    public DataSet GetUploadedFiles(int grantApplicantId, int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@grantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[1].Value = fundCode;

        pArray[2] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[2].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUploadedFiles", pArray);
    }

    public int RemoveUploadFile(int grantApplicantId, int fileUploadedType)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FileUploadedType", SqlDbType.Int);
        pArray[1].Value = fileUploadedType;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteUploadedFile", pArray);
    }

    public int SaveUploadFile(int grantApplicantId, int fileUploadedType, byte[] fileBytes, string filename, string filetype)
    {
        SqlParameter[] pArray = new SqlParameter[5];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FileUploadedType", SqlDbType.Int);
        pArray[1].Value = fileUploadedType;

        pArray[2] = new SqlParameter("@FileBytes", SqlDbType.Image);
        pArray[2].Value = fileBytes;

        pArray[3] = new SqlParameter("@Filename", SqlDbType.VarChar, 100);
        pArray[3].Value = filename;

        pArray[4] = new SqlParameter("@Filetype", SqlDbType.VarChar, 10);
        pArray[4].Value = filetype;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUploadFile", pArray);
    }

    public int SavePreschoolServiceTuition(int GrantApplicantID, int preschoolServiceTuition, int mou)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@PreschoolServiceTuition", SqlDbType.Int);
        pArray[1].Value = preschoolServiceTuition;

        pArray[2] = new SqlParameter("@MOU", SqlDbType.Int);
        pArray[2].Value = mou;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePreschoolServiceTuition", pArray);
    }

    public DataSet GetPreschoolServiceTuition(int GrantApplicantID)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetPreschoolServiceTuition", pArray);
    }

    public int UpdateProjectedDeliverablesErrorCount(int budgetNarrativeId, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[1].Value = errorCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateProjectedDeliverablesErrorCount", pArray);
    }

    public void UpdateEligibilityAmount(int grantApplicantId, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@TotalFunding", SqlDbType.Money);
        pArray[1].Value = 0;

        pArray[2] = new SqlParameter("@FiscalYear", SqlDbType.Money);
        pArray[2].Value = fiscalYear;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateEligibilityAmount", pArray);
    }

    public void UpdateEligibilityAmount(int grantApplicantId, int fiscalYear, int fundcode)
    {
        SqlParameter[] pArray = new SqlParameter[4];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@TotalFunding", SqlDbType.Money);
        pArray[1].Value = 0;

        pArray[2] = new SqlParameter("@FiscalYear", SqlDbType.Money);
        pArray[2].Value = fiscalYear;

        pArray[3] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[3].Value = fundcode;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateEligibilityAmount", pArray);
    }

    public DataSet GetUPKAgencyInfo(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUPKAgencyInfo", pArray);
    }

    public int GetUPKMaxClassroom(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspGetUPKMaxClassroom", pArray));
    }

    public DataSet GetUPKQuestionnaire(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUPKQuestionnaire", pArray);
    }

    public void SaveUPKQuestionnaire(int grantApplicantId, int isValid, SortedList<string, int> aList)
    {
        SqlParameter[] pArray = new SqlParameter[aList.Count + 2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@IsValid", SqlDbType.TinyInt);
        pArray[1].Value = isValid;

        int count = 2;
        foreach (string key in aList.Keys)
        {
            pArray[count] = new SqlParameter("@" + key, SqlDbType.TinyInt);
            pArray[count].Value = aList[key];
            count++;
        }

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUPKQuestionnaire", pArray);
    }

    public void SaveUPKPartStatus(int grantApplicantId, string part, int status)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Part", SqlDbType.Int);
        pArray[1].Value = part;

        pArray[2] = new SqlParameter("@Status", SqlDbType.TinyInt);
        pArray[2].Value = status;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUPKPartStatus", pArray);
    }

    public DataSet GetUPKPartStatus(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUPKPartStatus", pArray);
    }

    public string GetUPKEligibilityAmount(int grantApplicantId, float amountPerChild)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@AmountPerChild", SqlDbType.Float);
        pArray[1].Value = amountPerChild;

        return SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspGetUpkEligibilityAmount", pArray).ToString();
    }

    public string GetUPKEligibilityAmountPercent(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspGetUpkEligibilityAmountPercent", pArray).ToString();
    }

    public int SaveUpkProgramInformation(int GrantApplicantId
        , int? ProgramTypeId
        , bool? IsHeadStartProgram
        , bool? IsProgramLicensed
        , int? WeeksPerYearOperation
        , int? DaysPerWeekOperation
        , int? HoursPerDayOperation
        , int? UpkFundedPreschoolClassrooms
        , int? NonUpkFundedPreschoolClassrooms
        , int? PreschoolChildrenEnrolled
        , int? PreschoolChildrenProjectedEnrollment
        , int? ChildrenWithFinAssistance
        , int? ProjectedChildrenWithFinAssistance
        , int? ChildrenWithIEP
        , int? UPKChildrenWithIEP
        , string AssessmentInstrumentId
        , string AssessmentInstrumentNotes
        , int? UpkVersionId
        , string sysProviders
        , int? IsAccredited
        , int? AccreditationTypeId
        , string AccreditationNumber
        , DateTime? AccreditationExpirationDate
        , int? Children3YearOld
        , int? Children4YearOld
        , int? Children5YearOld
        , int? IsToolLicensed
        )
    {
        SqlParameter[] pArray = new SqlParameter[27];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@ProgramTypeId", SqlDbType.Int);
        pArray[1].Value = (object)ProgramTypeId ?? DBNull.Value;

        pArray[2] = new SqlParameter("@IsHeadStartProgram", SqlDbType.Bit);
        pArray[2].Value = (object)IsHeadStartProgram ?? DBNull.Value;

        pArray[3] = new SqlParameter("@IsProgramLicensed", SqlDbType.Bit);
        pArray[3].Value = (object)IsProgramLicensed ?? DBNull.Value;

        pArray[4] = new SqlParameter("@WeeksPerYearOperation", SqlDbType.Int);
        pArray[4].Value = (object)WeeksPerYearOperation ?? DBNull.Value;

        pArray[5] = new SqlParameter("@DaysPerWeekOperation", SqlDbType.Int);
        pArray[5].Value = (object)DaysPerWeekOperation ?? DBNull.Value;

        pArray[6] = new SqlParameter("@HoursPerDayOperation", SqlDbType.Int);
        pArray[6].Value = (object)HoursPerDayOperation ?? DBNull.Value;

        pArray[7] = new SqlParameter("@UpkFundedPreschoolClassrooms", SqlDbType.Int);
        pArray[7].Value = (object)UpkFundedPreschoolClassrooms ?? DBNull.Value;

        pArray[8] = new SqlParameter("@NonUpkFundedPreschoolClassrooms", SqlDbType.Int);
        pArray[8].Value = (object)NonUpkFundedPreschoolClassrooms ?? DBNull.Value;

        pArray[9] = new SqlParameter("@PreschoolChildrenEnrolled", SqlDbType.Int);
        pArray[9].Value = (object)PreschoolChildrenEnrolled ?? DBNull.Value;

        pArray[10] = new SqlParameter("@PreschoolChildrenProjectedEnrollment", SqlDbType.Int);
        pArray[10].Value = (object)PreschoolChildrenProjectedEnrollment ?? DBNull.Value;

        pArray[11] = new SqlParameter("@ChildrenWithFinAssistance", SqlDbType.Int);
        pArray[11].Value = (object)ChildrenWithFinAssistance ?? DBNull.Value;

        pArray[12] = new SqlParameter("@ProjectedChildrenWithFinAssistance", SqlDbType.Int);
        pArray[12].Value = (object)ProjectedChildrenWithFinAssistance ?? DBNull.Value;

        pArray[13] = new SqlParameter("@ChildrenWithIEP", SqlDbType.Int);
        pArray[13].Value = (object)ChildrenWithIEP ?? DBNull.Value;

        pArray[14] = new SqlParameter("@UPKChildrenWithIEP", SqlDbType.Int);
        pArray[14].Value = (object)UPKChildrenWithIEP ?? DBNull.Value;

        pArray[15] = new SqlParameter("@AssessmentInstrumentId", SqlDbType.VarChar);
        pArray[15].Value = AssessmentInstrumentId;

        pArray[16] = new SqlParameter("@AssessmentInstrumentNotes", SqlDbType.VarChar);
        pArray[16].Value = (object)AssessmentInstrumentNotes ?? DBNull.Value;

        pArray[17] = new SqlParameter("@UpkVersionId", SqlDbType.Int);
        pArray[17].Value = (object)UpkVersionId ?? DBNull.Value;

        pArray[18] = new SqlParameter("@SystemProviders", SqlDbType.VarChar);
        pArray[18].Value = sysProviders;

        pArray[19] = new SqlParameter("@IsAccredited", SqlDbType.Int);
        pArray[19].Value = (object)IsAccredited ?? DBNull.Value;

        pArray[20] = new SqlParameter("@AccreditationTypeId", SqlDbType.Int);
        pArray[20].Value = (object)AccreditationTypeId ?? DBNull.Value;

        pArray[21] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar);
        pArray[21].Value = AccreditationNumber;

        pArray[22] = new SqlParameter("@AccreditationExpirationDate", SqlDbType.DateTime);
        pArray[22].Value = (object)AccreditationExpirationDate ?? DBNull.Value;

        pArray[23] = new SqlParameter("@Children3YearOld", SqlDbType.Int);
        pArray[23].Value = (object)Children3YearOld ?? DBNull.Value;

        pArray[24] = new SqlParameter("@Children4YearOld", SqlDbType.Int);
        pArray[24].Value = (object)Children4YearOld ?? DBNull.Value;

        pArray[25] = new SqlParameter("@Children5YearOld", SqlDbType.Int);
        pArray[25].Value = (object)Children5YearOld ?? DBNull.Value;

        pArray[26] = new SqlParameter("@IsToolLicensed", SqlDbType.Int);
        pArray[26].Value = (object)IsToolLicensed ?? DBNull.Value;

        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUpkProgramInformation", pArray));
    }

    public int DeleteUpkClassroom(int upkClassroomId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@UpkClassroomId", SqlDbType.Int);
        pArray[0].Value = upkClassroomId;


        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteUpkClassroom", pArray));
    }

    public DataSet GetUpkClassrooms(int GrantUpkSystemProvidersId)
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, @"SELECT c.UpkClassroomId, c.ClassroomName, c.TotalChildren, c.PreSchoolChildren, c.Amount 
                                            FROM dbo.UpkClassroom c WHERE c.GrantUpkSystemProvidersId = " + GrantUpkSystemProvidersId.ToString());
    }

    public DataSet GetUpkClassroom(int upkClassroomId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@UpkClassroomId", SqlDbType.Int);
        pArray[0].Value = upkClassroomId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUpkClassroom", pArray);
    }

    public int SaveUpkProgramInformation(int GrantApplicantId
        , int? ProgramTypeId
        , bool? IsHeadStartProgram
        , bool? IsProgramLicensed
        , int? UpkFundedPreschoolClassrooms
        , int? NonUpkFundedPreschoolClassrooms
        , int? PreschoolChildrenEnrolled
        , int? PreschoolChildrenProjectedEnrollment
        , int? ChildrenWithFinAssistance
        , int? ProjectedChildrenWithFinAssistance
        , int? ChildrenWithIEP
        , int? UPKChildrenWithIEP
        , string AssessmentInstrumentId
        , string AssessmentInstrumentNotes
        , int? UpkVersionId
        , string sysProviders
        , int? IsAccredited
        , int? AccreditationTypeId
        , string AccreditationNumber
        , DateTime? AccreditationExpirationDate
        , int? Children3YearOld
        , int? Children4YearOld
        , int? Children5YearOld
        , int? IsToolLicensed
        , string programNumber
        , string QRISLevel
        , string GrantUpkSystemProvidersId
        , string ProgramName
        , DateTime? AccreditationEarnDate
        , int FiscalYear
        )
    {
        SqlParameter[] pArray = new SqlParameter[34];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@ProgramTypeId", SqlDbType.Int);
        pArray[1].Value = (object)ProgramTypeId ?? DBNull.Value;

        pArray[2] = new SqlParameter("@IsHeadStartProgram", SqlDbType.Bit);
        pArray[2].Value = (object)IsHeadStartProgram ?? DBNull.Value;

        pArray[3] = new SqlParameter("@IsProgramLicensed", SqlDbType.Bit);
        pArray[3].Value = (object)IsProgramLicensed ?? DBNull.Value;

        pArray[7] = new SqlParameter("@UpkFundedPreschoolClassrooms", SqlDbType.Int);
        pArray[7].Value = (object)UpkFundedPreschoolClassrooms ?? DBNull.Value;

        pArray[8] = new SqlParameter("@NonUpkFundedPreschoolClassrooms", SqlDbType.Int);
        pArray[8].Value = (object)NonUpkFundedPreschoolClassrooms ?? DBNull.Value;

        pArray[9] = new SqlParameter("@PreschoolChildrenEnrolled", SqlDbType.Int);
        pArray[9].Value = (object)PreschoolChildrenEnrolled ?? DBNull.Value;

        pArray[10] = new SqlParameter("@PreschoolChildrenProjectedEnrollment", SqlDbType.Int);
        pArray[10].Value = (object)PreschoolChildrenProjectedEnrollment ?? DBNull.Value;

        pArray[11] = new SqlParameter("@ChildrenWithFinAssistance", SqlDbType.Int);
        pArray[11].Value = (object)ChildrenWithFinAssistance ?? DBNull.Value;

        pArray[12] = new SqlParameter("@ProjectedChildrenWithFinAssistance", SqlDbType.Int);
        pArray[12].Value = (object)ProjectedChildrenWithFinAssistance ?? DBNull.Value;

        pArray[13] = new SqlParameter("@ChildrenWithIEP", SqlDbType.Int);
        pArray[13].Value = (object)ChildrenWithIEP ?? DBNull.Value;

        pArray[14] = new SqlParameter("@UPKChildrenWithIEP", SqlDbType.Int);
        pArray[14].Value = (object)UPKChildrenWithIEP ?? DBNull.Value;

        pArray[15] = new SqlParameter("@AssessmentInstrumentId", SqlDbType.VarChar);
        pArray[15].Value = AssessmentInstrumentId;

        pArray[16] = new SqlParameter("@AssessmentInstrumentNotes", SqlDbType.VarChar);
        pArray[16].Value = (object)AssessmentInstrumentNotes ?? DBNull.Value;

        pArray[17] = new SqlParameter("@UpkVersionId", SqlDbType.Int);
        pArray[17].Value = (object)UpkVersionId ?? DBNull.Value;

        pArray[18] = new SqlParameter("@SystemProviders", SqlDbType.VarChar);
        pArray[18].Value = sysProviders;

        pArray[19] = new SqlParameter("@IsAccredited", SqlDbType.Int);
        pArray[19].Value = (object)IsAccredited ?? DBNull.Value;

        pArray[20] = new SqlParameter("@AccreditationTypeId", SqlDbType.Int);
        pArray[20].Value = (object)AccreditationTypeId ?? DBNull.Value;

        pArray[21] = new SqlParameter("@AccreditationNumber", SqlDbType.VarChar);
        pArray[21].Value = AccreditationNumber;

        pArray[22] = new SqlParameter("@AccreditationExpirationDate", SqlDbType.DateTime);
        pArray[22].Value = (object)AccreditationExpirationDate ?? DBNull.Value;

        pArray[23] = new SqlParameter("@Children3YearOld", SqlDbType.Int);
        pArray[23].Value = (object)Children3YearOld ?? DBNull.Value;

        pArray[24] = new SqlParameter("@Children4YearOld", SqlDbType.Int);
        pArray[24].Value = (object)Children4YearOld ?? DBNull.Value;

        pArray[25] = new SqlParameter("@Children5YearOld", SqlDbType.Int);
        pArray[25].Value = (object)Children5YearOld ?? DBNull.Value;

        pArray[26] = new SqlParameter("@IsToolLicensed", SqlDbType.Int);
        pArray[26].Value = (object)IsToolLicensed ?? DBNull.Value;

        pArray[27] = new SqlParameter("@ProgramNumber", SqlDbType.Int);
        pArray[27].Value = programNumber;

        pArray[28] = new SqlParameter("@QRISLevel", SqlDbType.Int);
        pArray[28].Value = QRISLevel;

        pArray[29] = new SqlParameter("@GrantUpkSystemProvidersId", SqlDbType.Int);
        pArray[29].Value = GrantUpkSystemProvidersId;
        pArray[29].Direction = ParameterDirection.InputOutput;

        pArray[30] = new SqlParameter("@ProgramName", SqlDbType.VarChar);
        pArray[30].Value = ProgramName;

        pArray[31] = new SqlParameter("@AccreditationEarnDate", SqlDbType.DateTime);
        pArray[31].Value = (object)AccreditationEarnDate ?? DBNull.Value;

        pArray[32] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[32].Value = FiscalYear;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUpkProgramInformation", pArray);

        return Int32.Parse(pArray[29].Value.ToString());
    }

    public DataSet GetUpkProgramInformation(int providerId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@ProviderId", SqlDbType.Int);
        pArray[0].Value = providerId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetUpkProgramInformation", pArray);
    }

    public string GetLatestSubmissionDate(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspGetLatestSubmissionDate", pArray).ToString();
    }

    //maybe we don't need this
    public DataSet GetAccreditationTypes()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, "SELECT AccreditationTypeId, AccreditationName FROM lookup.AccreditationType ORDER BY DisplayOrder");
    }

    public DataSet GetAssessmentInstruments()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, "Select AssessmentInstrumentId, Description from lookup.AssessmentInstrument order by DisplayOrder");
    }

    public DataSet GetUpkVersions()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, "Select UpkVersionId, Description from lookup.UpkVersion order by DisplayOrder");
    }

    public DataSet GetProgramTypes()
    {
        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, "Select ProgramTypeId, Description from lookup.ProgramType");
    }

    public int GetAgencyProgramType(int grantApplicantId)
    {
        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.Text, @"SELECT DISTINCT ProgramTypeId 
FROM dbo.UPKEligibility	a
	JOIN dbo.GrantApplicant g ON a.AgencyName = g.AgencyName
WHERE g.GrantApplicantId = " + grantApplicantId.ToString()));
    }

    public DataSet GetUpkSystemProviders(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllUpkPrograms", pArray);
    }

    public int UpdateRequiredFormsErrorCount(int grantApplicantId, string partNum, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[1].Value = errorCount;

        pArray[2] = new SqlParameter("@PartNum", SqlDbType.VarChar);
        pArray[2].Value = partNum;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateRequiredFormsErrorCount", pArray);
    }

    public int UpdateNarrativeQuestionsErrorCount(int grantApplicantId, string partNum, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[1].Value = errorCount;

        pArray[2] = new SqlParameter("@PartNum", SqlDbType.VarChar);
        pArray[2].Value = partNum;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateNarrativeQuestionsErrorCount", pArray);
    }

    public int RemoveNarrativeQuestions(int grantApplicantId, int num)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Num", SqlDbType.Int);
        pArray[1].Value = num;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteNarrativeData", pArray);
    }

    public int UpdateBudgetErrorCount(int budgetNarrativeId, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@budgetNarrativeID", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[1].Value = errorCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateBudgetErrorCount", pArray);
    }

    public int UpdateBudgetWarningCount(int budgetNarrativeId, int warningCount)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@budgetNarrativeID", SqlDbType.Int);
        pArray[0].Value = budgetNarrativeId;

        pArray[1] = new SqlParameter("@WarningCount", SqlDbType.Int);
        pArray[1].Value = warningCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateBudgetWarningCount", pArray);
    }

    public DataSet GetBudgetNarrativeData(int GrantApplicantId, int isLeadAgency)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[1].Value = isLeadAgency;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetNarrativeData", pArray);
    }

    public DataSet GetBudgetNarrativeDisableColumn(int FiscalYear, int FundCode)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[0].Value = FiscalYear;

        pArray[1] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[1].Value = FundCode;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetDisableColumn", pArray);
    }

    public DataSet GetBudgetAmountTotal(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetAmountTotal", pArray);
    }

    public DataSet GetBudgetSummary(int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetSummary", pArray);
    }

    public int SaveBudgetNarrativeData(string budgetNarrativeID,
                                                int GrantApplicantId,
                                                string agencyName,
                                                string agencyEmail,
                                                string agencyPhone,
                                                string agencyContact,
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
                                                decimal IndirectPercent,
                                                string IndirectCostsDescr,
                                                string InstructionalEquipmentDescr,
                                                string NoninstructionalEquipmentDescr,
                                                string EqOtherDescr,
                                                string AncillaryDescr,
                                                int SupervisorDirectorColD,
                                                int ProjectCoordinatorColD,
                                                int StipendColD,
                                                int OtherColD,
                                                int AdvisorColD,
                                                int ClinicianColD,
                                                int CoordinatorColD,
                                                int EducatorInstructorColD,
                                                int HomeVisitorColD,
                                                int SpecialistColD,
                                                int IPSStipendColD,
                                                int IPSOtherColD,
                                                int AideParaprofessionalColD,
                                                int SecretaryBookkeeperColD,
                                                int SSOtherColD,
                                                int SSStipendColD,
                                                int FringeBenefitsColD,
                                                int CSAdvisorColD,
                                                int CSClinicianColD,
                                                int CSConsultantColD,
                                                int CSEducatorInstructorColD,
                                                int CSHomeVisitorColD,
                                                int CSSpecialistColD,
                                                int CSSpeakerColD,
                                                int CSSubstituteColD,
                                                int CSStipendColD,
                                                int CSOtherColD,
                                                int EducationalInstructionalMaterialsColD,
                                                int InstructionalTechnologySoftwareColD,
                                                int NonInstructionalSuppliesColD,
                                                int SMOtherColD,
                                                int SupervisoryStaffColD,
                                                int InstructionalStaffColD,
                                                int TravelOtherColD,
                                                int AdvertisingColD,
                                                int EquipmentRentalColD,
                                                int MaintenanceRepairsColD,
                                                int MembershipSubscriptionsColD,
                                                int PrintingReproductionColD,
                                                int StaffTrainingColD,
                                                int RentalofSpaceColD,
                                                int TelephoneUtilitiesColD,
                                                int DirectServiceTransportationColD,
                                                int OCOtherColD,
                                                int ProfessionalDevelopOpportunitiesColD,
                                                int ApplicationFeesColD,
                                                int CEUCoursesColD,
                                                int CollegeCoursesColD,
                                                int CBOtherColD,
                                                int InstructionalEquipmentColD,
                                                int NoninstructionalEquipmentColD,
                                                int EqOtherColD,
                                                int AncillaryColD,
                                                int SupervisorDirectorColF,
                                                int ProjectCoordinatorColF,
                                                int StipendColF,
                                                int OtherColF,
                                                int AdvisorColF,
                                                int ClinicianColF,
                                                int CoordinatorColF,
                                                int EducatorInstructorColF,
                                                int HomeVisitorColF,
                                                int SpecialistColF,
                                                int IPSStipendColF,
                                                int IPSOtherColF,
                                                int AideParaprofessionalColF,
                                                int SecretaryBookkeeperColF,
                                                int SSStipendColF,
                                                int SSOtherColF,
                                                int FringeBenefitsColF,
                                                int CSAdvisorColF,
                                                int CSClinicianColF,
                                                int CSConsultantColF,
                                                int CSEducatorInstructorColF,
                                                int CSHomeVisitorColF,
                                                int CSSpecialistColF,
                                                int CSSpeakerColF,
                                                int CSSubstituteColF,
                                                int CSStipendColF,
                                                int CSOtherColF,
                                                int EducationalInstructionalMaterialsColF,
                                                int InstructionalTechnologySoftwareColF,
                                                int NonInstructionalSuppliesColF,
                                                int SMOtherColF,
                                                int SupervisoryStaffColF,
                                                int InstructionalStaffColF,
                                                int TravelOtherColF,
                                                int AdvertisingColF,
                                                int EquipmentRentalColF,
                                                int MaintenanceRepairsColF,
                                                int MembershipSubscriptionsColF,
                                                int PrintingReproductionColF,
                                                int StaffTrainingColF,
                                                int RentalofSpaceColF,
                                                int TelephoneUtilitiesColF,
                                                int DirectServiceTransportationColF,
                                                int OCOtherColF,
                                                int ProfessionalDevelopOpportunitiesColF,
                                                int ApplicationFeesColF,
                                                int CEUCoursesColF,
                                                int CollegeCoursesColF,
                                                int CBOtherColF,
                                                int InstructionalEquipmentColF,
                                                int NoninstructionalEquipmentColF,
                                                int EqOtherColF,
                                                int AncillaryColF,
                                                int IndirectCosts,
                                                int SupervisorDirectorNumofStaff,
                                                decimal SupervisorDirectorFTE,
                                                int ProjectCoordinatorNumofStaff,
                                                decimal ProjectCoordinatorFTE,
                                                int OtherNumofStaff,
                                                decimal OtherFTE,
                                                int AdvisorNumofStaff,
                                                decimal AdvisorFTE,
                                                int ClinicianNumofStaff,
                                                decimal ClinicianFTE,
                                                int CoordinatorNumofStaff,
                                                decimal CoordinatorFTE,
                                                int EducatorInstructorNumofStaff,
                                                decimal EducatorInstructorFTE,
                                                int HomeVisitorNumofStaff,
                                                decimal HomeVisitorFTE,
                                                int SpecialistNumofStaff,
                                                decimal SpecialistFTE,
                                                int IPSOtherNumofStaff,
                                                decimal IPSOtherFTE,
                                                int AideParaprofessionalNumofStaff,
                                                decimal AideParaprofessionalFTE,
                                                int SecretaryBookkeeperNumofStaff,
                                                decimal SecretaryBookkeeperFTE,
                                                int SSOtherNumofStaff,
                                                decimal SSOtherFTE,
                                                int FringeBenefitsNumofStaff,
                                                decimal FringeBenefitsFTE,
                                                decimal CSAdvisorRate,
                                                string CSAdvisorHrWkDayFlat,
                                                decimal CSClinicianRate,
                                                string CSClinicianHrWkDayFlat,
                                                decimal CSConsultantRate,
                                                string CSConsultantHrWkDayFlat,
                                                decimal CSEducatorInstructorRate,
                                                string CSEducatorInstructorHrWkDayFlat,
                                                decimal CSHomeVisitorRate,
                                                string CSHomeVisitorHrWkDayFlat,
                                                decimal CSSpecialistRate,
                                                string CSSpecialistHrWkDayFlat,
                                                decimal CSSpeakerRate,
                                                string CSSpeakerHrWkDayFlat,
                                                decimal CSSubstituteRate,
                                                string CSSubstituteHrWkDayFlat,
                                                decimal CSOtherRate,
                                                string CSOtherHrWkDayFlat,
                                                decimal SupervisoryStaffMileageRate,
                                                decimal InstructionalStaffMileageRate,
                                                decimal TravelOtherMileageRate,
                                                int isLeadAgency,
                                                int NumberOfChildren)
    {
        SqlParameter[] pArray = new SqlParameter[275];
        pArray[0] = new SqlParameter("@BudgetNarrativeID", SqlDbType.Int);
        pArray[0].Direction = ParameterDirection.InputOutput;

        if (!string.IsNullOrEmpty(budgetNarrativeID))
        {
            pArray[0].Value = budgetNarrativeID;
        }

        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = GrantApplicantId;

        pArray[2] = new SqlParameter("@AgencyName", SqlDbType.VarChar);
        pArray[2].Value = agencyName;

        pArray[3] = new SqlParameter("@AgencyEmail", SqlDbType.VarChar);
        pArray[3].Value = agencyEmail;

        pArray[4] = new SqlParameter("@AgencyPhone", SqlDbType.VarChar);
        pArray[4].Value = agencyPhone;

        pArray[5] = new SqlParameter("@AgencyContactName", SqlDbType.Text);
        pArray[5].Value = agencyContact;

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
        pArray[99] = new SqlParameter("@IndirectPercent", SqlDbType.Decimal);
        pArray[99].Value = IndirectPercent;

        pArray[102] = new SqlParameter("@InstructionalEquipmentDescr", SqlDbType.Text);
        pArray[102].Value = InstructionalEquipmentDescr;

        pArray[104] = new SqlParameter("@NoninstructionalEquipmentDescr", SqlDbType.Text);
        pArray[104].Value = NoninstructionalEquipmentDescr;

        pArray[106] = new SqlParameter("@EqOtherDescr", SqlDbType.Text);
        pArray[106].Value = EqOtherDescr;

        pArray[107] = new SqlParameter("@AncillaryDescr", SqlDbType.Text);
        pArray[107].Value = AncillaryDescr;

        pArray[108] = new SqlParameter("@IndirectCosts", SqlDbType.Int);
        pArray[108].Value = IndirectCosts;


        pArray[111] = new SqlParameter("@SupervisorDirectorColD", SqlDbType.Int);
        pArray[111].Value = SupervisorDirectorColD;
        pArray[112] = new SqlParameter("@ProjectCoordinatorColD", SqlDbType.Int);
        pArray[112].Value = ProjectCoordinatorColD;
        pArray[113] = new SqlParameter("@StipendColD", SqlDbType.Int);
        pArray[113].Value = StipendColD;
        pArray[114] = new SqlParameter("@OtherColD", SqlDbType.Int);
        pArray[114].Value = OtherColD;
        pArray[115] = new SqlParameter("@AdvisorColD", SqlDbType.Int);
        pArray[115].Value = AdvisorColD;
        pArray[116] = new SqlParameter("@ClinicianColD", SqlDbType.Int);
        pArray[116].Value = ClinicianColD;
        pArray[117] = new SqlParameter("@CoordinatorColD", SqlDbType.Int);
        pArray[117].Value = CoordinatorColD;
        pArray[118] = new SqlParameter("@EducatorInstructorColD", SqlDbType.Int);
        pArray[118].Value = EducatorInstructorColD;
        pArray[119] = new SqlParameter("@HomeVisitorColD", SqlDbType.Int);
        pArray[119].Value = HomeVisitorColD;
        pArray[120] = new SqlParameter("@SpecialistColD", SqlDbType.Int);
        pArray[120].Value = SpecialistColD;
        pArray[121] = new SqlParameter("@IPSStipendColD", SqlDbType.Int);
        pArray[121].Value = IPSStipendColD;
        pArray[122] = new SqlParameter("@IPSOtherColD", SqlDbType.Int);
        pArray[122].Value = IPSOtherColD;
        pArray[123] = new SqlParameter("@AideParaprofessionalColD", SqlDbType.Int);
        pArray[123].Value = AideParaprofessionalColD;
        pArray[124] = new SqlParameter("@SecretaryBookkeeperColD", SqlDbType.Int);
        pArray[124].Value = SecretaryBookkeeperColD;
        pArray[125] = new SqlParameter("@SSOtherColD", SqlDbType.Int);
        pArray[125].Value = SSOtherColD;
        pArray[126] = new SqlParameter("@SSStipendColD", SqlDbType.Int);
        pArray[126].Value = SSStipendColD;
        pArray[127] = new SqlParameter("@FringeBenefitsColD", SqlDbType.Int);
        pArray[127].Value = FringeBenefitsColD;
        pArray[128] = new SqlParameter("@CSAdvisorColD", SqlDbType.Int);
        pArray[128].Value = CSAdvisorColD;
        pArray[129] = new SqlParameter("@CSClinicianColD", SqlDbType.Int);
        pArray[129].Value = CSClinicianColD;
        pArray[130] = new SqlParameter("@CSConsultantColD", SqlDbType.Int);
        pArray[130].Value = CSConsultantColD;
        pArray[131] = new SqlParameter("@CSEducatorInstructorColD", SqlDbType.Int);
        pArray[131].Value = CSEducatorInstructorColD;
        pArray[132] = new SqlParameter("@CSHomeVisitorColD", SqlDbType.Int);
        pArray[132].Value = CSHomeVisitorColD;
        pArray[133] = new SqlParameter("@CSSpecialistColD", SqlDbType.Int);
        pArray[133].Value = CSSpecialistColD;
        pArray[134] = new SqlParameter("@CSSpeakerColD", SqlDbType.Int);
        pArray[134].Value = CSSpeakerColD;
        pArray[135] = new SqlParameter("@CSSubstituteColD", SqlDbType.Int);
        pArray[135].Value = CSSubstituteColD;
        pArray[136] = new SqlParameter("@CSStipendColD", SqlDbType.Int);
        pArray[136].Value = CSStipendColD;
        pArray[137] = new SqlParameter("@CSOtherColD", SqlDbType.Int);
        pArray[137].Value = CSOtherColD;
        pArray[138] = new SqlParameter("@EducationalInstructionalMaterialsColD", SqlDbType.Int);
        pArray[138].Value = EducationalInstructionalMaterialsColD;
        pArray[139] = new SqlParameter("@InstructionalTechnologySoftwareColD", SqlDbType.Int);
        pArray[139].Value = InstructionalTechnologySoftwareColD;
        pArray[140] = new SqlParameter("@NonInstructionalSuppliesColD", SqlDbType.Int);
        pArray[140].Value = NonInstructionalSuppliesColD;
        pArray[141] = new SqlParameter("@SMOtherColD", SqlDbType.Int);
        pArray[141].Value = SMOtherColD;
        pArray[142] = new SqlParameter("@SupervisoryStaffColD", SqlDbType.Int);
        pArray[142].Value = SupervisoryStaffColD;
        pArray[143] = new SqlParameter("@InstructionalStaffColD", SqlDbType.Int);
        pArray[143].Value = InstructionalStaffColD;
        pArray[144] = new SqlParameter("@TravelOtherColD", SqlDbType.Int);
        pArray[144].Value = TravelOtherColD;
        pArray[145] = new SqlParameter("@AdvertisingColD", SqlDbType.Int);
        pArray[145].Value = AdvertisingColD;
        pArray[146] = new SqlParameter("@EquipmentRentalColD", SqlDbType.Int);
        pArray[146].Value = EquipmentRentalColD;
        pArray[147] = new SqlParameter("@MaintenanceRepairsColD", SqlDbType.Int);
        pArray[147].Value = MaintenanceRepairsColD;
        pArray[148] = new SqlParameter("@MembershipSubscriptionsColD", SqlDbType.Int);
        pArray[148].Value = MembershipSubscriptionsColD;
        pArray[149] = new SqlParameter("@PrintingReproductionColD", SqlDbType.Int);
        pArray[149].Value = PrintingReproductionColD;
        pArray[150] = new SqlParameter("@StaffTrainingColD", SqlDbType.Int);
        pArray[150].Value = StaffTrainingColD;
        pArray[151] = new SqlParameter("@RentalofSpaceColD", SqlDbType.Int);
        pArray[151].Value = RentalofSpaceColD;
        pArray[152] = new SqlParameter("@TelephoneUtilitiesColD", SqlDbType.Int);
        pArray[152].Value = TelephoneUtilitiesColD;
        pArray[153] = new SqlParameter("@DirectServiceTransportationColD", SqlDbType.Int);
        pArray[153].Value = DirectServiceTransportationColD;
        pArray[154] = new SqlParameter("@OCOtherColD", SqlDbType.Int);
        pArray[154].Value = OCOtherColD;
        pArray[155] = new SqlParameter("@ProfessionalDevelopOpportunitiesColD", SqlDbType.Int);
        pArray[155].Value = ProfessionalDevelopOpportunitiesColD;
        pArray[156] = new SqlParameter("@ApplicationFeesColD", SqlDbType.Int);
        pArray[156].Value = ApplicationFeesColD;
        pArray[157] = new SqlParameter("@CEUCoursesColD", SqlDbType.Int);
        pArray[157].Value = CEUCoursesColD;
        pArray[158] = new SqlParameter("@CollegeCoursesColD", SqlDbType.Int);
        pArray[158].Value = CollegeCoursesColD;
        pArray[159] = new SqlParameter("@CBOtherColD", SqlDbType.Int);
        pArray[159].Value = CBOtherColD;
        pArray[160] = new SqlParameter("@InstructionalEquipmentColD", SqlDbType.Int);
        pArray[160].Value = InstructionalEquipmentColD;
        pArray[161] = new SqlParameter("@NoninstructionalEquipmentColD", SqlDbType.Int);
        pArray[161].Value = NoninstructionalEquipmentColD;
        pArray[162] = new SqlParameter("@EqOtherColD", SqlDbType.Int);
        pArray[162].Value = EqOtherColD;
        pArray[163] = new SqlParameter("@AncillaryColD", SqlDbType.Int);
        pArray[163].Value = AncillaryColD;

        pArray[164] = new SqlParameter("@IndirectCostsDescr", SqlDbType.Text);
        pArray[164].Value = IndirectCostsDescr;


        pArray[165] = new SqlParameter("@SupervisorDirectorColF", SqlDbType.Int);
        pArray[165].Value = SupervisorDirectorColF;
        pArray[166] = new SqlParameter("@ProjectCoordinatorColF", SqlDbType.Int);
        pArray[166].Value = ProjectCoordinatorColF;
        pArray[167] = new SqlParameter("@StipendColF", SqlDbType.Int);
        pArray[167].Value = StipendColF;
        pArray[168] = new SqlParameter("@OtherColF", SqlDbType.Int);
        pArray[168].Value = OtherColF;
        pArray[169] = new SqlParameter("@AdvisorColF", SqlDbType.Int);
        pArray[169].Value = AdvisorColF;
        pArray[170] = new SqlParameter("@ClinicianColF", SqlDbType.Int);
        pArray[170].Value = ClinicianColF;
        pArray[171] = new SqlParameter("@CoordinatorColF", SqlDbType.Int);
        pArray[171].Value = CoordinatorColF;
        pArray[172] = new SqlParameter("@EducatorInstructorColF", SqlDbType.Int);
        pArray[172].Value = EducatorInstructorColF;
        pArray[173] = new SqlParameter("@HomeVisitorColF", SqlDbType.Int);
        pArray[173].Value = HomeVisitorColF;
        pArray[174] = new SqlParameter("@SpecialistColF", SqlDbType.Int);
        pArray[174].Value = SpecialistColF;
        pArray[175] = new SqlParameter("@IPSStipendColF", SqlDbType.Int);
        pArray[175].Value = IPSStipendColF;
        pArray[176] = new SqlParameter("@IPSOtherColF", SqlDbType.Int);
        pArray[176].Value = IPSOtherColF;
        pArray[177] = new SqlParameter("@AideParaprofessionalColF", SqlDbType.Int);
        pArray[177].Value = AideParaprofessionalColF;
        pArray[178] = new SqlParameter("@SecretaryBookkeeperColF", SqlDbType.Int);
        pArray[178].Value = SecretaryBookkeeperColF;
        pArray[179] = new SqlParameter("@SSStipendColF", SqlDbType.Int);
        pArray[179].Value = SSStipendColF;
        pArray[180] = new SqlParameter("@SSOtherColF", SqlDbType.Int);
        pArray[180].Value = SSOtherColF;
        pArray[181] = new SqlParameter("@FringeBenefitsColF", SqlDbType.Int);
        pArray[181].Value = FringeBenefitsColF;
        pArray[182] = new SqlParameter("@CSAdvisorColF", SqlDbType.Int);
        pArray[182].Value = CSAdvisorColF;
        pArray[183] = new SqlParameter("@CSClinicianColF", SqlDbType.Int);
        pArray[183].Value = CSClinicianColF;
        pArray[184] = new SqlParameter("@CSConsultantColF", SqlDbType.Int);
        pArray[184].Value = CSConsultantColF;
        pArray[185] = new SqlParameter("@CSEducatorInstructorColF", SqlDbType.Int);
        pArray[185].Value = CSEducatorInstructorColF;
        pArray[186] = new SqlParameter("@CSHomeVisitorColF", SqlDbType.Int);
        pArray[186].Value = CSHomeVisitorColF;
        pArray[187] = new SqlParameter("@CSSpecialistColF", SqlDbType.Int);
        pArray[187].Value = CSSpecialistColF;
        pArray[188] = new SqlParameter("@CSSpeakerColF", SqlDbType.Int);
        pArray[188].Value = CSSpeakerColF;
        pArray[189] = new SqlParameter("@CSSubstituteColF", SqlDbType.Int);
        pArray[189].Value = CSSubstituteColF;
        pArray[190] = new SqlParameter("@CSStipendColF", SqlDbType.Int);
        pArray[190].Value = CSStipendColF;
        pArray[191] = new SqlParameter("@CSOtherColF", SqlDbType.Int);
        pArray[191].Value = CSOtherColF;
        pArray[192] = new SqlParameter("@EducationalInstructionalMaterialsColF", SqlDbType.Int);
        pArray[192].Value = EducationalInstructionalMaterialsColF;
        pArray[193] = new SqlParameter("@InstructionalTechnologySoftwareColF", SqlDbType.Int);
        pArray[193].Value = InstructionalTechnologySoftwareColF;
        pArray[194] = new SqlParameter("@NonInstructionalSuppliesColF", SqlDbType.Int);
        pArray[194].Value = NonInstructionalSuppliesColF;
        pArray[195] = new SqlParameter("@SMOtherColF", SqlDbType.Int);
        pArray[195].Value = SMOtherColF;
        pArray[196] = new SqlParameter("@SupervisoryStaffColF", SqlDbType.Int);
        pArray[196].Value = SupervisoryStaffColF;
        pArray[197] = new SqlParameter("@InstructionalStaffColF", SqlDbType.Int);
        pArray[197].Value = InstructionalStaffColF;
        pArray[198] = new SqlParameter("@TravelOtherColF", SqlDbType.Int);
        pArray[198].Value = TravelOtherColF;
        pArray[199] = new SqlParameter("@AdvertisingColF", SqlDbType.Int);
        pArray[199].Value = AdvertisingColF;
        pArray[200] = new SqlParameter("@EquipmentRentalColF", SqlDbType.Int);
        pArray[200].Value = EquipmentRentalColF;
        pArray[201] = new SqlParameter("@MaintenanceRepairsColF", SqlDbType.Int);
        pArray[201].Value = MaintenanceRepairsColF;
        pArray[202] = new SqlParameter("@MembershipSubscriptionsColF", SqlDbType.Int);
        pArray[202].Value = MembershipSubscriptionsColF;
        pArray[203] = new SqlParameter("@PrintingReproductionColF", SqlDbType.Int);
        pArray[203].Value = PrintingReproductionColF;
        pArray[204] = new SqlParameter("@StaffTrainingColF", SqlDbType.Int);
        pArray[204].Value = StaffTrainingColF;
        pArray[205] = new SqlParameter("@RentalofSpaceColF", SqlDbType.Int);
        pArray[205].Value = RentalofSpaceColF;
        pArray[206] = new SqlParameter("@TelephoneUtilitiesColF", SqlDbType.Int);
        pArray[206].Value = TelephoneUtilitiesColF;
        pArray[207] = new SqlParameter("@DirectServiceTransportationColF", SqlDbType.Int);
        pArray[207].Value = DirectServiceTransportationColF;
        pArray[208] = new SqlParameter("@OCOtherColF", SqlDbType.Int);
        pArray[208].Value = OCOtherColF;
        pArray[209] = new SqlParameter("@ProfessionalDevelopOpportunitiesColF", SqlDbType.Int);
        pArray[209].Value = ProfessionalDevelopOpportunitiesColF;
        pArray[210] = new SqlParameter("@ApplicationFeesColF", SqlDbType.Int);
        pArray[210].Value = ApplicationFeesColF;
        pArray[211] = new SqlParameter("@CEUCoursesColF", SqlDbType.Int);
        pArray[211].Value = CEUCoursesColF;
        pArray[212] = new SqlParameter("@CollegeCoursesColF", SqlDbType.Int);
        pArray[212].Value = CollegeCoursesColF;
        pArray[213] = new SqlParameter("@CBOtherColF", SqlDbType.Int);
        pArray[213].Value = CBOtherColF;
        pArray[214] = new SqlParameter("@InstructionalEquipmentColF", SqlDbType.Int);
        pArray[214].Value = InstructionalEquipmentColF;
        pArray[215] = new SqlParameter("@NoninstructionalEquipmentColF", SqlDbType.Int);
        pArray[215].Value = NoninstructionalEquipmentColF;
        pArray[216] = new SqlParameter("@EqOtherColF", SqlDbType.Int);
        pArray[216].Value = EqOtherColF;
        pArray[217] = new SqlParameter("@AncillaryColF", SqlDbType.Int);
        pArray[217].Value = AncillaryColF;



        pArray[219] = new SqlParameter("@SupervisorDirectorNumofStaff", SqlDbType.Int);
        pArray[219].Value = SupervisorDirectorNumofStaff;
        pArray[220] = new SqlParameter("@SupervisorDirectorFTE", SqlDbType.Decimal);
        pArray[220].Value = SupervisorDirectorFTE;
        pArray[221] = new SqlParameter("@ProjectCoordinatorNumofStaff", SqlDbType.Int);
        pArray[221].Value = ProjectCoordinatorNumofStaff;
        pArray[222] = new SqlParameter("@ProjectCoordinatorFTE", SqlDbType.Decimal);
        pArray[222].Value = ProjectCoordinatorFTE;
        pArray[223] = new SqlParameter("@OtherNumofStaff", SqlDbType.Int);
        pArray[223].Value = OtherNumofStaff;
        pArray[224] = new SqlParameter("@OtherFTE", SqlDbType.Decimal);
        pArray[224].Value = OtherFTE;
        pArray[225] = new SqlParameter("@AdvisorNumofStaff", SqlDbType.Int);
        pArray[225].Value = AdvisorNumofStaff;
        pArray[226] = new SqlParameter("@AdvisorFTE", SqlDbType.Decimal);
        pArray[226].Value = AdvisorFTE;
        pArray[227] = new SqlParameter("@ClinicianNumofStaff", SqlDbType.Int);
        pArray[227].Value = ClinicianNumofStaff;
        pArray[228] = new SqlParameter("@ClinicianFTE", SqlDbType.Decimal);
        pArray[228].Value = ClinicianFTE;
        pArray[229] = new SqlParameter("@CoordinatorNumofStaff", SqlDbType.Int);
        pArray[229].Value = CoordinatorNumofStaff;
        pArray[230] = new SqlParameter("@CoordinatorFTE", SqlDbType.Decimal);
        pArray[230].Value = CoordinatorFTE;
        pArray[231] = new SqlParameter("@EducatorInstructorNumofStaff", SqlDbType.Int);
        pArray[231].Value = EducatorInstructorNumofStaff;
        pArray[232] = new SqlParameter("@EducatorInstructorFTE", SqlDbType.Decimal);
        pArray[232].Value = EducatorInstructorFTE;
        pArray[233] = new SqlParameter("@HomeVisitorNumofStaff", SqlDbType.Int);
        pArray[233].Value = HomeVisitorNumofStaff;
        pArray[234] = new SqlParameter("@HomeVisitorFTE", SqlDbType.Decimal);
        pArray[234].Value = HomeVisitorFTE;
        pArray[235] = new SqlParameter("@SpecialistNumofStaff", SqlDbType.Int);
        pArray[235].Value = SpecialistNumofStaff;
        pArray[236] = new SqlParameter("@SpecialistFTE", SqlDbType.Decimal);
        pArray[236].Value = SpecialistFTE;
        pArray[237] = new SqlParameter("@IPSOtherNumofStaff", SqlDbType.Int);
        pArray[237].Value = IPSOtherNumofStaff;
        pArray[238] = new SqlParameter("@IPSOtherFTE", SqlDbType.Decimal);
        pArray[238].Value = IPSOtherFTE;
        pArray[239] = new SqlParameter("@AideParaprofessionalNumofStaff", SqlDbType.Int);
        pArray[239].Value = AideParaprofessionalNumofStaff;
        pArray[240] = new SqlParameter("@AideParaprofessionalFTE", SqlDbType.Decimal);
        pArray[240].Value = AideParaprofessionalFTE;
        pArray[241] = new SqlParameter("@SecretaryBookkeeperNumofStaff", SqlDbType.Int);
        pArray[241].Value = SecretaryBookkeeperNumofStaff;
        pArray[242] = new SqlParameter("@SecretaryBookkeeperFTE", SqlDbType.Decimal);
        pArray[242].Value = SecretaryBookkeeperFTE;
        pArray[243] = new SqlParameter("@SSOtherNumofStaff", SqlDbType.Int);
        pArray[243].Value = SSOtherNumofStaff;
        pArray[244] = new SqlParameter("@SSOtherFTE", SqlDbType.Decimal);
        pArray[244].Value = SSOtherFTE;
        pArray[245] = new SqlParameter("@FringeBenefitsNumofStaff", SqlDbType.Int);
        pArray[245].Value = FringeBenefitsNumofStaff;
        pArray[246] = new SqlParameter("@FringeBenefitsFTE", SqlDbType.Decimal);
        pArray[246].Value = FringeBenefitsFTE;
        pArray[247] = new SqlParameter("@CSAdvisorRate", SqlDbType.Decimal);
        pArray[247].Value = CSAdvisorRate;
        pArray[248] = new SqlParameter("@CSAdvisorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[248].Value = CSAdvisorHrWkDayFlat;
        pArray[249] = new SqlParameter("@CSClinicianRate", SqlDbType.Decimal);
        pArray[249].Value = CSClinicianRate;
        pArray[250] = new SqlParameter("@CSClinicianHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[250].Value = CSClinicianHrWkDayFlat;
        pArray[251] = new SqlParameter("@CSConsultantRate", SqlDbType.Decimal);
        pArray[251].Value = CSConsultantRate;
        pArray[252] = new SqlParameter("@CSConsultantHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[252].Value = CSConsultantHrWkDayFlat;
        pArray[253] = new SqlParameter("@CSEducatorInstructorRate", SqlDbType.Decimal);
        pArray[253].Value = CSEducatorInstructorRate;
        pArray[254] = new SqlParameter("@CSEducatorInstructorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[254].Value = CSEducatorInstructorHrWkDayFlat;
        pArray[255] = new SqlParameter("@CSHomeVisitorRate", SqlDbType.Decimal);
        pArray[255].Value = CSHomeVisitorRate;
        pArray[256] = new SqlParameter("@CSHomeVisitorHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[256].Value = CSHomeVisitorHrWkDayFlat;
        pArray[257] = new SqlParameter("@CSSpecialistRate", SqlDbType.Decimal);
        pArray[257].Value = CSSpecialistRate;
        pArray[258] = new SqlParameter("@CSSpecialistHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[258].Value = CSSpecialistHrWkDayFlat;
        pArray[259] = new SqlParameter("@CSSpeakerRate", SqlDbType.Decimal);
        pArray[259].Value = CSSpeakerRate;
        pArray[260] = new SqlParameter("@CSSpeakerHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[260].Value = CSSpeakerHrWkDayFlat;
        pArray[261] = new SqlParameter("@CSSubstituteRate", SqlDbType.Decimal);
        pArray[261].Value = CSSubstituteRate;
        pArray[262] = new SqlParameter("@CSSubstituteHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[262].Value = CSSubstituteHrWkDayFlat;
        pArray[263] = new SqlParameter("@CSOtherRate", SqlDbType.Decimal);
        pArray[263].Value = CSOtherRate;
        pArray[264] = new SqlParameter("@CSOtherHrWkDayFlat", SqlDbType.VarChar, 50);
        pArray[264].Value = CSOtherHrWkDayFlat;
        pArray[265] = new SqlParameter("@SupervisoryStaffMileageRate", SqlDbType.Decimal);
        pArray[265].Value = SupervisoryStaffMileageRate;
        pArray[266] = new SqlParameter("@InstructionalStaffMileageRate", SqlDbType.Decimal);
        pArray[266].Value = InstructionalStaffMileageRate;
        pArray[267] = new SqlParameter("@TravelOtherMileageRate", SqlDbType.Decimal);
        pArray[267].Value = TravelOtherMileageRate;

        pArray[268] = new SqlParameter("@NumberOfChildren", SqlDbType.Int);
        pArray[268].Value = NumberOfChildren;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveBudgetNarrativeData", pArray);

        return Int32.Parse(pArray[0].Value.ToString());
    }

    public DataSet GetHeadStartBudgetNarrativeSubcontractorData(int SCID, int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[3];
        pArray[0] = new SqlParameter("@SCID", SqlDbType.Int);
        pArray[0].Value = SCID;

        pArray[1] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[1].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetBudgetNarrativeSubcontractorData", pArray);

    }

    public DataSet GetHSSubContractorsInfo(int GrantApplicantID, int isLeadAgency)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@GrantApplicantID", SqlDbType.Int);
        pArray[0].Value = GrantApplicantID;

        pArray[1] = new SqlParameter("@IsLeadAgency", SqlDbType.Int);
        pArray[1].Value = isLeadAgency;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetSubContractorsInfo", pArray);

    }

    public DataSet GetGrantContacts(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantApplicantContacts", pArray);
    }

    public int SaveGrantContacts(int grantApplicantId, int grantTypeId, DataTable dtContacts)
    {
        SqlParameter[] pArray = new SqlParameter[14];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@GrantContactsTableType", SqlDbType.Structured);
        pArray[1].Value = dtContacts;
        pArray[1].TypeName = "dbo.GrantContactsTableType";

        pArray[2] = new SqlParameter("@GrantTypeId", SqlDbType.Int);
        pArray[2].Value = grantTypeId;

        return Convert.ToInt32(SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, "uspSaveGrantContacts", pArray));

    }

    public int RegisterNewAgency(string agencyName, string agencyAddress, string agencyCity,
                                 string agencyState, string agencyZipcode, string agencyPhone,
                                 string agencyEmail, string username, string password,
                                 int fiscalYear, int fundCode)
    {
        SqlParameter[] pArray = new SqlParameter[12];

        pArray[0] = new SqlParameter("@AgencyName", SqlDbType.VarChar);
        pArray[0].Value = agencyName;

        pArray[1] = new SqlParameter("@Address1", SqlDbType.VarChar);
        pArray[1].Value = agencyAddress;

        pArray[2] = new SqlParameter("@City", SqlDbType.VarChar);
        pArray[2].Value = agencyCity;

        pArray[3] = new SqlParameter("@State", SqlDbType.VarChar);
        pArray[3].Value = agencyState;

        pArray[4] = new SqlParameter("@Zipcode", SqlDbType.VarChar);
        pArray[4].Value = agencyZipcode;

        pArray[5] = new SqlParameter("@Phone", SqlDbType.VarChar);
        pArray[5].Value = agencyPhone;

        pArray[6] = new SqlParameter("@Email", SqlDbType.VarChar);
        pArray[6].Value = agencyEmail;

        pArray[7] = new SqlParameter("@Username", SqlDbType.VarChar);
        pArray[7].Value = username;

        pArray[8] = new SqlParameter("@Password", SqlDbType.VarChar);
        pArray[8].Value = password;

        pArray[9] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[9].Value = fiscalYear;

        pArray[10] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[10].Value = fundCode;

        pArray[11] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[11].Direction = ParameterDirection.InputOutput;
        pArray[11].Value = -1;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspRegisterNewAgency", pArray);

        return Convert.ToInt32(pArray[11].Value.ToString());
    }

    //preschool survey
    public int GetNewSystemProviderId(int GrantApplicantId, int FiscalYear, int FundCode)
    {
        SqlParameter[] pArray = new SqlParameter[4];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        pArray[2] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[2].Value = FundCode;

        pArray[3] = new SqlParameter("@SystemProviderId", SqlDbType.Int);
        pArray[3].Value = 0;
        pArray[3].Direction = ParameterDirection.InputOutput;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePreschoolProgramInformation", pArray);

        return Int32.Parse(pArray[3].Value.ToString());
    }

    public int UpdatePreschoolProgramInformationErrorCount(int systemProviderId, int errorCount)
    {
        SqlParameter[] pArray = new SqlParameter[2];
        pArray[0] = new SqlParameter("@SystemProviderId", SqlDbType.Int);
        pArray[0].Value = systemProviderId;

        pArray[1] = new SqlParameter("@ErrorCount", SqlDbType.Int);
        pArray[1].Value = errorCount;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdatePreschoolProgramInformationErrorCount", pArray);
    }

    public DataSet GetPreschoolSystemProviders(int grantApplicantId, int FiscalYear, int FundCode)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        pArray[2] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[2].Value = FundCode;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetAllPreschoolPrograms2017", pArray);
    }

    public int DeletePreschoolProgram(int systemProviderId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@SystemProviderId", SqlDbType.Int);
        pArray[0].Value = systemProviderId;


        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeletePreschoolProgram", pArray));
    }

    public int SavePreschoolProgramSurveyData(int SystemProviderId, string QuestionId, string QuestionAns, int GrantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[4];

        pArray[0] = new SqlParameter("@SystemProviderId", SqlDbType.Int);
        pArray[0].Value = SystemProviderId;

        pArray[1] = new SqlParameter("@QuestionId", SqlDbType.VarChar);
        pArray[1].Value = QuestionId;

        pArray[2] = new SqlParameter("@QuestionAns", SqlDbType.VarChar);
        pArray[2].Value = QuestionAns;

        pArray[3] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[3].Value = GrantApplicantId;

        return SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePreschoolProgramSurveyData", pArray);
    }

    public SortedList<string, string> GetPreschoolProgramSurveyData(int SystemProviderId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@SystemProviderId", SqlDbType.Int);
        pArray[0].Value = SystemProviderId;

        DataSet ds = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetPreschoolProgramSurveyData", pArray);

        SortedList<string, string> questions = new SortedList<string, string>();

        DataRow dr;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            dr = ds.Tables[0].Rows[i];

            questions.Add(dr["QuestionId"].ToString(), dr["QuestionAns"].ToString());
        }

        return questions;
    }

    public DataSet GetPreschoolQuestionnaire(int grantApplicantId, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = FiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetPreschoolQuestionnaire", pArray);
    }

    public void SavePreschoolQuestionnaire(int grantApplicantId, int isValid, SortedList<string, int> aList, string Q3Reason, string Q4Reason, int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[aList.Count + 2 + 3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@IsValid", SqlDbType.TinyInt);
        pArray[1].Value = isValid;

        int count = 2;
        foreach (string key in aList.Keys)
        {
            pArray[count] = new SqlParameter("@" + key, SqlDbType.TinyInt);
            pArray[count].Value = aList[key];
            count++;
        }

        pArray[count] = new SqlParameter("@Q3Reason", SqlDbType.VarChar);
        pArray[count].Value = Q3Reason;

        pArray[count + 1] = new SqlParameter("@Q4Reason", SqlDbType.VarChar);
        pArray[count + 1].Value = Q4Reason;

        pArray[count + 2] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[count + 2].Value = FiscalYear;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePreschoolQuestionnaire", pArray);
    }

    public void SavePreschoolPartStatus(int grantApplicantId, string part, int status)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Part", SqlDbType.Int);
        pArray[1].Value = part;

        pArray[2] = new SqlParameter("@Status", SqlDbType.TinyInt);
        pArray[2].Value = status;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSavePreschoolPartStatus", pArray);
    }

    public DataSet GetPreschoolPartStatus(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[1];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetPreschoolPartStatus", pArray);
    }

    //upk survey
    public int SaveUpkClassroom(int GrantApplicantId, int UpkClassroomId, string ClassroomName, int TotalChildren, int HighNeedsChildren,
                                int EnglishLearner,
                                int HispanicChildren,
                                int NonHispanicChildren,
                                int IndianChildren,
                                int AsianChildren,
                                int AfricanChildren,
                                int HawaiianChildren,
                                int WhiteChildren,
                                int BiracialChildren,
                                int OtherRaceChildren,
                                int UnspecifiedChildren,
                                int PreSchoolChildren,
                                string GrantUpkSystemProvidersId,
                                int WeeksPerYearOperation,
                                int DaysPerWeekOperation,
                                int HoursPerDayOperation,
                                int FiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[23];
        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = GrantApplicantId;

        pArray[1] = new SqlParameter("@UpkClassroomId", SqlDbType.Int);
        pArray[1].Value = UpkClassroomId;

        pArray[2] = new SqlParameter("@ClassroomName", SqlDbType.VarChar);
        pArray[2].Value = ClassroomName;

        pArray[3] = new SqlParameter("@TotalChildren", SqlDbType.Int);
        pArray[3].Value = TotalChildren;

        pArray[4] = new SqlParameter("@HighNeedsChildren", SqlDbType.Int);
        pArray[4].Value = HighNeedsChildren;

        pArray[5] = new SqlParameter("@EnglishLearner", SqlDbType.Int);
        pArray[5].Value = EnglishLearner;

        pArray[6] = new SqlParameter("@HispanicChildren", SqlDbType.Int);
        pArray[6].Value = HispanicChildren;

        pArray[7] = new SqlParameter("@NonHispanicChildren", SqlDbType.Int);
        pArray[7].Value = NonHispanicChildren;

        pArray[8] = new SqlParameter("@IndianChildren", SqlDbType.Int);
        pArray[8].Value = IndianChildren;

        pArray[9] = new SqlParameter("@AsianChildren", SqlDbType.Int);
        pArray[9].Value = AsianChildren;

        pArray[10] = new SqlParameter("@AfricanChildren", SqlDbType.Int);
        pArray[10].Value = AfricanChildren;

        pArray[11] = new SqlParameter("@HawaiianChildren", SqlDbType.Int);
        pArray[11].Value = HawaiianChildren;

        pArray[12] = new SqlParameter("@WhiteChildren", SqlDbType.Int);
        pArray[12].Value = WhiteChildren;

        pArray[13] = new SqlParameter("@BiracialChildren", SqlDbType.Int);
        pArray[13].Value = BiracialChildren;

        pArray[14] = new SqlParameter("@OtherRaceChildren", SqlDbType.Int);
        pArray[14].Value = OtherRaceChildren;

        pArray[15] = new SqlParameter("@UnspecifiedChildren", SqlDbType.Int);
        pArray[15].Value = UnspecifiedChildren;

        pArray[16] = new SqlParameter("@PreSchoolChildren", SqlDbType.Int);
        pArray[16].Value = PreSchoolChildren;

        pArray[17] = new SqlParameter("@GrantUpkSystemProvidersId", SqlDbType.Int);
        pArray[17].Value = GrantUpkSystemProvidersId;

        pArray[18] = new SqlParameter("@WeeksPerYearOperation", SqlDbType.Int);
        pArray[18].Value = WeeksPerYearOperation;

        pArray[19] = new SqlParameter("@DaysPerWeekOperation", SqlDbType.Int);
        pArray[19].Value = DaysPerWeekOperation;

        pArray[20] = new SqlParameter("@HoursPerDayOperation", SqlDbType.Int);
        pArray[20].Value = HoursPerDayOperation;

        pArray[21] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[21].Value = FiscalYear;

        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspSaveUpkClassroom", pArray));
    }

    public float UpdateUPKEligAmount(int grantApplicantId)
    {
        SqlParameter[] pArray = new SqlParameter[3];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@Amount", SqlDbType.Float);
        pArray[1].Direction = ParameterDirection.Output;

        SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateUPKEligibilityAmount", pArray);

        return Single.Parse(pArray[1].Value.ToString());
    }

    public int DeleteUpkProgram(int providerId)
    {
        SqlParameter[] pArray = new SqlParameter[1];
        pArray[0] = new SqlParameter("@ProviderId", SqlDbType.Int);
        pArray[0].Value = providerId;


        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, "uspDeleteUpkProgram", pArray));
    }

    public DataSet GetGrantApplicants(int fundCode, int fiscalYear)
    {
        SqlParameter[] pArray = new SqlParameter[2];

        pArray[0] = new SqlParameter("@FundCode", SqlDbType.Int);
        pArray[0].Value = fundCode;

        pArray[1] = new SqlParameter("@FiscalYear", SqlDbType.Int);
        pArray[1].Value = fiscalYear;

        return SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspGetGrantApplicants", pArray);
    }

    public void UpdateGrantApplicants(int grantApplicantId, string agencyName, string programName, string amount, string vendorCode, string MMarsId, string ADNumber,
                                      string address1, string address2, string city, string state, string zipcode, string awarded, string pchp, string originalBudgetAlloc, string amendment1Eligibility, string amendment2Eligibility, string amendment3Eligibility)
    {

        SqlParameter[] pArray = new SqlParameter[18];

        pArray[0] = new SqlParameter("@GrantApplicantId", SqlDbType.Int);
        pArray[0].Value = grantApplicantId;

        pArray[1] = new SqlParameter("@AgencyName", SqlDbType.VarChar, 300);
        pArray[1].Value = agencyName;

        pArray[2] = new SqlParameter("@ProgramName", SqlDbType.VarChar, 300);
        pArray[2].Value = programName;

        pArray[3] = new SqlParameter("@VendorCode", SqlDbType.VarChar, 300);
        pArray[3].Value = vendorCode;

        pArray[4] = new SqlParameter("@MMarsId", SqlDbType.VarChar, 300);
        pArray[4].Value = MMarsId;

        pArray[5] = new SqlParameter("@ADNumber", SqlDbType.VarChar, 300);
        pArray[5].Value = ADNumber;

        pArray[6] = new SqlParameter("@Address1", SqlDbType.VarChar, 300);
        pArray[6].Value = address1;

        pArray[7] = new SqlParameter("@Address2", SqlDbType.VarChar, 300);
        pArray[7].Value = address2;

        pArray[8] = new SqlParameter("@City", SqlDbType.VarChar, 300);
        pArray[8].Value = city;

        pArray[9] = new SqlParameter("@State", SqlDbType.VarChar, 300);
        pArray[9].Value = state;

        pArray[10] = new SqlParameter("@ZipCode", SqlDbType.VarChar, 300);
        pArray[10].Value = zipcode;

        pArray[11] = new SqlParameter("@Awarded", SqlDbType.Int);
        pArray[11].Value = awarded;

        pArray[12] = new SqlParameter("@PCHP", SqlDbType.Int);
        pArray[12].Value = pchp;

        pArray[13] = new SqlParameter("@EligAmount", SqlDbType.Float);
        pArray[13].Value = amount;

        pArray[14] = new SqlParameter("@OriginalBudgetAlloc", SqlDbType.Float);
        pArray[14].Value = originalBudgetAlloc;

        pArray[15] = new SqlParameter("@Amendment1Eligibility", SqlDbType.Float);
        pArray[15].Value = amendment1Eligibility;

        pArray[16] = new SqlParameter("@Amendment2Eligibility", SqlDbType.Float);
        pArray[16].Value = amendment2Eligibility;

        pArray[17] = new SqlParameter("@Amendment3Eligibility", SqlDbType.Float);
        pArray[17].Value = amendment3Eligibility;

        SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, "uspUpdateGrantApplicants", pArray);
    }
}
