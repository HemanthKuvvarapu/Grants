USE [GrantOnlineFY2016]
GO
/****** Object:  StoredProcedure [dbo].[uspGetContactAndBudgetNarrativeSubcontractorData]    Script Date: 10/30/2018 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[uspGetContactAndBudgetNarrativeSubcontractorData]
(
@SCID int,
@GrantApplicantId INT
)
as
begin
select 
AgencyName,
AgencyEmail,
AgencyPhone,
AgencyContactName,
sd.ContactID,
sd.SubContractorName,
sd.SubcontractorContactName,
sd.SubcontractorAddress1,
sd.SubcontractorAddress2,
SubcontractorCityStateZip = sd.SubcontractorCity + ',' + sd.SubcontractorState + ' ' + sd.SubcontractorZipcode,
sd.SubcontractorCity,
sd.SubcontractorState,
sd.SubcontractorZipcode,
sd.SubcontractorPhone,
sd.SubcontractorFAX,
sd.SubcontractorEmail,
sd.IsFiscalContact,
SupervisorDirector ,
SupervisorDirectorDescr ,
ProjectCoordinator ,
ProjectCoordinatorDescr ,
Stipend ,
StipendDescr ,
Other ,
OtherDescr ,
--AdminSubTotal ,
Advisor ,
AdvisorDescr ,
Clinician ,
ClinicianDescr ,
Coordinator ,
CoordinatorDescr ,
EducatorInstructor ,
EducatorInstructorDescr ,
HomeVisitor ,
HomeVisitorDescr ,
Specialist ,
SpecialistDescr ,
IPSStipend ,
IPSStipendDescr ,
IPSOther ,
IPSOtherDescr ,
--IPSSubTotal ,
AideParaprofessional ,
AideParaprofessionalDescr ,
SecretaryBookkeeper ,
SecretaryBookkeeperDescr ,
SSStipend ,
SSStipendDescr ,
SSOther ,
SSOtherDescr ,
--SSSubTotal ,
FringeBenefits ,
FringeBenefitsDescr ,
--FBSubTotal ,
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
--CSSubTotal ,
EducationalInstructionalMaterials ,
EducationalInstructionalMaterialsDescr ,
InstructionalTechnologySoftware ,
InstructionalTechnologySoftwareDescr ,
NonInstructionalSupplies ,
NonInstructionalSuppliesDescr ,
SMOther ,
SMOtherDescr ,
--SMSubTotal ,
SupervisoryStaff ,
SupervisoryStaffDescr ,
InstructionalStaff ,
InstructionalStaffDescr ,
TravelOther ,
TraveOtherDescr ,
--TravelSubTotal ,
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
--OCSubTotal ,
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
--CBSubTotal ,
IndirectPercent ,
IndirectCosts ,
--IndirectCostsSubTotal ,
IndirectCostsDescr,
InstructionalEquipment ,
InstructionalEquipmentDescr ,
NoninstructionalEquipment ,
NoninstructionalEquipmentDescr ,
EqOther ,
EqOtherDescr ,
Ancillary ,
AncillaryDescr ,
--EqSubTotal ,
SupervisorDirectorColD ,
ProjectCoordinatorColD ,
StipendColD ,
OtherColD ,
--AdminSubTotalColD ,
AdvisorColD ,
ClinicianColD ,
CoordinatorColD ,
EducatorInstructorColD ,
HomeVisitorColD ,
SpecialistColD ,
IPSStipendColD ,
IPSOtherColD ,
--IPSSubTotalColD ,
AideParaprofessionalColD ,
SecretaryBookkeeperColD ,
SSStipendColD ,
SSOtherColD ,
--SSSubTotalColD ,
FringeBenefitsColD ,
--FBSubTotalColD ,
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
--CSSubTotalColD ,
EducationalInstructionalMaterialsColD ,
InstructionalTechnologySoftwareColD ,
NonInstructionalSuppliesColD ,
SMOtherColD ,
--SMSubTotalColD ,
SupervisoryStaffColD ,
InstructionalStaffColD ,
TravelOtherColD ,
--TravelSubTotalColD ,
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
--OCSubTotalColD ,
ProfessionalDevelopOpportunitiesColD ,
ApplicationFeesColD ,
CEUCoursesColD ,
CollegeCoursesColD ,
CBOtherColD ,
--CBSubTotalColD ,
--IndirectPercentColD ,
--IndirectCostsColD ,
--IndirectCostsSubTotalColD ,
InstructionalEquipmentColD ,
NoninstructionalEquipmentColD ,
EqOtherColD ,
AncillaryColD ,
--EqSubTotalColD ,
SupervisorDirectorColF ,
ProjectCoordinatorColF ,
StipendColF ,
OtherColF ,
--AdminSubTotalColF ,
AdvisorColF ,
ClinicianColF ,
CoordinatorColF ,
EducatorInstructorColF ,
HomeVisitorColF ,
SpecialistColF ,
IPSStipendColF ,
IPSOtherColF ,
--IPSSubTotalColF ,
AideParaprofessionalColF ,
SecretaryBookkeeperColF ,
SSStipendColF ,
SSOtherColF ,
--SSSubTotalColF ,
FringeBenefitsColF ,
--FBSubTotalColF ,
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
--CSSubTotalColF ,
EducationalInstructionalMaterialsColF ,
InstructionalTechnologySoftwareColF ,
NonInstructionalSuppliesColF ,
SMOtherColF ,
--SMSubTotalColF ,
SupervisoryStaffColF ,
InstructionalStaffColF ,
TravelOtherColF ,
--TravelSubTotalColF ,
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
--OCSubTotalColF ,
ProfessionalDevelopOpportunitiesColF ,
ApplicationFeesColF ,
CEUCoursesColF ,
CollegeCoursesColF ,
CBOtherColF ,
--CBSubTotalColF ,
--IndirectPercentColF ,
--IndirectCostsColF ,
--IndirectCostsSubTotalColF ,
InstructionalEquipmentColF ,
NoninstructionalEquipmentColF ,
EqOtherColF ,
AncillaryColF ,
--EqSubTotalColF ,
SupervisorDirectorNumofStaff ,
SupervisorDirectorFTE ,
ProjectCoordinatorNumofStaff ,
ProjectCoordinatorFTE ,
OtherNumofStaff ,
OtherFTE ,
--AdminSubTotalNumofStaff ,
--AdminSubTotalFTE ,
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
--IPSSubTotalNumofStaff ,
--IPSSubTotalFTE ,
AideParaprofessionalNumofStaff ,
AideParaprofessionalFTE ,
SecretaryBookkeeperNumofStaff ,
SecretaryBookkeeperFTE ,
SSOtherNumofStaff ,
SSOtherFTE ,
--SSSubTotalNumofStaff ,
--SSSubTotalFTE ,
FringeBenefitsNumofStaff ,
FringeBenefitsFTE ,
--FBSubTotalNumofStaff ,
--FBSubTotalFTE ,
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
CSOtherHrWkDayFlat ,
--CSSubTotalRate ,
--CSSubTotalHrWkDayFlat ,
SupervisoryStaffMileageRate ,
InstructionalStaffMileageRate ,
TravelOtherMileageRate ,
--SubContractsProgramCoordinationRate ,
--SubContractsProgramCoordinationHrWkDayFlat ,
-- subtotals 
NumberOfChildren,
Case CSAdvisorHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSAdvisorHrWkDayFlat END CSAdvisorHrWkDayFlatDesc,
	Case CSClinicianHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSClinicianHrWkDayFlat END CSClinicianHrWkDayFlatDesc,
	Case CSConsultantHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSConsultantHrWkDayFlat END CSConsultantHrWkDayFlatDesc, 
	Case CSEducatorInstructorHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSEducatorInstructorHrWkDayFlat END CSEducatorInstructorHrWkDayFlatDesc,
	Case CSHomeVisitorHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSHomeVisitorHrWkDayFlat END CSHomeVisitorHrWkDayFlatDesc,
	Case CSSpecialistHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSSpecialistHrWkDayFlat END CSSpecialistHrWkDayFlatDesc,
	Case CSSpeakerHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSSpeakerHrWkDayFlat END CSSpeakerHrWkDayFlatDesc,
	Case CSSubstituteHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSSubstituteHrWkDayFlat END CSSubstituteHrWkDayFlatDesc,
	Case CSOtherHrWkDayFlat
	when 0 then '' 
	when 10000 then 'Hour'
	WHEN 10001 Then 'Day'
	WHEN 10002 Then 'Week'
	WHEN 10003 Then 'Year'
	WHEN 10004 Then 'Flat'
	ELSE CSOtherHrWkDayFlat END CSOtherHrWkDayFlatDesc,
	
AdminSubTotal = convert(int , SupervisorDirector 
+ProjectCoordinator 
+Stipend 
+Other), 
IPSSubTotal = convert(int , Advisor 
+Clinician 
+Coordinator 
+EducatorInstructor 
+HomeVisitor 
+Specialist 
+IPSStipend 
+IPSOther), 
SSSubTotal = convert(int , AideParaprofessional 
+SecretaryBookkeeper 
+SSStipend 
+SSOther), 
FBSubTotal = convert(int , FringeBenefits ),
CSSubTotal = convert(int , CSAdvisor 
+CSClinician 
+CSConsultant 
+CSEducatorInstructor 
+CSHomeVisitor 
+CSSpecialist 
+CSSpeaker 
+CSSubstitute 
+CSStipend 
+CSOther),
SMSubTotal = convert(int , InstructionalTechnologySoftware 
+NonInstructionalSupplies 
+SMOther
+EducationalInstructionalMaterials),
TravelSubTotal = convert(int , SupervisoryStaff 
+InstructionalStaff 
+TravelOther), 
OCSubTotal = convert(int , Advertising 
+EquipmentRental 
+MaintenanceRepairs 
+MembershipSubscriptions 
+PrintingReproduction 
+StaffTraining 
+RentalofSpace 
+TelephoneUtilities 
+DirectServiceTransportation 
+OCOther ),
CBSubTotal = convert(int , ProfessionalDevelopOpportunities 
+ApplicationFees 
+CEUCourses 
+CollegeCourses 
+CBOther ),
IndirectCostsSubTotal = convert(int , IndirectCosts ),
EqSubTotal = convert(int , InstructionalEquipment 
+NoninstructionalEquipment 
+EqOther ),
AncillarySubTotal = CONVERT(int, Ancillary),
AdminSubTotalColD = convert(int , SupervisorDirectorColD 
+ProjectCoordinatorColD 
+StipendColD 
+OtherColD ), 
IPSSubTotalColD = convert(int , AdvisorColD 
+ClinicianColD 
+CoordinatorColD
+EducatorInstructorColD
+HomeVisitorColD
+SpecialistColD
+IPSStipendColD
+IPSOtherColD), 
SSSubTotalColD = convert(int , AideParaprofessionalColD
+SecretaryBookkeeperColD
+SSStipendColD
+SSOtherColD), 
FBSubTotalColD = convert(int , FringeBenefitsColD),
CSSubTotalColD = convert(int , CSAdvisorColD
+CSClinicianColD
+CSConsultantColD
+CSEducatorInstructorColD
+CSHomeVisitorColD
+CSSpecialistColD
+CSSpeakerColD
+CSSubstituteColD
+CSStipendColD
+CSOtherColD),
SMSubTotalColD = convert(int , InstructionalTechnologySoftwareColD
+NonInstructionalSuppliesColD
+SMOtherColD
+EducationalInstructionalMaterialsColD),
TravelSubTotalColD = convert(int , SupervisoryStaffColD
+InstructionalStaffColD
+TravelOtherColD), 
OCSubTotalColD = convert(int , AdvertisingColD
+EquipmentRentalColD
+MaintenanceRepairsColD
+MembershipSubscriptionsColD
+PrintingReproductionColD
+StaffTrainingColD
+RentalofSpaceColD
+TelephoneUtilitiesColD
+DirectServiceTransportationColD
+OCOtherColD ),
CBSubTotalColD = convert(int , ProfessionalDevelopOpportunitiesColD
+ApplicationFeesColD
+CEUCoursesColD
+CollegeCoursesColD
+CBOtherColD ),
--IndirectCostsSubTotalColD = convert(int , IndirectCostsColD ),
EqSubTotalColD = convert(int , InstructionalEquipmentColD 
+NoninstructionalEquipmentColD
+EqOtherColD ),
AncillarySubTotalColD = CONVERT(int, AncillaryColD),
AdminSubTotalColF = convert(int , SupervisorDirectorColF
+ProjectCoordinatorColF
+StipendColF
+OtherColF), 
IPSSubTotalColF = convert(int , AdvisorColF
+ClinicianColF
+CoordinatorColF
+EducatorInstructorColF
+HomeVisitorColF
+SpecialistColF
+IPSStipendColF
+IPSOtherColF), 
SSSubTotalColF = convert(int , AideParaprofessionalColF
+SecretaryBookkeeperColF
+SSStipendColF
+SSOtherColF),
FBSubTotalColF = convert(int , FringeBenefitsColF ),
CSSubTotalColF = convert(int , CSAdvisorColF
+CSClinicianColF
+CSConsultantColF
+CSEducatorInstructorColF
+CSHomeVisitorColF
+CSSpecialistColF
+CSSpeakerColF
+CSSubstituteColF
+CSStipendColF
+CSOtherColF),
SMSubTotalColF = convert(int , InstructionalTechnologySoftwareColF
+NonInstructionalSuppliesColF
+SMOtherColF
+EducationalInstructionalMaterialsColF),
TravelSubTotalColF = convert(int , SupervisoryStaffColF
+InstructionalStaffColF
+TravelOtherColF),
OCSubTotalColF = convert(int , AdvertisingColF
+EquipmentRentalColF
+MaintenanceRepairsColF
+MembershipSubscriptionsColF
+PrintingReproductionColF
+StaffTrainingColF
+RentalofSpaceColF
+TelephoneUtilitiesColF
+DirectServiceTransportationColF
+OCOtherColF ),
CBSubTotalColF = convert(int , ProfessionalDevelopOpportunitiesColF
+ApplicationFeesColF
+CEUCoursesColF
+CollegeCoursesColF
+CBOtherColF ),
--IndirectCostsSubTotalColF = convert(int , IndirectCostsColF ),
EqSubTotalColF = convert(int , InstructionalEquipmentColF 
+NoninstructionalEquipmentColF
+EqOtherColF ),
AncillarySubTotalColF = CONVERT(int, AncillaryColF),
AdminSubTotalNumofStaff = convert(int , SupervisorDirectorNumofStaff 
+ProjectCoordinatorNumofStaff 
+OtherNumofStaff), 
IPSSubTotalNumofStaff = convert(int , AdvisorNumofStaff 
+ClinicianNumofStaff 
+CoordinatorNumofStaff 
+EducatorInstructorNumofStaff 
+HomeVisitorNumofStaff 
+SpecialistNumofStaff
+IPSOtherNumofStaff), 
SSSubTotalNumofStaff = convert(int , AideParaprofessionalNumofStaff 
+SecretaryBookkeeperNumofStaff 
+SSOtherNumofStaff ),
FBSubTotalNumofStaff = convert(int , FringeBenefitsNumofStaff ),
--AdminSubTotalFTE = convert(decimal , SupervisorDirectorFTE
--+ProjectCoordinatorFTE
--+OtherFTE ), 
--IPSSubTotalFTE = convert(decimal , AdvisorFTE
--+ClinicianFTE
--+CoordinatorFTE
--+EducatorInstructorFTE
--+HomeVisitorFTE
--+SpecialistFTE
--+IPSOtherFTE), 
--SSSubTotalFTE = convert(decimal , AideParaprofessionalFTE
--+SecretaryBookkeeperFTE
--+SSOtherFTE), 
--FBSubTotalFTE = convert(decimal , FringeBenefitsFTE),
	AdminSubTotalFTE,
	IPSSubTotalFTE,
	SSSubTotalFTE,
	FBSubTotalFTE,
CSSubTotalRate = convert(decimal , CSAdvisorRate
+CSClinicianRate
+CSConsultantRate
+CSEducatorInstructorRate
+CSHomeVisitorRate
+CSSpecialistRate
+CSSpeakerRate
+CSSubstituteRate
+CSOtherRate),
TravelSubTotalMileageRate = convert(decimal , SupervisoryStaffMileageRate
+InstructionalStaffMileageRate
+TravelOtherMileageRate),
0 'GrantTotal',
0 'GrantTotalColD',
0 'GrantTotalColF'
into #tempA
from dbo.BudgetNarrative bn
LEFT JOIN dbo.CPPISubcontractorContactData sd ON sd.BudgetNarrativeID = bn.BudgetNarrativeID AND sd.GrantApplicantID = bn.GrantApplicantID
where bn.BudgetNarrativeID = @SCID
AND bn.GrantApplicantId = @GrantApplicantId

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
EqSubTotalColD +
AncillaryColD,

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
AncillaryColF + 
IndirectCostsSubTotal

update #tempA 
set GrantTotal = GrantTotalColD + GrantTotalColF
select * from #tempA
drop table #tempA
end
