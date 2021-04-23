EXEC uspGetUploadedFiles 6373, 515, 2019


SELECT * FROM templateGrantFiles 
WHERE fundcode = 515


DELETE FROM templateGrantFiles 
WHERE FileNum = '6'
AND fundcode = 515


UPDATE TemplateGrantFiles 
SET FileNum = '9' 
where  FileNum = '10'
AND fundcode = 515


SELECT * FROM dbo.TemplatePageInstructions
WHERE FUNDCODE = 515


UPDATE dbo.TemplatePageInstructions
SET content =
'<b>Instructions:</b><br/><br/>  <b>Upload</b>&nbsp;the completed documents. These additional documents need to be uploaded from your computer.<br/>  <ul type="A">   <li>Project Narrative</li>   <li>Implementation Timeline</li>   <li>Cost Projection Summary</li>   <li>Needs Assessment Results</li>   <li>Strategic Plan</li>   <li>Letter of Commitment from Superintendent/Receiver, and/or School Committee chair</li>   <li>Resumes of Key Personnel from LEA and each Subcontractor</li>   <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>   <li>Subcontractor Indirect Cost Approval Letter (if applicable)</li></ul>  <u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''OPEN'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''SAVE Information'' button located below.<br />'
WHERE content = 
'<b>Instructions:</b><br/><br/>  <b>Upload</b>&nbsp;the completed documents. These additional documents need to be uploaded from your computer.<br/>  <ul type="A">   <li>Project Narrative</li>   <li>Implementation Timeline</li>   <li>Cost Projection Summary</li>   <li>Needs Assessment Results</li>   <li>Strategic Plan</li>   <li>MOU between LEA and each Subcontractor</li>   <li>Letter of Commitment from Superintendent/Receiver, and/or School Committee chair</li>   <li>Resumes of Key Personnel from LEA and each Subcontractor</li>   <li>Lead Agency Indirect Cost Approval Letter (if applicable)</li>   <li>Subcontractor Indirect Cost Approval Letter (if applicable)</li></ul>  <u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''OPEN'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''SAVE Information'' button located below.<br />'
AND fundcode = 515
AND Part = 9

