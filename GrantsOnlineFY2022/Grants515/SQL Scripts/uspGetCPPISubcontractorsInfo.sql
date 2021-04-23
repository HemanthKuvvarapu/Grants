USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPISubContractorsInfo]    Script Date: 11/7/2018 1:17:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspGetCPPISubContractorsInfo]
(
@GrantApplicantID INT,
@IsLeadAgency INT = 0
)

AS
BEGIN


SELECT sc.BudgetNarrativeID,
cd.SystemProviderID, cd.SubcontractorName, cd.ContactID, cd.SubcontractorContactName, 
SubcontractorAddress = SubcontractorAddress1 + ' ' + SubcontractorAddress2 + ', ' + SubcontractorCity + ', ' + SubcontractorState + ' ' + SubcontractorZipcode
,GrantTotal = sc.SupervisorDirector  
	+sc.ProjectCoordinator  
	+sc.Stipend  
	+sc.Other  
	+sc.Advisor  
	+sc.Clinician  
	+sc.Coordinator  
	+sc.EducatorInstructor  
	+sc.HomeVisitor  
	+sc.Specialist  
	+sc.IPSStipend  
	+sc.IPSOther  
	+sc.AideParaprofessional 
	+sc.SecretaryBookkeeper 
	+sc.SSStipend 
	+sc.SSOther 
	+sc.FringeBenefits 
	+sc.CSAdvisor 
	+sc.CSClinician 
	+sc.CSConsultant 
	+sc.CSEducatorInstructor 
	+sc.CSHomeVisitor 
	+sc.CSSpecialist 
	+sc.CSSpeaker 
	+sc.CSSubstitute 
	+sc.CSStipend 
	+sc.CSOther 
	+sc.EducationalInstructionalMaterials 
	+sc.InstructionalTechnologySoftware 
	+sc.NonInstructionalSupplies 
	+sc.SMOther
	+sc.SupervisoryStaff 
	+sc.InstructionalStaff 
	+sc.TravelOther 
	+sc.Advertising 
	+sc.EquipmentRental 
	+sc.MaintenanceRepairs 
	+sc.MembershipSubscriptions 
	+sc.PrintingReproduction 
	+sc.StaffTraining 
	+sc.RentalofSpace 
	+sc.TelephoneUtilities 
	+sc.DirectServiceTransportation 
	+sc.OCOther 
	+sc.ProfessionalDevelopOpportunities 
	+sc.ApplicationFees 
	+sc.CEUCourses 
	+sc.CollegeCourses 
	+sc.CBOther 
	+sc.IndirectCosts 
	+sc.InstructionalEquipment 
	+sc.NoninstructionalEquipment 
	+sc.EqOther,
	
GrantTotalColD = sc.SupervisorDirectorColD   
	+sc.ProjectCoordinatorColD   
	+sc.StipendColD   
	+sc.OtherColD   
	+sc.AdvisorColD   
	+sc.ClinicianColD  
	+sc.CoordinatorColD
	+sc.EducatorInstructorColD
	+sc.HomeVisitorColD
	+sc.SpecialistColD
	+sc.IPSStipendColD
	+sc.IPSOtherColD  
	+sc.AideParaprofessionalColD
	+sc.SecretaryBookkeeperColD
	+sc.SSStipendColD
	+sc.SSOtherColD 
	+sc.FringeBenefitsColD
	+sc.CSAdvisorColD
	+sc.CSClinicianColD
	+sc.CSConsultantColD
	+sc.CSEducatorInstructorColD
	+sc.CSHomeVisitorColD
	+sc.CSSpecialistColD
	+sc.CSSpeakerColD
	+sc.CSSubstituteColD
	+sc.CSStipendColD
	+sc.CSOtherColD
	+sc.EducationalInstructionalMaterialsColD
	+sc.InstructionalTechnologySoftwareColD
	+sc.NonInstructionalSuppliesColD
	+sc.SMOtherColD
	+sc.SupervisoryStaffColD
	+sc.InstructionalStaffColD
	+sc.TravelOtherColD 
	+sc.AdvertisingColD
	+sc.EquipmentRentalColD
	+sc.MaintenanceRepairsColD
	+sc.MembershipSubscriptionsColD
	+sc.PrintingReproductionColD
	+sc.StaffTrainingColD
	+sc.RentalofSpaceColD
	+sc.TelephoneUtilitiesColD
	+sc.DirectServiceTransportationColD
	+sc.OCOtherColD 
	+sc.ProfessionalDevelopOpportunitiesColD
	+sc.ApplicationFeesColD
	+sc.CEUCoursesColD
	+sc.CollegeCoursesColD
	+sc.CBOtherColD 
	+sc.IndirectCosts
	+sc.InstructionalEquipmentColD 
	+sc.NoninstructionalEquipmentColD
	+sc.EqOtherColD ,
	
	
	
GrantTotalColF= sc.SupervisorDirectorColF
	+sc.ProjectCoordinatorColF
	+sc.StipendColF 
	+sc.OtherColF 
	+sc.AdvisorColF
	+sc.ClinicianColF
	+sc.CoordinatorColF
	+sc.EducatorInstructorColF
	+sc.HomeVisitorColF
	+sc.SpecialistColF
	+sc.IPSStipendColF
	+sc.IPSOtherColF  
	+sc.AideParaprofessionalColF
	+sc.SecretaryBookkeeperColF
	+sc.SSStipendColF
	+sc.SSOtherColF
	+sc.FringeBenefitsColF 
	+sc.CSAdvisorColF
	+sc.CSClinicianColF
	+sc.CSConsultantColF
	+sc.CSEducatorInstructorColF
	+sc.CSHomeVisitorColF
	+sc.CSSpecialistColF
	+sc.CSSpeakerColF
	+sc.CSSubstituteColF
	+sc.CSStipendColF
	+sc.CSOtherColF
	+sc.EducationalInstructionalMaterialsColF
	+sc.InstructionalTechnologySoftwareColF
	+sc.NonInstructionalSuppliesColF
	+sc.SMOtherColF
	+sc.SupervisoryStaffColF
	+sc.InstructionalStaffColF
	+sc.TravelOtherColF
	+sc.AdvertisingColF
	+sc.EquipmentRentalColF
	+sc.MaintenanceRepairsColF
	+sc.MembershipSubscriptionsColF
	+sc.PrintingReproductionColF
	+sc.StaffTrainingColF
	+sc.RentalofSpaceColF
	+sc.TelephoneUtilitiesColF
	+sc.DirectServiceTransportationColF
	+sc.OCOtherColF 
	+sc.ProfessionalDevelopOpportunitiesColF
	+sc.ApplicationFeesColF
	+sc.CEUCoursesColF
	+sc.CollegeCoursesColF
	+sc.CBOtherColF 
	+sc.IndirectCostsColF 
	+sc.InstructionalEquipmentColF 
	+sc.NoninstructionalEquipmentColF
	+sc.EqOtherColF,
ErrorCount,
WarningCount
FROM  dbo.BudgetNarrative sc 
LEFT JOIN dbo.CPPISubcontractorContactData cd ON cd.GrantApplicantID = sc.GrantApplicantID AND cd.BudgetNarrativeID = sc.BudgetNarrativeID
WHERE sc.GrantApplicantId = @GrantApplicantID
  AND sc.IsLeadAgency = @IsLeadAgency
  AND ISNULL(sc.isPCHP,0) = 0

END



GO

