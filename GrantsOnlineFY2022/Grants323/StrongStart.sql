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

INSERT INTO dbo.TemplatePageInstructions 
SELECT 
323, 2021, Part, Content
FROM dbo.templatePageInstructions 
WHERE fiscalyear = 2020
AND fundcode = 323


UPDATE  dbo.TemplatePageInstructions 
SET Content = 
'<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/FY21 SSTTA Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'
WHERE fundcode = 323 AND fiscalyear = 2021 
AND part = '9'
AND CONTENT = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'


--EXEC dbo.uspGetUploadedFiles 8111, 323, 2021


INSERT INTO dbo.TemplateGrantFiles
(fundcode, grantyear, fileNum, CustomContent)
SELECT 323, 2021, FileNum, CustomContent
FROM dbo.TemplateGrantFiles
WHERE fundcode = 323 AND grantyear = 2020


INSERT INTO dbo.budgetInvalidColumn 
SELECT 2021, fundcode, columnName FROM dbo.BudgetinvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2020

 
SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColD'

DELETE FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColD'


INSERT INTO dbo.BudgetInvalidColumn
(
    FiscalYear,
    FundCode,
    ColumnName
)
VALUES
(   2021, -- FiscalYear - int
    323, -- FundCode - int
    'txtSupervisorDirectorColF' -- ColumnName - varchar(100)
    )
SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 323 AND fiscalyear = 2021 
AND columnName = 'txtSupervisorDirectorColF'


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


SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 323 AND fiscalyear = 2021
AND part = '9'


UPDATE dbo.templatePageInstructions 
SET content = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       
<ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/FY21 SSTTA Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>
      Step 2: Complete the documents.<br/>         
	  Step 3: <b>Upload</b> the completed documents. <ul>                                                    <li>Narrative Response</li>  <li>Service Delivery Plan</li>  </ul>
	  Step 4:  These additional documents need to be uploaded from your computer.<br/>
	              <ul>     <li>Grant Organization Chart</li> <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      
				  <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/>'
WHERE fundcode = 323 AND fiscalyear = 2021
AND part = '9' 
AND content = '<b>Instructions:</b><br/>  Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attachment below and saving the document to your computer.       <ul>                                                    <li><a href="docs/FY21 SSTTA Narrative Response.docx">Narrative Response</a></li>  <li><a href="docs/FY21 SSTTA Service Delivery Plan.xlsx">Service Delivery Plan</a></li>  </ul>      Step 2: Complete the documents.<br/>         Step 3: <b>Upload</b> the completed documents.<br/>Step 4:  These additional documents need to be uploaded from your computer.<br/>             <ul>     <li>Narrative Response</li>  <li>Service Delivery Plan</li>  <li>Letters of Support (applicants may be required to save all letters of support into one file to upload in grant application)</li>  <li>Lead Agency Organization Chart</li>  <li>Grant Organization Chart</li>  <li>Key Personnel Statement</li>  <li>Lead Agency Indirect Cost Rate Letter (if applicable)</li>  <li>Subcontractor Indirect Cost Rate Letter (if applicable)</li>  </ul>      <b><u>Instructions for Uploading a Document</u></b><br/>    Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>    Step 2: Next locate and select the file from your computer.<br/>    Step 3: Click the ''Open'' button to attach each file.<br/>    Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'


SELECT * FROM dbo.TemplateGrantFiles 
WHERE fundcode = 323 AND grantyear = 2021

DELETE FROM dbo.TemplateGrantFiles 
WHERE fundcode = 323 AND grantyear = 2021
AND FileNum IN ('3','4','6')

