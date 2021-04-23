delete from [GrantOnlineFY2016].[dbo].[BudgetInvalidColumn]
	where columnName like 'txtStaffTrainingColF'
	  and fundcode = 700
	  and fiscalyear = 2017
	  
insert into [GrantOnlineFY2016].[dbo].[BudgetInvalidColumn]
	(FiscalYear, Fundcode, ColumnName) values (2017, 700, 'txtProjectCoordinatorColF')
	
insert into [GrantOnlineFY2016].[dbo].[BudgetInvalidColumn]
	(FiscalYear, Fundcode, ColumnName) values (2017, 700, 'txtStaffTrainingColD')
	
delete from [GrantOnlineFY2016].[dbo].[BudgetInvalidColumn]
	where columnName like 'txtProfessionalDevelopOpportunitiesColF'
	  and fundcode = 700
	  and fiscalyear = 2017
	  
update [GrantOnlineFY2016].[dbo].[TemplatePageInstructions]
	set Content = 
'<b>Instructions:</b> The following section is designed to address how each applicant and their proposed subcontracted partners will meet the grant requirements as outlined in the FY2017 Early Childhood Mental Health Consultation (ECMHC) Grant Application (RFR). 
<br/><br/>
Please carefully review the Grant Application (RFR) prior to completing your response to the Narrative Questions.
Please ensure that responses provided in this section are aligned and consistent with your responses provided within all other portions of the grant application. 
<br/><br/>
All questions must be answered in the space provided. Character Limit including spaces: 7000 per question.'
  where FiscalYear = 2017
    and FundCode = 700
    and [part] = '7'


update [GrantOnlineFY2016].[dbo].[TemplatePageInstructions]
	set Content = 
'<b>Instructions:</b> 
Please respond to all questions in the Online Grant Application <b>Projected Deliverables - Part 8</b>. Please see  FY 2017 Projected Deliverables Guidance in the appendix for additional instructions for completing Projected Deliverables (Part 8).
<br/><br/> 
These questions are organized by the <b>Required Activity outlined in the Grant Application (RFR)</b>
<br/><br/>
<b>Please ensure that information pertaining to any subcontracted partners is included in your responses.</b>
<br/><br/>
 If the answer is "0" for "Total for the YEAR," then an explanation must be provided in the description.  
ALL questions require a response and each description should be answered according to the guidance provided within the appendix.
'
  where FiscalYear = 2017
    and FundCode = 700
    and [part] = '8'

update [GrantOnlineFY2016].[dbo].[TemplatePageInstructions]
	set Content = 
'<b>Instructions:</b><br/>
Step 1: <b>Complete</b>  the following documents as required by the Grant Application by selecting the attached documents from your computer.
<ul>                                       
<li>Project Description Abstract</li>                                 
<li>Organizational Chart, Resumes and Job Descriptions</li>                               
<li>Service Delivery Planning</li>                               
<li>Letters of Support (at least six letters of support) </li>             
</ul>    
Step 2: Complete the documents.<br/>       
Step 3: <b>Upload</b> the completed documents.<br/>        
<br/><br/>
Note: if more than one document is needed to meet the requirement, then one PDF that contains all documents should be upload to the designated section. For example, the six letters of support should be saved in one PDF file, prior to being uploaded as a Required Form.  
<br/><br/>
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
  where FiscalYear = 2017
    and FundCode = 700
    and [part] = '9'
    
    
 insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 1, '<b>File: Project Description Abstract</b>', 1)
     
  insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 2, '<b>File: Organizational Chart, Resumes and Job Descriptions</b>', 1)
     
   insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 3, '<b>File: Service Delivery Planning</b>', 1)
     
   insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 4, '<b>File: Letters of Support (at least six letters of support) </b>', 1)
     
    insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 5, '<b>File: Lead Agency Indirect Cost Rate Letter (if applicable)</b>', 0)
     
     insert into [GrantOnlineFY2016].[dbo].[TemplateGrantFiles]
	([FundCode]
      ,[GrantYear]
      ,[FileNum]
      ,[CustomContent]
      ,[IsRequired])
     values
     (700, 2017, 6, '<b>File: Subcontractor Indirect Cost Rate Letter (if applicable)</b>', 0)