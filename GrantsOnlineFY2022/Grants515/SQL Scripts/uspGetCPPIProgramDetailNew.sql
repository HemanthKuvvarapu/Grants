USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIProgramDetailNew]    Script Date: 11/7/2018 1:15:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec uspGetCPPIProgramDetailNew 6475
CREATE PROC [dbo].[uspGetCPPIProgramDetailNew]      
(
@SystemProviderId INT
)
AS
BEGIN

/*
--It is for SQL report only
SELECT p.SystemProviderId, 
	   p.grantapplicantid, 
	   b.CPPIProgramName, 
	   b.agencyname, b.eligibilityAmount as amount, [ddlAccreditation],[MaskedEditExtender1_ClientState],[MaskedEditExtender2_ClientState],[rbtnAssessmentTool],[rbtnAssessmentToolType],[rbtnFormalCurriculum],[rbtnHaveFormalCurriculum],[rbtnIsAccredited],[rbtnIsCQIP],[rbtnIsHeadStartProgram],[rbtnIsProgramLicensed],[rbtnScreenTool],[rbtnScreenToolType],[rdoQRISLevel],[TextBoxWatermarkExtender1_ClientState],[TextBoxWatermarkExtender2_ClientState],[txtAccreditationEarnDate],[txtAccreditationExpDate],[txtAccreditationNumber],[txtCQIPLastUpdated],[txtDummy],[txtEECProgramNumber],[txtProgramName],[txtQ10YesOption1],[txtQ10YesOption2],[txtQ10YesOption3],[txtQ8YesOption1],[txtQ8YesOption2],[txtQ8YesOption3],[txtQ8YesOption4],[txtQ8YesOption5],[txtQ8YesOption6],[txtQ8YesOption7],[txtQ9YesOption1],[txtQ9YesOption2],[txtQ9YesOption3],[txtQ9YesOption4],[txtQ9YesOption5],[txtScreenToolOther] 
	   from CPPISurveyProgramInformation pivot               (                  max(questionAns)                  for QuestionId in ([0],[ddlAccreditation],[MaskedEditExtender1_ClientState],[MaskedEditExtender2_ClientState],[rbtnAssessmentTool],[rbtnAssessmentToolType],[rbtnFormalCurriculum],[rbtnHaveFormalCurriculum],[rbtnIsAccredited],[rbtnIsCQIP],[rbtnIsHeadStartProgram],[rbtnIsProgramLicensed],[rbtnScreenTool],[rbtnScreenToolType],[rdoQRISLevel],[TextBoxWatermarkExtender1_ClientState],[TextBoxWatermarkExtender2_ClientState],[txtAccreditationEarnDate],[txtAccreditationExpDate],[txtAccreditationNumber],[txtCQIPLastUpdated],[txtDummy],[txtEECProgramNumber],[txtProgramName],[txtQ10YesOption1],[txtQ10YesOption2],[txtQ10YesOption3],[txtQ8YesOption1],[txtQ8YesOption2],[txtQ8YesOption3],[txtQ8YesOption4],[txtQ8YesOption5],[txtQ8YesOption6],[txtQ8YesOption7],[txtQ9YesOption1],[txtQ9YesOption2],[txtQ9YesOption3],[txtQ9YesOption4],[txtQ9YesOption5],[txtScreenToolOther])              ) p               join grantapplicant b on p.grantapplicantid = b.grantapplicantid              where p.SystemProviderid = 6475 order by p.systemproviderid 

return
*/

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)


SELECT @cols = STUFF((SELECT ',' + QUOTENAME(QuestionId) 
                    FROM dbo.CPPISurveyProgramInformation
                    GROUP BY QuestionId
                    ORDER BY QuestionId
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

--SET @query = N'SELECT p.SystemProviderId, p.grantapplicantid, b.CPPIProgramName, b.agencyname, b.eligibilityAmount as amount, ' + @cols + N' from 
--             dbo.CPPISurveyProgramInformation
--            pivot 
--            (
--                max(questionAns)
--                for QuestionId in (' + @cols + N')
--            ) p 
--            join grantapplicant b on p.grantapplicantid = b.grantapplicantid
--            where p.SystemProviderid = ' + CONVERT(VARCHAR, @SystemProviderId) + ' ' +
--            'order by p.systemproviderid '

SET @query = N'SELECT p.SystemProviderId, p.grantapplicantid, ' + @cols + N' from 
             dbo.CPPISurveyProgramInformation
            pivot 
            (
                max(questionAns)
                for QuestionId in (' + @cols + N')
            ) p 
            where p.SystemProviderid = ' + CONVERT(VARCHAR, @SystemProviderId) + ' ' +
            'order by p.systemproviderid '
			          
--select @query
EXEC sp_executesql @query;

END


	


GO

