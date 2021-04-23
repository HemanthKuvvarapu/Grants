SELECT * FROM dbo.GrantApplicant 
WHERE fundcode = 390 AND fiscalyear = 2022

INSERT INTO dbo.GrantApplicant 
(AgencyName, Username, Passphrase, CreatedDate, ModifiedDate, Address1, Address2, City, [State], Zipcode, Phone, Email, FiscalYear, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, Awarded)

SELECT AgencyName, Username, '', GETDATE(), GetDate(), Address1, Address2, City, [State], Zipcode, Phone, Email, 2022, Fundcode, EligibilityAmount, TaxId, DocId, VEndorCode, MMArsId, ADNumber, isPCHP, 0 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2021 AND Fundcode = 390

DELETE FROM dbo.GrantApplicant WHERE AgencyName='Action for Boston Community Development, Inc. - (Everett/Malden)' and FiscalYear = 2022 AND Fundcode = 390
DELETE FROM dbo.GrantApplicant WHERE AgencyName='COMMUNITY DEVELOPMENT INSTITUTE HEAD START.' and FiscalYear = 2022 AND Fundcode = 390
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
		 where  FiscalYear=2022 and fundcode=390
-----------------------------------------------------

SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 390 AND fiscalYear = 2022


INSERT INTO dbo.TemplatePageInstructions
(
    FundCode,
    FiscalYear,
    Part,
    Content
)
SELECT Fundcode, 2022, Part, Content FROM dbo.TemplatePageInstructions 
WHERE FiscalYear = 2021 AND Fundcode = 390
-----------------------------------------------------
SELECT * FROM dbo.TemplateGrantFiles
WHERE fundcode = 390 AND grantYear = 2022

INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
SELECT Fundcode, 2022, FileNum, CustomContent, IsRequired FROM dbo.TemplateGrantFiles
WHERE grantYear = 2021 AND Fundcode = 390

------------------------------------------------------------------

SELECT * FROM dbo.BudgetInvalidColumn 
WHERE fundcode = 390 AND fiscalYear = 2022


INSERT into dbo.BudgetInvalidColumn
(
    FiscalYear,
    FundCode,
    ColumnName
)
SELECT 2022, FundCode, ColumnName FROM dbo.BudgetInvalidColumn
WHERE fundcode = 390 AND fiscalyear = 2021


--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtSupervisoryStaffMileageRate'


--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtInstructionalStaffMileageRate'


--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtTravelOtherMileageRate'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtSupervisoryStaff'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtInstructionalStaff'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtTravelOther'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtSupervisoryStaffDescr'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtInstructionalStaffDescr'

--delete FROM dbo.BudgetInvalidColumn
--WHERE fundcode = 390 AND fiscalyear = 2022
--AND ColumnName = 'txtTravelOtherDescr'
--------------------------
--Insert into dbo.BudgetInvalidColumn
--VALUES (2022,390,'txtPrintingReproductionColD')

Insert into dbo.BudgetInvalidColumn
VALUES (2022,390,'txtPrintingReproduction')--

Insert into dbo.BudgetInvalidColumn
VALUES (2022,390,'txtPrintingReproductionDescr')


----------------------------------------------------------------------

UPDATE dbo.TemplatePageInstructions 
SET Content = 
'<b>Instructions:</b>The following narrative section is designed to address your program’s capacity to deliver the required services outlined in the FY 2022 Head Start State Supplemental Grant Application. All questions must be answered in the space provided. The character limit including spaces is 7,000.<b> Please note: prior to submission, review the PDF to ensure that your full response is included. If the full response is not visible, you have exceeded your character limit and you will need to revise your response accordingly.</b><br/><br/><b>Note: Please ensure that responses provided in this section are aligned with your program responses in the FY 2022 Head Start State Supplemental Projected Deliverables (Part 8) of this Online Application. </b><br/><br/>For each question, responses must include: <br/> 
  <ol type=''a''>
	<li>A description of specific practices/models used with this additional funding; </li>
	<li>Outcomes of specific practices/models; </li>
	<li>How this practice/model will enhance positive outcomes for children, staff, families and/or the program</li>
	<li>How this additional funding supports workforce development, retention and quality improvements in your program</li 
  </ol>
  <br/>
'
WHERE fundcode = 390 AND fiscalyear =2022 
AND part = '7'


UPDATE dbo.TemplatePageInstructions 
SET Content = 
'<u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.
  <ul>                                                    
	<li><a href="docs/FY22 Staff Salary Chart.docx">Staff Salary Chart</a></li>
	<li><a href="docs/FY22 Staff Incentive Chart.docx">Staff Incentive Chart</a></li>
  </ul>                 Step 2:  Complete the documents.<br />                  Step 3:  Upload the completed documents. 
  <ul>
	<li>Staff Salary Chart</li>
	<li>Staff Incentive Chart</li>
  </ul>                  Step 4:  These documents must be uploaded, if applicable.
  <ul>
	<li>Lead Agency Indirect Cost Rate Letter</li>
	<li>Subcontractor Indirect Cost Rate Letter</li>
  </ul>'
WHERE fundcode = 390 AND fiscalyear = 2022
AND part = '9' 


