SELECT * FROM dbo.GrantApplicant 
WHERE fundcode = 700 AND fiscalyear = 2022

INSERT INTO dbo.GrantApplicant 
(AgencyName, Username, Passphrase, CreatedDate, ModifiedDate, Address1, Address2, City, [State], Zipcode, Phone, Email, FiscalYear, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, Awarded)

SELECT AgencyName, Username, '', GETDATE(), GetDate(), Address1, Address2, City, [State], Zipcode, Phone, Email, 2022, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, 0 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2021 AND Fundcode = 700


----------------------------------------------------
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
where  FiscalYear=2022 and fundcode=700

----------------------------------------------------
Update dbo.GrantApplicant 
SET EligibilityAmount=495621
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8489

Update dbo.GrantApplicant 
SET EligibilityAmount=364572
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8488

Update dbo.GrantApplicant 
SET EligibilityAmount=283347
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8491

Update dbo.GrantApplicant 
SET EligibilityAmount=473129
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8493

Update dbo.GrantApplicant 
SET EligibilityAmount=630239
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8492

Update dbo.GrantApplicant 
SET EligibilityAmount=253092
WHERE fundcode = 700 AND fiscalyear = 2022 and GrantApplicantId=8490

-----------------------------------------------------

SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 700 AND fiscalYear = 2022


INSERT INTO dbo.TemplatePageInstructions
(
    FundCode,
    FiscalYear,
    Part,
    Content
)
SELECT Fundcode, 2022, Part, Content FROM dbo.TemplatePageInstructions 
WHERE FiscalYear = 2021 AND Fundcode = 700
-----------------------------------------------------
SELECT * FROM dbo.TemplateGrantFiles
WHERE fundcode = 700 AND grantYear = 2022

INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
SELECT Fundcode, 2022, FileNum, CustomContent, IsRequired FROM dbo.TemplateGrantFiles
WHERE grantYear = 2021 AND Fundcode = 700
----------
Delete from TemplateGrantFiles where FundCode=700 and GrantYear=2022 and FileNum=3
Update TemplateGrantFiles set FileNum=3 where FundCode=700 and GrantYear=2022 and FileNum=4
Update TemplateGrantFiles set FileNum=4 where FundCode=700 and GrantYear=2022 and FileNum=5
------------------------------------------------------------------

SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 700 AND fiscalYear = 2022


INSERT into dbo.BudgetInvalidColumn
(
    FiscalYear,
    FundCode,
    ColumnName
)
SELECT 2022, FundCode, ColumnName FROM dbo.BudgetInvalidColumn
WHERE fundcode = 700 AND fiscalyear = 2021


----------------------------------------------------------------------

UPDATE dbo.TemplatePageInstructions 
SET Content = 
    '<b>Instructions:</b><br/>  Step 1: See instructions in the grant application (RFR) for completing the following documents as required by the Grant Application.
	  <ul> 
	     <li>Project Description Abstract</li>
		 <li>Organizational Chart, Resumes and Job Descriptions</li>
	   </ul>
	   Step 2: Complete the documents.<br/>
	   Step 3: <b>Upload</b> the completed documents.<br/><br/><br/> 
	   Note: if more than one document is needed to meet the requirement, then one PDF that contains all documents should be <b>uploaded</b> to the designated section. <br/><br/> 
	   Step 4:  These additional documents need to be uploaded from your computer.<br/>
	   <ul>
	       <li>Lead Agency Indirect Cost Rate Letter</li>
		   <li>Subcontractor Indirect Cost Rate Letter</li>
	   </ul>
	   <b><u>Instructions for Uploading a Document</u></b><br/>
	   Step 1: Once you are ready to upload the documents, click the ''Browse'' button.<br/>
	   Step 2: Next locate and select the file from your computer.<br/>
	   Step 3: Click the ''Open'' button to attach each file.<br/>
	   Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>'
WHERE fundcode = 700 AND fiscalyear = 2022
AND part = '9' 


UPDATE dbo.TemplatePageInstructions
SET Content='<b>Instructions:   Please respond to all questions in the Online Grant Application Projected Deliverables - Part 8. 
Appendix I provides additional guidance for completing the Projected Deliverables (Part 8)</b>.  <br/><br/>  
These questions are organized by the <b>Required Activity outlined in the Grant Application (RFR)</b>  <br/><br/> 
<b>Please ensure that information pertaining to any subcontracted partners is included in your responses.</b>  <br/><br/>   
<i>If the answer is "0" for "Total for the YEAR," then an explanation must be provided in the description.    ALL questions require a response and each description should be answered according to the guidance provided within the appendix.</i>'
WHERE fundcode = 700 AND fiscalyear = 2022
AND part = '8'
-------------------------------------------------
Insert into [TownFunding] 
  Select DISTINCT [CityTownId]
      ,[Town]
      ,[Amount]
      ,[Fundcode]
      ,2022
	 From [GrantOnlineFY2016].[dbo].[TownFunding]
	 WHERE FiscalYear=2021
    AND FUNDCODE=700