USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetCPPIClassroomDetailNew]    Script Date: 11/7/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec uspGetCPPIClassroomDetailNew 672
CREATE PROC [dbo].[uspGetCPPIClassroomDetailNew]      
(
@SystemProviderId INT
)
AS
BEGIN

/*
--It is for SQL report only
SELECT p.ClassroomId, p.SystemProviderId, p.GrantApplicantId, c.QuestionAns as ProgramName, [cboAnnualSalary],[cboEducationLevel],[cboPosition],[txtAmount],[txtClassroomName],[txtDaysPerWeekOperation],[txtEducatorName],[txtHoursPerDayOperation],[txtOtherEducationLevel],[txtOtherPosition],[txtQ1_1_1],[txtQ1_1_2],[txtQ1_1_3],[txtQ1_2_1],[txtQ1_2_2],[txtQ1_2_3],[txtQ1_3_1],[txtQ1_3_2],[txtQ1_3_3],[txtQ1_4_1],[txtQ1_4_2],[txtQ1_4_3],[txtQ1_5_1],[txtQ1_5_2],[txtQ1_5_3],[txtQ2_1_1],[txtQ2_1_2],[txtQ2_1_3],[txtQ2_1_4],[txtQ2_1_5],[txtQ2_1_6],[txtQ2_2_1],[txtQ2_2_2],[txtQ2_2_3],[txtQ2_2_4],[txtQ2_2_5],[txtQ2_2_6],[txtQ2_3_1],[txtQ2_3_2],[txtQ2_3_3],[txtQ2_3_4],[txtQ2_3_5],[txtQ2_3_6],[txtQ2_4_1],[txtQ2_4_2],[txtQ2_4_3],[txtQ2_4_4],[txtQ2_4_5],[txtQ2_4_6],[txtQ2_5_1],[txtQ2_5_2],[txtQ2_5_3],[txtQ2_5_4],[txtQ2_5_5],[txtQ2_5_6],[txtQ3_1_1],[txtQ3_1_2],[txtQ3_1_3],[txtQ3_2_1],[txtQ3_2_2],[txtQ3_2_3],[txtQ3_3_1],[txtQ3_3_2],[txtQ3_3_3],[txtQ3_4_1],[txtQ3_4_2],[txtQ3_4_3],[txtQ3_5_1],[txtQ3_5_2],[txtQ3_5_3],[txtQ4_1_1],[txtQ4_1_2],[txtQ4_1_3],[txtQ4_2_1],[txtQ4_2_2],[txtQ4_2_3],[txtQ4_3_1],[txtQ4_3_2],[txtQ4_3_3],[txtQ4_4_1],[txtQ4_4_2],[txtQ4_4_3],[txtQ4_5_1],[txtQ4_5_2],[txtQ4_5_3],[txtTotalHoursPerYear],[txtWeeksPerYearOperation] from                CPPISurveyClassroomInformation              pivot               (                  max(questionAns)                  for QuestionId in ([cboAnnualSalary],[cboEducationLevel],[cboPosition],[txtAmount],[txtClassroomName],[txtDaysPerWeekOperation],[txtEducatorName],[txtHoursPerDayOperation],[txtOtherEducationLevel],[txtOtherPosition],[txtQ1_1_1],[txtQ1_1_2],[txtQ1_1_3],[txtQ1_2_1],[txtQ1_2_2],[txtQ1_2_3],[txtQ1_3_1],[txtQ1_3_2],[txtQ1_3_3],[txtQ1_4_1],[txtQ1_4_2],[txtQ1_4_3],[txtQ1_5_1],[txtQ1_5_2],[txtQ1_5_3],[txtQ2_1_1],[txtQ2_1_2],[txtQ2_1_3],[txtQ2_1_4],[txtQ2_1_5],[txtQ2_1_6],[txtQ2_2_1],[txtQ2_2_2],[txtQ2_2_3],[txtQ2_2_4],[txtQ2_2_5],[txtQ2_2_6],[txtQ2_3_1],[txtQ2_3_2],[txtQ2_3_3],[txtQ2_3_4],[txtQ2_3_5],[txtQ2_3_6],[txtQ2_4_1],[txtQ2_4_2],[txtQ2_4_3],[txtQ2_4_4],[txtQ2_4_5],[txtQ2_4_6],[txtQ2_5_1],[txtQ2_5_2],[txtQ2_5_3],[txtQ2_5_4],[txtQ2_5_5],[txtQ2_5_6],[txtQ3_1_1],[txtQ3_1_2],[txtQ3_1_3],[txtQ3_2_1],[txtQ3_2_2],[txtQ3_2_3],[txtQ3_3_1],[txtQ3_3_2],[txtQ3_3_3],[txtQ3_4_1],[txtQ3_4_2],[txtQ3_4_3],[txtQ3_5_1],[txtQ3_5_2],[txtQ3_5_3],[txtQ4_1_1],[txtQ4_1_2],[txtQ4_1_3],[txtQ4_2_1],[txtQ4_2_2],[txtQ4_2_3],[txtQ4_3_1],[txtQ4_3_2],[txtQ4_3_3],[txtQ4_4_1],[txtQ4_4_2],[txtQ4_4_3],[txtQ4_5_1],[txtQ4_5_2],[txtQ4_5_3],[txtTotalHoursPerYear],[txtWeeksPerYearOperation])              ) p               join grantapplicant b on p.grantapplicantid = b.grantapplicantid              join CPPISurveyProgramInformation c on c.SystemProviderId = p.SystemProviderId and c.QuestionId = 'txtProgramName'              where p.SystemProviderid = 687 order by p.systemproviderid 
return
*/

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)


SELECT @cols = STUFF((SELECT ',' + QUOTENAME(QuestionId) 
                    FROM dbo.CPPISurveyClassroomInformation
                    GROUP BY QuestionId
                    ORDER BY QuestionId
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @query = N'SELECT p.ClassroomId, p.SystemProviderId, c.QuestionAns as ProgramName, ' + @cols + N' from 
             CPPISurveyClassroomInformation
            pivot 
            (
                max(questionAns)
                for QuestionId in (' + @cols + N')
            ) p 
            join CPPISurveyProgramInformation c on c.SystemProviderId = p.SystemProviderId and c.QuestionId = ''txtProgramName''
            where p.SystemProviderid = ' + CONVERT(VARCHAR, @SystemProviderId) + ' ' +
            'order by p.systemproviderid '
            
--select @query
EXEC sp_executesql @query;

END


	


GO

