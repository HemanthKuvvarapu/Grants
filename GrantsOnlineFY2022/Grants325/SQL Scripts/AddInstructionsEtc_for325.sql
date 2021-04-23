/*
SELECT * FROM dbo.GrantApplicant
WHERE fundcode = 325

exec uspGetCommunitiesTotalDataPoint @GrantApplicantId=6367
go
exec uspGetAllCommunitiesServed @GrantApplicantId=6367,@FiscalYear=2019, @IsTownFunding= 1, @FundCode=325
go
exec uspGetAllDistrictData @GrantApplicantId=6367,@FiscalYear=2019
go

EXEC uspGetBudgetNarrativeData 6367,1

SELECT * FROM budgetNarrative WHERE grantapplicantid = 6367

UPDATE budgetnarrative SET SupervisorDirector = 0 
WHERE grantapplicantid = 6367 AND supervisordirector = 1000000


EXEC uspGetPartInstruction @Fundcode=325, @fiscalyear = 2019, @part = '4'
*/

SELECT * FROM TemplatePageInstructions 
WHERE FUNDCODE = 322
AND FiscalYear = 2019

INSERT INTO TemplatePageInstructions 
(fundcode, fiscalyear, part, content)
SELECT 325, 2019, PART, Content
FROM TemplatePageInstructions 
WHERE FUNDCODE = 322
AND FiscalYear = 2019

SELECT * FROM templatePageInstructions 
WHERE fundcode = 325


UPDATE dbo.TemplatePageInstructions
SET content = 
'      <b>Instructions:</b>&nbsp;Please reference the fund use section within the Grant Application and Appendix D: Budget Guidelines for specific guidelines regarding the budget, including program and admin costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET</b>.  Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.<br/>'
WHERE fundcode = 325 
AND fiscalyear = 2019
AND part = '4'


UPDATE dbo.TemplatePageInstructions
SET content = 
'<b>Instructions: </b>Please select the cities/towns below in your community college''s catchment area.  The demographic information will automatically populate for the cities and towns chosen.  This information is provided AS a resource to applicants.  For additional information on the demographics for specific cities and towns within the Commonwealth, please see Appendices I and J in the grant application.'
WHERE fundcode = 325 
AND fiscalyear = 2019
AND part = '2'


UPDATE dbo.TemplatePageInstructions
SET content =
'<b>Instructions: </b>Please provide clear and concise answers to address the following questions based on prior experience, expertise, and anticipated service for FY2019.  Responses are limited to 10,000 characters, approximately 2 pages per question.'
WHERE fundcode = 325 
AND fiscalyear = 2019
AND part = '7'



UPDATE dbo.TemplatePageInstructions
SET content ='<b>Instructions:</b>&nbsp;Please provide the following contact information for the Lead Agency. <b>Note:&nbsp;</b><i>The fields marked with <font color="red">*</font> are required</i>.'
WHERE fundcode = 325 
AND fiscalyear = 2019
AND part = '1' 


UPDATE dbo.TemplatePageInstructions
SET content = '<b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''Open'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''Save Information'' button located below.<br />'
WHERE fundcode = 325 
AND fiscalyear = 2019
AND part = '9'


UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions: </b>Please select the languages your agency serves.'
WHERE part = '3'
AND fundcode = 325 AND fiscalyear = 2019


UPDATE dbo.TemplatePageInstructions 
SET content = 
'    <b>Instructions:</b>&nbsp;This is a read-only page; costs cannot be entered. In order to make changes to the information on this Budget Summary, changes must be made in the Lead Agency Budget.'
WHERE part = '6a'
AND fundcode = 325 AND fiscalyear = 2019


UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions: </b>This is a read-only page; costs cannot be entered.  Costs provided for FY 2020 and FY 2021 Proposed Budget Summary are based on FY 2019 budget allocations provided and will serve as a placeholder.  Selected applicants will be required to submit revised Lead Agency Budget for prior to FY 2020 and FY 2021 service delivery.'
WHERE part = '6b'
AND fundcode = 325 AND fiscalyear = 2019

UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions: </b>This is a read-only page; costs cannot be entered.  Costs provided for FY 2020 and FY 2021 Proposed Budget Summary are based on FY 2019 budget allocations provided and will serve as a placeholder.  Selected applicants will be required to submit revised Lead Agency Budget for prior to FY 2020 and FY 2021 service delivery.'
WHERE part = '6c'
AND fundcode = 325 AND fiscalyear = 2019

UPDATE dbo.TemplatePageInstructions 
SET content = '<b>Instructions:  </b>Enter the Federal Tax ID.  <br/><b>Please Note:</b>  Once the PDF is printed, the cover page must be signed with an original signature (<font style=color:blue>in blue ink</font>) by an authorized signatory.'
WHERE part = '11' AND fundcode = 325 AND fiscalyear = 2019




SELECT * FROM dbo.templateGrantFiles 
WHERE fundcode = 325 AND grantyear = 2019


INSERT INTO dbo.TemplateGrantFiles 
VALUES 
(325, 2019, 1, '<b>Letters of Support</b>',1)

INSERT INTO dbo.TemplateGrantFiles 
VALUES 
(325, 2019, 2, '<b>Key Personnel Statement</b>',1)

INSERT INTO dbo.TemplateGrantFiles 
VALUES 
(325, 2019, 3, '<b>Demographic Information</b>',1)

INSERT INTO dbo.TemplateGrantFiles 
VALUES 
(325, 2019, 4, '<b>Lead Agency Indirect Cost Rate Letter</b>',0)



SELECT * FROM BudgetInvalidColumn 
WHERE fundcode = 325
AND columnName LIKE '%descr'

INSERT INTO BudgetInvalidColumn 
(FiscalYEAR, FundCode, ColumnName)
SELECT 2019, 325, ColumnName 
FROM BudgetInvalidColumn 
WHERE fundcode = 322 AND fiscalyear = 2016


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 325 and fiscalyear = 2019 
AND columnName IN (
'txtProfessionalDevelopOpportunitiesColD',
'txtProfessionalDevelopOpportunitiesColF',
'txtProfessionalDevelopOpportunities',
'txtProfessionalDevelopOpportunitiesDescr'
)


INSERT INTO BudgetInvalidColumn 
(FiscalYEAR, FundCode, ColumnName) VALUES 
(2019, 325, 'txtAncillaryColD')

INSERT INTO BudgetInvalidColumn 
(FiscalYEAR, FundCode, ColumnName) VALUES 
(2019, 325, 'txtAncillaryColF')

INSERT INTO BudgetInvalidColumn 
(FiscalYEAR, FundCode, ColumnName) VALUES 
(2019, 325, 'txtAncillary')

INSERT INTO BudgetInvalidColumn 
(FiscalYEAR, FundCode, ColumnName) VALUES 
(2019, 325, 'txtAncillaryDescr')



--exec uspGetCheckList @GrantApplicantId=6367