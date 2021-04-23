SELECT * FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 390

EXEC dbo.uspGetHSHomeBaseSiteSurvey 7852, 2020

SELECT * FROM dbo.HSCenterBasedSiteSurvey
WHERE fiscalyear = 2021

SELECT * FROM dbo.HSFamChildCareSiteSurvey
WHERE fiscalyear = 2021

SELECT * FROM dbo.HSHomeBasedSiteSurvey
WHERE fiscalyear = 2021



SELECT a.GrantApplicantID, b.GrantApplicantId, a.AgencyName 
FROM dbo.GrantApplicant a
JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName AND a.FundCode = b.Fundcode
WHERE a.FiscalYear = 2020
AND b.FiscalYear = 2021
AND a.FundCode = 390


INSERT INTO dbo.HSCenterbasedSiteSurvey
(
    HeadStartLeadAgencyID,
    HeadStartLeadAgencyName,
    ProgramNumber,
    ProgramlicenseStatus,
    FiscalYear,
    HeadStartFacilityName,
    Address,
    City,
    State,
    ZipCode,
    EECLicensedCapacity,
    NumberChildrenFundedACF,
    NumberChildrenFundedNonACF,
    NumberDualLanguageLearners,
    NAEYCAccredited,
    TotalNumberClassrooms,
    FullDayClasses,
    FullYearClasses,
    NumberClassroomTeachers,
    NumberHighSchoolTeachers,
    NumberSomeCollegeTeachers,
    CDATeachers,
    NumberAAASDegreedTeachers,
    NumberBABSDegreedTeachers,
    AdvanceDegreedTeachers,
    NumberUPKClassrooms,
    NumberUPKChildrenClassroom,
    QRISParticipation,
    QRISSelfAssessedLevel,
    QRISGrantedLevel,
    Comments,
    TotalCbPrograms,
    ProgramType,
    CreateDate,
    ModifiedDate,
    Accreditation,
    AccreditationNumber,
    AccreditationExpDate,
    AccreditationEarnDate
)
SELECT 
	b.GrantApplicantId,              -- HeadStartLeadAgencyID - int
    b.AgencyName,                    -- HeadStartLeadAgencyName - varchar(150)
    c.ProgramNumber,                 -- ProgramNumber - varchar(150)
    c.ProgramLicenseStatus,          -- ProgramlicenseStatus - varchar(50)
    2021,							 -- FiscalYear - varchar(50)
    c.HeadStartFacilityName,         -- HeadStartFacilityName - varchar(150)
    c.Address,					     -- Address - varchar(250)
    c.City,							 -- City - varchar(50)
    c.State,						 -- State - varchar(2)
    c.ZipCode,						 -- ZipCode - varchar(10)
    c.EECLicensedCapacity,           -- EECLicensedCapacity - int
    c.NumberChildrenFundedACF,       -- NumberChildrenFundedACF - int
    c.NumberChildrenFundedNonACF,    -- NumberChildrenFundedNonACF - int
    c.NumberDualLanguageLearners,    -- NumberDualLanguageLearners - int
    c.NAEYCAccredited,               -- NAEYCAccredited - varchar(10)
    c.TotalNumberClassrooms,                     -- TotalNumberClassrooms - int
    c.FullDayClasses,                     -- FullDayClasses - int
    c.FullYearClasses,                     -- FullYearClasses - int
    c.NumberClassroomTeachers,                     -- NumberClassroomTeachers - int
    c.NumberHighSchoolTeachers,                     -- NumberHighSchoolTeachers - int
    c.NumberSomeCollegeTeachers,                     -- NumberSomeCollegeTeachers - int
    c.CDATeachers,                     -- CDATeachers - int
    c.NumberAAASDegreedTeachers,                     -- NumberAAASDegreedTeachers - int
    c.NumberBABSDegreedTeachers,                     -- NumberBABSDegreedTeachers - int
    c.AdvanceDegreedTeachers,                     -- AdvanceDegreedTeachers - int
    c.NumberUPKClassrooms,                     -- NumberUPKClassrooms - int
    c.NumberUPKChildrenClassroom,                     -- NumberUPKChildrenClassroom - int
    c.QRISParticipation,                    -- QRISParticipation - varchar(10)
    c.QRISSelfAssessedLevel,                    -- QRISSelfAssessedLevel - varchar(20)
    c.QRISGrantedLevel,                    -- QRISGrantedLevel - varchar(20)
    c.Comments,                    -- Comments - varchar(max)
    c.TotalCBPrograms,                     -- TotalCbPrograms - int
    c.ProgramType,                    -- ProgramType - varchar(50)
    GETDATE(),						-- CreateDate - smalldatetime
    GETDATE(),						-- ModifiedDate - smalldatetime
    c.Accreditation,                    -- Accreditation - varchar(10)
    c.AccreditationNumber,                    -- AccreditationNumber - varchar(10)
    c.AccreditationExpDate,             -- AccreditationExpDate - datetime
    c.AccreditationEarnDate              -- AccreditationEarnDate - datetime

	FROM dbo.HSCenterBasedSiteSurvey c 
	JOIN dbo.GrantApplicant a ON a.GrantApplicantId = c.HeadStartLeadAgencyID
	JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName
	WHERE a.Fundcode = 390 
	AND b.FiscalYear = 2021
	AND a.FiscalYear = 2020
	--AND a.GrantApplicantID = 7824
	ORDER BY a.GrantApplicantId


