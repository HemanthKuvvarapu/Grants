USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAdminViewData322BudgetNarrative]    Script Date: 12/21/2020 1:41:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAdminViewData322PCHPBudgetNarrative]
(
	@FundCode INT,
	@FiscalYear INT
)
AS

BEGIN
SELECT BudgetNarrativeID
,a.GrantApplicantId
,c.AgencyName
--,[Eligibility Amount] = '$'+convert(varchar,c.EligibilityAmount, 101)
--,AgencyEmail
--,AgencyPhone
,c.FiscalYear
,SupervisorDirectorNumofStaff AS 'Supervisor Director # of Staff'
,SupervisorDirectorFTE AS ' SupervisorDirectorFTE'
,SupervisorDirectorColD AS ' SupervisorDirectorProgramCosts'
,SupervisorDirectorColF AS ' SupervisorDirectorAdminCosts'
,SupervisorDirector AS ' SupervisorDirectorTotalGrantBudget'
,SupervisorDirectorDescr AS ' SupervisorDirectorDescr'
,ProjectCoordinatorNumofStaff AS ' Project Coordinator # of Staff'
,ProjectCoordinatorFTE AS ' ProjectCoordinatorFTE'
,ProjectCoordinatorColD AS ' ProjectCoordinatorProgramCosts'
,ProjectCoordinatorColF AS ' ProjectCoordinatorAdminCosts'
,ProjectCoordinator AS ' ProjectCoordinatorTotalGrantBudget'
,ProjectCoordinatorDescr AS ' ProjectCoordinatorDescr'
,StipendColD AS ' StipendProgramCosts'
,StipendColF AS ' StipendAdminCosts'
,Stipend AS ' StipendTotalGrantBudget'
,StipendDescr AS ' StipendDescr'
,OtherFTE AS ' OtherFTE'
,OtherNumofStaff AS ' Other # of Staff'
,OtherColD AS ' OtherProgramCosts'
,OtherColF AS ' OtherAdminCosts'
,Other AS ' OtherTotalGrantBudget'
,OtherDescr AS ' OtherDescr'
,AdminSubTotalNumofStaff  AS ' Admin Sub Total # of Staff'
,AdminSubTotalFTE AS ' AdminSubTotalFTE'
,AdminSubTotalColD AS ' Adminstrator Sub Total ProgramCosts'
,AdminSubTotalColF AS ' Adminstrator Admin Costs'
,AdminSubTotal AS ' Administrators SubTotal Grant Total Budget'
,AdvisorNumofStaff AS ' Advisor # of Staff'
,AdvisorFTE AS ' AdvisoryFTE'
,AdvisorColD AS ' Advisor Sub-Total ProgramCosts'
,AdvisorColF AS ' Advisor Admin Costs'
,Advisor AS ' Advisor SubTotal Grant Total Budget'
,AdvisorDescr AS ' AdvisorDescr'
,ClinicianNumofStaff AS ' Clinician # of Staff'
,ClinicianFTE AS ' ClinicianFTE'
,ClinicianColD AS ' ClinicianProgramCosts'
,ClinicianColF AS ' Clinician Admin Costs'
,Clinician AS ' Clinician SubTotal Grant Total Budget'
,ClinicianDescr AS ' ClinicianDescr'
,CoordinatorNumofStaff AS ' Coordinator # of Staff'
,CoordinatorFTE AS ' CoordinatorFTE'
,CoordinatorColD AS ' CoordinatorProgramCosts'
,CoordinatorColF AS ' Coordinator Admin Costs'
,Coordinator AS ' Coordinator SubTotal Grant Total Budget'
,CoordinatorDescr AS ' CoordinatorDescr'
,EducatorInstructorNumofStaff AS ' Educator # of Staff '
,EducatorInstructorFTE AS ' EducatorFTE'
,EducatorInstructorColD AS ' EducatorProgramCosts'
,EducatorInstructorColF AS ' Educator Admin Costs'
,EducatorInstructor AS ' Educator SubTotal Grant Total Budget'
,EducatorInstructorDescr AS ' EducatorInstructorDescr'
,HomeVisitorNumofStaff AS ' HomeVisitor # of Staff'
,HomeVisitorFTE AS ' HomeVisitorFTE'
,HomeVisitorColD AS ' HomeVisitorProgramCosts'
,HomeVisitorColF AS ' HomeVisitor Admin Costs'
,HomeVisitor AS ' HomeVisitor  Grant Total Budget'
,HomeVisitorDescr AS ' HomeVisitorDescr'
,SpecialistNumofStaff AS ' Specialist # of Staff'
,SpecialistFTE AS ' SpecialistFTE'
,SpecialistColD AS ' SpecialistProgramCosts'
,SpecialistColF AS ' Specialist Admin Costs'
,Specialist AS ' Specialist  Grant Total Budget'
,SpecialistDescr AS ' SpecialistDescr'
,IPSStipendColD AS ' IPSStipendProgramCosts'
,IPSStipendColF AS ' IPSStipend Admin Costs'
,IPSStipend AS ' IPSStipend  Grant Total Budget'
,IPSStipendDescr AS ' IPSStipendDescr'
,IPSOtherNumofStaff AS ' IPSOther  # of Staff'
,IPSOtherFTE AS ' IPSOtherFTE'
,IPSOtherColD AS ' IPSOtherProgramCosts'
,IPSOtherColF AS ' IPSOther Admin Costs'
,IPSOther AS ' IPS Other  Grant Total Budget'
,IPSOtherDescr AS ' IPSOtherDescr'
,IPSSubTotalNumofStaff AS ' IPSS Sub # of Staff '
,IPSSubTotalFTE AS ' IPSSSub-total FTE'
,IPSSubTotalColD AS ' IPSSSub-totalProgramCosts'
,IPSSubTotalColF AS ' IPSSSub-totalAdmin Costs'
,IPSSubTotal AS ' IPSSSub-total Grant Budget '
,AideParaprofessionalNumofStaff AS ' AideParaprofessional # of Staff'
,AideParaprofessionalFTE AS ' AideParaprofessionalFTE'
,AideParaprofessionalColD AS ' AideParaprofessionalProgramCosts'
,AideParaprofessionalColF AS ' AideParaprofessional Admin Costs'
,AideParaprofessional AS ' AideParaprofessional  Grant Total Budget '
,AideParaprofessionalDescr AS ' AideParaprofessionalDescr'
,SecretaryBookkeeperNumofStaff AS ' SecretaryBookkeeper # of Staff'
,SecretaryBookkeeperFTE AS ' SecretaryBookkeeperFTE'
,SecretaryBookkeeperColD AS ' SecretaryBookkeeperProgramCosts'
,SecretaryBookkeeperColF AS ' SecretaryBookkeeper Admin Costs'
,SecretaryBookkeeper AS ' SecretaryBookkeeper  Grant Total Budget'
,SecretaryBookkeeperDescr AS ' SecretaryBookkeeperDescr'
,SSStipendColD AS ' SSStipendProgramCosts'
,SSStipendColF AS ' SSStipend Admin Costs'
,SSStipend AS ' SSStipend  Grant Total Budget'
,SSStipendDescr AS ' SSStipendDescr'
,SSOtherFTE AS ' SSOtherFTE'
,SSOtherNumofStaff AS ' SSOther Sub # of Staff'
,SSOtherColD AS ' SSOtherProgramCosts'
,SSOtherColF AS ' SSOther Admin Costs'
,SSOther AS ' SSOther  Grant Total Budget'
,SSOtherDescr AS ' SSOtherDescr'
,SSSubTotalNumofStaff AS ' SS Sub # of Staff'
,SSSubTotalFTE AS ' SS Sub-total FTE'
,SSSubTotalColD AS ' SS Sub-total ProgramCosts'
,SSSubTotalColF AS ' SS Sub-total Admin Costs'
,SSSubTotal AS ' SS Sub-Total Grant Budget '
,FringeBenefitsNumofStaff AS ' FringeBenefits # of Staff'
,FringeBenefitsFTE AS ' FringeBenefitsFTE'
,FringeBenefitsColD AS ' FringeBenefitsProgramCosts'
,FringeBenefitsColF AS ' FringeBenefits Admin Costs'
,FringeBenefits AS ' FringeBenefits  Grant Total Budget'
,FringeBenefitsDescr AS ' FringeBenefitsDescr'
,FBSubTotalNumofStaff  = convert(int,FringeBenefitsNumofStaff)
,FBSubTotalFTE = convert(int,FringeBenefitsFTE  )
,FBSubTotalColD = convert(int,FringeBenefitsColD)
,FBSubTotalColF = convert(int,FringeBenefitsColF )
,CSAdvisorRate AS ' CSAdvisor Rate'
,CSAdvisorHrWkDayFlat AS ' CSAdvisor Hr/Day/Wk/Yr/Flat'
,CSAdvisorColD AS ' CSAdvisorProgramCosts'
,CSAdvisorColF AS ' CSAdvisor Admin Costs'
,CSAdvisor AS ' CSAdvisor  Grant Total Budget'
,CSAdvisorDescr AS ' CSAdvisorDescr'
,CSClinicianRate AS ' CSClinician Rate'
,CSClinicianHrWkDayFlat AS ' CSClinician Hr/Day/Wk/Yr/Flat'
,CSClinicianColD AS ' CSClinicianProgramCosts'
,CSClinicianColF AS ' CSClinician Admin Costs'
,CSClinician AS ' CSClinician  Grant Total Budget'
,CSClinicianDescr AS ' CSClinicianDescr'
,CSConsultantRate AS ' CSConsultant Rate'
,CSConsultantHrWkDayFlat AS ' CSConsultant Hr/Day/Wk/Yr/Flat'
,CSConsultantColD AS ' CSConsultantProgramCosts'
,CSConsultantColF AS ' CSConsultant Admin Costs'
,CSConsultant AS ' CSConsultant  Grant Total Budget'
,CSConsultantDescr AS ' CSConsultantDescr'
,CSEducatorInstructorRate AS ' CSEducatorInstructor Rate'
,CSEducatorInstructorHrWkDayFlat AS ' CSEducatorInstructor Hr/Day/Wk/Yr/Flat'
,CSEducatorInstructorColD AS ' CSEducatorInstructorProgramCosts'
,CSEducatorInstructorColF AS ' CSEducatorInstructor Admin Costs'
,CSEducatorInstructor AS ' CSEducatorInstructor  Grant Total Budget'
,CSEducatorInstructorDescr AS ' CSEducatorInstructorDescr'
,CSHomeVisitorRate AS ' CSHomeVisitor Rate'
,CSHomeVisitorHrWkDayFlat AS ' CSHomeVisitor Hr/Day/Wk/Yr/Flat'
,CSHomeVisitorColD AS ' CSHomeVisitorProgramCosts'
,CSHomeVisitorColF AS ' CSHomeVisitor Admin Costs'
,CSHomeVisitor AS ' CSHomeVisitor  Grant Total Budget'
,CSHomeVisitorDescr AS ' CSHomeVisitorDescr'
,CSSpecialistRate AS ' CSSpecialist Rate'
,CSSpecialistHrWkDayFlat AS ' CSSpecialist hr/day/wk/yr/flat'
,CSSpecialistColD AS ' CSSpecialistProgramCosts'
,CSSpecialistColF AS ' CSSpecialist Admin Costs'
,CSSpecialist AS ' CSSpecialist  Grant Total Budget'
,CSSpecialistDescr AS ' CSSpecialistDescr'
,CSSpeakerRate AS ' CSSpeaker Rate'
,CSSpeakerHrWkDayFlat AS ' CSSpeaker hr/day/wk/yr/flat'
,CSSpeakerColD AS ' CSSpeakerProgramCosts'
,CSSpeakerColF AS ' CSSpeaker Admin Costs'
,CSSpeaker AS ' CSSpeaker  Grant Total Budget'
,CSSpeakerDescr AS ' CSSpeakerDescr'
,CSSubstituteRate AS ' CSSubstitute Rate'
,CSSubstituteHrWkDayFlat AS ' CSSubstitute hr/day/wk/yr/flat'
,CSSubstituteColD AS ' CSSubstituteProgramCosts'
,CSSubstituteColF AS ' CSSubstitute Admin Costs'
,CSSubstitute AS ' CSSubstitute  Grant Total Budget'
,CSSubstituteDescr AS ' CSSubstituteDescr'
,CSStipendColD AS ' CSStipendProgram Costs'
,CSStipendColF AS ' CSStipend Admin Costs'
,CSStipend AS ' CSStipend  Grant Total Budget'
,CSStipendDescr AS ' CSStipendDescr'
,CSOtherRate AS ' CSOther Rate'
,CSOtherHrWkDayFlat AS ' CSOther Hr/day/wk/yr/flat'
,CSOtherColD AS ' CSOtherProgramCosts'
,CSOtherColF AS ' CSOther Admin Costs'
,CSOther AS ' CSOther  Grant Total Budget'
,CSOtherDescr AS ' CSOtherDescr'
,CSSubTotalColD AS ' CSSub-total Program Costs'
,CSSubTotalColF AS ' CS Sub-total Admin Costs'
,CSSubTotal AS ' CSSub-total Total Grant Budget'
,EducationalInstructionalMaterialsColD AS ' EducationalInstructionalMaterialsProgramCosts'
,EducationalInstructionalMaterialsColF AS ' EducationalInstructionalMaterials Admin Costs'
,EducationalInstructionalMaterials AS ' EducationalInstructionalMaterials  Grant Total Budget'
,EducationalInstructionalMaterialsDescr AS ' EducationalInstructionalMaterialsDescr'
,InstructionalTechnologySoftwareColD AS ' InstructionalTechnologySoftwareProgramCosts'
,InstructionalTechnologySoftwareColF AS ' InstructionalTechnologySoftware Admin Costs'
,InstructionalTechnologySoftware AS ' InstructionalTechnologySoftware  Grant Total Budget'
,InstructionalTechnologySoftwareDescr AS ' InstructionalTechnologySoftwareDescr'
,NonInstructionalSuppliesColD AS ' NonInstructionalSuppliesProgramCosts'
,NonInstructionalSuppliesColF AS ' NonInstructionalSupplies Admin Costs'
,NonInstructionalSupplies AS ' NonInstructionalSupplies  Grant Total Budget'
,NonInstructionalSuppliesDescr AS ' NonInstructionalSuppliesDescr'
,SMOtherColD AS ' SMOtherProgramCosts'
,SMOtherColF AS ' SMOther Admin Costs'
,SMOther AS ' SMOther  Grant Total Budget'
,SMOtherDescr AS ' SMOtherDescr'
,SMSubTotalColD AS ' SM Sub-total ProgramCosts'
,SMSubTotalColF AS ' SM Sub-total Admin Costs'
,SMSubTotal AS ' SM Sub-total Total Grant Budget'
,SupervisoryStaffMileageRate AS ' SupervisoryStaff Mileage Rate'
,SupervisoryStaffColD AS ' SupervisoryStaffProgramCosts'
,SupervisoryStaffColF AS ' SupervisoryStaff Admin Costs'
,SupervisoryStaff AS ' SupervisoryStaff  Grant Total Budget'
,SupervisoryStaffDescr AS ' SupervisoryStaffDescr'
,InstructionalStaffMileageRate AS ' InstructionalStaff Mileage Rate'
,InstructionalStaffColD AS ' InstructionalStaffProgramCosts'
,InstructionalStaffColF AS ' InstructionalStaff Admin Costs'
,InstructionalStaff AS ' InstructionalStaff SubTotal Grant Budget Total'
,InstructionalStaffDescr AS ' InstructionalStaffDescr'
,TravelOtherMileageRate AS ' TravelOther Mileage Rate'
,TravelOtherColD AS ' TravelOtherProgramCosts'
,TravelOtherColF AS ' TravelOther Admin Costs'
,TravelOther AS ' TravelOther SubTotal Grant Budget Total'
,TraveOtherDescr AS ' TraveOtherDescr'
,TravelSubTotalColD AS ' TravelSub-TotalProgramCosts'
,TravelSubTotalColF AS ' Travel Sub-total Admin  Costs'
,TravelSubTotal AS ' TravelSubTotalTotal Grant Budget'
,AdvertisingColD AS ' Advertising ProgramCosts '
,AdvertisingColF AS ' Advertising Admin Costs'
,Advertising AS ' Advertising Total Grant Budget '
,AdvertisingDescr AS ' AdvertisingDescr'
,EquipmentRentalColD AS ' EquipmentRentalProgramCosts'
,EquipmentRentalColF AS ' EquipmentRental Admin Costs'
,EquipmentRental AS ' EquipmentRental Total Grant Budget'
,EquipmentRentalDescr AS ' EquipmentRentalDescr'
,MaintenanceRepairsColD AS ' MaintenanceRepairsProgramCosts'
,MaintenanceRepairsColF AS ' MaintenanceRepairs Admin Costs'
,MaintenanceRepairs AS ' MaintenanceRepairs Total Grant Budget'
,MaintenanceRepairsDescr AS ' MaintenanceRepairsDescr'
,MembershipSubscriptionsColD AS ' MembershipSubscriptionsProgramCosts'
,MembershipSubscriptionsColF AS ' MembershipSubscriptions Admin Costs'
,MembershipSubscriptions AS ' MembershipSubscriptions Total Grant Budget'
,MembershipSubscriptionsDescr AS ' MembershipSubscriptionsDescr'
,PrintingReproductionColD AS ' PrintingReproductionProgramCosts'
,PrintingReproductionColF AS ' PrintingReproduction Admin Costs'
,PrintingReproduction AS ' PrintingReproduction Total Grant Budget'
,PrintingReproductionDescr AS ' PrintingReproductionDescr'
,StaffTrainingColD AS ' StaffTrainingProgramCosts'
,StaffTrainingColF AS ' StaffTraining Admin Costs'
,StaffTraining AS ' StaffTraining Total Grant Budget'
,StaffTrainingDescr AS ' StaffTrainingDescr'
,RentalofSpaceColD AS ' RentalofSpaceProgramCosts'
,RentalofSpaceColF AS ' RentalofSpace Admin Costs'
,RentalofSpace AS ' RentalofSpace Total Grant Budget'
,RentalofSpaceDescr AS ' RentalofSpaceDescr'
,TelephoneUtilitiesColD AS ' TelephoneUtilitiesProgramCosts'
,TelephoneUtilitiesColF AS ' TelephoneUtilities Admin Costs'
,TelephoneUtilities AS ' TelephoneUtilities Total Grant Budget'
,TelephoneUtilitiesDescr AS ' TelephoneUtilitiesDescr'
,DirectServiceTransportationColD AS ' DirectServiceTransportationProgramCosts'
,DirectServiceTransportationColF AS ' DirectServiceTransportation Admin Costs'
,DirectServiceTransportation AS ' DirectServiceTransportation Total Grant Budget'
,DirectServiceTransportationDescr AS ' DirectServiceTransportationDescr'
,OCOtherColD AS ' OCOtherProgramCosts'
,OCOtherColF AS ' OCOther Admin Costs'
,OCOther AS ' OCOther Total Grant budget'
,OCOtherDescr AS ' OCOtherDescr'
,OCSubTotalColD AS ' Other Costs Sub-total Program Costs '
,OCSubTotalColF AS ' Other Costs Sub-total Admin Costs '
,OCSubTotal AS ' OCSubTotal Total Grant Budget '
,ProfessionalDevelopOpportunitiesColD AS ' ProfessionalDevelopOpportunitiesProgramCosts '
,ProfessionalDevelopOpportunitiesColF AS ' ProfessionalDevelopOpportunities Admin Costs '
,ProfessionalDevelopOpportunities AS ' ProfessionalDevelopOpportunities Total Grant Budget '
,ProfessionalDevelopOpportunitiesDescr AS ' ProfessionalDevelopOpportunitiesDescr'
,ApplicationFeesColD AS ' ApplicationFeesProgramCosts'
,ApplicationFeesColF AS ' ApplicationFees Admin Costs'
,ApplicationFees AS ' ApplicationFees Total Grant Budget '
,ApplicationFeesDescr AS ' ApplicationFeesDescr'
,CEUCoursesColD AS ' CEUCoursesProgramCosts '
,CEUCoursesColF AS ' CEUCourses Admin Costs'
,CEUCourses AS ' CEUCourses Total Grant Budget '
,CEUCoursesDescr AS ' CEUCoursesDescr'
,CollegeCoursesColD AS ' CollegeCoursesProgramCosts '
,CollegeCoursesColF AS ' CollegeCourses Admin Costs '
,CollegeCourses AS ' CollegeCourses Total Grant Budget '
,CollegeCoursesDescr AS ' CollegeCoursesDescr'
,CBOtherColD AS ' CBOtherProgramCosts '
,CBOtherColF AS ' CBOther Admin Costs '
,CBOther AS ' CBOther Total Grant Budget '
,CBOtherDescr AS ' CBOtherDescr'
,CBSubTotalColD AS ' CBSubTotalProgramCosts '
,CBSubTotalColF AS ' CBSubTotal Admin Costs '
,CBSubTotal AS ' CBSubTotal Total Grant budget '
,IndirectPercent AS ' IndirectPercent'
,IndirectCosts  AS ' IndirectCosts'
,IndirectCostsSubTotal = convert(int  ,IndirectCosts )
,InstructionalEquipmentColD AS ' InstructionalEquipmentProgramcosts '
,InstructionalEquipmentColF AS ' InstructionalEquipment Admin Costs '
,InstructionalEquipment AS ' InstructionalEquipment Total Grant Budget '
,InstructionalEquipmentDescr AS ' InstructionalEquipmentDescr'
,NoninstructionalEquipmentColD AS ' NoninstructionalEquipmentProgramCosts '
,NoninstructionalEquipmentColF AS ' NoninstructionalEquipment Admin Costs '
,NoninstructionalEquipment AS ' NoninstructionalEquipment Total Grant Budget '
,NoninstructionalEquipmentDescr AS ' NoninstructionalEquipmentDescr'
,EqOtherColD AS ' EqOtherProgramCosts '
,EqOtherColF AS ' EqOther Admin Costs '
,EqOther AS ' EqOther Total Grant Budget '
,EqOtherDescr AS ' EqOtherDescr'
,EqSubTotalColD AS ' EqSubTotalProgramCosts '
,EqSubTotalColF AS ' EqSubTotal Admin Costs '
,EqSubTotal AS ' EqSubTotal Total Grant Budget '
,0 'Lead Agency PCHP Total Program Costs'
,0 'Lead Agency PCHP Total Admin Costs' 
,0 'Lead Agency PCHP Total'
--,Lead Agency PCHP Total Program Costs  AS ' --,Lead Agency PCHP Total Program Costs '
--,Lead Agency PCHP Total Admin Costs  AS ' --,Lead Agency PCHP Total Admin Costs '
,a.CreatedDate AS 'CreatedDate'
,a.ModifiedDate AS 'ModifiedDate'
into #tempt
 FROM [dbo].[BudgetNarrative] a inner JOIN
 dbo.GrantApplicant c on c.GrantApplicantId = a.GrantApplicantId 
 Where  a.[IsLeadAgency] = 0 And c.FundCode = @FundCode and c.FiscalYear = @FiscalYear
 and isnull(a.IsPCHP, 0) = 1
  Order by a.[AgencyName] asc
  
  update #tempt
		set [Lead Agency PCHP Total Program Costs] = 
		     [ Adminstrator Sub Total ProgramCosts]+
		     [ IPSSSub-totalProgramCosts] +
             [ SS Sub-total ProgramCosts] +
             [FBSubTotalColD] +
             [ CSSub-total Program Costs] +
             [ SM Sub-total ProgramCosts] +
             [ TravelSub-TotalProgramCosts] +
             [ Other Costs Sub-total Program Costs ] +
             [ CBOtherProgramCosts ] +
             [ EqSubTotalProgramCosts ], 
 
 [Lead Agency PCHP Total Admin Costs] = 
                 [ Adminstrator Admin Costs] +
                 [ IPSSSub-totalAdmin Costs] +
                 [FBSubTotalColF] +
                 [ SS Sub-total Admin Costs] +
                 [ CS Sub-total Admin Costs] +
                 [ SM Sub-total Admin Costs] +
                 [ Travel Sub-total Admin  Costs] +
                 [ OCOther Admin Costs] +
                 [ CBSubTotal Admin Costs ] +
                 [ EqSubTotal Admin Costs ] 

	update #tempt	
		set [Lead Agency PCHP Total] = [Lead Agency PCHP Total Program Costs] + [Lead Agency PCHP Total Admin Costs]

	select * from #tempt

	drop table #tempt
