USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspGetBudgetNarrativeDataAmendment]    Script Date: 11/20/2020 9:46:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
[uspGetBudgetNarrativeDataAmendment] 4045, 1
*/

ALTER proc [dbo].[uspGetBudgetNarrativeDataAmendment]
(
	@BudgetNarrativeID int,
	@Version int
)
as
begin
	Select 
	BudgetNarrativeID,
	SupervisorDirectorDescr  ,
	ProjectCoordinatorDescr  ,
	StipendDescr  ,
	OtherDescr  ,
	AdvisorDescr  ,
	ClinicianDescr  ,
	CoordinatorDescr  ,
	EducatorInstructorDescr  ,
	HomeVisitorDescr  ,
	SpecialistDescr  ,
	IPSStipendDescr  ,
	IPSOtherDescr  ,
	AideParaprofessionalDescr ,
	SecretaryBookkeeperDescr ,
	SSStipendDescr ,
	SSOtherDescr ,
	FringeBenefitsDescr ,
	CSAdvisorDescr ,
	CSClinicianDescr ,
	CSConsultantDescr ,
	CSEducatorInstructorDescr ,
	CSHomeVisitorDescr ,
	CSSpecialistDescr ,
	CSSpeakerDescr ,
	CSSubstituteDescr ,
	CSStipendDescr ,
	CSOtherDescr ,
	EducationalInstructionalMaterialsDescr ,
	InstructionalTechnologySoftwareDescr ,
	NonInstructionalSuppliesDescr ,
	SMOtherDescr ,
	SupervisoryStaffDescr ,
	InstructionalStaffDescr ,
	TraveOtherDescr ,
	AdvertisingDescr ,
	EquipmentRentalDescr ,
	MaintenanceRepairsDescr ,
	MembershipSubscriptionsDescr ,
	PrintingReproductionDescr ,
	StaffTrainingDescr ,
	RentalofSpaceDescr ,
	TelephoneUtilitiesDescr ,
	DirectServiceTransportationDescr ,
	OCOtherDescr ,
	ProfessionalDevelopOpportunitiesDescr ,
	ApplicationFeesDescr ,
	CEUCoursesDescr ,
	CollegeCoursesDescr ,
	CBOtherDescr ,
	IndirectCostsDescr,
	InstructionalEquipmentDescr ,
	NoninstructionalEquipmentDescr ,
	EqOtherDescr ,
	AncillaryDescr ,
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
	AncillaryColD ,
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
	AncillaryColF ,
	SupervisorDirectorNumofStaff ,
	SupervisorDirectorFTE ,
	ProjectCoordinatorNumofStaff ,
	ProjectCoordinatorFTE ,
	OtherNumofStaff ,
	OtherFTE ,
	AdvisorNumofStaff ,
	AdvisorFTE ,
	ClinicianNumofStaff ,
	ClinicianFTE ,
	CoordinatorNumofStaff ,
	CoordinatorFTE ,
	EducatorInstructorNumofStaff ,
	EducatorInstructorFTE ,
	HomeVisitorNumofStaff ,
	HomeVisitorFTE ,
	SpecialistNumofStaff ,
	SpecialistFTE ,
	IPSOtherNumofStaff ,
	IPSOtherFTE ,
	AideParaprofessionalNumofStaff ,
	AideParaprofessionalFTE ,
	SecretaryBookkeeperNumofStaff ,
	SecretaryBookkeeperFTE ,
	SSOtherNumofStaff ,
	SSOtherFTE ,
	FringeBenefitsNumofStaff ,
	FringeBenefitsFTE ,
	CSAdvisorRate ,
	CSClinicianRate ,
	CSConsultantRate ,
	CSEducatorInstructorRate ,
	CSHomeVisitorRate ,
	CSSpecialistRate ,
	CSSpeakerRate ,
	CSSubstituteRate ,
	CSOtherRate ,
	SupervisoryStaffMileageRate ,
	InstructionalStaffMileageRate ,
	TravelOtherMileageRate ,
	IndirectPercent,
	IndirectCosts,
	
	CSAdvisorHrWkDayFlat ,
	CSClinicianHrWkDayFlat ,
	CSConsultantHrWkDayFlat ,
	CSEducatorInstructorHrWkDayFlat ,
	CSHomeVisitorHrWkDayFlat ,
	CSSpecialistHrWkDayFlat ,
	CSSpeakerHrWkDayFlat ,
	CSSubstituteHrWkDayFlat ,
	CSOtherHrWkDayFlat
	into #Amendment
	from BudgetNarrativeAmendment
	where BudgetNarrativeID = @BudgetNarrativeID
	  and [Version] = @Version


	Select 
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
	AncillaryColD ,
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
	AncillaryColF ,
	SupervisorDirectorNumofStaff ,
	SupervisorDirectorFTE ,
	ProjectCoordinatorNumofStaff ,
	ProjectCoordinatorFTE ,
	OtherNumofStaff ,
	OtherFTE ,
	AdvisorNumofStaff ,
	AdvisorFTE ,
	ClinicianNumofStaff ,
	ClinicianFTE ,
	CoordinatorNumofStaff ,
	CoordinatorFTE ,
	EducatorInstructorNumofStaff ,
	EducatorInstructorFTE ,
	HomeVisitorNumofStaff ,
	HomeVisitorFTE ,
	SpecialistNumofStaff ,
	SpecialistFTE ,
	IPSOtherNumofStaff ,
	IPSOtherFTE ,
	AideParaprofessionalNumofStaff ,
	AideParaprofessionalFTE ,
	SecretaryBookkeeperNumofStaff ,
	SecretaryBookkeeperFTE ,
	SSOtherNumofStaff ,
	SSOtherFTE ,
	FringeBenefitsNumofStaff ,
	FringeBenefitsFTE ,
	SupervisoryStaffMileageRate ,
	InstructionalStaffMileageRate ,
	TravelOtherMileageRate ,
	IndirectCosts
	into #tempOriginal
	from BudgetNarrative
	where BudgetNarrativeID = @BudgetNarrativeID
	union
	Select 
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
	AncillaryColD ,
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
	AncillaryColF ,
	SupervisorDirectorNumofStaff ,
	SupervisorDirectorFTE ,
	ProjectCoordinatorNumofStaff ,
	ProjectCoordinatorFTE ,
	OtherNumofStaff ,
	OtherFTE ,
	AdvisorNumofStaff ,
	AdvisorFTE ,
	ClinicianNumofStaff ,
	ClinicianFTE ,
	CoordinatorNumofStaff ,
	CoordinatorFTE ,
	EducatorInstructorNumofStaff ,
	EducatorInstructorFTE ,
	HomeVisitorNumofStaff ,
	HomeVisitorFTE ,
	SpecialistNumofStaff ,
	SpecialistFTE ,
	IPSOtherNumofStaff ,
	IPSOtherFTE ,
	AideParaprofessionalNumofStaff ,
	AideParaprofessionalFTE ,
	SecretaryBookkeeperNumofStaff ,
	SecretaryBookkeeperFTE ,
	SSOtherNumofStaff ,
	SSOtherFTE ,
	FringeBenefitsNumofStaff ,
	FringeBenefitsFTE ,
	SupervisoryStaffMileageRate ,
	InstructionalStaffMileageRate ,
	TravelOtherMileageRate ,
	IndirectCosts
	from BudgetNarrativeAmendment
	where BudgetNarrativeID = @BudgetNarrativeID
	  and [Version] < @Version
	
	Select 
	@BudgetNarrativeID 'BudgetNarrativeID',
	Sum(SupervisorDirectorColD) 'SupervisorDirectorColD',
	Sum(ProjectCoordinatorColD) 'ProjectCoordinatorColD',
	Sum(StipendColD) 'StipendColD',
	Sum(OtherColD) 'OtherColD',
	Sum(AdvisorColD) 'AdvisorColD',
	Sum(ClinicianColD) 'ClinicianColD',
	Sum(CoordinatorColD) 'CoordinatorColD',
	Sum(EducatorInstructorColD) 'EducatorInstructorColD',
	Sum(HomeVisitorColD) 'HomeVisitorColD',
	Sum(SpecialistColD) 'SpecialistColD',
	Sum(IPSStipendColD) 'IPSStipendColD',
	Sum(IPSOtherColD) 'IPSOtherColD',
	Sum(AideParaprofessionalColD) 'AideParaprofessionalColD' ,
	Sum(SecretaryBookkeeperColD) 'SecretaryBookkeeperColD' ,
	Sum(SSStipendColD) 'SSStipendColD' ,
	Sum(SSOtherColD ) 'SSOtherColD' ,
	Sum(FringeBenefitsColD ) 'FringeBenefitsColD' ,
	Sum(CSAdvisorColD ) 'CSAdvisorColD' ,
	Sum(CSClinicianColD ) 'CSClinicianColD' ,
	Sum(CSConsultantColD ) 'CSConsultantColD' ,
	Sum(CSEducatorInstructorColD ) 'CSEducatorInstructorColD' ,
	Sum(CSHomeVisitorColD ) 'CSHomeVisitorColD' ,
	Sum(CSSpecialistColD ) 'CSSpecialistColD' ,
	Sum(CSSpeakerColD ) 'CSSpeakerColD' ,
	Sum(CSSubstituteColD ) 'CSSubstituteColD' ,
	Sum(CSStipendColD ) 'CSStipendColD' ,
	Sum(CSOtherColD ) 'CSOtherColD' ,
	Sum(EducationalInstructionalMaterialsColD ) 'EducationalInstructionalMaterialsColD' ,
	Sum(InstructionalTechnologySoftwareColD ) 'InstructionalTechnologySoftwareColD' ,
	Sum(NonInstructionalSuppliesColD ) 'NonInstructionalSuppliesColD' ,
	Sum(SMOtherColD ) 'SMOtherColD' ,
	Sum(SupervisoryStaffColD ) 'SupervisoryStaffColD' ,
	Sum(InstructionalStaffColD ) 'InstructionalStaffColD' ,
	Sum(TravelOtherColD ) 'TravelOtherColD' ,
	Sum(AdvertisingColD ) 'AdvertisingColD' ,
	Sum(EquipmentRentalColD ) 'EquipmentRentalColD' ,
	Sum(MaintenanceRepairsColD ) 'MaintenanceRepairsColD' ,
	Sum(MembershipSubscriptionsColD ) 'MembershipSubscriptionsColD' ,
	Sum(PrintingReproductionColD ) 'PrintingReproductionColD' ,
	Sum(StaffTrainingColD ) 'StaffTrainingColD' ,
	Sum(RentalofSpaceColD ) 'RentalofSpaceColD' ,
	Sum(TelephoneUtilitiesColD ) 'TelephoneUtilitiesColD' ,
	Sum(DirectServiceTransportationColD ) 'DirectServiceTransportationColD' ,
	Sum(OCOtherColD ) 'OCOtherColD' ,
	Sum(ProfessionalDevelopOpportunitiesColD ) 'ProfessionalDevelopOpportunitiesColD' ,
	Sum(ApplicationFeesColD ) 'ApplicationFeesColD' ,
	Sum(CEUCoursesColD ) 'CEUCoursesColD' ,
	Sum(CollegeCoursesColD ) 'CollegeCoursesColD' ,
	Sum(CBOtherColD ) 'CBOtherColD' ,
	Sum(InstructionalEquipmentColD ) 'InstructionalEquipmentColD' ,
	Sum(NoninstructionalEquipmentColD ) 'NoninstructionalEquipmentColD' ,
	Sum(EqOtherColD ) 'EqOtherColD' ,
	SUM(AncillaryColD) 'AncillaryColD',
	Sum(SupervisorDirectorColF ) 'SupervisorDirectorColF' ,
	Sum(ProjectCoordinatorColF ) 'ProjectCoordinatorColF' ,
	Sum(StipendColF ) 'StipendColF' ,
	Sum(OtherColF ) 'OtherColF' ,
	Sum(AdvisorColF ) 'AdvisorColF' ,
	Sum(ClinicianColF ) 'ClinicianColF' ,
	Sum(CoordinatorColF ) 'CoordinatorColF' ,
	Sum(EducatorInstructorColF ) 'EducatorInstructorColF' ,
	Sum(HomeVisitorColF ) 'HomeVisitorColF' ,
	Sum(SpecialistColF ) 'SpecialistColF' ,
	Sum(IPSStipendColF ) 'IPSStipendColF' ,
	Sum(IPSOtherColF ) 'IPSOtherColF' ,
	Sum(AideParaprofessionalColF ) 'AideParaprofessionalColF' ,
	Sum(SecretaryBookkeeperColF ) 'SecretaryBookkeeperColF' ,
	Sum(SSStipendColF ) 'SSStipendColF' ,
	Sum(SSOtherColF ) 'SSOtherColF' ,
	Sum(FringeBenefitsColF ) 'FringeBenefitsColF' ,
	Sum(CSAdvisorColF ) 'CSAdvisorColF' ,
	Sum(CSClinicianColF ) 'CSClinicianColF' ,
	Sum(CSConsultantColF ) 'CSConsultantColF' ,
	Sum(CSEducatorInstructorColF ) 'CSEducatorInstructorColF' ,
	Sum(CSHomeVisitorColF ) 'CSHomeVisitorColF' ,
	Sum(CSSpecialistColF ) 'CSSpecialistColF' ,
	Sum(CSSpeakerColF ) 'CSSpeakerColF' ,
	Sum(CSSubstituteColF ) 'CSSubstituteColF' ,
	Sum(CSStipendColF ) 'CSStipendColF' ,
	Sum(CSOtherColF ) 'CSOtherColF' ,
	Sum(EducationalInstructionalMaterialsColF ) 'EducationalInstructionalMaterialsColF' ,
	Sum(InstructionalTechnologySoftwareColF ) 'InstructionalTechnologySoftwareColF' ,
	Sum(NonInstructionalSuppliesColF ) 'NonInstructionalSuppliesColF' ,
	Sum(SMOtherColF ) 'SMOtherColF' ,
	Sum(SupervisoryStaffColF ) 'SupervisoryStaffColF' ,
	Sum(InstructionalStaffColF ) 'InstructionalStaffColF' ,
	Sum(TravelOtherColF ) 'TravelOtherColF' ,
	Sum(AdvertisingColF ) 'AdvertisingColF' ,
	Sum(EquipmentRentalColF ) 'EquipmentRentalColF' ,
	Sum(MaintenanceRepairsColF ) 'MaintenanceRepairsColF' ,
	Sum(MembershipSubscriptionsColF ) 'MembershipSubscriptionsColF' ,
	Sum(PrintingReproductionColF ) 'PrintingReproductionColF' ,
	Sum(StaffTrainingColF ) 'StaffTrainingColF' ,
	Sum(RentalofSpaceColF ) 'RentalofSpaceColF' ,
	Sum(TelephoneUtilitiesColF ) 'TelephoneUtilitiesColF' ,
	Sum(DirectServiceTransportationColF ) 'DirectServiceTransportationColF' ,
	Sum(OCOtherColF ) 'OCOtherColF' ,
	Sum(ProfessionalDevelopOpportunitiesColF ) 'ProfessionalDevelopOpportunitiesColF' ,
	Sum(ApplicationFeesColF ) 'ApplicationFeesColF' ,
	Sum(CEUCoursesColF ) 'CEUCoursesColF' ,
	Sum(CollegeCoursesColF ) 'CollegeCoursesColF' ,
	Sum(CBOtherColF ) 'CBOtherColF' ,
	Sum(InstructionalEquipmentColF ) 'InstructionalEquipmentColF' ,
	Sum(NoninstructionalEquipmentColF ) 'NoninstructionalEquipmentColF' ,
	Sum(EqOtherColF ) 'EqOtherColF' ,
	SUM(AncillaryColF) 'AncillaryColF',
	Sum(SupervisorDirectorNumofStaff ) 'SupervisorDirectorNumofStaff' ,
	Sum(SupervisorDirectorFTE ) 'SupervisorDirectorFTE' ,
	Sum(ProjectCoordinatorNumofStaff ) 'ProjectCoordinatorNumofStaff' ,
	Sum(ProjectCoordinatorFTE ) 'ProjectCoordinatorFTE' ,
	Sum(OtherNumofStaff ) 'OtherNumofStaff' ,
	Sum(OtherFTE ) 'OtherFTE' ,
	Sum(AdvisorNumofStaff ) 'AdvisorNumofStaff' ,
	Sum(AdvisorFTE ) 'AdvisorFTE' ,
	Sum(ClinicianNumofStaff ) 'ClinicianNumofStaff' ,
	Sum(ClinicianFTE ) 'ClinicianFTE' ,
	Sum(CoordinatorNumofStaff ) 'CoordinatorNumofStaff' ,
	Sum(CoordinatorFTE ) 'CoordinatorFTE' ,
	Sum(EducatorInstructorNumofStaff ) 'EducatorInstructorNumofStaff' ,
	Sum(EducatorInstructorFTE ) 'EducatorInstructorFTE' ,
	Sum(HomeVisitorNumofStaff ) 'HomeVisitorNumofStaff' ,
	Sum(HomeVisitorFTE ) 'HomeVisitorFTE' ,
	Sum(SpecialistNumofStaff ) 'SpecialistNumofStaff' ,
	Sum(SpecialistFTE ) 'SpecialistFTE' ,
	Sum(IPSOtherNumofStaff ) 'IPSOtherNumofStaff' ,
	Sum(IPSOtherFTE ) 'IPSOtherFTE' ,
	Sum(AideParaprofessionalNumofStaff ) 'AideParaprofessionalNumofStaff' ,
	Sum(AideParaprofessionalFTE ) 'AideParaprofessionalFTE' ,
	Sum(SecretaryBookkeeperNumofStaff ) 'SecretaryBookkeeperNumofStaff' ,
	Sum(SecretaryBookkeeperFTE ) 'SecretaryBookkeeperFTE' ,
	Sum(SSOtherNumofStaff ) 'SSOtherNumofStaff' ,
	Sum(SSOtherFTE ) 'SSOtherFTE' ,
	Sum(FringeBenefitsNumofStaff ) 'FringeBenefitsNumofStaff' ,
	Sum(FringeBenefitsFTE ) 'FringeBenefitsFTE' ,
	Sum(SupervisoryStaffMileageRate ) 'SupervisoryStaffMileageRate' ,
	Sum(InstructionalStaffMileageRate ) 'InstructionalStaffMileageRate' ,
	Sum(TravelOtherMileageRate) 'TravelOtherMileageRate',
	Sum(IndirectCosts) 'IndirectCosts'
	into #Original
	from #tempOriginal

