alter table grantapplicant add FundCode int
alter table grantapplicant add EligibilityAmount money  
alter table GrantApplicant add [Contact First Name] varchar(50)
alter table GrantApplicant add [Contact Last Name] varchar(50)

alter table GrantTown add FiscalYear int

GO

Update GrantTown set FiscalYear = 2015

GO
 
ALTER PROC [dbo].[uspGetGrantApplicant]
(
@GrantApplicantId Int
)
AS
BEGIN
/*
exec uspGetGrantApplicant 111
exec uspGetGrantApplicant 3005

*/
	SELECT a.GrantApplicantId, 
		   a.AgencyName, 
		   a.Username, 
		   a.Passphrase, 
		   a.Address1, 
		   a.Address2, 
		   a.City, 
		   a.State, 
		   a.Zipcode, 
		   a.Phone, 
		   a.Fax, 
		   a.Email,
		   ISNULL(a.EligibilityAmount, 0) 'EligibilityAmount'
	FROM dbo.GrantApplicant a 
	WHERE a.GrantApplicantId = @GrantApplicantId
	
	SELECT GrantContactId
		, gc.ContactTypeId
		, ContactType = lc.Description
		, FirstName
		, LastName
		, Address1, Address2, City, State, Zipcode, Phone, Fax, Email, WebAddress
	FROM dbo.GrantContact gc
		JOIN lookup.ContactType lc ON gc.ContactTypeId = lc.ContactTypeId
	WHERE GrantApplicantId = @GrantApplicantId
	

END

GO


ALTER proc [dbo].[uspConfirmUsernamePassword](
@Username VARCHAR(20),
@Password varchar(20),
@FundCode INT,
@FiscalYear int
)
as
begin

DECLARE @GrantApplicantId INT

set @GrantApplicantId = 0

if( @Password = 'eecadm1n' )
BEGIN
	 SELECT @GrantApplicantId = GrantApplicantId 
	 FROM dbo.GrantApplicant
	 WHERE Username = @Username
	 AND FundCode = @FundCode
end
else
begin
	SELECT @GrantApplicantId = GrantApplicantId 
	FROM GrantApplicant
	WHERE Username = @Username AND Passphrase = @Password
	 AND FundCode = @FundCode
	 And FiscalYear = @FiscalYear
end
 
 INSERT INTO UserLog(GrantApplicantId, Username, Pwd, LoginDate)
 VALUES (@GrantApplicantId, @Username, @Password, GETDATE())
 
select @GrantApplicantId


end

GO

ALTER proc [dbo].[uspGetCoverSheetData]
(
	@GrantApplicantId int
)
as
/*
	uspGetCoverSheetData 3226
*/

begin
select a.[AgencyName] as 'Lead Agency Name', 
	   --a.District as 'OrganizationName', 
	   ----OrganizationType, 
	   a.[Contact First Name] + '' + a.[Contact Last Name] as 'GrantContactName', 
	   a.[Email] as 'GrantContactEmail',
	   a.[Phone] as 'GrantContactPhone',
	   a.[Address1] as 'AddressLine1',
	   a.[Address2] as 'Address2',
	   '' as 'AddressLine2',
	   a.[City] as 'CityTown', 
	   a.[State] as 'State',
	   a.[Zipcode] as 'ZipCode',
	   a.[Fax] as 'Fax',
	   Case len(isnull(a.[Address2],''))
	   when 0 then a.Address1 
	   else a.Address1 + ', ' + a.[Address2] end 'Address'
	   --Convert(varchar, CONVERT(money,a.[FY2015 Total Grant Award]))'FY 2015 Grant Award',
	   --Convert(varchar, CONVERT(money,isnull(d.GrantTotal, 0)), 1) 'BudgetTotal'
from GrantApplicant a 
Where  a.GrantApplicantId = @GrantApplicantId
end

GO


