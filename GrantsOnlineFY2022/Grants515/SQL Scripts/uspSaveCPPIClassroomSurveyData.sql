USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspSaveCPPIClassroomSurveyData]    Script Date: 11/7/2018 1:18:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[uspSaveCPPIClassroomSurveyData]
(
@ClassroomId int out,
@SystemProviderId int,
@QuestionId varchar(50),
@QuestionAns varchar(max) = null,
@GrantApplicantId int
)
as
begin

if (@ClassroomId = -1)
begin
	select @ClassroomId = isnull(MAX(ClassroomId), 999) + 1 from [CPPISurveyClassroomInformation]
end

if exists(select 1 from CPPISurveyClassroomInformation
				where ClassroomId = @ClassroomId
				  and SystemProviderId = @SystemProviderId
				  and QuestionId = @QuestionId
				  and GrantApplicantId = @GrantApplicantId )
begin
	Update CPPISurveyClassroomInformation
	set QuestionAns = @QuestionAns
	where ClassroomId = @ClassroomId
	  and SystemProviderId = @SystemProviderId
	  and QuestionId = @QuestionId
	  and GrantApplicantId = @GrantApplicantId
end
else
	Insert into CPPISurveyClassroomInformation(ClassroomId, SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
	values (@ClassroomId, @SystemProviderId, @QuestionId, @QuestionAns, @GrantApplicantId)
end

GO