if (@Version = 1)
	begin
		select 
		BudgetNarrativeID ,
		CSAdvisorRate ,
		CSAdvisorHrWkDayFlat ,
		CSClinicianRate ,
		CSClinicianHrWkDayFlat ,
		CSConsultantRate ,
		CSConsultantHrWkDayFlat ,
		CSEducatorInstructorRate ,
		CSEducatorInstructorHrWkDayFlat ,
		CSHomeVisitorRate ,
		CSHomeVisitorHrWkDayFlat ,
		CSSpecialistRate ,
		CSSpecialistHrWkDayFlat ,
		CSSpeakerRate ,
		CSSpeakerHrWkDayFlat ,
		CSSubstituteRate ,
		CSSubstituteHrWkDayFlat ,
		CSOtherRate ,
		CSOtherHrWkDayFlat,
		IndirectPercent
		into #tempOriginal3
		from BudgetNarrative
			where BudgetNarrativeID = @BudgetNarrativeID
	end
else if (@Version = 2)
	begin
		select 
		BudgetNarrativeID ,
		CSAdvisorRate ,
		CSAdvisorHrWkDayFlat ,
		CSClinicianRate ,
		CSClinicianHrWkDayFlat ,
		CSConsultantRate ,
		CSConsultantHrWkDayFlat ,
		CSEducatorInstructorRate ,
		CSEducatorInstructorHrWkDayFlat ,
		CSHomeVisitorRate ,
		CSHomeVisitorHrWkDayFlat ,
		CSSpecialistRate ,
		CSSpecialistHrWkDayFlat ,
		CSSpeakerRate ,
		CSSpeakerHrWkDayFlat ,
		CSSubstituteRate ,
		CSSubstituteHrWkDayFlat ,
		CSOtherRate ,
		CSOtherHrWkDayFlat,
		IndirectPercent
		into #tempOriginal4
		from BudgetNarrativeAmendment
			where BudgetNarrativeID = @BudgetNarrativeID
			  and [Version] = 1
	end
