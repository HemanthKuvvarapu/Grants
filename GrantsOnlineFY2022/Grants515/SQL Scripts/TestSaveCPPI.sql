

SELECT * FROM dbo.CPPISurveyProgramInformation
DELETE FROM dbo.CPPISurveyProgramInformation

declare @p1 int
set @p1=1
exec uspSaveCPPIProgramSurveyData @SystemProviderId=@p1 output,@QuestionId='txtProgramName',@QuestionAns='Whodunit',@GrantApplicantId=6373
select @p1
go
declare @p1 int
set @p1=1
exec uspSaveCPPIProgramSurveyData @SystemProviderId=@p1 output,@QuestionId='cboProgramType',@QuestionAns='1',@GrantApplicantId=6373
select @p1
go

EXEC USPGetAllCPPIProgramS 6373

SELECT * FROM dbo.CPPIProgramInformation


SELECT
		s.[GrantCPPISystemProvidersId] 
		, s.ProgramNumber
		, s.ProgramName
		, Program = s.ProgramName
		, s.IsAccredited
		, s.IsHeadstartProgram
		, IsAccreditedText = CASE WHEN IsAccredited IS NULL THEN '' 
									WHEN IsAccredited = 1 THEN 'Yes'
									WHEN IsAccredited = 0 THEN 'No'
									WHEN IsAccredited = 2 THEN 'Not Applicable'
									ELSE '' END
		, s.AccreditationTypeId
		, AccreditationType = la.AccreditationName
		, AccreditationNumber
		, AccreditationExpirationDate = CONVERT(VARCHAR, AccreditationExpirationDate, 101)
		, ISNULL(c.amount, 0) 'Amount'
	--INTO #tempA
	FROM GrantApplicant g JOIN dbo.CPPIProgramInformation s 
		ON g.GrantApplicantId = s.GrantApplicantId 
		LEFT JOIN CPPIclassroom c
		ON s.grantCPPIsystemProvidersid = c.grantCPPIsystemprovidersid
		LEFT JOIN lookup.AccreditationType la ON s.AccreditationTypeId = la.AccreditationTypeId
	WHERE g.GrantApplicantId = 6373