USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetAllCPPIProgramsNew]    Script Date: 11/7/2018 1:10:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec uspGetAllCPPIProgramsNew 6464
CREATE PROC [dbo].[uspGetAllCPPIProgramsNew]      
(
@GrantApplicantId INT
)
AS
BEGIN

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX),
	@fiscalyear INT = 2019

SELECT @cols = STUFF((SELECT ',' + QUOTENAME(QuestionId) 
                    FROM CPPISurveyProgramInformation
					WHERE Questionid NOT LIKE 'MaskedEditExtender%'
					AND Questionid NOT LIKE 'TextBoxWatermark%'
                    GROUP BY QuestionId
                    ORDER BY QuestionId
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @query = N'SELECT p.SystemProviderId, p.grantapplicantid as GrantApplicantId, b.agencyname, b.eligibilityAmount as amount, ' + @cols + N' from 
             CPPISurveyProgramInformation
            pivot 
            (
                max(questionAns)
                for QuestionId in (' + @cols + N')
            ) p 
            join grantapplicant b on p.grantapplicantid = b.grantapplicantid
            where b.fiscalyear = ' + CONVERT(VARCHAR, @fiscalyear) + ' ' +
              'and p.grantapplicantid = ' + CONVERT(VARCHAR, @grantapplicantId) + ' ' +
            'order by grantapplicantid, systemproviderid '
            
--select @query
EXEC sp_executesql @query;

END
GO

