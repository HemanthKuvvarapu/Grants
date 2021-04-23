SELECT * FROM grantApplicant WHERE fundcode = 515

EXEC uspGetGrantApplicant @GrantApplicantId=6373,@FundCode=515
go
exec uspGetCPPIPartStatus @GrantApplicantId=6373
go
exec uspGetBudgetAmountTotal @GrantApplicantId=6373
go

EXEC uspGetPartInstruction 239,2019, 1

SELECT * FROM TemplatePageInstructions WHERE fundcode = 515 AND fiscalyear = 2019


INSERT INTO TemplatePageInstructions 
SELECT 515, 2019, Part, Content 
FROM TemplatePageInstructions 
WHERE fundcode = 511 AND fiscalyear = 2018

UPDATE templatePageInstructions 
SET content = REPLACE(content, '2018', '2019')
WHERE fundcode = 515 AND fiscalyear = 2019

UPDATE TemplatePageInstructions 
SET content = '<b>Instructions: </b>Select the names of the cities/towns to be served in each region. When each city/town is selected, demographic information will populate. For more information about the demographic information displayed below, see Appendices E-1, E-2, and E-3 in the Grant Application.'
WHERE fundcode = 515 AND fiscalyear = 2019
AND part = '2'


UPDATE TemplatePageInstructions 
SET content = '<b>Instructions:</b><br/><br/>  <b>Upload</b>&nbsp;the completed documents. These additional documents need to be uploaded from your computer.<br/>  <ul type="A">   <li>Project Narrative</li>   <li>Implementation Timeline</li>   <li>Cost Projection Summary</li>   <li>Needs Assessment Results</li>   <li>Strategic Plan</li>   <li>MOU between LEA and each Subcontractor</li>   <li>Letter of Commitment from Superintendent/Receiver, and/or School Committee chair</li>   <li>Resumes of Key Personnel from LEA and each Subcontractor</li>   <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>   <li>Subcontractor Indirect Cost Approval Letter (if applicable)</li></ul>  <u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''OPEN'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''SAVE Information'' button located below.<br />'
where fundcode = 515
AND fiscalyear = 2019 
AND Part = '9'




SELECT * FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019

INSERT INTO BudgetInvalidColumn 
SELECT 2019, 515, columnname 
FROM BudgetInvalidColumn 
WHERE fundcode = 511 AND fiscalyear = 2018


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtSupervisorDirectorColD'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtProjectCoordinatorColF'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtCoordinatorColF'

INSERT INTO BudgetInvalidColumn 
VALUES
(2019, 515, 'txtAdvisorColD')

INSERT INTO BudgetInvalidColumn 
VALUES
(2019, 515, 'txtCSAdvisorColD')


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtEquipmentRentalColD'


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtMembershipSubscriptionsColD'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtPrintingReproductionColD'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtStaffTrainingColD'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtStaffTrainingColF'


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtInstructionalEquipmentColF'


DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtNoninstructionalEquipmentColF'

DELETE FROM BudgetInvalidColumn 
WHERE fundcode = 515 
AND fiscalyear = 2019
AND columnName = 'txtEqOtherColF'




SELECT * FROM dbo.TemplateGrantFiles
WHERE fundcode = 515
AND GrantYear = 2019

INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 1, 'Project Narrative',1)

INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 2, 'Implementation Timeline', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 3, 'Cost Projection Summary', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 4, 'Needs Assessment Results', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 5, 'Strategic Plan', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 6, 'MOU between LEA and each Subcontractor', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 7, 'Letter of Commitment from Superintendent/Receiver, and/or School Committee Chair', 1)


INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 8, 'Resumes of Key Personnel from LEA and each Subcontractor', 1)

INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 9, 'Lead Agency Indirect Cost Approval Letter (if applicable)', 0)

INSERT INTO TemplateGrantFiles 
VALUES
(515, 2019, 10, 'Subcontractor Indirect Cost Approval Letter (if applicable)', 0)



