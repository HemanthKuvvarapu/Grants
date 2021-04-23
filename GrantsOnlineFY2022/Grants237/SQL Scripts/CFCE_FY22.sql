 USE [GrantOnlineFY2016]
 GO

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
            ,[Amendment3SubmitDate] from GrantApplicant where fiscalyear=2021 and fundcode=237
-------------------
 Delete from GrantApplicant 
where AgencyName in ('ACCEPT EDUCATION COLLABORATIVE','Ashburnham-Westminster')
and fiscalyear=2022
and fundcode=237
------------------------
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
		 where  FiscalYear=2022 and fundcode=237
-------------------------------------------------------------------------------------
 INSERT INTO [dbo].[TemplatePageInstructions]
            ([FundCode]
            ,[FiscalYear]
            ,[Part]
            ,[Content])
      select [FundCode]
            ,2022
            ,[Part]
            ,[Content] from TemplatePageInstructions where fundcode=237 and fiscalyear=2021

-----------------------------------------------------------------------------------------	 

UPDATE TemplatePageInstructions 
SET CONTENT='Please note: For grantees who receive ParentChild+ funds, please enter your total ParentChild+ budget in Part 4a.
<br/><br/>If staff are funded for both ParentChild+ and CFCE activities, please enter funds in the appropriate budget.  For example, if you are the CFCE Coordinator, and you conduct ParentChild+ activities, those funds would be entered into the ParentChild+ Budget, and if you are also the ParentChild+ Coordinator, and you conduct CFCE activities, those funds would be entered into the CFCE Budget.
<br/><br/>If you subcontract with an outside agency to implement your ParentChild+ program, those funds should be entered into the ParentChild+ budget, not a separate subcontractor budget. In the ParentChild+ Budget Narrative, identify the outside agency on those budget lines.
<br/><br/>  <span style="color:red">  DO NOT INCLUDE PARENTCHILD+ FUNDS IN THE LEAD AGENCY BUDGET OR SUBCONTRACTS.<br/><br/>  THE LEAD AGENCY BUDGET + ParentChild+ BUDGET + SUBCONTRACTS (IF APPLICABLE) = TOTAL ELIGIBILITY AMOUNT</span>'
Where FundCode = 237 
	  and FiscalYear = 2022
	  and Part = '4a'
-----------------------------------------------------------------------------------------	 
UPDATE TemplatePageInstructions 
SET CONTENT='<b>Instructions: </b>The following narrative section is designed to address your program’s effectiveness in delivering the required services outlined in the FY 2022 Coordinated Family and Community Engagement Grant Application. (Please refer to the "Required Services" section of the FY 2018 grant application for additional information.) All questions must be answered in the space provided. The character limit including spaces is 30,000. <br/><br/>Please note: Review the PDF to ensure that your full response is included. If the full response is not visible, you have exceeded your character limit and you will need to revise your response.'
Where FundCode = 237 
	  and FiscalYear = 2022
	  and Part = '7'
-----------------------------------------------------------------------------------------	 

UPDATE TemplatePageInstructions 
SET CONTENT='<b>Instructions: </b>
Grantees are asked to make projections related to FY 2022 CFCE required services. 
Grantees will complete quarterly reports that will capture progress to date in each of these areas.
Please note:  additional outcome data related to evidence-based literacy programming will be collected during FY 2022.  (See Required Services.)'
Where FundCode = 237 
	  and FiscalYear = 2022
	  and Part = '8'
-----------------------------------------------------------------------------------------
 INSERT INTO [dbo].[BudgetInvalidColumn]
            ([FiscalYear]
            ,[FundCode]
            ,[ColumnName])
 select 2022
            ,[FundCode]
            ,[ColumnName] from [BudgetInvalidColumn] where fundcode=237 and fiscalyear=2021 
		   
