 USE [GrantOnlineFY2016]
 GO

 --INSERT INTO [dbo].[GrantApplicant]
 --           ([AgencyName]
 --           ,[Username]
 --           ,[Passphrase]
 --           ,[CreatedDate]
 --           ,[ModifiedDate]
 --           ,[Address1]
 --           ,[Address2]
 --           ,[City]
 --           ,[State]
 --           ,[Zipcode]
 --           ,[Phone]
 --           ,[Fax]
 --           ,[Email]
 --           ,[GrantTypeId]
 --           ,[FiscalYear]
 --           ,[LatestSubmitDate]
 --           ,[MiscDocsPrinted]
 --           ,[FirstSubmitDate]
 --           ,[FundCode]
 --           ,[EligibilityAmount]
 --           ,[Contact First Name]
 --           ,[Contact Last Name]
 --           ,[TaxId]
 --           ,[Amendment1SubmitDate]
 --           ,[Amendment2SubmitDate]
 --           ,[programtypeid]
 --           ,[OrgId]
 --           ,[DocId]
 --           ,[VendorCode]
 --           ,[MMarsId]
 --           ,[ADNumber]
 --           ,[UseLegalAddress]
 --           ,[legalAddress]
 --           ,[legalCity]
 --           ,[legalState]
 --           ,[legalzipcode]
 --           ,[UPKProgramName]
 --           ,[isPCHP]
 --           ,[Awarded]
 --           ,[Amendment3SubmitDate])
 --   select [AgencyName]
 --           ,[Username]
 --           ,[Passphrase]
 --           ,[CreatedDate]
 --           ,[ModifiedDate]
 --           ,[Address1]
 --           ,[Address2]
 --           ,[City]
 --           ,[State]
 --           ,[Zipcode]
 --           ,[Phone]
 --           ,[Fax]
 --           ,[Email]
 --           ,[GrantTypeId]
 --           ,2021
 --           ,[LatestSubmitDate]
 --           ,[MiscDocsPrinted]
 --           ,[FirstSubmitDate]
 --           ,[FundCode]
 --           ,[EligibilityAmount]
 --           ,[Contact First Name]
 --           ,[Contact Last Name]
 --           ,[TaxId]
 --           ,[Amendment1SubmitDate]
 --           ,[Amendment2SubmitDate]
 --           ,[programtypeid]
 --           ,[OrgId]
 --           ,[DocId]
 --           ,[VendorCode]
 --           ,[MMarsId]
 --           ,[ADNumber]
 --           ,[UseLegalAddress]
 --           ,[legalAddress]
 --           ,[legalCity]
 --           ,[legalState]
 --           ,[legalzipcode]
 --           ,[UPKProgramName]
 --           ,[isPCHP]
 --           ,[Awarded]
 --           ,[Amendment3SubmitDate] from GrantApplicant where FiscalYear=2020 and fundcode=325



	-- --Reset passwords
	-- update grantapplicant
	--	 set [Passphrase] = ''
	--	    ,[LatestSubmitDate] = null
	--	   ,[MiscDocsPrinted] = null
	--	   ,[FirstSubmitDate] = null
	--	   ,[TaxId] = null
	--	   ,[Amendment1SubmitDate] = null
	--	   ,[Amendment2SubmitDate] = null
	--	   ,[UPKProgramName] = null
	--	   ,[Awarded] = null
	--	 where  FiscalYear=2021 and fundcode=325
---------------------------------------------------------------------------------------
 --INSERT INTO [dbo].[TemplatePageInstructions]
 --           ([FundCode]
 --           ,[FiscalYear]
 --           ,[Part]
 --           ,[Content])
 --     select [FundCode]
 --           ,2021
 --           ,[Part]
 --           ,[Content] from TemplatePageInstructions where fundcode=325 and fiscalyear=2020

-----------------------------------------------------------------------------------------
 update TemplatePageInstructions
	 set content='<b>Instructions: </b>Please select the languages in which your agency will provide services through the FY 2021 Career Pathways.'
	 Where FundCode = 325 
	   and FiscalYear = 2021
	   and Part = '3'
	  
