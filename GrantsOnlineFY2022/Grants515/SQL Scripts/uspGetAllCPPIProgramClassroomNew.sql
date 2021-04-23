USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspGetAllCPPIProgramClassroomNew]    Script Date: 11/7/2018 1:11:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--exec uspGetAllCPPIProgramClassroomNew 666,  6456
CREATE PROC [dbo].[uspGetAllCPPIProgramClassroomNew]      
(
@SystemProviderId INT,
@GrantApplicantId INT
)
AS
Begin

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX),
	@fiscalyear int = 2019

select @cols = STUFF((SELECT ',' + QUOTENAME(QuestionId) 
                    from CPPISurveyClassroomInformation
                    group by QuestionId
                    order by QuestionId
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = N'SELECT p.ClassroomId, p.SystemProviderId, p.grantapplicantid, ' + @cols + N' from 
             CPPISurveyClassroomInformation
            pivot 
            (
                max(questionAns)
                for QuestionId in (' + @cols + N')
            ) p 
            where p.SystemProviderId = ' + convert(varchar, @SystemProviderId) + ' ' +
             
            'order by grantapplicantid, systemproviderid '
            
--select @query
exec sp_executesql @query;

end


	

GO

