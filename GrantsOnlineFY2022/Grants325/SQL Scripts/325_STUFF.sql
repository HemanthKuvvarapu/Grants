exec uspCheckRegisteredAgencyName @AgencyName='City of Taunton',@FundCode=511,@FiscalYear=2019
go
declare @p14 int
--set @p14=-1
exec uspRegisterNewAgency @AgencyName='City of Taunton',@Address1='25 Hilgard Ave',@City='Taunton',@State='MA',@Zipcode='01821',@Phone='555-555-5555',@Email='angels@angels.org',@Username='TestMe',@Password='Testme',@FiscalYear=2019,@FundCode=511,@GrantApplicantId=@p14 output
select @p14
go

exec uspConfirmUsernamePassword @Username='TestMe',@Password='eecadm1n',@FundCode=511,@FiscalYear=2019
go
exec uspGetGrantApplicant @GrantApplicantId=6366,@FundCode=511
go
declare @p2 float
set @p2=NULL
exec uspUpdateUPKEligibilityAmount  @GrantApplicantId=6366,@Amount=@p2 output
select @p2
go

exec uspGetUPKPartStatus @GrantApplicantId=6366
go
exec uspGetAllUpkProgramsNew @GrantApplicantId=6366
go

exec uspGetUPKProgramSurveyData @SystemProviderId=-1

exec uspGetPartInstruction @FundCode=325,@FiscalYear=2018,@Part='1'

SELECT * FROM dbo.templatePageinstructions 
WHERE fundcode = 239

INSERT INTO dbo.TemplatePageInstructions
(
    FundCode,
    FiscalYear,
    Part,
    Content
)
SELECT 325, 2019, part, content FROM 
dbo.TemplatePageInstructions WHERE fundcode = 239 AND fiscalyear = 2019


SELECT * FROM dbo.templatePageinstructions 
WHERE fundcode = 325 AND fiscalyear = 2019

UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions: </b>Please select the cities/towns below in your community college''s catchment area.  The demographic information will automatically populate for the cities and towns chosen.  This information is provided AS a resource to applicants.  For additional information on the demographics for specific cities and towns within the Commonwealth, please see Appendices I and J IN the grant application'
WHERE part = '2'
AND fundcode = 325 AND fiscalyear = 2019
--AND content = '<b>Instructions: </b>Below are the 351 cities and towns separated into 5 regions within Massachusetts. Select the names of the cities/towns to be served in each region. When each city/town is selected, demographic information will populate. For more information about the demographic information displayed below, see Appendices E-1, E-2 and E-3 in the Grant Application.'


exec uspGetCommunitiesTotalDataPoint @GrantApplicantId=6362
exec uspGetCommunitiesTotalDataPoint @GrantApplicantId=6367
GO
exec uspGetAllCommunitiesServed @GrantApplicantId=6362,@FiscalYear=2019
exec uspGetAllCommunitiesServed @GrantApplicantId=6367,@FiscalYear=2019
go
exec uspGetAllDistrictData @GrantApplicantId=6362,@FiscalYear=2019
exec uspGetAllDistrictData @GrantApplicantId=6367,@FiscalYear=2019

go
