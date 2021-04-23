USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetBudgetNarrativeData]    Script Date: 6/8/2020 12:37:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
[uspGetBudgetNarrativeData] 1808
*/

ALTER PROC [dbo].[uspGetBudgetNarrativeData]
(
	@GrantApplicantId INT,
	@IsLeadAgency TINYINT,
	@IsPCHP INT = 0
)
AS
BEGIN
	SELECT b.BudgetNarrativeID,
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
	Ancillary ,
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
	b.AncillarySubTotal,
	
	CASE b.CSAdvisorHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSAdvisorHrWkDayFlat END CSAdvisorHrWkDayFlatDesc,
	CASE b.CSClinicianHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSClinicianHrWkDayFlat END CSClinicianHrWkDayFlatDesc,
	CASE b.CSConsultantHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSConsultantHrWkDayFlat END CSConsultantHrWkDayFlatDesc, 
	CASE b.CSEducatorInstructorHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSEducatorInstructorHrWkDayFlat END CSEducatorInstructorHrWkDayFlatDesc,
	CASE b.CSHomeVisitorHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSHomeVisitorHrWkDayFlat END CSHomeVisitorHrWkDayFlatDesc,
	CASE b.CSSpecialistHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSSpecialistHrWkDayFlat END CSSpecialistHrWkDayFlatDesc,
	CASE b.CSSpeakerHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSSpeakerHrWkDayFlat END CSSpeakerHrWkDayFlatDesc,
	CASE b.CSSubstituteHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSSubstituteHrWkDayFlat END CSSubstituteHrWkDayFlatDesc,
	CASE b.CSOtherHrWkDayFlat
	WHEN 0 THEN '' 
	WHEN 10000 THEN 'Hour'
	WHEN 10001 THEN 'Day'
	WHEN 10002 THEN 'Week'
	WHEN 10003 THEN 'Year'
	WHEN 10004 THEN 'Flat'
	ELSE b.CSOtherHrWkDayFlat END CSOtherHrWkDayFlatDesc,
	
	AdminSubTotalColD  = CONVERT(INT , 	SupervisorDirectorColD   
					+ProjectCoordinatorColD   
					+StipendColD   
					+OtherColD ),  
	IPSSubTotalColD  = CONVERT(INT , 	AdvisorColD   
					+ClinicianColD  
					+CoordinatorColD
					+EducatorInstructorColD
					+HomeVisitorColD
					+SpecialistColD
					+IPSStipendColD
					+IPSOtherColD),  
	SSSubTotalColD  = CONVERT(INT  ,	AideParaprofessionalColD
					+SecretaryBookkeeperColD
					+SSStipendColD
					+SSOtherColD), 
	FBSubTotalColD = CONVERT(INT  ,	FringeBenefitsColD),
	CSSubTotalColD   = CONVERT(INT  ,	CSAdvisorColD
					+CSClinicianColD
					+CSConsultantColD
					+CSEducatorInstructorColD
					+CSHomeVisitorColD
					+CSSpecialistColD
					+CSSpeakerColD
					+CSSubstituteColD
					+CSStipendColD
					+CSOtherColD),
	SMSubTotalColD   = CONVERT(INT  ,	InstructionalTechnologySoftwareColD
					+NonInstructionalSuppliesColD
					+SMOtherColD 
					+EducationalInstructionalMaterialsColD),
	TravelSubTotalColD = CONVERT(INT  ,	SupervisoryStaffColD
					+InstructionalStaffColD
					+TravelOtherColD), 
	OCSubTotalColD  = CONVERT(INT  ,	AdvertisingColD
					+EquipmentRentalColD
					+MaintenanceRepairsColD
					+MembershipSubscriptionsColD
					+PrintingReproductionColD
					+StaffTrainingColD
					+RentalofSpaceColD
					+TelephoneUtilitiesColD
					+DirectServiceTransportationColD
					+OCOtherColD ),
	CBSubTotalColD   = CONVERT(INT  ,	ProfessionalDevelopOpportunitiesColD
					+ApplicationFeesColD
					+CEUCoursesColD
					+CollegeCoursesColD
					+CBOtherColD ),
	 EqSubTotalColD = CONVERT(INT ,	InstructionalEquipmentColD 
					+NoninstructionalEquipmentColD
					+EqOtherColD ),	
	AncillarySubTotalColD = CONVERT(INT, AncillaryColD),
	AdminSubTotalColF = CONVERT(INT , 	SupervisorDirectorColF
					+ProjectCoordinatorColF
					+StipendColF
					+OtherColF), 
	IPSSubTotalColF  = CONVERT(INT , 	AdvisorColF
					+ClinicianColF
					+CoordinatorColF
					+EducatorInstructorColF
					+HomeVisitorColF
					+SpecialistColF
					+IPSStipendColF
					+IPSOtherColF),  
	SSSubTotalColF  = CONVERT(INT  ,	AideParaprofessionalColF
					+SecretaryBookkeeperColF
					+SSStipendColF
					+SSOtherColF),
	FBSubTotalColF = CONVERT(INT  ,	FringeBenefitsColF ),
	CSSubTotalColF   = CONVERT(INT  ,	CSAdvisorColF
					+CSClinicianColF
					+CSConsultantColF
					+CSEducatorInstructorColF
					+CSHomeVisitorColF
					+CSSpecialistColF
					+CSSpeakerColF
					+CSSubstituteColF
					+CSStipendColF
					+CSOtherColF),
	SMSubTotalColF   = CONVERT(INT  ,	InstructionalTechnologySoftwareColF
					+NonInstructionalSuppliesColF
					+SMOtherColF
					+EducationalInstructionalMaterialsColF),
	TravelSubTotalColF = CONVERT(INT  ,	SupervisoryStaffColF
					+InstructionalStaffColF
					+TravelOtherColF),
	OCSubTotalColF  = CONVERT(INT  ,	AdvertisingColF
					+EquipmentRentalColF
					+MaintenanceRepairsColF
					+MembershipSubscriptionsColF
					+PrintingReproductionColF
					+StaffTrainingColF
					+RentalofSpaceColF
					+TelephoneUtilitiesColF
					+DirectServiceTransportationColF
					+OCOtherColF ),
	CBSubTotalColF   = CONVERT(INT  ,	ProfessionalDevelopOpportunitiesColF
					+ApplicationFeesColF
					+CEUCoursesColF
					+CollegeCoursesColF
					+CBOtherColF ),
	EqSubTotalColF = CONVERT(INT ,	InstructionalEquipmentColF 
					+NoninstructionalEquipmentColF
					+EqOtherColF ),
	AncillarySubTotalColF = CONVERT(INT, AncillaryColF),
	AdminSubTotalNumofStaff  = CONVERT(INT , 	SupervisorDirectorNumofStaff 
					+ProjectCoordinatorNumofStaff 
					+OtherNumofStaff),   
	IPSSubTotalNumofStaff   = CONVERT(INT , 	AdvisorNumofStaff 
					+ClinicianNumofStaff 
					+CoordinatorNumofStaff 
					+EducatorInstructorNumofStaff 
					+HomeVisitorNumofStaff 
					+SpecialistNumofStaff
					+IPSOtherNumofStaff),   
	SSSubTotalNumofStaff   = CONVERT(INT  ,	AideParaprofessionalNumofStaff 
					+SecretaryBookkeeperNumofStaff 
					+SSOtherNumofStaff ),
	FBSubTotalNumofStaff  = CONVERT(INT  ,	FringeBenefitsNumofStaff  ),
	
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
	AllocationFund = CONVERT(VARCHAR, CONVERT(MONEY, e.[EligibilityAmount])),
	BudgetTotal = CONVERT(VARCHAR, CONVERT(MONEY,ISNULL(b.GrantTotal, 0)), 1),
	b.NumberOfChildren
	INTO #tempA
	FROM GrantApplicant e JOIN BudgetNarrative b
	ON e.GrantApplicantId = b.GrantApplicantId
	WHERE b.GrantApplicantId = @GrantApplicantId
	  AND b.IsLeadAgency = @IsLeadAgency
	  AND ISNULL(b.IsPCHP, 0) = @IsPCHP
	  
	UPDATE #tempA
		SET GrantTotalColD = ISNULL(AdminSubTotalColD,0) + 
							ISNULL(IPSSubTotalColD,0) +
							ISNULL(SSSubTotalColD,0) + 
							ISNULL(FBSubTotalColD,0) +
							ISNULL(CSSubTotalColD,0) +
							ISNULL(SMSubTotalColD,0) +
							ISNULL(TravelSubTotalColD,0) + 
							ISNULL(OCSubTotalColD,0) +
							ISNULL(CBSubTotalColD,0) +
							ISNULL(EqSubTotalColD,0) +
							ISNULL(AncillarySubTotalColD,0),

		    GrantTotalColF = ISNULL(AdminSubTotalColF,0) + 
							ISNULL(IPSSubTotalColF,0) +  
							ISNULL(SSSubTotalColF,0) +
							ISNULL(FBSubTotalColF,0) +
							ISNULL(CSSubTotalColF,0) +
							ISNULL(SMSubTotalColF,0) +
							ISNULL(TravelSubTotalColF,0) +
							ISNULL(OCSubTotalColF,0) +
							ISNULL(CBSubTotalColF,0) +
							ISNULL(EqSubTotalColF,0) +
							ISNULL(AncillarySubTotalColF,0) +
							ISNULL(IndirectCostsSubTotal,0)

	UPDATE #tempA	
		SET GrantTotal = ISNULL(GrantTotalColD,0) + ISNULL(GrantTotalColF,0)

	SELECT * FROM #tempA

	DROP TABLE #tempA
END

--exec uspGetBudgetNarrativeData 3429, 1
GO


