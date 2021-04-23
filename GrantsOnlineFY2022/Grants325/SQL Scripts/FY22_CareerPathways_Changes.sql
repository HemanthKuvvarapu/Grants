INSERT INTO [dbo].[GrantApplicant]
            ([AgencyName]
            ,[Username]
            ,[Passphrase]
            ,[CreatedDate]
            ,[ModifiedDate]
            ,[Address1]
            ,[Address2]
            ,[City]
            ,[State]
            ,[Zipcode]
            ,[Phone]
            ,[Fax]
            ,[Email]
            ,[GrantTypeId]
            ,[FiscalYear]
            ,[LatestSubmitDate]
            ,[MiscDocsPrinted]
            ,[FirstSubmitDate]
            ,[FundCode]
            ,[EligibilityAmount]
            ,[Contact First Name]
            ,[Contact Last Name]
            ,[TaxId]
            ,[Amendment1SubmitDate]
            ,[Amendment2SubmitDate]
            ,[programtypeid]
            ,[OrgId]
            ,[DocId]
            ,[VendorCode]
            ,[MMarsId]
            ,[ADNumber]
            ,[UseLegalAddress]
            ,[legalAddress]
            ,[legalCity]
            ,[legalState]
            ,[legalzipcode]
            ,[UPKProgramName]
            ,[isPCHP]
            ,[Awarded]
            ,[Amendment3SubmitDate])
    select [AgencyName]
            ,[Username]
            ,[Passphrase]
            ,[CreatedDate]
            ,[ModifiedDate]
            ,[Address1]
            ,[Address2]
            ,[City]
            ,[State]
            ,[Zipcode]
            ,[Phone]
            ,[Fax]
            ,[Email]
            ,[GrantTypeId]
            ,2022
            ,[LatestSubmitDate]
            ,[MiscDocsPrinted]
            ,[FirstSubmitDate]
            ,[FundCode]
            ,[EligibilityAmount]
            ,[Contact First Name]
            ,[Contact Last Name]
            ,[TaxId]
            ,[Amendment1SubmitDate]
            ,[Amendment2SubmitDate]
            ,[programtypeid]
            ,[OrgId]
            ,[DocId]
            ,[VendorCode]
            ,[MMarsId]
            ,[ADNumber]
            ,[UseLegalAddress]
            ,[legalAddress]
            ,[legalCity]
            ,[legalState]
            ,[legalzipcode]
            ,[UPKProgramName]
            ,[isPCHP]
            ,[Awarded]
            ,[Amendment3SubmitDate] from GrantApplicant where FiscalYear=2021 and fundcode=325



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
		 where  FiscalYear=2022 and fundcode=325
-------------------------------------------------------------------------------------
Update dbo.GrantApplicant 
SET EligibilityAmount=100000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Bristol Community College'

Update dbo.GrantApplicant 
SET EligibilityAmount=275000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Bunker Hill Community College'

Update dbo.GrantApplicant 
SET EligibilityAmount=350000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Cape Cod Community College'

Update dbo.GrantApplicant 
SET EligibilityAmount=975000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Holyoke Community College'

Update dbo.GrantApplicant 
SET EligibilityAmount=480000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Massachusetts Bay Community College'

Update dbo.GrantApplicant 
SET EligibilityAmount=350000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Massasoit Community College' 

Update dbo.GrantApplicant 
SET EligibilityAmount=300000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Middlesex Community College' 

Update dbo.GrantApplicant 
SET EligibilityAmount=480000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Mount Wachusett Community College' 

Update dbo.GrantApplicant 
SET EligibilityAmount=975000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='North Shore Community College' 

Update dbo.GrantApplicant 
SET EligibilityAmount=275000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Quinsigamond Community College' 

Update dbo.GrantApplicant 
SET EligibilityAmount=100000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Roxbury Community College (RCC)' 

Update dbo.GrantApplicant 
SET EligibilityAmount=340000
WHERE fundcode = 325 AND fiscalyear = 2022 and [AgencyName]='Springfield Technical Community College' 

-------------------------------------------------------------------------------------
 INSERT INTO [dbo].[TemplatePageInstructions]
            ([FundCode]
            ,[FiscalYear]
            ,[Part]
            ,[Content])
      select [FundCode]
            ,2022
            ,[Part]
            ,[Content] from TemplatePageInstructions where fundcode=325 and fiscalyear=2021
------------------------------------------------------------------------------------------
update TemplatePageInstructions
	 set content='<b>Instructions: </b>Please select the languages in which your agency will provide services through the FY 2022 Career Pathways.'
	 Where FundCode = 325 
	   and FiscalYear = 2022
	   and Part = '3'

---------------------------------------------------------------------------------------
update TemplatePageInstructions
	set content='<b>Instructions:</b>  The following links provide templates for documents that you will need to complete and then upload in the appropriate ''upload'' sections below.  Please download these templates, complete and upload:<br/>
    <ul>
        <li><a href="docs/FY 2022 Career Pathways Narrative Questions.docx">Narrative Response</a></li>
        <li><a href="docs/FY22 ISA Budget Template.xlsx" target="_blank">ISA Budget Template</a></li> 
        <li><a href="docs/InKind Supports.xlsx" target="_blank">In-Kind Contributions</a></li>    
    </ul><br/>
    &nbsp;&nbsp;The following documents must be uploaded from your computer:<br/>   
    <ul> 
        <li>Depreciation Schedule (if applicable)</li>     
        <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li> 
        <li>Sub-Contractor Indirect Cost Approval (if applicable)</li> 
    </ul>'
	Where FundCode = 325 
	  and FiscalYear = 2022
	  and Part = '9'
-----------------------------------------------------------------------------------------
INSERT INTO [dbo].[BudgetInvalidColumn]
            ([FiscalYear]
            ,[FundCode]
            ,[ColumnName])
      select 2022
            ,[FundCode]
            ,[ColumnName] from [BudgetInvalidColumn] where fundcode=325 and FiscalYear=2021

---------------------------------------------------------------------------------
INSERT INTO dbo.BudgetInvalidColumn
VALUES (2022, 325, 'txtProfessionalDevelopOpportunitiesColF')

INSERT INTO dbo.BudgetInvalidColumn
VALUES (2022, 325, 'txtProfessionalDevelopOpportunitiesDescr')
---------------------------------------------------------------------------------

DELETE FROM TemplateGrantFiles
	WHERE FundCode = 325
	and GrantYear = 2022

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,1,'Narrative Response',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,2,'ISA Budget Template',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,3,'In-Kind Contributions',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,4,'Lead Agency Indirect Cost Approval Letter (if applicable)',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,5,'Subcontractor Indirect Cost Approval Letter (if applicable)',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2022,6,'Depreciation Schedule (if applicable)',0)

-------------------------------------------------------------------------------------