SELECT * FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalyear = 2022
ORDER BY FiscalYear

INSERT INTO dbo.GrantApplicant
(AgencyName, Username, Passphrase, CreatedDate, MOdifiedDate, Address1, Address2, City, [State], Zipcode, Phone, Fax, Email, GrantTypeId, FiscalYear, LatestSubmitDate, MiscDocsPrinted, FirstSubmitDate, Fundcode, EligibilityAmount, Taxid, Amendment1SubmitDate, programtypeid, isPCHP, Awarded)
SELECT 
AgencyName, '', '', GETDATE(), GETDATE(), Address1, Address2, City, [State], Zipcode, Phone, Fax, Email, GrantTypeId, 2022, NULL, MiscDocsPrinted, NULL, Fundcode, EligibilityAmount, Taxid, NULL, programtypeid, isPCHP, 0 
FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalyear = 2021


INSERT INTO dbo.GrantApplicant
(AgencyName, Username, Passphrase, CreatedDate, MOdifiedDate, Address1, Address2, City, [State], Zipcode, Phone, Fax, Email, GrantTypeId, FiscalYear, LatestSubmitDate, MiscDocsPrinted, FirstSubmitDate, Fundcode, EligibilityAmount, Taxid, Amendment1SubmitDate, programtypeid, isPCHP, Awarded)
SELECT 
AgencyName, '', '', GETDATE(), GETDATE(), Address1, Address2, City, [State], Zipcode, Phone, Fax, Email, GrantTypeId, 2022, NULL, MiscDocsPrinted, NULL, 515, EligibilityAmount, Taxid, NULL, programtypeid, isPCHP, 0 
FROM dbo.GrantApplicant 
WHERE fundcode = 615 AND fiscalyear = 2021



 --Reset passwords
	 update grantapplicant
		 set [Passphrase] = ''
		    ,[LatestSubmitDate] = null
		   ,[MiscDocsPrinted] = null
		   ,[FirstSubmitDate] = null
		   ,[TaxId] = null
		   ,[Amendment1SubmitDate] = null
		   ,[Amendment2SubmitDate] = null
           ,[Amendment3SubmitDate] = null
		   ,[UPKProgramName] = null
		   ,[Awarded] = null
		 where  FiscalYear=2022 and fundcode=515

--UPDATE dbo.GrantApplicant 
--SET EligibilityAmount = 650000.00
--WHERE Fundcode = 515 
--AND fiscalyear = 2022
--AND AgencyName <> 'North Adams Public Schools'

--UPDATE dbo.GrantApplicant 
--SET EligibilityAmount = 450000.00
--WHERE Fundcode = 515 
--AND fiscalyear = 2022
--AND AgencyName = 'North Adams Public Schools'



SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 515
AND fiscalyear = 2022

INSERT INTO dbo.TemplatePageInstructions 
select fundcode, 2022, part, CONTENT 
FROM  dbo.TemplatePageInstructions 
WHERE fundcode = 515
AND fiscalyear = 2021


UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions:</b><br/>Step 1: Download the following document as required by the Grant Application by selecting the attached document, opening and saving them to your computer.<br/>
  <ul>
  <li><a href="docs/FY22 CPPI Direct Service Summary.docx">FY 2022 Direct Service Summary</a></li>
  </ul>
  Step 2: Complete the documents.<br/>  
  Step 3: Upload the completed documents.<br/>
  <ul type="A">   
  <li>FY 2022 Direct Service Summary</li>   
  <li>Resumes of Key Personnel from LEA and each subcontractor (if new staff)</li>
  </ul>
  Step 4: These documents must be uploaded, if applicable.
  <ul>
  <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>  
   <li>Subcontractor Indirect Cost Approval Letter (if applicable)</li>
  </ul>  
  '
  WHERE fundcode = 515 AND fiscalYear = 2022 
  AND part = '9'
  --AND content = '<b>Instructions:</b><br/>Step 1: Download the following document as required by the Grant Application by selecting the attached document, opening and saving them to your computer.<br/>
  --<ul>
  --<li><a href="docs/FY20 CPPI Direct Service Summary.docx">FY 2022 Direct Service Summary</a></li>
  --</ul>&nbsp;&nbsp;
  --Step 2: Complete the documents.<br/>  
  --Step 3: Upload the completed documents.<br/>
  --<ul type="A">   
  --<li>FY 2022 Direct Service Summary</li>   
  --<li>Resumes of Key Personnel from LEA and each subcontractor (if new staff)</li>
  --</ul>
  --Step 4: These documents must be uploaded, if applicable.
  --<ul>
  --<li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>  
  -- <li>Subcontractor Indirect Cost Approval Letter (if applicable)</li>
  --</ul>  
  --'

  UPDATE dbo.TemplatePageInstructions 
  SET content =
  '<b>Instructions:</b>&nbsp;Please reference the fund use section within the Grant Application and <b>Appendix C: Budget Guidelines</b> for specific guidelines regarding the budget, including program and administrative costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET.</b>&nbsp;Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.'
  WHERE fundcode = 515 
  AND fiscalYear = 2022 
  AND part = '4'
  


SELECT * FROM dbo.TemplateNarrativeQuestions 
WHERE fundcode = 515 
AND grantyear >= 2021
--0 no narrative questions



SELECT * FROM dbo.TemplateGrantFiles
WHERE fundcode = 515 
AND grantyear >= 2021

INSERT INTO dbo.TemplateGrantFiles 
SELECT fundcode, 2022, FileNum, CustomContent, IsRequired
FROM dbo.TemplateGrantFiles
WHERE fundcode = 515 
AND grantyear = 2021

SELECT * FROM dbo.TemplateGrantFiles WHERE fundcode = 515 AND GrantYear = 2022

UPDATE dbo.TEmplateGrantFiles 
SET CustomContent = 'FY 2022 Direct Service Summary'
WHERE fundcode = 515
AND grantYear = 2022 
AND Filenum = 1



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear >= 2021

INSERT INTO dbo.budgetinvalidColumn 
SELECT 2022, Fundcode, ColumnName 
FROM  dbo.BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2021



SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2022
AND ColumnName = 'txtStaffTrainingColD'

SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2022
AND ColumnName = 'txtStaffTrainingColF'

SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2022
AND ColumnName = 'txtStaffTraining'

--INSERT INTO dbo.BudgetInvalidColumn 
--VALUES 
--(2022, 515, 'txtStaffTrainingColD')

--INSERT INTO dbo.BudgetInvalidColumn 
--VALUES 
--(2022, 515, 'txtStaffTrainingColF')

--INSERT INTO dbo.BudgetInvalidColumn 
--VALUES 
--(2022, 515, 'txtStaffTraining')


--INSERT INTO dbo.BudgetInvalidColumn 
--VALUES 
--(2022, 515, 'txtIndirectCosts')

--SELECT * FROM dbo.BudgetInvalidColumn 
--where fiscalyear = 2022 AND fundcode = 515 
--AND columnName = 'txtIndirectCosts'


INSERT INTO dbo.BudgetInvalidColumn 
VALUES (2022, 515 ,'txtAdvertisingColD')

INSERT INTO dbo.BudgetInvalidColumn 
VALUES (2022, 515 ,'txtEquipmentRentalColD')

INSERT INTO dbo.BudgetInvalidColumn 
VALUES (2022, 515 ,'txtMaintenanceRepairsColF')

INSERT INTO dbo.BudgetInvalidColumn 
VALUES (2022, 515 ,'txtMembershipSubscriptionsColD')



--select distinct SystemProviderID FROM CPPISurveyProgramInformation
-- where GrantApplicantId = 8117
--EXEC uspGetUploadedFiles 8117, 515, 2022






