-- Stongstart FY21 grant 323

SELECT * FROM dbo.GrantApplicant 
--WHERE AgencyName = 'University of Massachusetts Boston'
WHERE fundcode = 323 AND fiscalyear = 2021
-- grantapplicantID = 7858


INSERT INTO dbo.GrantApplicant
(
    AgencyName,
    Username,
    Passphrase,
    CreatedDate,
    ModifiedDate,
    Address1,
    Address2,
    City,
    State,
    Zipcode,
    Phone,
    Fax,
    Email,
    GrantTypeId,
    FiscalYear,
    LatestSubmitDate,
    MiscDocsPrinted,
    FirstSubmitDate,
    FundCode,
    EligibilityAmount,
    [Contact First Name],
    [Contact Last Name],
    TaxId,
    Amendment1SubmitDate,
    Amendment2SubmitDate,
    programtypeid,
    OrgId,
    DocId,
    VendorCode,
    MMarsId,
    ADNumber,
    UseLegalAddress,
    legalAddress,
    legalCity,
    legalState,
    legalzipcode,
    UPKProgramName,
    isPCHP,
    Awarded,
    Amendment3SubmitDate
)
select
	AgencyName,        -- AgencyName - varchar(200)
    '',        -- Username - varchar(20)
    '',        -- Passphrase - varchar(20)
    GETDATE(), -- CreatedDate - datetime
    GETDATE(), -- ModifiedDate - datetime
    Address1,        -- Address1 - varchar(100)
    Address2,        -- Address2 - varchar(100)
    City,        -- City - varchar(50)
    State,        -- State - char(2)
    Zipcode,        -- Zipcode - varchar(10)
    Phone,        -- Phone - varchar(20)
    FAX,        -- Fax - varchar(20)
    Email,        -- Email - varchar(200)
    GrantTypeId,         -- GrantTypeId - int
    2021,         -- FiscalYear - int
    NULL, -- LatestSubmitDate - datetime
    0,         -- MiscDocsPrinted - tinyint
    NULL, -- FirstSubmitDate - datetime
    FundCode,         -- FundCode - int
    4144044.00,      -- EligibilityAmount - money
    '',        -- Contact First Name - varchar(50)
    '',        -- Contact Last Name - varchar(50)
    '',        -- TaxId - varchar(10)
    NULL, -- Amendment1SubmitDate - datetime
    NULL, -- Amendment2SubmitDate - datetime
    0,         -- programtypeid - int
    '',        -- OrgId - varchar(30)
    '',        -- DocId - varchar(30)
    '',        -- VendorCode - varchar(50)
    '',        -- MMarsId - varchar(50)
    '',        -- ADNumber - varchar(50)
    0,         -- UseLegalAddress - int
    '',        -- legalAddress - varchar(200)
    '',        -- legalCity - varchar(255)
    '',        -- legalState - varchar(255)
    '',        -- legalzipcode - varchar(50)
    '',        -- UPKProgramName - varchar(300)
    0,         -- isPCHP - int
    0,         -- Awarded - int
    NULL  -- Amendment3SubmitDate - datetime
    FROM dbo.GrantApplicant
	WHERE GrantApplicantId = 7858
	AND fiscalyear = 2020
	AND fundcode = 323


--UPDATE dbo.GrantApplicant 
--SET fundcode = 323 
--WHERE grantapplicantid = 8153 
--AND fundcode = 0

SELECT * FROM dbo.templatePageInstructions 
WHERE fiscalyear = 2021
AND fundcode = 323

DELETE FROM dbo.TemplatePageInstructions 
WHERE fiscalyear = 2021
AND fundcode = 323

INSERT INTO dbo.TemplatePageInstructions 
SELECT 
323, 2021, Part, Content
FROM dbo.templatePageInstructions 
WHERE fiscalyear = 2020
AND fundcode = 323


--EXEC dbo.uspGetUploadedFiles 8111, 323, 2021


