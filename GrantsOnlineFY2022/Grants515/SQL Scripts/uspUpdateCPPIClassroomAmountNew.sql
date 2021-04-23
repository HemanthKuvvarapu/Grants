USE [GrantOnlineFY2016]
GO

/****** Object:  StoredProcedure [dbo].[uspUpdateCPPIClassroomAmountNew]    Script Date: 11/7/2018 1:20:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspUpdateCPPIClassroomAmountNew]
(
  @SystemProviderId int,
  @ClassroomId int,
  @GrantApplicantId int,
  @Amount numeric(18, 2) out
) 
AS
BEGIN

	select @Amount = Convert(numeric(18, 2), ISNULL(QuestionAns,'0')) from CPPISurveyClassroomInformation
	where ClassroomId = @ClassroomId
	  and SystemProviderId = @SystemProviderId
	  and QuestionId = 'txtAmount'	
	  
	/*
	declare @QRISLevel int
	declare @Preschoolchildren int
	declare @WeeksPerYearOperation int
	declare @DaysPerWeekOperation int
	declare @HoursPerDayOperation int
	declare @TotalHoursPerYear int
	declare @Perc numeric(18, 2)
	
  select @QRISLevel = QuestionAns from [CPPISurveyProgramInformation]
	where questionid = 'rdoQRISLevel'
    and SystemProviderId = @SystemProviderId
    
  select @Preschoolchildren = QuestionAns from CPPISurveyClassroomInformation
    where questionid = 'txtQ1_1_1'
    and ClassroomId = @ClassroomId
    
  select @WeeksPerYearOperation = QuestionAns from CPPISurveyClassroomInformation
    where questionid = 'txtWeeksPerYearOperation'
    and ClassroomId = @ClassroomId
    
  select @DaysPerWeekOperation = QuestionAns from CPPISurveyClassroomInformation
    where questionid = 'txtDaysPerWeekOperation'
    and ClassroomId = @ClassroomId
    
  select @HoursPerDayOperation = QuestionAns from CPPISurveyClassroomInformation
    where questionid = 'txtHoursPerDayOperation'
    and ClassroomId = @ClassroomId
    
    set @TotalHoursPerYear = @WeeksPerYearOperation * @DaysPerWeekOperation * @HoursPerDayOperation
    
    set @Perc = 	case when (@TotalHoursPerYear >= 2079) then
						1
						when (@TotalHoursPerYear >= 1560) then
						.75
						when (@TotalHoursPerYear >= 1080) then
						.60
						when (@TotalHoursPerYear = 0) then
						0
						else
						.50
						end
	
	set @Amount = case when @PreSchoolChildren >= 5 and @QRISLevel = 3 then 15000.00
								  when @PreSchoolChildren >= 5 and @QRISLevel = 4 then 20000.00
								  when @PreSchoolChildren < 5 and @QRISLevel = 3 then 9000.00
								  when @Preschoolchildren = 0 then 0.00
								  else 12000.00
								  end * @Perc
							  
	
	delete from CPPISurveyClassroomInformation where QuestionId = 'txtAmount' and ClassroomId = @ClassroomId
	
	insert into CPPISurveyClassroomInformation
	(
		ClassroomId, SystemProviderId, QuestionId, QuestionAns, GrantApplicantId
	)
	values
	(
		@ClassroomId, @SystemProviderId, 'txtAmount', @Amount, @GrantApplicantId
	)
	*/
	
END

GO