END

--------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAdminViewShowData]    Script Date: 12/21/2020 1:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[uspGetAdminView]    Script Date: 03/21/2014 10:53:17 ******/
ALTER proc [dbo].[uspGetAdminViewShowData]
(
	@type varchar(50),
	@FundCode INT,
	@FiscalYear INT
)
as
begin

if( @type = 'part1' )
	exec uspGetAdminView322GrantContacts @FundCode, @FiscalYear
else if(@type = 'part2' )
	exec uspGetAdminView322GetGrantTowns @FundCode, @FiscalYear
else if(@type = 'part3' )
	exec uspGetAdminView322GrantLanguagesServed @FundCode, @FiscalYear
else if( @type = 'part4' )
	exec uspGetAdminViewData322BudgetNarrative @FundCode, @FiscalYear
else if( @type = 'part4a' )
	exec uspGetAdminViewData322PCHPBudgetNarrative @FundCode, @FiscalYear
ELSE IF (@type = 'part5' )
	EXEC uspGetAdminViewData322SubcontractorBudgetNarrative @FundCode, @FiscalYear
ELSE IF ( @type = 'part6a' )
	EXEC uspGetAdminView322BudgetSummary @FundCode, @FiscalYear
ELSE IF ( @type = 'part6b' ) 
    EXEC uspGetAdminView322BudgetSummary @FundCode, @FiscalYear
--ELSE IF ( @type = 'part6c' )
--	EXEC uspGetAdminView237BudgetSummary	
ELSE IF ( @type = 'part7' )
	EXEC uspGetAdminView322GetNarrativeQuestions @FundCode, @FiscalYear
ELSE IF ( @type = 'part8' )
	EXEC uspGetAdminView322ProjectDeliverable @FundCode, @FiscalYear
ELSE IF ( @type = 'part10' )
	EXEC uspGetAdminView322GrantChecklist @FundCode, @FiscalYear
ELSE IF (@type = 'financialreport')
	EXEC uspGetAdminViewDataFinancialReport @FundCode, @FiscalYear
ELSE IF (@type = 'pchpfamilyform')
	EXEC uspGetAdminViewPCHPFamilyFormData @FundCode, @FiscalYear

   

end
----------------------------------------------------------------------------------------------------------------------------