SELECT * FROM dbo.TemplateGrantFiles 
WHERE Fundcode = 323 AND grantyear = 2021

INSERT INTO dbo.TemplateGrantFiles
(fundcode, grantyear, fileNum, CustomContent)
SELECT 323, 2021, FileNum, CustomContent
FROM dbo.TemplateGrantFiles
WHERE fundcode = 323 AND grantyear = 2020
AND FileNum IN ('7', '8')	--('1', '7','8')

--UPDATE dbo.TemplateGrantFiles 
--SET IsRequired = 1 
--WHERE fundcode = 323 AND grantyear = 2021 
--AND filenum NOT IN ('7','8')

UPDATE dbo.TemplateGrantFiles 
SET IsRequired = 0 
WHERE fundcode = 323 AND grantyear = 2021 
AND filenum IN ('7','8')


UPDATE dbo.TemplateGrantFiles
SET Filenum = '1'
WHERE fundcode = 323 AND grantyear = 2021 
AND filenum IN ('7')

UPDATE dbo.TemplateGrantFiles
SET Filenum = '2'
WHERE fundcode = 323 AND grantyear = 2021 
AND filenum IN ('8')

--DELETE FROM dbo.TEmplateGrantFiles 
--WHERE fundcode = 323 AND grantyear = 2021 
--AND filenum IN ('4')





SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021


INSERT INTO dbo.budgetInvalidColumn 
SELECT 2021, fundcode, columnName FROM dbo.BudgetinvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2020

 
SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColD'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColD'


--INSERT INTO dbo.BudgetInvalidColumn
--(
--    FiscalYear,
--    FundCode,
--    ColumnName
--)
--VALUES
--(   2021, -- FiscalYear - int
--    323, -- FundCode - int
--    'txtSupervisorDirectorColF' -- ColumnName - varchar(100)
--    )

SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColF'

--DELETE FROM dbo.BudgetInvalidColumn 
--WHERE fundcode = 323 AND fiscalyear = 2021 
--AND columnName = 'txtSupervisorDirectorColF'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSecretaryBookkeeperColD'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSecretaryBookkeeperColD'



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisoryStaffColD'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisoryStaffColD'



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtMembershipSubscriptionsColD'


DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtMembershipSubscriptionsColD'



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtApplicationFeesColF'


DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtApplicationFeesColF'



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryColD'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryColD'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryColF'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryColF'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillary'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillary'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryDescr'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtAncillaryDescr'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtBudgetColF'



SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 323 AND fiscalyear = 2021
AND part = '9'


UPDATE dbo.TemplatePageInstructions 
SET content = 
'<b>Instructions:</b>  Please reference the fund use section within the Grant Application and Appendix B: Budget Guidelines for specific guidelines regarding the budget, including program and administrative costs. Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET. Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.'
--WHERE content =
--'<b>Instructions:</b><br/>  Please reference the fund use section within the Grant Application and Appendix D: Budget Guidelines for specific guidelines regarding the budget, including program and admin costs. Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET. Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant. '
WHERE fundcode = 323 AND fiscalyear = 2021
AND part = '4'

--UPDATE dbo.templatePageInstructions 
--SET content = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following document as required by the Grant Application by selecting the attachment below and saving the document to your computer.       
--<ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  </ul>
--      Step 2: Complete the document.<br/>         
--	  Step 3: <b>Upload</b> the completed document. <ul>                                                    <li>Narrative Response</li>  </ul>
--	  Step 4:  These documents must be uploaded:<br/>
--	              <ul>     <li>Narrative Response</li> <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      
--				  <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/>'
--WHERE fundcode = 323 AND fiscalyear = 2021
--AND part = '9' 
--AND content = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/FY21 SSTTA Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'


UPDATE dbo.TemplatePageInstructions 
SET Content =
'<b>Instructions:</b>  If applicable, complete the following document(s): 
<ul>    <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul> 
<b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'
WHERE Fundcode = 323 AND fiscalYear = 2021
AND Part = '9' 
--AND CONTENT = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/FY21 SSTTA Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'


