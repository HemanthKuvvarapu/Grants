--[HEMANTH]: 2020/09/29 -- Insert YMCA sql
INSERT INTO dbo.GrantApplicant 
(AgencyName,
 Username, 
 Passphrase, 
 CreatedDate,
 ModifiedDate, 
 Address1, 
 Address2, 
 City, 
 [State], 
 Zipcode, 
 Phone, 
 Email, 
 FiscalYear, 
 Fundcode, 
 EligibilityAmount, 
 TaxId, DocId, 
 VEndorCode, 
 MMArsId, 
 ADNumber, 
 isPCHP, 
 Awarded)
Values
('YMCA of Cape Cod',
 '', 
 '', 
 GetDate(), 
 GetDate(), 
 '2245 Iyannough Rd', 
 '2245 Iyannough Rd', 
 'West Barnstable', 
 'MA', 
 '02668', 
 '508-362-6500', 
 'test@test.com', 
 2021, 
 390, 
 0, 
 null, 
 null, 
 null, 
 null, 
 null, 
 0, 
 0)


------------------------------------------------------------------------------------------------------


SELECT * FROM dbo.GrantApplicant 
WHERE fundcode = 390 AND fiscalyear = 2021

INSERT INTO dbo.GrantApplicant 
(AgencyName, Username, Passphrase, CreatedDate, ModifiedDate, Address1, Address2, City, [State], Zipcode, Phone, Email, FiscalYear, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, Awarded)

SELECT AgencyName, Username, '', GETDATE(), GetDate(), Address1, Address2, City, [State], Zipcode, Phone, Email, 2021, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, 0 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2020 AND Fundcode = 390


SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 390 AND fiscalYear = 2021


INSERT INTO dbo.TemplatePageInstructions
(
    FundCode,
    FiscalYear,
    Part,
    Content
)
SELECT Fundcode, 2021, Part, Content FROM dbo.TemplatePageInstructions 
WHERE FiscalYear = 2020 AND Fundcode = 390


SELECT * FROM dbo.TemplateGrantFiles
WHERE fundcode = 390 AND grantYear = 2021

INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
SELECT Fundcode, 2021, FileNum, CustomContent, IsRequired FROM dbo.TemplateGrantFiles
WHERE grantYear = 2020 AND Fundcode = 390




SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 390 AND fiscalYear = 2021


INSERT into dbo.BudgetInvalidColumn
(
    FiscalYear,
    FundCode,
    ColumnName
)
SELECT 2021, FundCode, ColumnName FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2020


SELECT * FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtStipendColf'

delete FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtStipendColf'


SELECT * FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtIPSStipendColf'

delete FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtIPSStipendColf'


SELECT * FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtSSStipendColf'

delete FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtSSStipendColf'


SELECT * FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtCSStipendColf'

delete FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021
AND ColumnName = 'txtCSStipendColf'


SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 390 AND fiscalYEAR = 2021
AND ColumnName = 'txtPrintingReproductionColD'

INSERT INTO dbo.BudgetInvalidColumn 
VALUES (2021, 390, 'txtPrintingReproductionColD')




UPDATE dbo.TemplatePageInstructions 
SET Content = 
'<b>Instructions:</b>The following narrative section is designed to address your program’s capacity to deliver the required services outlined in the FY 2021 Head Start State Supplemental Grant Application. All questions must be answered in the space provided. The character limit including spaces is 7,000. Please note: prior to submission, review the PDF to ensure that your full response is included. If the full response is not visible, you have exceeded your character limit and you will need to revise your response accordingly.</b><br/><br/><b>Note:</b> Please ensure that responses provided in this section are aligned with your program responses in the FY 2021 Head Start State Supplemental Projected Deliverables (Part 8) of this Online Application. <br/><br/>For each question, responses <b>must</b> include: <br/> 
  <ol type=''a''>
	<li>A description of specific practices/models used with this additional funding; </li>
	<li>Outcomes of specific practices/models; </li>
	<li>How this practice/model will enhance positive outcomes for children, staff, families and/or the program</li>
	<li>How this additional funding supports workforce development, retention and quality improvements in your program</li 
  </ol>
  <br/>
'
WHERE fundcode = 390 AND fiscalyear =2021 
AND part = '7'
AND content = 
'<b>Instructions:</b>The following narrative section is designed to address your program’s capacity to deliver the required services outlined in the FY 2020 Head Start State Supplemental Grant Application. All questions must be answered in the space provided. The character limit including spaces is 7,000. <b>Please note: prior to submission, review the PDF to ensure that your full response is included. If the full response is not visible, you have exceeded your character limit and you will need to revise your response accordingly.</b><br/><br/><b>Note:</b> Please ensure that responses provided in this section are aligned with your program responses in the FY 2020 Head Start State Supplemental Projected Deliverables (Part 8) of this Online Application.<br/><br/>For each question, responses <b>must</b> include: <br/>
  <ol type=''a''>
	<li>A description of specific practices/models used with this additional funding; </li>
	<li>Outcomes of specific practices/models; </li>
	<li>How this practice/model will enhance positive outcomes for children, staff, families and/or the program</li>
	<li>How this additional funding supports workforce development, retention and quality improvements in your program</li>
  </ol>'


UPDATE dbo.TemplatePageInstructions 
SET Content = 
'<u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.
  <ul>                                                    
	<li><a href="docs/FY21 Staff Salary Chart.docx">Staff Salary Chart</a></li>
	<li><a href="docs/FY21 Staff Incentive Chart.docx">Staff Incentive Chart</a></li>
  </ul>                 Step 2:  Complete the documents.<br />                  Step 3:  Upload the completed documents. 
  <ul>
	<li>Staff Salary Chart</li>
	<li>Staff Incentive Chart</li>
  </ul>                  Step 4:  These documents must be uploaded, if applicable.
  <ul>
	<li>Lead Agency Indirect Cost Rate Letter</li>
	<li>Subcontractor Indirect Cost Rate Letter</li>
  </ul>'
WHERE fundcode = 390 AND fiscalyear = 2021
AND part = '9' 
AND content =
'<u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.
  <ul>                                                    
	<li><a href="docs/FY20 Staff Salary Chart - required form.docx">Staff Salary Chart</a></li>
	<li><a href="docs/FY20 Staff Incentive Chart - required form.docx">Staff Incentive Chart</a></li>
  </ul>                 Step 2:  Complete the documents.<br />                  Step 3:  Upload the completed documents. 
  <ul>
	<li>Staff Salary Chart</li>
	<li>Staff Incentive Chart</li>
  </ul>                  Step 4:  These documents must be uploaded, if applicable.
  <ul>
	<li>Lead Agency Indirect Cost Rate Letter</li>
	<li>Subcontractor Indirect Cost Rate Letter</li>
  </ul>
  '