------------------------------------------------------------------------------------------	 
Delete from BudgetInvalidColumn where fundcode=237 and FiscalYear=2022 and ColumnName='txtStaffTrainingColD'
Delete from BudgetInvalidColumn where fundcode=237 and FiscalYear=2022 and ColumnName='txtStaffTraining'
Delete from BudgetInvalidColumn where fundcode=237 and FiscalYear=2022 and ColumnName='txtStaffTrainingDescr'

--------------------------------------------------------------------------------------------	 

INSERT INTO dbo.BudgetInvalidColumn
VALUES (2022, 237, 'txtInstructionalStaffColF')
   
------------------------------------------------------------------------------------------	   
  

update TemplatePageInstructions
	set content='<b>Instructions:</b>
    <br/>Step 1: Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.<br/> 
            <ul><li><a href="docs/FY2022 CFCE ACTIVITIES CALENDAR.xls">Calendar of Activities</a></li>  
                <li><a href="docs/FY2022 CFCE - In-Kind Contributions and Fundraising Resources.xlsx">In-Kind Contributions and Fundraising</a></li>
                <li><a href="docs/FY2022 CFCE - ParentChild Statistical Projections.docx">ParentChild+ Statistical Information (if applicable)</a></li>  
            </ul>  
            <br/>Step 2: Complete the documents.   <br/>
            <br/>  Step 3: Upload the completed documents.<br/>  
                <ul>  
                    <li>CFCE Calendar of Activities</li>  
                    <li>In-Kind Contributions and Fundraising</li>  
                    <li>ParentChild+ Statistical Information (if applicable)</li> 
                </ul>   
            <br/>  Step 4: The following documents are ONLY required to be uploaded if there are CHANGES since your FY2021 submission.<br/> 
                    <ul>  
                        <li>Advisory Council Bylaws</li>  
                        <li>Lead Agency Organization Chart</li> 
                        <li>CFCE Program Organization Chart</li> 
                        <li>Resume of CFCE Coordinator</li>  
                        <li>Literacy Program Evaluation Form</li> 
                        <li>Parent Satisfaction Survey</li> 
                     </ul>   
            <br/>  Step 5: These documents must be uploaded, if applicable. <br/>     
                    <ul>
                        <li> Lead Agency Indirect Cost Rate Letter</li> 
                        <li>Subcontractor Indirect Cost Rate Letter</li>
                    </ul>     
            <br/>    <b><u>Instructions for Uploading a Document </u></b>
            <br/>  Step 1: Once you are ready to upload the documents, click the ''Browse'' button. 
            <br/>  Step 2: Next locate and select the file from your computer. 
            <br/>  Step 3: Click the ''Open'' button to attach each file. 
            <br/>  Step 4: After attaching all files, click the ''Save Information'' button located below.<br/><br/>  '
	Where FundCode = 237 
	  and FiscalYear = 2022
	  and Part = '9'
-------------------------------------------------------------------------------------------
 
----------------------------------------------------------------------------------------------------

DELETE FROM TemplateGrantFiles
	WHERE FundCode = 237
	and GrantYear = 2022

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,1,'<b>File: CFCE Calendar of Activities</b>',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,2,'<b>File: In-Kind Contributions and Fundraising</b>',1)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,3,'<b>File: ParentChild+ Statistical Information (if applicable)</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,4,'<b>File: Advisory Council Bylaws</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,5,'<b>File: Lead Agency Organization Chart</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,6,'<b>File: CFCE Program Organization Chart</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,7,'<b>File: Resume of CFCE Coordinator</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,8,'<b>File: Literacy Program Evaluation Form</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,9,'<b>File: Parent Satisfaction Survey</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,10,'<b>File: Lead Agency Indirect Cost Rate Letter (if applicable)</b>',0)

INSERT INTO [dbo].[TemplateGrantFiles]
VALUES (237,2022,11,'<b>File: Subcontractor/Provider Indirect Cost Rate Letter (if applicable)</b>',0)