else 
	begin
		select 
		BudgetNarrativeID ,
		CSAdvisorRate ,
		CSAdvisorHrWkDayFlat ,
		CSClinicianRate ,
		CSClinicianHrWkDayFlat ,
		CSConsultantRate ,
		CSConsultantHrWkDayFlat ,
		CSEducatorInstructorRate ,
		CSEducatorInstructorHrWkDayFlat ,
		CSHomeVisitorRate ,
		CSHomeVisitorHrWkDayFlat ,
		CSSpecialistRate ,
		CSSpecialistHrWkDayFlat ,
		CSSpeakerRate ,
		CSSpeakerHrWkDayFlat ,
		CSSubstituteRate ,
		CSSubstituteHrWkDayFlat ,
		CSOtherRate ,
		CSOtherHrWkDayFlat,
		IndirectPercent
		into #tempOriginal5
		from BudgetNarrativeAmendment
			where BudgetNarrativeID = @BudgetNarrativeID
			  and [Version] = 2
	end
		
	if (@Version = 1)
	begin
		select a.*, b.*, (select AgencyName from BudgetNarrative where BudgetNarrativeID = @BudgetNarrativeID) 'AgencyName'
			from #Original a join #tempOriginal3 b 
			on a.BudgetNarrativeID = b.BudgetNarrativeID
			
		drop table #tempOriginal3
	end
	else if (@Version = 2)
	begin
		select a.*, b.*, (select AgencyName from BudgetNarrative where BudgetNarrativeID = @BudgetNarrativeID) 'AgencyName' 
			from #Original a join #tempOriginal4 b 
			on a.BudgetNarrativeID = b.BudgetNarrativeID
			
		drop table #tempOriginal4
	end
	else 
	begin
		select a.*, b.*, (select AgencyName from BudgetNarrative where BudgetNarrativeID = @BudgetNarrativeID) 'AgencyName' 
			from #Original a join #tempOriginal5 b 
			on a.BudgetNarrativeID = b.BudgetNarrativeID
			
		drop table #tempOriginal5
	end
		
	select * from #Amendment
	
	Select 
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
	AncillaryColD ,
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
	AncillaryColF,
	SupervisorDirectorNumofStaff ,
	SupervisorDirectorFTE ,
	ProjectCoordinatorNumofStaff ,
	ProjectCoordinatorFTE ,
	OtherNumofStaff ,
	OtherFTE ,
	AdvisorNumofStaff ,
	AdvisorFTE ,
	ClinicianNumofStaff ,
	ClinicianFTE ,
	CoordinatorNumofStaff ,
	CoordinatorFTE ,
	EducatorInstructorNumofStaff ,
	EducatorInstructorFTE ,
	HomeVisitorNumofStaff ,
	HomeVisitorFTE ,
	SpecialistNumofStaff ,
	SpecialistFTE ,
	IPSOtherNumofStaff ,
	IPSOtherFTE ,
	AideParaprofessionalNumofStaff ,
	AideParaprofessionalFTE ,
	SecretaryBookkeeperNumofStaff ,
	SecretaryBookkeeperFTE ,
	SSOtherNumofStaff ,
	SSOtherFTE ,
	FringeBenefitsNumofStaff ,
	FringeBenefitsFTE ,
	SupervisoryStaffMileageRate ,
	InstructionalStaffMileageRate ,
	TravelOtherMileageRate,
	IndirectCosts
	into #tempA
	from #Amendment
	union
	Select 
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
	AncillaryColD ,
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
	AncillaryColF ,
	SupervisorDirectorNumofStaff ,
	SupervisorDirectorFTE ,
	ProjectCoordinatorNumofStaff ,
	ProjectCoordinatorFTE ,
	OtherNumofStaff ,
	OtherFTE ,
	AdvisorNumofStaff ,
	AdvisorFTE ,
	ClinicianNumofStaff ,
	ClinicianFTE ,
	CoordinatorNumofStaff ,
	CoordinatorFTE ,
	EducatorInstructorNumofStaff ,
	EducatorInstructorFTE ,
	HomeVisitorNumofStaff ,
	HomeVisitorFTE ,
	SpecialistNumofStaff ,
	SpecialistFTE ,
	IPSOtherNumofStaff ,
	IPSOtherFTE ,
	AideParaprofessionalNumofStaff ,
	AideParaprofessionalFTE ,
	SecretaryBookkeeperNumofStaff ,
	SecretaryBookkeeperFTE ,
	SSOtherNumofStaff ,
	SSOtherFTE ,
	FringeBenefitsNumofStaff ,
	FringeBenefitsFTE ,
	SupervisoryStaffMileageRate ,
	InstructionalStaffMileageRate ,
	TravelOtherMileageRate,
	IndirectCosts
	from #Original


	select 
	AdminSubTotalColD  = convert(int , 	sum(SupervisorDirectorColD)   
					+sum(ProjectCoordinatorColD)   
					+sum(StipendColD)   
					+sum(OtherColD)),  
	IPSSubTotalColD  = convert(int , 	sum(AdvisorColD)
					+sum(ClinicianColD)  
					+sum(CoordinatorColD)
					+sum(EducatorInstructorColD)
					+sum(HomeVisitorColD)
					+sum(SpecialistColD)
					+sum(IPSStipendColD)
					+sum(IPSOtherColD)),  
	SSSubTotalColD  = convert(int  ,	sum(AideParaprofessionalColD)
					+sum(SecretaryBookkeeperColD)
					+sum(SSStipendColD)
					+sum(SSOtherColD)), 
	FBSubTotalColD = convert(int  ,	sum(FringeBenefitsColD)),
	CSSubTotalColD   = convert(int  ,	sum(CSAdvisorColD)
					+sum(CSClinicianColD)
					+sum(CSConsultantColD)
					+sum(CSEducatorInstructorColD)
					+sum(CSHomeVisitorColD)
					+sum(CSSpecialistColD)
					+sum(CSSpeakerColD)
					+sum(CSSubstituteColD)
					+sum(CSStipendColD)
					+sum(CSOtherColD)),
	SMSubTotalColD   = convert(int  ,	sum(InstructionalTechnologySoftwareColD)
					+sum(NonInstructionalSuppliesColD)
					+sum(SMOtherColD) 
					+sum(EducationalInstructionalMaterialsColD)),
	TravelSubTotalColD = convert(int  ,	sum(SupervisoryStaffColD)
					+sum(InstructionalStaffColD)
					+sum(TravelOtherColD)), 
	OCSubTotalColD  = convert(int  ,	sum(AdvertisingColD)
					+sum(EquipmentRentalColD)
					+sum(MaintenanceRepairsColD)
					+sum(MembershipSubscriptionsColD)
					+sum(PrintingReproductionColD)
					+sum(StaffTrainingColD)
					+sum(RentalofSpaceColD)
					+sum(TelephoneUtilitiesColD)
					+sum(DirectServiceTransportationColD)
					+sum(OCOtherColD)),
	CBSubTotalColD   = convert(int  ,	sum(ProfessionalDevelopOpportunitiesColD)
					+sum(ApplicationFeesColD)
					+sum(CEUCoursesColD)
					+sum(CollegeCoursesColD)
					+sum(CBOtherColD)),
	 EqSubTotalColD = convert(int ,	sum(InstructionalEquipmentColD)
					+sum(NoninstructionalEquipmentColD)
					+sum(EqOtherColD)),	
	AncillarySubTotalColD = CONVERT(int , sum(AncillaryColD)),
	AdminSubTotalColF = convert(int , 	sum(SupervisorDirectorColF)
					+sum(ProjectCoordinatorColF)
					+sum(StipendColF)
					+sum(OtherColF)), 
	IPSSubTotalColF  = convert(int , 	sum(AdvisorColF)
					+sum(ClinicianColF)
					+sum(CoordinatorColF)
					+sum(EducatorInstructorColF)
					+sum(HomeVisitorColF)
					+sum(SpecialistColF)
					+sum(IPSStipendColF)
					+sum(IPSOtherColF)),  
	SSSubTotalColF  = convert(int  ,	sum(AideParaprofessionalColF)
					+sum(SecretaryBookkeeperColF)
					+sum(SSStipendColF)
					+sum(SSOtherColF)),
	FBSubTotalColF = convert(int  ,	sum(FringeBenefitsColF) ),
	CSSubTotalColF   = convert(int  ,	sum(CSAdvisorColF)
					+sum(CSClinicianColF)
					+sum(CSConsultantColF)
					+sum(CSEducatorInstructorColF)
					+sum(CSHomeVisitorColF)
					+sum(CSSpecialistColF)
					+sum(CSSpeakerColF)
					+sum(CSSubstituteColF)
					+sum(CSStipendColF)
					+sum(CSOtherColF)),
	SMSubTotalColF   = convert(int  ,	sum(InstructionalTechnologySoftwareColF)
					+sum(NonInstructionalSuppliesColF)
					+sum(SMOtherColF)
					+sum(EducationalInstructionalMaterialsColF)),
	TravelSubTotalColF = convert(int  ,	sum(SupervisoryStaffColF)
					+sum(InstructionalStaffColF)
					+sum(TravelOtherColF)),
	OCSubTotalColF  = convert(int  ,	sum(AdvertisingColF)
					+sum(EquipmentRentalColF)
					+sum(MaintenanceRepairsColF)
					+sum(MembershipSubscriptionsColF)
					+sum(PrintingReproductionColF)
					+sum(StaffTrainingColF)
					+sum(RentalofSpaceColF)
					+sum(TelephoneUtilitiesColF)
					+sum(DirectServiceTransportationColF)
					+sum(OCOtherColF) ),
	CBSubTotalColF   = convert(int  ,	sum(ProfessionalDevelopOpportunitiesColF)
					+sum(ApplicationFeesColF)
					+sum(CEUCoursesColF)
					+sum(CollegeCoursesColF)
					+sum(CBOtherColF)),
	EqSubTotalColF = convert(int ,	sum(InstructionalEquipmentColF)
					+sum(NoninstructionalEquipmentColF)
					+sum(EqOtherColF)),
	AncillarySubTotalColF = CONVERT(int, sum(AncillaryColF)),
	AdminSubTotalNumofStaff  = convert(int , 	sum(SupervisorDirectorNumofStaff)
					+sum(ProjectCoordinatorNumofStaff)
					+sum(OtherNumofStaff)),   
	IPSSubTotalNumofStaff   = convert(int , sum(AdvisorNumofStaff)
					+sum(ClinicianNumofStaff)
					+sum(CoordinatorNumofStaff)
					+sum(EducatorInstructorNumofStaff)
					+sum(HomeVisitorNumofStaff)
					+sum(SpecialistNumofStaff)
					+sum(IPSOtherNumofStaff)),   
	SSSubTotalNumofStaff   = convert(int  ,	sum(AideParaprofessionalNumofStaff)
					+sum(SecretaryBookkeeperNumofStaff)
					+sum(SSOtherNumofStaff)),
	FBSubTotalNumofStaff  = convert(int  ,	sum(FringeBenefitsNumofStaff)),
	
	SupervisorDirector =  sum(SupervisorDirectorColD) + sum(SupervisorDirectorColF),
	ProjectCoordinator = sum(ProjectCoordinatorColD) + sum(ProjectCoordinatorColF),
	Stipend = sum(StipendColD) + sum(StipendColF),
	Other = sum(OtherColD) + sum(OtherColF) ,
	Advisor = sum(AdvisorColD) + sum(AdvisorColF),
	Clinician = sum(ClinicianColD) + sum(ClinicianColF),
	Coordinator = sum(CoordinatorColD) + sum(CoordinatorColF),
	EducatorInstructor = sum(EducatorInstructorColD) + sum(EducatorInstructorColF),
	HomeVisitor = sum(HomeVisitorColD) + sum(HomeVisitorColF) ,
	Specialist = sum(SpecialistColD) + sum(SpecialistColF),
	IPSStipend = sum(IPSStipendColD) + sum(IPSStipendColF) ,
	IPSOther = sum(IPSOtherColD) + sum(IPSOtherColF),
	AideParaprofessional = sum(AideParaprofessionalColD) + sum(AideParaprofessionalColF),
	SecretaryBookkeeper = sum(SecretaryBookkeeperColD) + sum(SecretaryBookkeeperColF),
	SSStipend = sum(SSStipendColD) + sum(SSStipendColF),
	SSOther = sum(SSOtherColD) + sum(SSOtherColF),
	FringeBenefits = sum(FringeBenefitsColD) + sum(FringeBenefitsColF),
	CSAdvisor = sum(CSAdvisorColD) + sum(CSAdvisorColF),
	CSClinician = sum(CSClinicianColD) + sum(CSClinicianColF),
	CSConsultant = sum(CSConsultantColD) + sum(CSConsultantColF),
	CSEducatorInstructor = sum(CSEducatorInstructorColD) + sum(CSEducatorInstructorColF),
	CSHomeVisitor = sum(CSHomeVisitorColD) + sum(CSHomeVisitorColF),
	CSSpecialist = sum(CSSpecialistColD) + sum(CSSpecialistColF),
	CSSpeaker = sum(CSSpeakerColD) + sum(CSSpeakerColF),
	CSSubstitute = sum(CSSubstituteColD) + sum(CSSubstituteColF),
	CSStipend = sum(CSStipendColD) + sum(CSStipendColF),
	CSOther = sum(CSOtherColD) + sum(CSOtherColF),
	EducationalInstructionalMaterials = sum(EducationalInstructionalMaterialsColD) + sum(EducationalInstructionalMaterialsColF),
	InstructionalTechnologySoftware = sum(InstructionalTechnologySoftwareColD) + sum(InstructionalTechnologySoftwareColF),
	NonInstructionalSupplies = sum(NonInstructionalSuppliesColD) + sum(NonInstructionalSuppliesColF),
	SMOther = sum(SMOtherColD) + sum(SMOtherColF),
	SupervisoryStaff = sum(SupervisoryStaffColD) + sum(SupervisoryStaffColF),
	InstructionalStaff = sum(InstructionalStaffColD) + sum(InstructionalStaffColF),
	TravelOther = sum(TravelOtherColD) + sum(TravelOtherColF),
	Advertising = sum(AdvertisingColD) + sum(AdvertisingColF),
	EquipmentRental = sum(EquipmentRentalColD) + sum(EquipmentRentalColF),
	MaintenanceRepairs = sum(MaintenanceRepairsColD) + sum(MaintenanceRepairsColF),
	MembershipSubscriptions = sum(MembershipSubscriptionsColD) + sum(MembershipSubscriptionsColF),
	PrintingReproduction = sum(PrintingReproductionColD) + sum(PrintingReproductionColF),
	StaffTraining = sum(StaffTrainingColD) + sum(StaffTrainingColF),
	RentalofSpace = sum(RentalofSpaceColD) + sum(RentalofSpaceColF),
	TelephoneUtilities = sum(TelephoneUtilitiesColD) + sum(TelephoneUtilitiesColF),
	DirectServiceTransportation = sum(DirectServiceTransportationColD) + sum(DirectServiceTransportationColF),
	OCOther = sum(OCOtherColD) + sum(OCOtherColF),
	ProfessionalDevelopOpportunities = sum(ProfessionalDevelopOpportunitiesColD) + sum(ProfessionalDevelopOpportunitiesColF),
	ApplicationFees = sum(ApplicationFeesColD) + sum(ApplicationFeesColF),
	CEUCourses = sum(CEUCoursesColD) + sum(CEUCoursesColF),
	CollegeCourses = sum(CollegeCoursesColD) + sum(CollegeCoursesColF),
	CBOther = sum(CBOtherColD) + sum(CBOtherColF),
	IndirectCosts = sum(IndirectCosts),
	InstructionalEquipment = sum(InstructionalEquipmentColD) + sum(InstructionalEquipmentColF),
	NoninstructionalEquipment = sum(NoninstructionalEquipmentColD) + sum(NoninstructionalEquipmentColF),
	EqOther = sum(EqOtherColD) + sum(EqOtherColF),
	Ancillary = SUM(AncillaryColD) + SUM(AncillaryColF),
	
	SupervisorDirectorFTE = sum(SupervisorDirectorFTE),
	ProjectCoordinatorFTE = sum(ProjectCoordinatorFTE),
	OtherFTE = sum(OtherFTE),
	AdvisorFTE = sum(AdvisorFTE),
	ClinicianFTE = sum(ClinicianFTE),
	CoordinatorFTE = sum(CoordinatorFTE),
	EducatorInstructorFTE = sum(EducatorInstructorFTE),
	HomeVisitorFTE = sum(HomeVisitorFTE),
	SpecialistFTE = sum(SpecialistFTE),
	IPSOtherFTE = sum(IPSOtherFTE),
	AideParaprofessionalFTE = sum(AideParaprofessionalFTE),
	SecretaryBookkeeperFTE = sum(SecretaryBookkeeperFTE),
	SSOtherFTE = sum(SSOtherFTE),
	FringeBenefitsFTE = sum(FringeBenefitsFTE)
	into #tempB
	from #tempA
	
	select *,
		AdminSubTotal = convert(int , 	SupervisorDirector  
					+ProjectCoordinator  
					+Stipend  
					+Other),  
			IPSSubTotal  = convert(int , 	Advisor  
					+Clinician  
					+Coordinator  
					+EducatorInstructor  
					+HomeVisitor  
					+Specialist  
					+IPSStipend  
					+IPSOther),  
			SSSubTotal  = convert(int  ,	AideParaprofessional 
					+SecretaryBookkeeper 
					+SSStipend 
					+SSOther), 
			FBSubTotal = convert(int  ,	FringeBenefits ),
			CSSubTotal   = convert(int  ,	CSAdvisor 
					+CSClinician 
					+CSConsultant 
					+CSEducatorInstructor 
					+CSHomeVisitor 
					+CSSpecialist 
					+CSSpeaker 
					+CSSubstitute 
					+CSStipend 
					+CSOther),
			SMSubTotal   = convert(int  ,	InstructionalTechnologySoftware 
					+NonInstructionalSupplies 
					+SMOther
					+EducationalInstructionalMaterials),
			TravelSubTotal = convert(int  ,	SupervisoryStaff 
					+InstructionalStaff 
					+TravelOther), 
			OCSubTotal  = convert(int  ,	Advertising 
					+EquipmentRental 
					+MaintenanceRepairs 
					+MembershipSubscriptions 
					+PrintingReproduction 
					+StaffTraining 
					+RentalofSpace 
					+TelephoneUtilities 
					+DirectServiceTransportation 
					+OCOther ),
			CBSubTotal   = convert(int  ,	ProfessionalDevelopOpportunities 
					+ApplicationFees 
					+CEUCourses 
					+CollegeCourses 
					+CBOther ),
			EqSubTotal = convert(int ,	InstructionalEquipment 
					+NoninstructionalEquipment 
					+EqOther ), 
			AncillarySubTotal = convert(int , Ancillary),
			
			IndirectCostsSubTotal = IndirectCosts,
			AdminSubTotalFTE  = convert(decimal(18, 2) , 	SupervisorDirectorFTE
					+ProjectCoordinatorFTE
					+OtherFTE ),
			IPSSubTotalFTE  = convert(decimal(18, 2) , 	AdvisorFTE
					+ClinicianFTE
					+CoordinatorFTE
					+EducatorInstructorFTE
					+HomeVisitorFTE
					+SpecialistFTE
					+IPSOtherFTE), 
			SSSubTotalFTE  = convert(decimal(18, 2)  ,	AideParaprofessionalFTE
					+SecretaryBookkeeperFTE
					+SSOtherFTE), 
			FBSubTotalFTE = convert(decimal(18, 2)  ,	FringeBenefitsFTE),
			GrantTotalColD = AdminSubTotalColD + 
							IPSSubTotalColD +
							SSSubTotalColD + 
							FBSubTotalColD +
							CSSubTotalColD +
							SMSubTotalColD +
							TravelSubTotalColD + 
							OCSubTotalColD +
							CBSubTotalColD +
							EqSubTotalColD +
							AncillarySubTotalColD,
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
							AncillarySubTotalColF +
							IndirectCosts,
			GrantTotal = AdminSubTotalColD + 
							IPSSubTotalColD +
							SSSubTotalColD + 
							FBSubTotalColD +
							CSSubTotalColD +
							SMSubTotalColD +
							TravelSubTotalColD + 
							OCSubTotalColD +
							CBSubTotalColD +
							EqSubTotalColD +
							AncillarySubTotalColD +
							AdminSubTotalColF + 
							IPSSubTotalColF +  
							SSSubTotalColF +
							FBSubTotalColF +
							CSSubTotalColF +
							SMSubTotalColF +
							TravelSubTotalColF +
							OCSubTotalColF +
							CBSubTotalColF +
							EqSubTotalColF +
							AncillarySubTotalColF +
							IndirectCosts
		from #tempB
		
		
	select 
	AllocationFund = Convert(varchar, CONVERT(money, e.[EligibilityAmount])),
	BudgetTotal = Convert(varchar, CONVERT(money,isnull(b.GrantTotal, 0)), 1),
	Version=@Version,
	OriginalBudgetAlloc=Convert(varchar, CONVERT(money, e.OriginalBudgetAlloc)),
	Amendment1Eligibility=Convert(varchar, CONVERT(money, e.Amendment1Eligibility)),
	Amendment2Eligibility=Convert(varchar, CONVERT(money, e.Amendment2Eligibility)),
	Amendment3Eligibility=Convert(varchar, CONVERT(money, e.Amendment3Eligibility))
	from GrantApplicant e join BudgetNarrative b
	on e.GrantApplicantId = b.GrantApplicantId
	where b.BudgetNarrativeID = @BudgetNarrativeID
	  
	select 
	b.ErrorCount,
	b.WarningCount
	from GrantApplicant e join BudgetNarrativeAmendment b
	on e.GrantApplicantId = b.GrantApplicantId
	where b.BudgetNarrativeID = @BudgetNarrativeID
	  and b.[Version] = @Version
	

	drop table #tempA
	drop table #tempB
	
	
	drop table #Original
	drop table #tempOriginal
	drop table #Amendment
End