SELECT * FROM dbo.HSCenterBasedSiteSurvey
WHERE fiscalyear = 2021
--Look for test records and delete

SELECT * FROM dbo.GrantApplicant 
WHERE GrantApplicantId IN (
8140,8122,8134)


INSERT INTO dbo.HSFamchildCareSiteSurvey
(
    HeadStartLeadAgencyID,
    LeadAgencyName,
    ProgramNumber,
    ProgramlicenseStatus,
    FiscalYear,
    FamilyChildCareProviderName,
    Address,
    ZipCode,
    LicensedCapacity,
    NumberChildrenEnrolledProgram,
    NumberChildrenFundedACFFam,
    NumberChildrenFundedNonACFFam,
    NumberDualLanguageLearnersFam,
    NumberProvidersHome,
    NumberAssistantHome,
    NumberHighSchoolProvidersHome,
    NumberSomeCollegeProvidersHome,
    NumberCDAProvidersHome,
    NumberAAASDegreedProvidersHome,
    NumberBABSDegreedProvidersHome,
    NumberAdvanceDegreedProvidersHome,
    UPKProvider,
    NumberChildrenReceivingUPKFundingHome,
    QRISParticipationFam,
    QRISSelfAssessedLevelFam,
    CommentsFam,
    TotalFCCProvider,
    ProgramType,
    CreateDate,
    ModifiedDate,
    NAEYCAccredited,
    Accreditation,
    AccreditationNumber,
    AccreditationExpDate,
    AccreditationEarnDate
)

SELECT 
	b.GrantApplicantId,                 -- HeadStartLeadAgencyID - int
    b.AgencyName,						-- HeadStartLeadAgencyName - varchar(150)
    c.ProgramNumber,                    -- ProgramNumber - varchar(150)
    c.ProgramLicenseStatus,             -- ProgramlicenseStatus - varchar(50)
    2021,								-- FiscalYear - varchar(50)
    c.FamilyChildCareProviderName,                   
    c.Address,                    -- Address - varchar(250)
    c.ZipCode,                    -- ZipCode - varchar(10)
    c.LicensedCapacity,                     
    c.NumberChildrenEnrolledProgram,             
    c.NumberChildrenFundedACFFam,                     
	c.NumberChildrenFundedNonACFFam,
    c.NumberDualLanguageLearnersFam,                 
    c.NumberProvidersHome,                    
    c.NumberAssistantHome,                     
    c.NumberHighSchoolProvidersHome,                     
    c.NumberSomeCollegeProvidersHome,                    
    c.NumberCDAProvidersHome,                     
    c.NumberAAASDegreedProvidersHome,                     
    c.NumberBABSDegreedProvidersHome,                     
    c.NumberAdvanceDegreedProvidersHome, 
    c.UPKProvider,
    c.NumberChildrenReceivingUPKFundingHome,     
    c.QRISParticipationFam,                     
    c.QRISSelfAssessedLevelFam,                
    c.CommentsFam,                     
    c.TotalFCCProvider,               
    c.ProgramType,                    
    GETDATE(), 
    GETDATE(), 
	c.NAEYCAccredited,
    c.Accreditation,                   
    c.AccreditationNumber,              
    c.AccreditationExpDate,             
    c.AccreditationEarnDate            

	FROM dbo.HSFamChildCareSiteSurvey c 
	JOIN dbo.GrantApplicant a ON a.GrantApplicantId = c.HeadStartLeadAgencyID
	JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName
	WHERE a.Fundcode = 390 
	AND b.FiscalYear = 2021
	AND a.FiscalYear = 2020
	--ORDER BY a.GrantApplicantId

SELECT * FROM dbo.HSFamChildCareSiteSurvey
WHERE fiscalyear = 2021
--Look for test records and delete



INSERT INTO dbo.HSHomeBasedSiteSurvey
(
    HeadStartLeadAgencyID,
    FiscalYear,
    LeadAgencyName,
    ProgramName,
    Address,
    CommunitiesServed,
    ZipCode,
    StaffDegreeLevel,
    FundedCapacityHeadstart,
    FundedCapacityEarlyHeadStart,
    NumberDualLanguageLearnersHome,
    Comments,
    TotalHBVisits,
    CreateDate,
    Modified
)
SELECT 
	b.GrantApplicantId,
	2021,
	b.AgencyName,
	c.ProgramName,
	c.Address,
	c.CommunitiesServed,
	c.ZipCode,
	c.StaffDegreeLevel,
	c.FundedCapacityHeadStart,
	c.FundedCapacityEarlyHeadStart,
	c.NumberDualLanguageLearnersHome,
	c.Comments,
	c.TotalHBVisits,
	GETDATE(),
	GETDATE()
FROM dbo.HSHomeBasedSiteSurvey c
JOIN dbo.GrantApplicant a ON a.GrantApplicantId = c.HeadStartLeadAgencyID
JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName
WHERE a.Fundcode = 390 
AND b.FiscalYear = 2021
AND a.FiscalYear = 2020