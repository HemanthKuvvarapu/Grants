SELECT * FROM dbo.TemplatePageInstructions
WHERE fundcode = 390 AND fiscalyear = 2021


UPDATE dbo.TemplatePageInstructions 
SET Content = 
'<u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.
  <ul>                                                    
	<li><a href="docs/FY21 Staff Salary Chart.docx">Staff Salary Chart</a></li>
	<li><a href="docs/FY21 Staff Incentive Chart.docx">Staff Incentive Chart</a></li>
  </ul>                 Step 2:  Complete the documents.<br />                  Step 3:  Upload the completed documents. 
  <ul>
	<li>Staff Salary Chart</li>
	<li>Staff Incentive Chart</li>
  </ul>                  Step 4:  These documents must be uploaded, if applicable.
  <ul>
	<li>Lead Agency Indirect Cost Rate Letter</li>
	<li>Subcontractor Indirect Cost Rate Letter</li>
  </ul>'
WHERE fundcode = 390 AND fiscalyear = 2021
AND part = '9' 
AND content =
'<u><b>Instructions for Uploading a Document</b></u><br />                  Step 1:  Download the following documents as required by the Grant Application by selecting the attached documents, opening and saving them to your computer.
  <ul>                                                    
	<li><a href="docs/FY20 Staff Salary Chart - required form.docx">Staff Salary Chart</a></li>
	<li><a href="docs/FY20 Staff Incentive Chart - required form.docx">Staff Incentive Chart</a></li>
  </ul>                 Step 2:  Complete the documents.<br />                  Step 3:  Upload the completed documents. 
  <ul>
	<li>Staff Salary Chart</li>
	<li>Staff Incentive Chart</li>
  </ul>                  Step 4:  These documents must be uploaded, if applicable.
  <ul>
	<li>Lead Agency Indirect Cost Rate Letter</li>
	<li>Subcontractor Indirect Cost Rate Letter</li>
  </ul>'




UPDATE dbo.TemplatePageInstructions 
SET content= '<b>Instructions:</b>  For each performance measure below, grantees must report their proposed outcomes for FY 2021 (July 2020- June 2021).  The data provided for each of these activities will help EEC identify if grantees are meeting their specific benchmarks throughout the grant year.    <br/>Note: Please make sure that data entered for each of these activities aligns with information that you provided in the "Narrative Questions (Part 7)" of this Online Application.'
WHERE content = '<b>Instructions:</b>  For each performance measure below, grantees must report their proposed outcomes for FY 2020 (July 2019- June 2020).  The data provided for each of these activities will help EEC identify if grantees are meeting their specific benchmarks throughout the grant year.    <br/>Note: Please make sure that data entered for each of these activities aligns with information that you provided in the "Narrative Questions (Part 7)" of this Online Application.'
AND fundcode = 390 AND fiscalyear = 2021 
AND part = '8'