SELECT * FROM dbo.TEmplatePageINstructions 
WHERE fundcode = 323 AND fiscalyear = 2021
AND part = '9' 

--<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the 'Browse' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the 'Open' button to attach each file.<br/>    Step 4: After attaching all files, click the 'Save Information' button located below.<br/><br/>



SELECT * FROM dbo.TemplateGrantFiles 
WHERE fundcode = 323 AND grantyear = 2021

--DELETE FROM dbo.TemplateGrantFiles 
--WHERE fundcode = 323 AND grantyear = 2021
--AND FileNum IN ('3','4','6')

--UPDATE dbo.TemplateGrantFiles 
--SET Filenum = '3' 
--WHERE fundcode = 323 AND grantyear = 2021
--AND FileNum = '5' 

--UPDATE dbo.TemplateGrantFiles 
--SET Filenum = '4' 
--WHERE fundcode = 323 AND grantyear = 2021
--AND FileNum = '7' 

--UPDATE dbo.TemplateGrantFiles 
--SET Filenum = '5' 
--WHERE fundcode = 323 AND grantyear = 2021
--AND FileNum = '8' 

SELECT * FROM dbo.GrantUploadedFiles
WHERE grantApplicantId = (SELECT grantapplicantID FROM dbo.GrantApplicant WHERE fundcode = 323 AND fiscalyear = 2021)

--UPDATE dbo.GrantuploadedFiles 
--SET FileUploadedType = '3' 
--WHERE GrantApplicantID = 8153 AND 
--fileuploadedtype = '5'


--Pre-populate Subcontractors from last year
SELECT GrantApplicantId, AgencyName, AgencyEmail, AgencyPhone, AgencyContactName
FROM dbo.BudgetNarrative sc
WHERE sc.GrantApplicantId IN (SELECT GrantApplicantID FROM dbo.GrantApplicant WHERE fundcode = 323 AND fiscalyear = 2020 AND Awarded = 1)
  AND sc.IsLeadAgency = 0
 
SELECT GrantApplicantId, AgencyName, AgencyEmail, AgencyPhone, AgencyContactName
--DELETE 
FROM dbo.BudgetNarrative 
WHERE GrantApplicantId IN (SELECT GrantApplicantID FROM dbo.GrantApplicant WHERE fundcode = 323 AND fiscalyear = 2021)
  AND IsLeadAgency = 0



