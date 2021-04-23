SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 325

UPDATE dbo.TemplatePageInstructions
SET content = '      <b>Instructions:</b>&nbsp;Please reference Appendix D: FY 2019 Early Childhood Education Career Pathways Budget Guidelines for specific guidelines regarding the budget, including program and admin costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET</b>.  Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.<br/>'
WHERE fundcode = 325 
AND part = 4
AND content = '      <b>Instructions:</b>&nbsp;Please reference the fund use section within the Grant Application and Appendix D: Budget Guidelines for specific guidelines regarding the budget, including program and admin costs. <b>Note: YOU CAN ONLY ENTER WHOLE NUMBERS INTO THE BUDGET</b>.  Funds cannot be entered into the gray boxes as these costs are considered unallowable for this grant.<br/>'



SELECT * FROM dbo.TemplatePageInstructions 
WHERE fundcode = 325
AND part = '9'

--'<b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the 'Browse' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the 'Open' button to attach each file.<br />                  Step 4:  After attaching all files, click the 'Save Information' button located below.<br />''

UPDATE dbo.TemplatePageInstructions
SET content =
'<b>Instructions:</b><br/>The following links provide templates for documents that you will need to complete and then upload in the appropriate Upload sections below.  Please download these templates and complete:<br/><ul><li><a href="docs/NarrativeQuestions.docs">Narrative Questions instructions</a></li><li><a href="docs/In-KindContributions.docx">In-Kind Contributions</a></li></ul>&nbsp;&nbsp;Also, for guidelines to complete the required Project Narrative document, please refer to Appendix G.<br/><br/>  <b>Upload</b>&nbsp;the completed documents. These additional documents need to be uploaded from your computer.<br/>  <ul type="A">   <li>Narrative Response</li>   <li>Career Pathways Sample Training Plan and Budget</li>   <li>Letters of Support</li>   <li>Key Personnel Statement</li>   <li>In-Kind Contributions</li>   <li>Lead Agency Indirect Cost Rate Letter</li></ul>  <u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''OPEN'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''SAVE Information'' button located below.<br />'
WHERE fundcode = 325 
AND part = '9'
AND content = '<b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Once you are ready to upload the documents, click the ''Browse'' button.<br />                  Step 2:  Next locate and select the file from your computer.<br />                  Step 3:  Click the ''Open'' button to attach each file.<br />                  Step 4:  After attaching all files, click the ''Save Information'' button located below.<br />'


SELECT * FROM dbo.TemplateGrantFiles 
WHERE fundcode = 325
ORDER BY FileNum

UPDATE dbo.TemplateGrantFiles
SET Filenum = 4 
WHERE filenum = 2
AND CONVERT(VARCHAR,CustomContent) = '<b>Key Personnel Statement</b>'

UPDATE dbo.TemplateGrantFiles
SET Filenum = 6
WHERE filenum = 4
AND CONVERT(VARCHAR,CustomContent) = CONVERT(VARCHAR,'<b>Lead Agency Indirect Cost Rate Letter</b>')


DELETE FROM dbo.TemplateGrantFiles
WHERE fundcode = 325
AND filenum = 1 
AND CONVERT(VARCHAR,CustomContent) = '<b>Letters of Support</b>'

DELETE FROM dbo.TemplateGrantFiles
WHERE fundcode = 325
AND filenum = 3
AND CONVERT(VARCHAR,CustomContent) = '<b>Demographic Information</b>'


UPDATE dbo.TemplateGrantFiles
SET Filenum = 6 
WHERE filenum = 4
--AND isrequired = 0
AND fundcode = 325
AND CONVERT(VARCHAR,CustomContent) = '<b>Lead Agency Indirect Cost Rate Letter</b>'



INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
VALUES
(   325,  -- FundCode - int
    2019,  -- GrantYear - int
    1,  -- FileNum - int
    '<b>Narrative Response</b>', -- CustomContent - text
    1   -- IsRequired - tinyint
    )


INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
VALUES
(   325,  -- FundCode - int
    2019,  -- GrantYear - int
    2,  -- FileNum - int
    '<b>Career Pathways Sample Training Plan and Budget</b>', -- CustomContent - text
    1   -- IsRequired - tinyint
    )



INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
VALUES
(   325,  -- FundCode - int
    2019,  -- GrantYear - int
    3,  -- FileNum - int
    '<b>Letters of Support</b>', -- CustomContent - text
    1   -- IsRequired - tinyint
    )


INSERT INTO dbo.TemplateGrantFiles
(
    FundCode,
    GrantYear,
    FileNum,
    CustomContent,
    IsRequired
)
VALUES
(   325,  -- FundCode - int
    2019,  -- GrantYear - int
    5,  -- FileNum - int
    '<b>In-Kind Contributions</b>', -- CustomContent - text
    1   -- IsRequired - tinyint
    )

GO
