SELECT * FROM GrantApplicant WHERE fundcode = 325

UPDATE GrantApplicant 
SET LatestSubmitDate = NULL 
WHERE grantapplicantID = 6920


SELECT * FROM dbo.TemplatePageInstructions
WHERE fundcode = 325


UPDATE dbo.TemplatePageInstructions
SET content = 
'<b>Instructions:</b><br/>The following links provide templates for documents that you will need to complete and then upload in the appropriate Upload sections below.  Please download these templates and complete:<br/><ul><li><a href="docs/Early Childhood Education Career Pathways Grant Narrative Questions.docx" target="_blank">Narrative Questions instructions</a></li><li><a href="docs/Sample Training Plan and Budget.xlsx" target="_blank">Sample Training Plan and Budget</a></li><li><a href="docs/In-Kind Supports.xlsx" target="_blank">In-Kind Contributions</a></li></ul>&nbsp;&nbsp;Also, for guidelines to complete the required Project Narrative document, please refer to Appendix G.<br/><br/>  <b>Upload</b>&nbsp;the completed documents. These additional documents need to be uploaded from your computer.<br/>  <ul type="A">   <li>Narrative Response</li>   <li>Career Pathways Sample Training Plan and Budget</li>   <li>Letters of Support</li>   <li>Key Personnel Statement</li>   <li>In-Kind Contributions</li>   <li>Lead Agency Indirect Cost Rate Letter</li></ul>  <u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''OPEN'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''SAVE Information'' button located below.<br />'
WHERE part = '9' 
AND fundcode=325