Insert into dbo.BudgetNarrative
		(AgencyName,
		AgencyEmail,
		AgencyPhone,
		AgencyContactName,
		GrantApplicantId,
		SupervisorDirector,
		SupervisorDirectorDescr,
		ProjectCoordinator,
		ProjectCoordinatorDescr,
		Stipend,
		StipendDescr,
		Other,
		OtherDescr,
		Advisor,
		AdvisorDescr,
		Clinician,
		ClinicianDescr,
		Coordinator,
		CoordinatorDescr,
		EducatorInstructor,
		EducatorInstructorDescr,
		HomeVisitor,
		HomeVisitorDescr,
		Specialist,
		SpecialistDescr,
		IPSStipend,
		IPSStipendDescr,
		IPSOther,
		IPSOtherDescr,
		AideParaprofessional,
		AideParaprofessionalDescr,
		SecretaryBookkeeper,
		SecretaryBookkeeperDescr,
		SSStipend,
		SSStipendDescr,
		SSOther,
		SSOtherDescr,
		FringeBenefits,
		FringeBenefitsDescr,
		CSAdvisor,
		CSAdvisorDescr,
		CSClinician,
		CSClinicianDescr,
		CSConsultant,
		CSConsultantDescr,
		CSEducatorInstructor,
		CSEducatorInstructorDescr,
		CSHomeVisitor,
		CSHomeVisitorDescr,
		CSSpecialist,
		CSSpecialistDescr,
		CSSpeaker,
		CSSpeakerDescr,
		CSSubstitute,
		CSSubstituteDescr,
		CSStipend,
		CSStipendDescr,
		CSOther,
		CSOtherDescr,
		EducationalInstructionalMaterials,
		EducationalInstructionalMaterialsDescr,
		InstructionalTechnologySoftware,
		InstructionalTechnologySoftwareDescr,
		NonInstructionalSupplies,
		NonInstructionalSuppliesDescr,
		SMOther,
		SMOtherDescr,
		SupervisoryStaff,
		SupervisoryStaffDescr,
		InstructionalStaff,
		InstructionalStaffDescr,
		TravelOther,
		TraveOtherDescr,
		Advertising,
		AdvertisingDescr,
		EquipmentRental,
		EquipmentRentalDescr,
		MaintenanceRepairs,
		MaintenanceRepairsDescr,
		MembershipSubscriptions,
		MembershipSubscriptionsDescr,
		PrintingReproduction,
		PrintingReproductionDescr,
		StaffTraining,
		StaffTrainingDescr,
		RentalofSpace,
		RentalofSpaceDescr,
		TelephoneUtilities,
		TelephoneUtilitiesDescr,
		DirectServiceTransportation,
		DirectServiceTransportationDescr,
		OCOther,
		OCOtherDescr,
		ProfessionalDevelopOpportunities,
		ProfessionalDevelopOpportunitiesDescr,
		ApplicationFees,
		ApplicationFeesDescr,
		CEUCourses,
		CEUCoursesDescr,
		CollegeCourses,
		CollegeCoursesDescr,
		CBOther,
		CBOtherDescr,
		CBSubTotal,
		IndirectPercent,
		IndirectCosts,
		IndirectCostsDescr,
		InstructionalEquipment,
		InstructionalEquipmentDescr,
		NoninstructionalEquipment,
		NoninstructionalEquipmentDescr,
		EqOther,
		EqOtherDescr,
		Ancillary,
		AncillaryDescr,
		CreatedDate,
		ModifiedDate,
		SupervisorDirectorColD,
		ProjectCoordinatorColD,
		StipendColD,
		OtherColD,
		AdvisorColD,
		ClinicianColD,
		CoordinatorColD,
		EducatorInstructorColD,
		HomeVisitorColD,
		SpecialistColD,
		IPSStipendColD,
		IPSOtherColD,
		AideParaprofessionalColD,
		SecretaryBookkeeperColD,
		SSOtherColD,
		SSStipendColD,
		FringeBenefitsColD,
		CSAdvisorColD,
		CSClinicianColD,
		CSConsultantColD,
		CSEducatorInstructorColD,
		CSHomeVisitorColD,
		CSSpecialistColD,
		CSSpeakerColD,
		CSSubstituteColD,
		CSStipendColD,
		CSOtherColD,
		EducationalInstructionalMaterialsColD,
		InstructionalTechnologySoftwareColD,
		NonInstructionalSuppliesColD,
		SMOtherColD,
		SupervisoryStaffColD,
		InstructionalStaffColD,
		TravelOtherColD,
		AdvertisingColD,
		EquipmentRentalColD,
		MaintenanceRepairsColD,
		MembershipSubscriptionsColD,
		PrintingReproductionColD,
		StaffTrainingColD,
		RentalofSpaceColD,
		TelephoneUtilitiesColD,
		DirectServiceTransportationColD,
		OCOtherColD,
		ProfessionalDevelopOpportunitiesColD,
		ApplicationFeesColD,
		CEUCoursesColD,
		CollegeCoursesColD,
		CBOtherColD,
		InstructionalEquipmentColD,
		NoninstructionalEquipmentColD,
		EqOtherColD,
		AncillaryColD,
		SupervisorDirectorColF,
		ProjectCoordinatorColF,
		StipendColF,
		OtherColF,
		AdvisorColF,
		ClinicianColF,
		CoordinatorColF,
		EducatorInstructorColF,
		HomeVisitorColF,
		SpecialistColF,
		IPSStipendColF,
		IPSOtherColF,
		AideParaprofessionalColF,
		SecretaryBookkeeperColF,
		SSStipendColF,
		SSOtherColF,
		FringeBenefitsColF,
		CSAdvisorColF,
		CSClinicianColF,
		CSConsultantColF,
		CSEducatorInstructorColF,
		CSHomeVisitorColF,
		CSSpecialistColF,
		CSSpeakerColF,
		CSSubstituteColF,
		CSStipendColF,
		CSOtherColF,
		EducationalInstructionalMaterialsColF,
		InstructionalTechnologySoftwareColF,
		NonInstructionalSuppliesColF,
		SMOtherColF,
		SupervisoryStaffColF,
		InstructionalStaffColF,
		TravelOtherColF,
		AdvertisingColF,
		EquipmentRentalColF,
		MaintenanceRepairsColF,
		MembershipSubscriptionsColF,
		PrintingReproductionColF,
		StaffTrainingColF,
		RentalofSpaceColF,
		TelephoneUtilitiesColF,
		DirectServiceTransportationColF,
		OCOtherColF,
		ProfessionalDevelopOpportunitiesColF,
		ApplicationFeesColF,
		CEUCoursesColF,
		CollegeCoursesColF,
		CBOtherColF,
		InstructionalEquipmentColF,
		NoninstructionalEquipmentColF,
		EqOtherColF,
		AncillaryColF,
		SupervisorDirectorNumofStaff,
		SupervisorDirectorFTE,
		ProjectCoordinatorNumofStaff,
		ProjectCoordinatorFTE,
		OtherNumofStaff,
		OtherFTE,
		AdvisorNumofStaff,
		AdvisorFTE,
		ClinicianNumofStaff,
		ClinicianFTE,
		CoordinatorNumofStaff,
		CoordinatorFTE,
		EducatorInstructorNumofStaff,
		EducatorInstructorFTE,
		HomeVisitorNumofStaff,
		HomeVisitorFTE,
		SpecialistNumofStaff,
		SpecialistFTE,
		IPSOtherNumofStaff,
		IPSOtherFTE,
		AideParaprofessionalNumofStaff,
		AideParaprofessionalFTE,
		SecretaryBookkeeperNumofStaff,
		SecretaryBookkeeperFTE,
		SSOtherNumofStaff,
		SSOtherFTE,
		FringeBenefitsNumofStaff,
		FringeBenefitsFTE,
		CSAdvisorRate,
		CSAdvisorHrWkDayFlat,
		CSClinicianRate,
		CSClinicianHrWkDayFlat,
		CSConsultantRate,
		CSConsultantHrWkDayFlat,
		CSEducatorInstructorRate,
		CSEducatorInstructorHrWkDayFlat,
		CSHomeVisitorRate,
		CSHomeVisitorHrWkDayFlat,
		CSSpecialistRate,
		CSSpecialistHrWkDayFlat,
		CSSpeakerRate,
		CSSpeakerHrWkDayFlat,
		CSSubstituteRate,
		CSSubstituteHrWkDayFlat,
		CSOtherRate,
		CSOtherHrWkDayFlat,
		SupervisoryStaffMileageRate,
		InstructionalStaffMileageRate,
		TravelOtherMileageRate,
		GrantTotal,
		IsLeadAgency,
		ErrorCount,
		WarningCount,
		NumberOfChildren,
		IsPCHP
		)
	SELECT
		AgencyName,
		AgencyEmail,
		AgencyPhone,
		AgencyContactName,
		(SELECT GrantApplicantId FROM dbo.GrantApplicant WHERE fiscalyear = 2021 AND Fundcode = 323),	--8350,
		0,--SupervisorDirector,
		'',--SupervisorDirectorDescr,
		0,--ProjectCoordinator,
		'',--ProjectCoordinatorDescr,
		0,--Stipend,
		'',--StipendDescr,
		0,--Other,
		'',--OtherDescr,
		0,--Advisor,
		'',--AdvisorDescr,
		0,--Clinician,
		'',--ClinicianDescr,
		0,--Coordinator,
		'',--CoordinatorDescr,
		0,--EducatorInstructor,
		'',--EducatorInstructorDescr,
		0,--HomeVisitor,
		'',--HomeVisitorDescr,
		0,--Specialist,
		'',--SpecialistDescr,
		0,--IPSStipend,
		'',--IPSStipendDescr,
		0,--IPSOther,
		'',--IPSOtherDescr,
		0,--AideParaprofessional,
		'',--AideParaprofessionalDescr,
		0,--SecretaryBookkeeper,
		'',--SecretaryBookkeeperDescr,
		0,--SSStipend,
		'',--SSStipendDescr,
		0,--SSOther,
		'',--SSOtherDescr,
		0,--FringeBenefits,
		'',--FringeBenefitsDescr,
		0,--CSAdvisor,
		'',--CSAdvisorDescr,
		0,--CSClinician,
		'',--CSClinicianDescr,
		0,--CSConsultant,
		'',--CSConsultantDescr,
		0,--CSEducatorInstructor,
		'',--CSEducatorInstructorDescr,
		0,--CSHomeVisitor,
		'',--CSHomeVisitorDescr,
		0,--CSSpecialist,
		'',--CSSpecialistDescr,
		0,--CSSpeaker,
		'',--CSSpeakerDescr,
		0,--CSSubstitute,
		'',--CSSubstituteDescr,
		0,--CSStipend,
		'',--CSStipendDescr,
		0,--CSOther,
		'',--CSOtherDescr,
		0,--EducationalInstructionalMaterials,
		'',--EducationalInstructionalMaterialsDescr,
		0,--InstructionalTechnologySoftware,
		'',--InstructionalTechnologySoftwareDescr,
		0,--NonInstructionalSupplies,
		'',--NonInstructionalSuppliesDescr,
		0,--SMOther,
		'',--SMOtherDescr,
		0,--SupervisoryStaff,
		'',--SupervisoryStaffDescr,
		0,--InstructionalStaff,
		'',--InstructionalStaffDescr,
		0,--TravelOther,
		'',--TraveOtherDescr,
		0,--Advertising,
		'',--AdvertisingDescr,
		0,--EquipmentRental,
		'',--EquipmentRentalDescr,
		0,--MaintenanceRepairs,
		'',--MaintenanceRepairsDescr,
		0,--MembershipSubscriptions,
		'',--MembershipSubscriptionsDescr, 
		0,--PrintingReproduction,
		'',--PrintingReproductionDescr,
		0,--StaffTraining,
		'',--StaffTrainingDescr,
		0,--RentalofSpace,
		'',--RentalofSpaceDescr,
		0,--TelephoneUtilities,
		'',--TelephoneUtilitiesDescr,
		0,--DirectServiceTransportation,
		'',--DirectServiceTransportationDescr,
		0,--OCOther,
		'',--OCOtherDescr,
		0,--ProfessionalDevelopOpportunities,
		'',--ProfessionalDevelopOpportunitiesDescr,
		0,--ApplicationFees,
		'',--ApplicationFeesDescr,
		0,--CEUCourses,
		'',--CEUCoursesDescr,
		0,--CollegeCourses,
		'',--CollegeCoursesDescr,
		0,--CBOther,
		'',--CBOtherDescr,
		0,--CBSubtotal,
		0,--IndirectPercent,
		0,--IndirectCosts,
		'',--IndirectCostsDescr,
		0,--InstructionalEquipment,
		'',--InstructionalEquipmentDescr,
		0,--NoninstructionalEquipment,
		'',--NoninstructionalEquipmentDescr,
		0,--EqOther,
		'',--EqOtherDescr,
		0,--Ancillary,
		'',--AncillaryDescr,
		NULL,--CreatedDate,
		NULL,--ModifiedDate,
		0,--SupervisorDirectorColD,
		0,--ProjectCoordinatorColD,
		0,--StipendColD,
		0,--OtherColD,
		0,--AdvisorColD,
		0,--ClinicianColD,
		0,--CoordinatorColD,
		0,--EducatorInstructorColD,
		0,--HomeVisitorColD,
		0,--SpecialistColD,
		0,--IPSStipendColD,
		0,--IPSOtherColD,
		0,--AideParaprofessionalColD,
		0,--SecretaryBookkeeperColD,
		0,--SSOtherColD,
		0,--SSStipendColD,
		0,--FringeBenefitsColD,
		0,--CSAdvisorColD,
		0,--CSClinicianColD,
		0,--CSConsultantColD,
		0,--CSEducatorInstructorColD,
		0,--CSHomeVisitorColD,
		0,--CSSpecialistColD,
		0,--CSSpeakerColD,
		0,--CSSubstituteColD,
		0,--CSStipendColD,
		0,--CSOtherColD,
		0,--EducationalInstructionalMaterialsColD,
		0,--InstructionalTechnologySoftwareColD,
		0,--NonInstructionalSuppliesColD,
		0,--SMOtherColD,
		0,--SupervisoryStaffColD,
		0,--InstructionalStaffColD,
		0,--TravelOtherColD,
		0,--AdvertisingColD,
		0,--EquipmentRentalColD,
		0,--MaintenanceRepairsColD,
		0,--MembershipSubscriptionsColD,
		0,--PrintingReproductionColD,
		0,--StaffTrainingColD,
		0,--RentalofSpaceColD,
		0,--TelephoneUtilitiesColD,
		0,--DirectServiceTransportationColD,
		0,--OCOtherColD,
		0,--ProfessionalDevelopOpportunitiesColD,
		0,--ApplicationFeesColD,
		0,--CEUCoursesColD,
		0,--CollegeCoursesColD,
		0,--CBOtherColD,
		0,--InstructionalEquipmentColD,
		0,--NoninstructionalEquipmentColD,
		0,--EqOtherColD,
		0,--AncillaryColD,
		0,--SupervisorDirectorColF,
		0,--ProjectCoordinatorColF,
		0,--StipendColF,
		0,--OtherColF,
		0,--AdvisorColF,
		0,--ClinicianColF,
		0,--CoordinatorColF,
		0,--EducatorInstructorColF,
		0,--HomeVisitorColF,
		0,--SpecialistColF,
		0,--IPSStipendColF,
		0,--IPSOtherColF,
		0,--AideParaprofessionalColF,
		0,--SecretaryBookkeeperColF,
		0,--SSStipendColF,
		0,--SSOtherColF,
		0,--FringeBenefitsColF,
		0,--CSAdvisorColF,
		0,--CSClinicianColF,
		0,--CSConsultantColF,
		0,--CSEducatorInstructorColF,
		0,--CSHomeVisitorColF,
		0,--CSSpecialistColF,
		0,--CSSpeakerColF,
		0,--CSSubstituteColF,
		0,--CSStipendColF,
		0,--CSOtherColF,
		0,--EducationalInstructionalMaterialsColF,
		0,--InstructionalTechnologySoftwareColF,
		0,--NonInstructionalSuppliesColF,
		0,--SMOtherColF,
		0,--SupervisoryStaffColF,
		0,--InstructionalStaffColF,
		0,--TravelOtherColF,
		0,--AdvertisingColF,
		0,--EquipmentRentalColF,
		0,--MaintenanceRepairsColF,
		0,--MembershipSubscriptionsColF,
		0,--PrintingReproductionColF,
		0,--StaffTrainingColF,
		0,--RentalofSpaceColF,
		0,--TelephoneUtilitiesColF,
		0,--DirectServiceTransportationColF,
		0,--OCOtherColF,
		0,--ProfessionalDevelopOpportunitiesColF,
		0,--ApplicationFeesColF,
		0,--CEUCoursesColF,
		0,--CollegeCoursesColF,
		0,--CBOtherColF,
		0,--InstructionalEquipmentColF,
		0,--NoninstructionalEquipmentColF,
		0,--EqOtherColF,
		0,--AncillaryColF,
		0,--SupervisorDirectorNumofStaff,
		0,--SupervisorDirectorFTE,
		0,--ProjectCoordinatorNumofStaff,
		0,--ProjectCoordinatorFTE,
		0,--OtherNumofStaff,
		0,--OtherFTE,
		0,--AdvisorNumofStaff,
		0,--AdvisorFTE,
		0,--ClinicianNumofStaff,
		0,--ClinicianFTE,
		0,--CoordinatorNumofStaff,
		0,--CoordinatorFTE,
		0,--EducatorInstructorNumofStaff,
		0,--EducatorInstructorFTE,
		0,--HomeVisitorNumofStaff,
		0,--HomeVisitorFTE,
		0,--SpecialistNumofStaff,
		0,--SpecialistFTE,
		0,--IPSOtherNumofStaff,
		0,--IPSOtherFTE,
		0,--AideParaprofessionalNumofStaff,
		0,--AideParaprofessionalFTE,
		0,--SecretaryBookkeeperNumofStaff,
		0,--SecretaryBookkeeperFTE,
		0,--SSOtherNumofStaff,
		0,--SSOtherFTE,
		0,--FringeBenefitsNumofStaff,
		0,--FringeBenefitsFTE,
		0,--CSAdvisorRate,
		0,--CSAdvisorHrWkDayFlat,
		0,--CSClinicianRate,
		0,--CSClinicianHrWkDayFlat,
		0,--CSConsultantRate,
		0,--CSConsultantHrWkDayFlat,
		0,--CSEducatorInstructorRate,
		0,--CSEducatorInstructorHrWkDayFlat,
		0,--CSHomeVisitorRate,
		0,--CSHomeVisitorHrWkDayFlat,
		0,--CSSpecialistRate,
		0,--CSSpecialistHrWkDayFlat,
		0,--CSSpeakerRate,
		0,--CSSpeakerHrWkDayFlat,
		0,--CSSubstituteRate,
		0,--CSSubstituteHrWkDayFlat,
		0,--CSOtherRate,
		0,--CSOtherHrWkDayFlat,
		0,--SupervisoryStaffMileageRate,
		0,--InstructionalStaffMileageRate,
		0,--TravelOtherMileageRate,
		0,--GrantTotal,
		0,--IsLeadAgency,
		0,--ErrorCount,
		0,--WarningCount,
		0,--NumberOfChildren,
		0--IsPCHP
FROM dbo.BudgetNarrative sc
WHERE sc.GrantApplicantId IN (SELECT GrantApplicantID FROM dbo.GrantApplicant WHERE fundcode = 323 AND fiscalyear = 2020 AND Awarded = 1)
  AND sc.IsLeadAgency = 0

--SELECT * FROM dbo.BudgetNarrative 
--WHERE GrantApplicantId = 8153

--SELECT * FROM dbo.GrantApplicant 
--WHERE GrantApplicantId = 8153

--DELETE 
----SELECT * 
--FROM dbo.BudgetNarrative 
--WHERE BudgetNarrativeId IN (
--7656,
--7854,
--7855,
--7856,
--7857,
--7858)
--AND GrantApplicantId = 8150
--AND CreatedDate IS null

SELECT * --GrantApplicantId, AgencyName, AgencyEmail, AgencyPhone, AgencyContactName
FROM dbo.BudgetNarrative sc
WHERE sc.GrantApplicantId
IN (SELECT GrantApplicantID FROM dbo.GrantApplicant WHERE fundcode = 323 AND fiscalyear = 2021)
  AND sc.IsLeadAgency = 0


 