UPDATE dbo.TemplatePageInstructions
SET Content='<b>Instructions:</b>  For each performance measure below, grantees must report their proposed outcomes for FY 2022 (July 2021- June 2022). The data provided for each of these activities will help EEC identify if grantees are meeting their specific benchmarks throughout the grant year. <br/>Note: Please make sure that data entered for each of these activities aligns with information that you provided in the "Narrative Questions (Part 7)" of this Online Application.'
WHERE fundcode = 390 AND fiscalyear = 2022
AND part = '8'


Update GrantApplicant set EligibilityAmount=2446010 Where FiscalYear=2022 and FundCode=390 and AgencyName='ACTION FOR BOSTON COMMUNITY DEVELOPMENT, INC.'
Update GrantApplicant set EligibilityAmount=125458 Where FiscalYear=2022 and FundCode=390 and AgencyName='ASSOCIATED FOR HUMAN SERVICES, INC.'
Update GrantApplicant set EligibilityAmount=286957 Where FiscalYear=2022 and FundCode=390 and AgencyName='BERKSHIRE COUNTY HEAD START'
Update GrantApplicant set EligibilityAmount=202038 Where FiscalYear=2022 and FundCode=390 and AgencyName='CAPE COD YMCA, INC.'
Update GrantApplicant set EligibilityAmount=374325 Where FiscalYear=2022 and FundCode=390 and AgencyName='CITIZENS FOR CITIZENS INC'
Update GrantApplicant set EligibilityAmount=527438 Where FiscalYear=2022 and FundCode=390 and AgencyName='CITY OF WORCESTER'
Update GrantApplicant set EligibilityAmount=292746 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITIES UNITED INC'
Update GrantApplicant set EligibilityAmount=453765 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY ACTION AGENCY OF SOMERVILLE'
Update GrantApplicant set EligibilityAmount=347330 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY ACTION INC'
Update GrantApplicant set EligibilityAmount=502725 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY ACTION PIONEER VALLEY'
Update GrantApplicant set EligibilityAmount=306841 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY ACTION PROGRAMS INTER-CITY'
Update GrantApplicant set EligibilityAmount=87865 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY DAY CARE CENTER OF LAWRENCE, INC.'
Update GrantApplicant set EligibilityAmount=608976 Where FiscalYear=2022 and FundCode=390 and AgencyName='COMMUNITY TEAMWORK  INC'
Update GrantApplicant set EligibilityAmount=313834 Where FiscalYear=2022 and FundCode=390 and AgencyName='DIMOCK COMMUNITY HEALTH CTR'
Update GrantApplicant set EligibilityAmount=407301 Where FiscalYear=2022 and FundCode=390 and AgencyName='GREATER LAWRENCE COMMUNITY ACTION COUNCIL'
Update GrantApplicant set EligibilityAmount=973295 Where FiscalYear=2022 and FundCode=390 and AgencyName='HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - HS and EHS'
Update GrantApplicant set EligibilityAmount=116727 Where FiscalYear=2022 and FundCode=390 and AgencyName='HOLYOKE CHICOPEE SPRINGFIELD HEAD START INC. - Migrant'
Update GrantApplicant set EligibilityAmount=362320 Where FiscalYear=2022 and FundCode=390 and AgencyName='LEO INC.'
Update GrantApplicant set EligibilityAmount=380021 Where FiscalYear=2022 and FundCode=390 and AgencyName='MAKING OPPORTUNITY COUNT'
Update GrantApplicant set EligibilityAmount=31860 Where FiscalYear=2022 and FundCode=390 and AgencyName='MARTHA''S VINEYARD COMMUNITY SERVICES, INC.'
Update GrantApplicant set EligibilityAmount=323110 Where FiscalYear=2022 and FundCode=390 and AgencyName='PATHWAYS FOR CHILDREN INC'
Update GrantApplicant set EligibilityAmount=251815 Where FiscalYear=2022 and FundCode=390 and AgencyName='PEOPLE ACTING IN COMMUNITY ENDEAVORS, INC.'
Update GrantApplicant set EligibilityAmount=258422 Where FiscalYear=2022 and FundCode=390 and AgencyName='QUINCY COMMUNITY ACTION PROGRAMS'
Update GrantApplicant set EligibilityAmount=99502 Where FiscalYear=2022 and FundCode=390 and AgencyName='RIVERSIDE COMMUNITY CARE EARLY HEAD START'
Update GrantApplicant set EligibilityAmount=570140 Where FiscalYear=2022 and FundCode=390 and AgencyName='SELF HELP INC'
Update GrantApplicant set EligibilityAmount=307375 Where FiscalYear=2022 and FundCode=390 and AgencyName='SOUTH MIDDLESEX OPPORTUNITY COUNCIL, INC.'
Update GrantApplicant set EligibilityAmount=442024 Where FiscalYear=2022 and FundCode=390 and AgencyName='SOUTH SHORE COMMUNITY ACTION COUNCIL'
Update GrantApplicant set EligibilityAmount=59902 Where FiscalYear=2022 and FundCode=390 and AgencyName='SOUTH SHORE STARS'
Update GrantApplicant set EligibilityAmount=345135 Where FiscalYear=2022 and FundCode=390 and AgencyName='TRIUMPH INC'
Update GrantApplicant set EligibilityAmount=194743 Where FiscalYear=2022 and FundCode=390 and AgencyName='WORCESTER COMMUNITY ACTION COUNCIL, INC'
