EXEC dbo.uspGetAllCPPIProgramsForRDL 6929

EXEC dbo.uspGetCPPIProgramIDsForRDL 6929


DELETE FROM CPPISurveyProgramInformation 
WHERE QuestionId LIKE 'txtChildrenSpeakNonEnglish%'

DELETE FROM CPPISurveyProgramInformation 
WHERE QuestionId LIKE 'txtChildrenWith%IEP%'

DELETE FROM CPPISurveyProgramInformation 
WHERE QuestionId = 'txtProgAddress'