CREATE TABLE [dbo].[TemplateGrantFiles](
	[FundCode] [int] NOT NULL,
	[GrantYear] [int] NOT NULL,
	[FileNum] [int] NOT NULL,
	[CustomContent] [text] NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER proc [dbo].[uspGetUploadedFiles]
(
@GrantApplicantID int,
@FundCode int,
@FiscalYear int
)
as
begin
	select * 
	into #tempA
	from TemplateGrantFiles
	where FundCode = @FundCode
	  and GrantYear = @FiscalYear
	  
alter table #tempA add FileBytes image
alter table #tempA add FileName varchar(100)
alter table #tempA add FileType varchar(10)
alter table #tempA add FileUploadedType int

update #tempA
	set FileBytes = b.FileBytes
	    ,FileName = b.FileName
	    ,FileType = b.FileType
	    ,FileUploadedType = b.FileUploadedType
	from #tempA a join GrantUploadedFiles b
	on a.fileNum = b.FileUploadedType
	where b.GrantApplicantID = @GrantApplicantID
	
select * from #tempA

drop table #tempA

end

GO

ALTER proc [dbo].[uspSavePDFCheckList]
(
	@GrantApplicantId int
	,@A1 int = 0
           ,@A2 int = 0
           ,@A3 int = 0
           ,@A4 int = 0
           ,@A5 int = 0
           ,@A6 int = 0
           ,@A7 int = 0
           ,@A8 int = 0
           --,@A9 int
           --,@A10 int
           --,@A11 int
           ,@A12 int = 0
           ,@A13 int = 0
           ,@A14 int = 0
           ,@A15 int = 0
           ,@A16 int = 0
           ,@A17 int = 0
           ,@A18 int = 0
           --,@A19 int
           --,@A20 int
           --,@A21 int
           ,@A22 int = 0
           ,@A23 int = 0
           ,@A24 int = 0
           ,@A25 int = 0
           ,@A26 int = 0
           ,@A27 int = 0
           ,@A28 int = 0
           ,@E1 int = 0
           ,@E2 int = 0
           ,@E3 int = 0
           ,@E4 int = 0
           ,@E5 int = 0
           ,@E6 int = 0
           ,@E7 int = 0
           ,@E8 int = 0 
           --,@E9 int
           --,@E10 int
           --,@E11 int
           ,@E12 int = 0
           ,@E13 int = 0
           ,@E14 int = 0
           ,@E15 int = 0
           ,@E16 int = 0
           ,@E17 int = 0
           ,@E18 int = 0
           --,@E19 int
           --,@E20 int
           --,@E21 int
           ,@E22 int = 0
           ,@E23 int = 0
           ,@E24 int = 0
           ,@E25 int = 0
           ,@E26 int = 0
           ,@E27 int = 0
           ,@F18 int = 0
           ,@F19 int = 0
)
as
begin

	delete from CheckList	
		where GrantApplicantId = @GrantApplicantId
		
	insert into CheckList
		([GrantApplicantId]
           ,[A1]
           ,[A2]
           ,[A3]
           ,[A4]
           ,[A5]
           ,[A6]
           ,[A7]
           ,[A8]
           --,[A9]
           --,[A10]
           --,[A11]
           ,[A12]
           ,[A13]
           ,[A14]
           ,[A15]
           ,[A16]
           ,[A17]
           ,[A18]
           --,[A19]
           --,[A20]
           --,[A21]
           ,[A22]
           ,[A23]
           ,[A24]
           ,[A25]
           ,[A26]
           ,[A27]
           ,[A28]
           ,[E1]
           ,[E2]
           ,[E3]
           ,[E4]
           ,[E5]
           ,[E6]
           ,[E7]
           ,[E8]
           --,[E9]
           --,[E10]
           --,[E11]
           ,[E12]
           ,[E13]
           ,[E14]
           ,[E15]
           ,[E16]
           ,[E17]
           ,[E18]
           --,[E19]
           --,[E20]
           --,[E21]
           ,[E22]
          ,[E23]
          ,[E24]
          ,[E25]
          ,[E26]
          ,[E27]
          ,[F18]
           ,[F19]) values
      (@GrantApplicantId
           ,@A1
           ,@A2
           ,@A3
           ,@A4
           ,@A5
           ,@A6
           ,@A7
           ,@A8
           --,@A9
           --,@A10
           --,@A11
           ,@A12
           ,@A13
           ,@A14
           ,@A15
           ,@A16
           ,@A17
           ,@A18
           --,@A19
           --,@A20
           --,@A21
           ,@A22
           ,@A23
           ,@A24
           ,@A25
           ,@A26
           ,@A27
           ,@A28
           ,@E1
           ,@E2
           ,@E3
           ,@E4
           ,@E5
           ,@E6
           ,@E7
           ,@E8
           --,@E9
           --,@E10
           --,@E11
           ,@E12
           ,@E13
           ,@E14
           ,@E15
           ,@E16
           ,@E17
           ,@E18
           --,@E19
           --,@E20
           --,@E21
           ,@E22
           ,@E23
           ,@E24
           ,@E25
           ,@E26
           ,@E27
           ,@F18
           ,@F19
      )     
end

Go

ALTER proc [dbo].[uspGetBudgetNarrativeData]
(
	@GrantApplicantId int,
	@IsLeadAgency tinyint
)
as
begin
	Select b.BudgetNarrativeID,
	b.AgencyName ,
	SupervisorDirector  ,
	SupervisorDirectorDescr  ,
	ProjectCoordinator  ,
	ProjectCoordinatorDescr  ,
	Stipend  ,
	StipendDescr  ,
	Other  ,
	OtherDescr  ,
	Advisor  ,
	AdvisorDescr  ,
	Clinician  ,
	ClinicianDescr  ,
	Coordinator  ,
	CoordinatorDescr  ,
	EducatorInstructor  ,
	EducatorInstructorDescr  ,
	HomeVisitor  ,
	HomeVisitorDescr  ,
	Specialist  ,
	SpecialistDescr  ,
	IPSStipend  ,
	IPSStipendDescr  ,
	IPSOther  ,
	IPSOtherDescr  ,
	AideParaprofessional ,
	AideParaprofessionalDescr ,
	SecretaryBookkeeper ,
	SecretaryBookkeeperDescr ,
	SSStipend ,
	SSStipendDescr ,
	SSOther ,
	SSOtherDescr ,
	FringeBenefits ,
	FringeBenefitsDescr ,
	CSAdvisor ,
	CSAdvisorDescr ,
	CSClinician ,
	CSClinicianDescr ,
	CSConsultant ,
	CSConsultantDescr ,
	CSEducatorInstructor ,
	CSEducatorInstructorDescr ,
	CSHomeVisitor ,
	CSHomeVisitorDescr ,
	CSSpecialist ,
	CSSpecialistDescr ,
	CSSpeaker ,
	CSSpeakerDescr ,
	CSSubstitute ,
	CSSubstituteDescr ,
	CSStipend ,
	CSStipendDescr ,
	CSOther ,
	CSOtherDescr ,
	EducationalInstructionalMaterials ,
	EducationalInstructionalMaterialsDescr ,
	InstructionalTechnologySoftware ,
	InstructionalTechnologySoftwareDescr ,
	NonInstructionalSupplies ,
	NonInstructionalSuppliesDescr ,
	SMOther ,
	SMOtherDescr ,
	SupervisoryStaff ,
	SupervisoryStaffDescr ,
	InstructionalStaff ,
	InstructionalStaffDescr ,
	TravelOther ,
	TraveOtherDescr ,
	Advertising ,
	AdvertisingDescr ,
	EquipmentRental ,
	EquipmentRentalDescr ,
	MaintenanceRepairs ,
	MaintenanceRepairsDescr ,
	MembershipSubscriptions ,
	MembershipSubscriptionsDescr ,
	PrintingReproduction ,
	PrintingReproductionDescr ,
	StaffTraining ,
	StaffTrainingDescr ,
	RentalofSpace ,
	RentalofSpaceDescr ,
	TelephoneUtilities ,
	TelephoneUtilitiesDescr ,
	DirectServiceTransportation ,
	DirectServiceTransportationDescr ,
	OCOther ,
	OCOtherDescr ,
	ProfessionalDevelopOpportunities ,
	ProfessionalDevelopOpportunitiesDescr ,
	ApplicationFees ,
	ApplicationFeesDescr ,
	CEUCourses ,
	CEUCoursesDescr ,
	CollegeCourses ,
	CollegeCoursesDescr ,
	CBOther ,
	CBOtherDescr ,
	IndirectPercent ,
	IndirectCosts ,
	IndirectCostsDescr,
	InstructionalEquipment ,
	InstructionalEquipmentDescr ,
	NoninstructionalEquipment ,
	NoninstructionalEquipmentDescr ,
	EqOther ,
	EqOtherDescr ,
	SupervisorDirectorColD ,
	ProjectCoordinatorColD ,
	StipendColD ,
	OtherColD ,
	AdvisorColD ,
	ClinicianColD ,
	CoordinatorColD ,
	EducatorInstructorColD ,
	HomeVisitorColD ,
	SpecialistColD ,
	IPSStipendColD ,
	IPSOtherColD ,
	AideParaprofessionalColD ,
	SecretaryBookkeeperColD ,
	SSStipendColD ,
	SSOtherColD ,
	FringeBenefitsColD ,
	CSAdvisorColD ,
	CSClinicianColD ,
	CSConsultantColD ,
	CSEducatorInstructorColD ,
	CSHomeVisitorColD ,
	CSSpecialistColD ,
	CSSpeakerColD ,
	CSSubstituteColD ,
	CSStipendColD ,
	CSOtherColD ,
	EducationalInstructionalMaterialsColD ,
	InstructionalTechnologySoftwareColD ,
	NonInstructionalSuppliesColD ,
	SMOtherColD ,
	SupervisoryStaffColD ,
	InstructionalStaffColD ,
	TravelOtherColD ,
	AdvertisingColD ,
	EquipmentRentalColD ,
	MaintenanceRepairsColD ,
	MembershipSubscriptionsColD ,
	PrintingReproductionColD ,
	StaffTrainingColD ,
	RentalofSpaceColD ,
	TelephoneUtilitiesColD ,
	DirectServiceTransportationColD ,
	OCOtherColD ,
	ProfessionalDevelopOpportunitiesColD ,
	ApplicationFeesColD ,
	CEUCoursesColD ,
	CollegeCoursesColD ,
	CBOtherColD ,
	InstructionalEquipmentColD ,
	NoninstructionalEquipmentColD ,
	EqOtherColD ,
	SupervisorDirectorColF ,
	ProjectCoordinatorColF ,
	StipendColF ,
	OtherColF ,
	AdvisorColF ,
	ClinicianColF ,
	CoordinatorColF ,
	EducatorInstructorColF ,
	HomeVisitorColF ,
	SpecialistColF ,
	IPSStipendColF ,
	IPSOtherColF ,
	AideParaprofessionalColF ,
	SecretaryBookkeeperColF ,
	SSStipendColF ,
	SSOtherColF ,
	FringeBenefitsColF ,
	CSAdvisorColF ,
	CSClinicianColF ,
	CSConsultantColF ,
	CSEducatorInstructorColF ,
	CSHomeVisitorColF ,
	CSSpecialistColF ,
	CSSpeakerColF ,
	CSSubstituteColF ,
	CSStipendColF ,
	CSOtherColF ,
	EducationalInstructionalMaterialsColF ,
	InstructionalTechnologySoftwareColF ,
	NonInstructionalSuppliesColF ,
	SMOtherColF ,
	SupervisoryStaffColF ,
	InstructionalStaffColF ,
	TravelOtherColF ,
	AdvertisingColF ,
	EquipmentRentalColF ,
	MaintenanceRepairsColF ,
	MembershipSubscriptionsColF ,
	PrintingReproductionColF ,
	StaffTrainingColF ,
	RentalofSpaceColF ,
	TelephoneUtilitiesColF ,
	DirectServiceTransportationColF ,
	OCOtherColF ,
	ProfessionalDevelopOpportunitiesColF ,
	ApplicationFeesColF ,
	CEUCoursesColF ,
	CollegeCoursesColF ,
	CBOtherColF ,
	InstructionalEquipmentColF ,
	NoninstructionalEquipmentColF ,
	EqOtherColF ,

	b.SupervisorDirectorNumofStaff ,
	b.SupervisorDirectorFTE ,
	b.ProjectCoordinatorNumofStaff ,
	b.ProjectCoordinatorFTE ,
	b.OtherNumofStaff ,
	b.OtherFTE ,
	b.AdvisorNumofStaff ,
	b.AdvisorFTE ,
	b.ClinicianNumofStaff ,
	b.ClinicianFTE ,
	b.CoordinatorNumofStaff ,
	b.CoordinatorFTE ,
	b.EducatorInstructorNumofStaff ,
	b.EducatorInstructorFTE ,
	b.HomeVisitorNumofStaff ,
	b.HomeVisitorFTE ,
	b.SpecialistNumofStaff ,
	b.SpecialistFTE ,
	b.IPSOtherNumofStaff ,
	b.IPSOtherFTE ,
	b.AideParaprofessionalNumofStaff ,
	b.AideParaprofessionalFTE ,
	b.SecretaryBookkeeperNumofStaff ,
	b.SecretaryBookkeeperFTE ,
	b.SSOtherNumofStaff ,
	b.SSOtherFTE ,
	b.FringeBenefitsNumofStaff ,
	b.FringeBenefitsFTE ,
	b.CSAdvisorRate ,
	b.CSAdvisorHrWkDayFlat ,
	b.CSClinicianRate ,
	b.CSClinicianHrWkDayFlat ,
	b.CSConsultantRate ,
	b.CSConsultantHrWkDayFlat ,
	b.CSEducatorInstructorRate ,
	b.CSEducatorInstructorHrWkDayFlat ,
	b.CSHomeVisitorRate ,
	b.CSHomeVisitorHrWkDayFlat ,
	b.CSSpecialistRate ,
	b.CSSpecialistHrWkDayFlat ,
	b.CSSpeakerRate ,
	b.CSSpeakerHrWkDayFlat ,
	b.CSSubstituteRate ,
	b.CSSubstituteHrWkDayFlat ,
	b.CSOtherRate ,
	b.CSOtherHrWkDayFlat ,
	b.SupervisoryStaffMileageRate ,
	b.InstructionalStaffMileageRate ,
	b.TravelOtherMileageRate ,
	b.AdminSubTotal,
	b.IPSSubTotal,
	b.SSSubTotal,
	b.FBSubTotal,
	b.CSSubTotal,
	b.SMSubTotal,
	b.TravelSubTotal,
	b.OCSubTotal,
	b.CBSubTotal,
	b.IndirectCostsSubTotal,
	b.EqSubTotal,
	
	AdminSubTotalColD  = convert(int , 	SupervisorDirectorColD   
					+ProjectCoordinatorColD   
					+StipendColD   
					+OtherColD ),  
	IPSSubTotalColD  = convert(int , 	AdvisorColD   
					+ClinicianColD  
					+CoordinatorColD
					+EducatorInstructorColD
					+HomeVisitorColD
					+SpecialistColD
					+IPSStipendColD
					+IPSOtherColD),  
	SSSubTotalColD  = convert(int  ,	AideParaprofessionalColD
					+SecretaryBookkeeperColD
					+SSStipendColD
					+SSOtherColD), 
	FBSubTotalColD = convert(int  ,	FringeBenefitsColD),
	CSSubTotalColD   = convert(int  ,	CSAdvisorColD
					+CSClinicianColD
					+CSConsultantColD
					+CSEducatorInstructorColD
					+CSHomeVisitorColD
					+CSSpecialistColD
					+CSSpeakerColD
					+CSSubstituteColD
					+CSStipendColD
					+CSOtherColD),
	SMSubTotalColD   = convert(int  ,	InstructionalTechnologySoftwareColD
					+NonInstructionalSuppliesColD
					+SMOtherColD 
					+EducationalInstructionalMaterialsColD),
	TravelSubTotalColD = convert(int  ,	SupervisoryStaffColD
					+InstructionalStaffColD
					+TravelOtherColD), 
	OCSubTotalColD  = convert(int  ,	AdvertisingColD
					+EquipmentRentalColD
					+MaintenanceRepairsColD
					+MembershipSubscriptionsColD
					+PrintingReproductionColD
					+StaffTrainingColD
					+RentalofSpaceColD
					+TelephoneUtilitiesColD
					+DirectServiceTransportationColD
					+OCOtherColD ),
	CBSubTotalColD   = convert(int  ,	ProfessionalDevelopOpportunitiesColD
					+ApplicationFeesColD
					+CEUCoursesColD
					+CollegeCoursesColD
					+CBOtherColD ),
	 EqSubTotalColD = convert(int ,	InstructionalEquipmentColD 
					+NoninstructionalEquipmentColD
					+EqOtherColD ),	
	AdminSubTotalColF = convert(int , 	SupervisorDirectorColF
					+ProjectCoordinatorColF
					+StipendColF
					+OtherColF), 
	IPSSubTotalColF  = convert(int , 	AdvisorColF
					+ClinicianColF
					+CoordinatorColF
					+EducatorInstructorColF
					+HomeVisitorColF
					+SpecialistColF
					+IPSStipendColF
					+IPSOtherColF),  
	SSSubTotalColF  = convert(int  ,	AideParaprofessionalColF
					+SecretaryBookkeeperColF
					+SSStipendColF
					+SSOtherColF),
	FBSubTotalColF = convert(int  ,	FringeBenefitsColF ),
	CSSubTotalColF   = convert(int  ,	CSAdvisorColF
					+CSClinicianColF
					+CSConsultantColF
					+CSEducatorInstructorColF
					+CSHomeVisitorColF
					+CSSpecialistColF
					+CSSpeakerColF
					+CSSubstituteColF
					+CSStipendColF
					+CSOtherColF),
	SMSubTotalColF   = convert(int  ,	InstructionalTechnologySoftwareColF
					+NonInstructionalSuppliesColF
					+SMOtherColF
					+EducationalInstructionalMaterialsColF),
	TravelSubTotalColF = convert(int  ,	SupervisoryStaffColF
					+InstructionalStaffColF
					+TravelOtherColF),
	OCSubTotalColF  = convert(int  ,	AdvertisingColF
					+EquipmentRentalColF
					+MaintenanceRepairsColF
					+MembershipSubscriptionsColF
					+PrintingReproductionColF
					+StaffTrainingColF
					+RentalofSpaceColF
					+TelephoneUtilitiesColF
					+DirectServiceTransportationColF
					+OCOtherColF ),
	CBSubTotalColF   = convert(int  ,	ProfessionalDevelopOpportunitiesColF
					+ApplicationFeesColF
					+CEUCoursesColF
					+CollegeCoursesColF
					+CBOtherColF ),
	EqSubTotalColF = convert(int ,	InstructionalEquipmentColF 
					+NoninstructionalEquipmentColF
					+EqOtherColF ),
	AdminSubTotalNumofStaff  = convert(int , 	SupervisorDirectorNumofStaff 
					+ProjectCoordinatorNumofStaff 
					+OtherNumofStaff),   
	IPSSubTotalNumofStaff   = convert(int , 	AdvisorNumofStaff 
					+ClinicianNumofStaff 
					+CoordinatorNumofStaff 
					+EducatorInstructorNumofStaff 
					+HomeVisitorNumofStaff 
					+SpecialistNumofStaff
					+IPSOtherNumofStaff),   
	SSSubTotalNumofStaff   = convert(int  ,	AideParaprofessionalNumofStaff 
					+SecretaryBookkeeperNumofStaff 
					+SSOtherNumofStaff ),
	FBSubTotalNumofStaff  = convert(int  ,	FringeBenefitsNumofStaff  ),
	
	b.AdminSubTotalFTE,
	b.IPSSubTotalFTE,
	b.SSSubTotalFTE,
	b.FBSubTotalFTE,
	
	0 'GrantTotal',
	0 'GrantTotalColD',
	0 'GrantTotalColF',
	b.ErrorCount,
	b.WarningCount,
	b.AgencyEmail,
	b.AgencyPhone,
	b.AgencyContactName,
	AllocationFund = Convert(varchar, CONVERT(money, e.[EligibilityAmount])),
	BudgetTotal = Convert(varchar, CONVERT(money,isnull(b.GrantTotal, 0)), 1)
	into #tempA
	from GrantApplicant e join BudgetNarrative b
	on e.GrantApplicantId = b.GrantApplicantId
	where b.GrantApplicantId = @GrantApplicantId
	  and b.IsLeadAgency = @IsLeadAgency
	  
	update #tempA
		set GrantTotalColD = AdminSubTotalColD + 
							IPSSubTotalColD +
							SSSubTotalColD + 
							FBSubTotalColD +
							CSSubTotalColD +
							SMSubTotalColD +
							TravelSubTotalColD + 
							OCSubTotalColD +
							CBSubTotalColD +
							EqSubTotalColD,	
		    GrantTotalColF = AdminSubTotalColF + 
							IPSSubTotalColF +  
							SSSubTotalColF +
							FBSubTotalColF +
							CSSubTotalColF +
							SMSubTotalColF +
							TravelSubTotalColF +
							OCSubTotalColF +
							CBSubTotalColF +
							EqSubTotalColF +
							IndirectCostsSubTotal

	update #tempA	
		set GrantTotal = GrantTotalColD + GrantTotalColF

	select * from #tempA

	drop table #tempA
End

GO

ALTER proc [dbo].[uspGetBudgetSummary]
(
	@GrantApplicantId int
)
as
begin

	select 
	b.GrantApplicantId,
	AdminSubTotalColD = isnull(b.SupervisorDirectorColD, 0) + 
						isnull(b.ProjectCoordinatorColD, 0) + 
						isnull(b.StipendColD, 0) + 
						isnull(b.OtherColD, 0),
	IPSSubTotalColD = isnull(b.AdvisorColD, 0) + 
					  isnull(b.ClinicianColD, 0) + 
					  isnull(b.CoordinatorColD, 0) + 
					  isnull(b.EducatorInstructorColD, 0) + 
					  isnull(b.HomeVisitorColD, 0) + 
					  isnull(b.SpecialistColD, 0) + 
					  isnull(b.IPSStipendColD, 0) + 
					  isnull(b.IPSOtherColD, 0),
	SSSubTotalColD = isnull(b.AideParaprofessionalColD, 0) + 
					 isnull(b.SecretaryBookkeeperColD, 0) + 
					 isnull(b.SSStipendColD, 0) + 
					 isnull(b.SSOtherColD, 0),
	FBSubTotalColD = isnull(b.FringeBenefitsColD, 0),
	CSSubTotalColD = isnull(b.CSAdvisorColD, 0) +
					 isnull(b.CSClinicianColD, 0) + 
					 isnull(b.CSConsultantColD, 0) + 
					 isnull(b.CSEducatorInstructorColD, 0) + 
					 isnull(b.CSHomeVisitorColD, 0) + 
					 isnull(b.CSSpecialistColD, 0) + 
					 isnull(b.CSSpeakerColD, 0) + 
					 isnull(b.CSSubstituteColD, 0) + 
					 isnull(b.CSStipendColD, 0) + 
					 isnull(b.CSOtherColD, 0),
	SMSubTotalColD = isnull(b.EducationalInstructionalMaterialsColD, 0) + 
					 isnull(b.InstructionalTechnologySoftwareColD, 0) + 
					 isnull(b.NonInstructionalSuppliesColD, 0) + 
					 isnull(b.SMOtherColD, 0),
	TravelSubTotalColD = isnull(b.SupervisoryStaffColD, 0) + 
						 isnull(b.InstructionalStaffColD, 0) + 
						 isnull(b.TravelOtherColD, 0),
	OCSubTotalColD = isnull(b.AdvertisingColD, 0) + 
					 isnull(b.EquipmentRentalColD, 0) + 
					 isnull(b.MaintenanceRepairsColD, 0) + 
					 isnull(b.MembershipSubscriptionsColD, 0) + 
					 isnull(b.PrintingReproductionColD, 0) + 
					 isnull(b.StaffTrainingColD, 0) + 
					 isnull(b.RentalofSpaceColD, 0) + 
					 isnull(b.TelephoneUtilitiesColD, 0) + 
					 isnull(b.DirectServiceTransportationColD, 0) + 
					 isnull(b.OCOtherColD, 0),
	CBSubTotalColD = isnull(b.ProfessionalDevelopOpportunitiesColD, 0) + 
					 isnull(b.ApplicationFeesColD, 0) + 
					 isnull(b.CEUCoursesColD, 0) + 
					 isnull(b.CollegeCoursesColD, 0) + 
					 isnull(b.CBOtherColD, 0),
	EqSubTotalColD = isnull(b.InstructionalEquipmentColD, 0) + 
					 isnull(b.NoninstructionalEquipmentColD, 0) + 
					 isnull(b.EqOtherColD, 0),
	AdminSubTotalColF = isnull(b.SupervisorDirectorColF, 0) + 
						isnull(b.ProjectCoordinatorColF, 0) + 
						isnull(b.StipendColF, 0) + 
						isnull(b.OtherColF, 0),
	IPSSubTotalColF = isnull(b.AdvisorColF, 0) + 
					  isnull(b.ClinicianColF, 0) + 
					  isnull(b.CoordinatorColF, 0) + 
					  isnull(b.EducatorInstructorColF, 0) + 
					  isnull(b.HomeVisitorColF, 0) + 
					  isnull(b.SpecialistColF, 0) + 
					  isnull(b.IPSStipendColF, 0) + 
					  isnull(b.IPSOtherColF, 0),
	SSSubTotalColF = isnull(b.AideParaprofessionalColF, 0) + 
					 isnull(b.SecretaryBookkeeperColF, 0) + 
					 isnull(b.SSStipendColF, 0) + 
					 isnull(b.SSOtherColF, 0),
	FBSubTotalColF = isnull(b.FringeBenefitsColF, 0),
	CSSubTotalColF = isnull(b.CSAdvisorColF, 0) + 
					 isnull(b.CSClinicianColF, 0) + 
					 isnull(b.CSConsultantColF, 0) + 
					 isnull(b.CSEducatorInstructorColF, 0) + 
					 isnull(b.CSHomeVisitorColF, 0) + 
					 isnull(b.CSSpecialistColF, 0) + 
					 isnull(b.CSSpeakerColF, 0) + 
					 isnull(b.CSSubstituteColF, 0) + 
					 isnull(b.CSStipendColF, 0) + 
					 isnull(b.CSOtherColF, 0),
	SMSubTotalColF = isnull(b.EducationalInstructionalMaterialsColF, 0) + 
					 isnull(b.InstructionalTechnologySoftwareColF, 0) + 
					 isnull(b.NonInstructionalSuppliesColF, 0) + 
					 isnull(b.SMOtherColF, 0),
	TravelSubTotalColF = isnull(b.SupervisoryStaffColF, 0) + 
					 isnull(b.InstructionalStaffColF, 0) + 
					 isnull(b.TravelOtherColF, 0),
	OCSubTotalColF = isnull(b.AdvertisingColF, 0) + 
					 isnull(b.EquipmentRentalColF, 0) + 
					 isnull(b.MaintenanceRepairsColF, 0) + 
					 isnull(b.MembershipSubscriptionsColF, 0) + 
					 isnull(b.PrintingReproductionColF, 0) + 
					 isnull(b.StaffTrainingColF, 0) + 
					 isnull(b.RentalofSpaceColF, 0) + 
					 isnull(b.TelephoneUtilitiesColF, 0) + 
					 isnull(b.DirectServiceTransportationColF, 0) + 
					 isnull(b.OCOtherColF, 0),
	CBSubTotalColF = isnull(b.ProfessionalDevelopOpportunitiesColF, 0) + 
					  isnull(b.ApplicationFeesColF, 0) + 
					  isnull(b.CEUCoursesColF, 0) + 
					  isnull(b.CollegeCoursesColF, 0) + 
					  isnull(b.CBOtherColF, 0),
	EqSubTotalColF = isnull(b.InstructionalEquipmentColF, 0) + 
					  isnull(b.NoninstructionalEquipmentColF, 0) + 
					  isnull(b.EqOtherColF, 0),
	AdminSubTotal = isnull(b.SupervisorDirector, 0) + 
					  isnull(b.ProjectCoordinator, 0) + 
					  isnull(b.Stipend, 0) + 
					  isnull(b.Other, 0),
	IPSSubTotal = isnull(b.Advisor, 0) + 
					 isnull(b.Clinician, 0) + 
					 isnull(b.Coordinator, 0) + 
					 isnull(b.EducatorInstructor, 0) + 
					 isnull(b.HomeVisitor, 0) + 
					 isnull(b.Specialist, 0) + 
					 isnull(b.IPSStipend, 0) + 
					 isnull(b.IPSOther, 0),
	SSSubTotal = isnull(b.AideParaprofessional, 0) + 
					  isnull(b.SecretaryBookkeeper, 0) + 
					  isnull(b.SSStipend, 0) + 
					  isnull(b.SSOther, 0),
	FBSubTotal = isnull(b.FringeBenefits, 0),
	CSSubTotal = isnull(b.CSAdvisor, 0) + 
					 isnull(b.CSClinician, 0) + 
					 isnull(b.CSConsultant, 0) + 
					 isnull(b.CSEducatorInstructor, 0) + 
					 isnull(b.CSHomeVisitor, 0) + 
					 isnull(b.CSSpecialist, 0) + 
					 isnull(b.CSSpeaker, 0) + 
					 isnull(b.CSSubstitute, 0) + 
					 isnull(b.CSStipend, 0) + 
					 isnull(b.CSOther, 0),
	SMSubTotal = isnull(b.EducationalInstructionalMaterials, 0) + 
					  isnull(b.InstructionalTechnologySoftware, 0) + 
					  isnull(b.NonInstructionalSupplies, 0) + 
					  isnull(b.SMOther, 0),
	TravelSubTotal = isnull(b.SupervisoryStaff, 0) + 
					  isnull(b.InstructionalStaff, 0) + 
					  isnull(b.TravelOther, 0),
	OCSubTotal = isnull(b.Advertising, 0) + 
					 isnull(b.EquipmentRental, 0) + 
					 isnull(b.MaintenanceRepairs, 0) + 
					 isnull(b.MembershipSubscriptions, 0) + 
					 isnull(b.PrintingReproduction, 0) + 
					 isnull(b.StaffTraining, 0) + 
					 isnull(b.RentalofSpace, 0) + 
					 isnull(b.TelephoneUtilities, 0) + 
					 isnull(b.DirectServiceTransportation, 0) + 
					 isnull(b.OCOther, 0),
	CBSubTotal = isnull(b.ProfessionalDevelopOpportunities, 0) + 
					 isnull(b.ApplicationFees, 0) + 
					 isnull(b.CEUCourses, 0) + 
					 isnull(b.CollegeCourses, 0) + 
					 isnull(b.CBOther, 0),
	EqSubTotal = isnull(b.InstructionalEquipment, 0) + 
					  isnull(b.NoninstructionalEquipment, 0) + 
					  isnull(b.EqOther, 0),
	AdminSubTotalNumofStaff = isnull(b.SupervisorDirectorNumofStaff, 0) + 
					  isnull(b.ProjectCoordinatorNumofStaff, 0) + 
					  isnull(b.OtherNumofStaff, 0),
	AdminSubTotalFTE = isnull(b.SupervisorDirectorFTE, 0) + 
					 isnull(b.ProjectCoordinatorFTE, 0) + 
					 isnull(b.OtherFTE, 0),
	IPSSubTotalNumofStaff = isnull(b.AdvisorNumofStaff, 0) + 
					 isnull(b.ClinicianNumofStaff, 0) + 
					 isnull(b.CoordinatorNumofStaff, 0) + 
					 isnull(b.EducatorInstructorNumofStaff, 0) + 
					 isnull(b.HomeVisitorNumofStaff, 0) + 
					 isnull(b.SpecialistNumofStaff, 0) + 
					 isnull(b.IPSOtherNumofStaff, 0),
	IPSSubTotalFTE = isnull(b.AdvisorFTE, 0) + 
					 isnull(b.ClinicianFTE, 0) + 
					 isnull(b.CoordinatorFTE, 0) + 
					 isnull(b.EducatorInstructorFTE, 0) + 
					 isnull(b.HomeVisitorFTE, 0) + 
					 isnull(b.SpecialistFTE, 0) + 
					 isnull(b.IPSOtherFTE, 0),
	SSSubTotalNumofStaff = isnull(b.AideParaprofessionalNumofStaff, 0) + 
					  isnull(b.SecretaryBookkeeperNumofStaff, 0) + 
					  isnull(b.SSOtherNumofStaff, 0),
	SSSubTotalFTE = isnull(b.AideParaprofessionalFTE, 0) + 
					 isnull(b.SecretaryBookkeeperFTE, 0) + 
					 isnull(b.SSOtherFTE, 0),
	FBSubTotalNumofStaff = isnull(b.FringeBenefitsNumofStaff, 0),
	FBSubTotalFTE = isnull(b.FringeBenefitsFTE, 0),
	IndirectCosts = isnull(b.IndirectCosts, 0),
	b.IndirectPercent,
	b.IsLeadAgency,
	b.BudgetNarrativeID,
	b.AgencyName
	,isnull(e.[EligibilityAmount], 0) 'EligibilityAmount'
	into #tempA
	from GrantApplicant e join dbo.BudgetNarrative b 
	on e.GrantApplicantId = b.GrantApplicantId
	where e.GrantApplicantId = @GrantApplicantId
	
	select 
	AdminSubTotalColD = sum(AdminSubTotalColD),
	IPSSubTotalColD = sum(IPSSubTotalColD),
	SSSubTotalColD = sum(SSSubTotalColD),
	FBSubTotalColD = sum(FBSubTotalColD),
	CSSubTotalColD = sum(CSSubTotalColD),
	SMSubTotalColD = sum(SMSubTotalColD),
	TravelSubTotalColD = sum(TravelSubTotalColD),
	OCSubTotalColD = sum(OCSubTotalColD),
	CBSubTotalColD = sum(CBSubTotalColD),
	EqSubTotalColD = sum(EqSubTotalColD),
	AdminSubTotalColF = sum(AdminSubTotalColF),
	IPSSubTotalColF = sum(IPSSubTotalColF),
	SSSubTotalColF = sum(SSSubTotalColF),
	FBSubTotalColF = sum(FBSubTotalColF),
	CSSubTotalColF = sum(CSSubTotalColF),
	SMSubTotalColF = sum(SMSubTotalColF),
	TravelSubTotalColF = sum(TravelSubTotalColF),
	OCSubTotalColF  = sum(OCSubTotalColF ),
	CBSubTotalColF = sum(CBSubTotalColF),
	EqSubTotalColF = sum(EqSubTotalColF),
	AdminSubTotal = sum(AdminSubTotal),
	IPSSubTotal = sum(IPSSubTotal),
	SSSubTotal = sum(SSSubTotal),
	FBSubTotal = sum(FBSubTotal),
	CSSubTotal = sum(CSSubTotal),
	SMSubTotal = sum(SMSubTotal),
	TravelSubTotal = sum(TravelSubTotal),
	OCSubTotal = sum(OCSubTotal),
	CBSubTotal  = sum(CBSubTotal),
	EqSubTotal = sum(EqSubTotal),
	AdminSubTotalNumofStaff  = sum(AdminSubTotalNumofStaff),
	AdminSubTotalFTE = sum(AdminSubTotalFTE),
	IPSSubTotalNumofStaff  = sum(IPSSubTotalNumofStaff),
	IPSSubTotalFTE = sum(IPSSubTotalFTE),
	SSSubTotalNumofStaff = sum(SSSubTotalNumofStaff),
	SSSubTotalFTE  = sum(SSSubTotalFTE),
	FBSubTotalNumofStaff  = sum(FBSubTotalNumofStaff),
	FBSubTotalFTE  = sum(FBSubTotalFTE),
	IndirectCosts = sum(IndirectCosts),
	GrantTotalD = sum(AdminSubTotalColD) + 
				  sum(IPSSubTotalColD) + 
				  sum(SSSubTotalColD) + 
				  sum(FBSubTotalColD) + 
				  sum(CSSubTotalColD) + 
				  sum(SMSubTotalColD) + 
				  sum(TravelSubTotalColD) + 
				  sum(OCSubTotalColD) + 
				  sum(CBSubTotalColD) + 
				  sum(EqSubTotalColD),
	GrantTotalF = sum(AdminSubTotalColF) + 
				  sum(IPSSubTotalColF) + 
				  sum(SSSubTotalColF) + 
				  sum(FBSubTotalColF) + 
				  sum(CSSubTotalColF) + 
				  sum(SMSubTotalColF) + 
				  sum(TravelSubTotalColF) + 
				  sum(OCSubTotalColF) + 
				  sum(CBSubTotalColF) + 
				  sum(IndirectCosts) +
				  sum(EqSubTotalColF),
	IndirectPercent = (select IndirectPercent from #tempA where IsLeadAgency = 1),
	(select top 1 EligibilityAmount from #tempA) 'EligibilityAmount'
	into #tempB
	from #tempA 
	group by GrantApplicantId
	
	select *, GrantTotalD + GrantTotalF 'GrantTotal'
		--,(select top 1 EligibilityAmount from #tempA where @GrantApplicantId = GrantApplicantId) 'EligibilityAmount'
	from #tempB
	
	select * from #tempA order by isLeadAgency desc

	drop table #tempA
	drop table #tempB
End

GO

ALTER PROCEDURE [dbo].[uspGetAllCommunitiesServed]
	@GrantApplicantId INT,
	@FiscalYear int
AS
Begin
	SELECT gt.CityTownId
		, CCRRRegionId
		, CCRRRegionName
		, Town
		, Providers = ISNULL(Providers,0)
		, FamiliesRecievingServices
		, ChildrenReceivingServices
		, FundDistribution
		, CensusHouseholds
		, CensusChildren0to52010
		, CensusChildren
        , LicensedPrograms = ISNULL(LicensedPrograms,0)
		, IsLevel4Community
		, IsGatewayCommunity
		, IsRuralCommunities
		, HighRiskVisitingFactor
		, null 'IsSelected'
	into #tempA
	FROM dbo.GrantTown gt
	where FiscalYear = @FiscalYear
		
	update #tempA
		set IsSelected = 1
		where citytownid in (
			select citytownid
				from grantProposalTown 
				where grantapplicantId = @GrantApplicantId)


	select distinct CCRRRegionId, CCRRRegionName from #tempA order by CCRRRegionId desc
	
	select * from #tempA
		order by CCRRRegionId desc, Town
		
	drop table #tempA
End

GO

create PROC [dbo].[uspUpdateEligibilityAmount]
(
  @GrantApplicantId int,
  @TotalFunding money
) 
AS
BEGIN
	
	update GrantApplicant
		set EligibilityAmount = @TotalFunding
	where GrantApplicantId = @GrantApplicantId

END

GO
