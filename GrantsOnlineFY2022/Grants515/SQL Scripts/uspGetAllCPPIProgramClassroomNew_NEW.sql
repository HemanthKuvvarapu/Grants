USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetAllCPPIProgramClassroomNew]    Script Date: 5/7/2020 12:03:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec uspGetAllCPPIProgramClassroomNew 666,  6456
alter PROC [dbo].[uspGetAllCPPIProgramClassroomNew]      
(
@SystemProviderId INT,
@GrantApplicantId INT
)
AS
BEGIN

-- Modified 05/12/2020 JN - added ' and p.txtClassroomName is not null ' to the @query to prevent bug

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX),
	@fiscalyear INT = 2019

SELECT @cols = STUFF((SELECT ',' + QUOTENAME(QuestionId) 
                    FROM CPPISurveyClassroomInformation
                    GROUP BY QuestionId
                    ORDER BY QuestionId
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @query = N'SELECT p.ClassroomId, p.SystemProviderId, p.grantapplicantid, ' + @cols + N' from 
             dbo.CPPISurveyClassroomInformation
            pivot 
            (
                max(questionAns)
                for QuestionId in (' + @cols + N')
            ) p 
            where p.SystemProviderId = ' + CONVERT(VARCHAR, @SystemProviderId) + ' and p.txtClassroomName is not null ' +
             
            'order by grantapplicantid, systemproviderid '
            
--select @query
EXEC sp_executesql @query;

END


	


GO