--------------------------------------------------------------------------------------------------------------
 Insert into GrantTown 
  Select [GrantTownId]
      ,[CityTownId]
      ,[RegionID]
      ,[CCRRRegionId]
      ,[MA_Town_ID]
      ,[Town]
      ,[Region]
      ,[State]
      ,[StateFIPS]
      ,[Population2000]
      ,[Population2010]
      ,[FamiliesRecievingServices]
      ,[ChildrenReceivingServices]
      ,[Providers]
      ,[LicensedPrograms]
      ,[FundDistribution]
      ,[CCRRRegionName]
      ,[CensusHouseholds]
      ,[CensusChildren]
      ,[IsLevel4Community]
      ,[IsGatewayCommunity]
      ,[HighRiskVisitingFactor]
      ,[IsRuralCommunities]
      ,[SelectedPopulation]
      ,2022
      ,[Avg# Number of Providers in Towns with Families Receiving Servic]
      ,[Median Number of Families Receiving Services Per Month]
      ,[Median Number of Children Receiving Services Per Month]
      ,[CensusChildren0to5]
      ,[ChildrenWithDisabilitiesPreschool]
	 From GrantTown
	 WHERE FiscalYear=2021
 --------------------------------------------------------------------------------------------------------------
 Insert into [TownFunding] 
  Select [CityTownId]
      ,[Town]
      ,[Amount]
      ,[Fundcode]
      ,2022
	 From [GrantOnlineFY2016].[dbo].[TownFunding]
	 WHERE FiscalYear=2021
    AND FUNDCODE=237
------------------------------------------------------------------------------------------------------------
 Insert into [selectedpopulations] 
  Select [Town/City]
      ,[Community]
      ,[DISTRICT]
      ,[First Language Not English]
      ,[English Language Learner]
      ,[Students With Disabilities]
      ,[High Needs]
      ,[CityTownId]
      ,[RegionId]
      ,[Children with Disabilities]
      ,[First Language Not English %]
      ,[English Language Learner %]
      ,[Students With Disabilities %]
      ,[High Needs %]
      ,2022
      ,[EconomicallyDisadvantaged]
	 From [GrantOnlineFY2016].[dbo].[selectedpopulations]
	 WHERE FiscalYear=2021
-----------------------------------------------------------------------------------------------
update GrantApplicant set EligibilityAmount=206020 where FundCode=237 and FiscalYear=2022 and AgencyName='AYER-SHIRLEY REGIONAL SCHOOL DISTR'
update GrantApplicant set EligibilityAmount=342985 where FundCode=237 and FiscalYear=2022 and AgencyName='CAPE COD CHILDREN S PLACE INC'
update GrantApplicant set EligibilityAmount=76285 where FundCode=237 and FiscalYear=2022 and AgencyName='CENTRAL BERKSHIRE REGIONAL SCHL DIST'
update GrantApplicant set EligibilityAmount=339953 where FundCode=237 and FiscalYear=2022 and AgencyName='CHILD CARE OF THE BERKSHIRES, INC.'
update GrantApplicant set EligibilityAmount=164540 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF ATTLEBORO'
update GrantApplicant set EligibilityAmount=155705 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF BROCKTON'
update GrantApplicant set EligibilityAmount=263815 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF CAMBRIDGE'
update GrantApplicant set EligibilityAmount=47690 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF EVERETT'
update GrantApplicant set EligibilityAmount=490580 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF FALL RIVER'
update GrantApplicant set EligibilityAmount=141275 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF FRAMINGHAM'
update GrantApplicant set EligibilityAmount=144485 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF LEOMINSTER'
update GrantApplicant set EligibilityAmount=300105 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF LOWELL'
update GrantApplicant set EligibilityAmount=249926 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF LYNN'
update GrantApplicant set EligibilityAmount=179344 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF MEDFORD'
update GrantApplicant set EligibilityAmount=170264 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF NEWTON'
update GrantApplicant set EligibilityAmount=133724 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF NORTHAMPTON'
update GrantApplicant set EligibilityAmount=374098 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF PEABODY'
update GrantApplicant set EligibilityAmount=152289 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF PITTSFIELD'
update GrantApplicant set EligibilityAmount=303320 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF SOMERVILLE'
update GrantApplicant set EligibilityAmount=365674 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF SPRINGFIELD'
update GrantApplicant set EligibilityAmount=63555 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF WESTFIELD'
update GrantApplicant set EligibilityAmount=637310 where FundCode=237 and FiscalYear=2022 and AgencyName='CITY OF WORCESTER'
update GrantApplicant set EligibilityAmount=504188 where FundCode=237 and FiscalYear=2022 and AgencyName='COLLABORATIVE FOR EDUCATIONAL SERVICES'
update GrantApplicant set EligibilityAmount=197361 where FundCode=237 and FiscalYear=2022 and AgencyName='COMMUNITY ACTION PROGRAMS'
update GrantApplicant set EligibilityAmount=135387 where FundCode=237 and FiscalYear=2022 and AgencyName='COMMUNITY ACTION INC'
update GrantApplicant set EligibilityAmount=82500 where FundCode=237 and FiscalYear=2022 and AgencyName='COMMUNITY HEALTH PROGRAMS, INC'
update GrantApplicant set EligibilityAmount=131095 where FundCode=237 and FiscalYear=2022 and AgencyName='COMMUNITY ACTION PIONEER VALLEY, INC'
update GrantApplicant set EligibilityAmount=137794 where FundCode=237 and FiscalYear=2022 and AgencyName='COMMUNITY TEAMWORK  INC'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='DISCOVERY SCHOOLHOUSE INC'
update GrantApplicant set EligibilityAmount=854889 where FundCode=237 and FiscalYear=2022 and AgencyName='FAMILY NURTURING CTR OF MASS'
update GrantApplicant set EligibilityAmount=51205 where FundCode=237 and FiscalYear=2022 and AgencyName='FRONTIER REGIONAL SCHOOL DISTRICT'
update GrantApplicant set EligibilityAmount=63704 where FundCode=237 and FiscalYear=2022 and AgencyName='GILL MONTAGUE RSD'
update GrantApplicant set EligibilityAmount=315210 where FundCode=237 and FiscalYear=2022 and AgencyName='GREATER LAWRENCE COMMUNITY'
update GrantApplicant set EligibilityAmount=69655 where FundCode=237 and FiscalYear=2022 and AgencyName='HAMILTON-WENHAM REG SCHOOL DIST'
update GrantApplicant set EligibilityAmount=73500 where FundCode=237 and FiscalYear=2022 and AgencyName='HILLTOWN COMM HEALTH CTRS INC'
update GrantApplicant set EligibilityAmount=311505 where FundCode=237 and FiscalYear=2022 and AgencyName='HOLYOKE CHICOPEE SPRINGFIELD'
update GrantApplicant set EligibilityAmount=129294 where FundCode=237 and FiscalYear=2022 and AgencyName='JUSTICE RESOURCE INSTITUTE INC'
update GrantApplicant set EligibilityAmount=109301 where FundCode=237 and FiscalYear=2022 and AgencyName='MARTHAS VINEYARD COMMUNITY'
update GrantApplicant set EligibilityAmount=128515 where FundCode=237 and FiscalYear=2022 and AgencyName='METROWEST YMCA'
update GrantApplicant set EligibilityAmount=94500 where FundCode=237 and FiscalYear=2022 and AgencyName='MOHAWK TRAIL REGIONAL SCHOOL'
update GrantApplicant set EligibilityAmount=366837 where FundCode=237 and FiscalYear=2022 and AgencyName='MONTACHUSETT OPPORTUNITY COUNCIL'
update GrantApplicant set EligibilityAmount=45701 where FundCode=237 and FiscalYear=2022 and AgencyName='NASHOBA REGIONAL SCHOOL'
update GrantApplicant set EligibilityAmount=218730 where FundCode=237 and FiscalYear=2022 and AgencyName='NEWTON COMMUNITY SERVICE CENTER dba FAMILY ACCESS'
update GrantApplicant set EligibilityAmount=83789 where FundCode=237 and FiscalYear=2022 and AgencyName='NEW SALEM/WENDELL UNION SCHOOL'
update GrantApplicant set EligibilityAmount=47689 where FundCode=237 and FiscalYear=2022 and AgencyName='OLD ROCHESTER REGIONAL SCHOOL DIST'
update GrantApplicant set EligibilityAmount=70585 where FundCode=237 and FiscalYear=2022 and AgencyName='PATHWAYS FOR CHILDREN INC'
update GrantApplicant set EligibilityAmount=407770 where FundCode=237 and FiscalYear=2022 and AgencyName='PEOPLE ACTING IN COMMUNITY'
update GrantApplicant set EligibilityAmount=45885 where FundCode=237 and FiscalYear=2022 and AgencyName='PIONEER VALLEY REGNL SCH'
update GrantApplicant set EligibilityAmount=272565 where FundCode=237 and FiscalYear=2022 and AgencyName='QUINCY COMMUNITY ACTION PROGRAMS INC'
update GrantApplicant set EligibilityAmount=600495 where FundCode=237 and FiscalYear=2022 and AgencyName='SELF HELP INC'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='SHINING STARS LEARNING CENTER'
update GrantApplicant set EligibilityAmount=85662 where FundCode=237 and FiscalYear=2022 and AgencyName='SOUTH MIDDLESEX OPPORTUNITY COUNCIL INC'
update GrantApplicant set EligibilityAmount=146015 where FundCode=237 and FiscalYear=2022 and AgencyName='SOUTH SHORE COMM ACTION COUNCIL'
update GrantApplicant set EligibilityAmount=94500 where FundCode=237 and FiscalYear=2022 and AgencyName='SPENCER CHILD CARE'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF AGAWAM'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF BOURNE'
update GrantApplicant set EligibilityAmount=59091 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF BRIMFIELD'
update GrantApplicant set EligibilityAmount=127474 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF BROOKLINE'
update GrantApplicant set EligibilityAmount=157330 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF CLINTON'
update GrantApplicant set EligibilityAmount=175665 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF FALMOUTH'
update GrantApplicant set EligibilityAmount=47690 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF HULL'
update GrantApplicant set EligibilityAmount=37415 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF IPSWICH'
update GrantApplicant set EligibilityAmount=134972 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF LEE'
update GrantApplicant set EligibilityAmount=161907 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF LUDLOW'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF LUNENBURG'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF MARSHFIELD'
update GrantApplicant set EligibilityAmount=95286 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF MILFORD'
update GrantApplicant set EligibilityAmount=75905 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF NANTUCKET'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF NORWOOD'
update GrantApplicant set EligibilityAmount=85596 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF OXFORD'
update GrantApplicant set EligibilityAmount=175669 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN  OF PLYMOUTH'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF SANDWICH'
update GrantApplicant set EligibilityAmount=185540 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WAKEFIELD'
update GrantApplicant set EligibilityAmount=78945 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WALPOLE'
update GrantApplicant set EligibilityAmount=101924 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WAREHAM'
update GrantApplicant set EligibilityAmount=164145 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WATERTOWN'
update GrantApplicant set EligibilityAmount=51205 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WEST SPRINGFIELD'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WESTWOOD'
update GrantApplicant set EligibilityAmount=88255 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WEYMOUTH'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WINCHENDON'
update GrantApplicant set EligibilityAmount=45700 where FundCode=237 and FiscalYear=2022 and AgencyName='TOWN OF WINTHROP'
update GrantApplicant set EligibilityAmount=65165 where FundCode=237 and FiscalYear=2022 and AgencyName='TRITON REGIONAL SCHOOL DISTRICT'
update GrantApplicant set EligibilityAmount=246651 where FundCode=237 and FiscalYear=2022 and AgencyName='TRIUMPH INC'
update GrantApplicant set EligibilityAmount=137571 where FundCode=237 and FiscalYear=2022 and AgencyName='VALUING OUR CHILDREN INC'
update GrantApplicant set EligibilityAmount=292469 where FundCode=237 and FiscalYear=2022 and AgencyName='YMCA OF CENTRAL MASSACHUSETTS'