-----------------------------------------------------------------------------------------
 update TemplatePageInstructions
	 set content='<b>Instructions:</b>&nbsp;Please reference the fund use section within the Grant Application and Appendix B: Budget Guidelines for specific guidelines regarding the budget, including program and administrative costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET.&nbsp;Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.</b>'
	 Where FundCode = 325 
	   and FiscalYear = 2021
	   and Part = '4'
	  
-----------------------------------------------------------------------------------------	  
	  
 --INSERT INTO [dbo].[BudgetInvalidColumn]
 --           ([FiscalYear]
 --           ,[FundCode]
 --           ,[ColumnName])
 --select 2021
 --           ,[FundCode]
 --           ,[ColumnName] from [BudgetInvalidColumn] where fundcode=325 and FiscalYear=2020 
		   
------------------------------------------------------------------------------------------	 
Delete from BudgetInvalidColumn where fundcode=325 and FiscalYear=2021 and ColumnName='txtProfessionalDevelopOpportunitiesColF'
Delete from BudgetInvalidColumn where fundcode=325 and FiscalYear=2021 and ColumnName='txtCSAdvisorColF'
Delete from BudgetInvalidColumn where fundcode=325 and FiscalYear=2021 and ColumnName='txtCoordinatorColF'

------------------------------------------------------------------------------------------	 

INSERT INTO dbo.BudgetInvalidColumn
VALUES (2021, 325, 'txtProfessionalDevelopOpportunitiesColD')

INSERT INTO dbo.BudgetInvalidColumn
VALUES (2021, 325, 'txtProfessionalDevelopOpportunities')


INSERT INTO dbo.BudgetInvalidColumn
VALUES (2021, 325, 'txtMembershipSubscriptionsColD')


INSERT INTO dbo.BudgetInvalidColumn
VALUES (2021, 325, 'txtMembershipSubscriptionsColF')


INSERT INTO dbo.BudgetInvalidColumn
VALUES (2021, 325, 'txtMembershipSubscriptions')	   
------------------------------------------------------------------------------------------	   
  
update TemplatePageInstructions
	set content='<b>Instructions:</b>  The following links provide templates for documents that you will need to complete and then upload in the appropriate ''upload'' sections below.  Please download these templates, complete and upload:<br/>   <ul><li><a href="docs/FY 2021 Career Pathways Narrative Questions.docx">Narrative Response</a></li><li><a href="docs/FY21 ISA Budget Template.xlsx" target="_blank">ISA Budget Template</a></li>    <li><a href="docs/FY21 Career Pathways Travel Approval Form.docx" target="_blank">Travel Approval Form (if applicable)</a></li>    <li><a href="docs/InKind Supports.xlsx" target="_blank">In-Kind Contributions</a></li>       </ul><br/>&nbsp;&nbsp;The following documents must be uploaded from your computer:<br/>    <ul> <li>Depreciation Schedule (if applicable)</li>     <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>    <li>Sub-Contractor Indirect Cost Approval (if applicable)</li> </ul>'
	Where FundCode = 325 
	  and FiscalYear = 2021
	  and Part = '9'
-------------------------------------------------------------------------------------------
 --INSERT INTO [dbo].[TemplateGrantFiles]
 --           ([FundCode]
 --           ,[GrantYear]
 --           ,[FileNum]
 --           ,[CustomContent]
 --           ,[IsRequired])
 --     select [FundCode]
 --           ,2021
 --           ,[FileNum]
 --           ,[CustomContent]
 --           ,[IsRequired]  
	-- from TemplateGrantFiles
	-- where FundCode = 325
	--   and GrantYear = 2020

----------------------------------------------------------------------------------------------------

DELETE FROM TemplateGrantFiles
	WHERE FundCode = 325
	and GrantYear = 2021

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,1,'Narrative Response',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,2,'ISA Budget Template',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,3,'Travel Approval Form (if applicable)',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,4,'In-Kind Contributions',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,5,'Lead Agency Indirect Cost Approval Letter (if applicable)',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,6,'Subcontractor Indirect Cost Approval Letter (if applicable)',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (325,2021,7,'Depreciation Schedule (if applicable)',0)
