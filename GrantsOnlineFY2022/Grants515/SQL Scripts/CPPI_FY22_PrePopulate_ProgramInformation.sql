SELECT * FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalyear = 2022
--ORDER BY FiscalYear

UPDATE dbo.GrantApplicant 
SET passphrase = '' WHERE 
GrantApplicantid = 8320 
AND fiscalyear = 2022
AND fundcode = 515

-- FY 2021
SELECT * FROM dbo.GrantApplicant WHERE grantApplicantId IN (
8315,
8316,
8317,
8318,
8319,
8320,
8333,
8334,
8335)


--SELECT * FROM dbo.GrantApplicant WHERE grantApplicantId BETWEEN 8315 AND 8320


SELECT * FROM dbo.CPPISurveyProgramInformation
WHERE  GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
AND questionId = 'txtProgramName'
ORDER BY GrantApplicantId 


SELECT * FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
ORDER BY GrantApplicantId, SystemProviderID

DELETE FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)


SELECT * FROM dbo.CPPISurveyClassroomInformation
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
AND questionId = 'txtClassroomName'
ORDER BY GrantApplicantId 

DELETE FROM dbo.CPPISurveyClassroomInformation
WHERE  GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
AND questionId = 'txtClassroomName'


-- GrantIds
DROP TABLE dbo.TmpMergedGrantIds

SELECT a.GrantApplicantID, b.GrantApplicantId AS NewGrantApplicantId, a.AgencyName 
INTO dbo.TmpMergedGrantIds
FROM dbo.GrantApplicant a
JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName AND a.FundCode = b.Fundcode
WHERE a.FiscalYear = 2021
AND b.FiscalYear = 2022
AND a.FundCode = 515

INSERT INTO dbo.TmpMergedGrantIds
SELECT a.GrantApplicantID, b.GrantApplicantId AS NewGrantApplicantId, a.AgencyName 
FROM dbo.GrantApplicant a
JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName AND a.FundCode != b.Fundcode
WHERE a.FiscalYear = 2021
AND b.FiscalYear = 2022
AND a.FundCode = 615


SELECT * FROM  dbo.TmpMergedGrantIds


INSERT INTO dbo.CPPIDistrictInformation
(
    GrantApplicantID,
    DistrictName,
    TotalEnrollment,
    HighSchoolGradRate,
    PctMeetExceed3rdGrade,
    PctMeetExceedELA,
    PctMeetExceedMath,
    PctRetentionEarlyK2,
    PctSuspensionK5
)
SELECT g.NewGrantApplicantId,
    DistrictName,
    TotalEnrollment,
    HighSchoolGradRate,
    PctMeetExceed3rdGrade,
    PctMeetExceedELA,
    PctMeetExceedMath,
    PctRetentionEarlyK2,
    PctSuspensionK5
FROM dbo.CPPIDistrictInformation a
JOIN dbo.TmpMergedGrantIds g ON g.GrantApplicantId = a.GrantApplicantID
WHERE a.GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode in (515,615))

SELECT * FROM dbo.CPPIDistrictInformation 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2022 AND fundcode = 515)


DROP TABLE dbo.TmpMergedSysIds

CREATE TABLE dbo.TmpMergedSysIds(
	GrantId20 int,
	SysId20 INT,
	ProgName VARCHAR(500),
	GrantId21 INT,
	SysId21 INT)

INSERT INTO dbo.TmpMergedSysIds
(
    GrantId20,
    SysId20,
	ProgName,
    GrantId21--,
    --SysId21
)
SELECT distinct a.GrantApplicantId, b.SystemProviderId, b.QuestionAns, a.NewGrantApplicantId--, c.SystemProviderId
FROM dbo.TmpMergedGrantIds a
JOIN dbo.CPPISurveyProgramInformation b ON b.GrantApplicantId = a.GrantApplicantId
--JOIN dbo.CPPISurveyProgramInformation c ON c.GrantApplicantId = a.NewGrantApplicantId
WHERE b.QuestionId = 'txtProgramName'

SELECT * FROM dbo.TmpMergedSysIds


-- Get SystemProviderIds for 2022

SELECT * INTO dbo.CPPISurveyProgramInformation_FY21
FROM dbo.CPPISurveyProgramInformation


DECLARE @SystemProviderId2021 INT,
		@Sid INT,
		@Gid INT

SELECT @Sid = ISNULL(MAX(systemProviderId), 0) + 1 FROM [GrantOnlineFY2016].[dbo].[CPPISurveyProgramInformation]

DECLARE SysIDCur CURSOR LOCAL READ_ONLY FOR 
	SELECT DISTINCT SystemProviderId FROM dbo.CPPISurveyProgramInformation
	WHERE GrantApplicantId IN (SELECT GrantApplicantId 
	FROM dbo.GrantApplicant 
	WHERE fiscalyear = 2021 AND fundcode in (515,615))


OPEN SysIdCur
FETCH FROM sysIdCur INTO @SystemProviderId2021

WHILE @@FETCH_STATUS = 0
BEGIN

	SELECT @Gid = g.NewGrantApplicantId 			
		FROM dbo.CPPISurveyProgramInformation p
		JOIN dbo.TmpMergedGrantIds g ON g.GrantApplicantId = p.GrantApplicantId
		WHERE p.SystemProviderId = @SystemProviderId2021


	INSERT INTO dbo.CPPISurveyProgramInformation
	(SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
	SELECT @Sid, QuestionId, QuestionAns, @Gid
	FROM dbo.CPPISurveyProgramInformation 
	WHERE GrantApplicantId IN (SELECT GrantApplicantId FROM dbo.GrantApplicant
			WHERE Fundcode in (515,615) AND FiscalYear = 2021)
			--AND QuestionId NOT LIKE 'txtQ%'
			AND SystemProviderId = @SystemProviderId2021

	--UPDATE dbo.CPPISurveyProgramInformation
	--	SET QuestionAns = '0' 
	--	WHERE SystemProviderId = @Sid 
	--	AND GrantApplicantId = @Gid
	--	AND QuestionId LIKE 'txtQ%'

	SELECT @Sid = @Sid + 1

	FETCH NEXT FROM SysIdCur INTO @SystemProviderId2021

END

CLOSE SysIDCur
DEALLOCATE SysIDCur

---------------------------------------------------------------
SELECT * FROM dbo.CPPISurveyProgramInformation 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)


-- CAN'T DO THIS UPDATE UNTIL AFTER CPPISurveyProgramInformation is prepopulated
UPDATE dbo.TmpMergedSysIds
SET SysId21 = c.SystemProviderId
--SELECT distinct c.SystemProviderId
FROM dbo.TmpMergedSysIds s 
JOIN dbo.CPPISurveyProgramInformation c ON c.GrantApplicantId = s.GrantId21
AND c.QuestionId = 'txtProgramName'
WHERE s.ProgName = c.QuestionAns


SELECT * FROM dbo.TmpMergedSysIds


INSERT INTO dbo.CPPIClassroom 
(ClassroomName, SystemProviderId, GrantApplicantId, CreateDate, ModifyDate)
SELECT DISTINCT p.QuestionAns, s.SysId21, s.GrantId21, GETDATE(), GETDATE() 
FROM dbo.CPPISurveyClassroomInformation p
JOIN dbo.TmpMergedSysIds s ON s.SysId20 = p.SystemProviderId AND s.GrantId20 = p.GrantApplicantId
WHERE p.QuestionId = 'txtClassroomName' 


SELECT * FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
ORDER BY GrantApplicantID



SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
AND questionid= 'txtclassroomname'
ORDER BY GrantApplicantID


--DELETE FROM dbo.CPPISurveyClassroomInformation 
--WHERE GrantApplicantId IN (
--SELECT GrantApplicantId FROM dbo.GrantApplicant 
--WHERE fundcode = 515 AND fiscalYear = 2022)


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE ClassroomId IN (SELECT ClassroomId 
FROM dbo.CPPIClassroom WHERE  GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022))
--AND questionid = 'txtClassroomName'

SELECT * FROM dbo.TmpMergedClassIds

DELETE FROM dbo.tmpMergedClassIds

--CREATE TABLE dbo.TmpMergedClassIds (
--ClassId20 INT NOT NULL, 
--ClassroomName VARCHAR(500) NOT NULL,
--SysId20 INT  NOT NULL,
--GrantId20 INT NOT NULL,
--Sysid21 INT NULL,
--GrantId21 INT NULL,
--ClassId21 INT NULL)

INSERT INTO dbo.tmpMergedClassIds (
ClassId20, ClassroomName, Sysid20, Grantid20,
Sysid21, GrantId21, ClassId21)
SELECT DISTINCT c.ClassroomId, c.ClassroomName, c.SystemProviderId, c.GrantApplicantId, 
c2.SystemProviderId, c2.GrantApplicantId, c2.ClassroomId
FROM dbo.CPPIClassroom c 
JOIN dbo.CPPIClassroom c2 ON c2.ClassroomName = c.ClassroomName
WHERE c2.grantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022)
AND c.GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2021)
ORDER BY c.GrantApplicantId

SELECT * FROM dbo.TmpMergedClassIds


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE ClassroomId IN (
SELECT classroomId FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022))


INSERT INTO dbo.CPPISurveyClassroomInformation
(
    ClassroomId,
    SystemProviderId,
    QuestionId,
    QuestionAns,
    GrantApplicantId
)
SELECT DISTINCT t.ClassId21, t.SysId21, s.QuestionId, s.QuestionAns, t.GrantId21
FROM dbo.TmpMergedClassIds t
JOIN dbo.CPPISurveyClassroomInformation s ON s.ClassroomId = t.ClassId20


--UPDATE dbo.CPPISurveyClassroomInformation 
--SET QuestionAns = '0'
----SELECT QuestionId,QuestionAns FROM dbo.CPPISurveyClassroomInformation 
--WHERE QuestionId LIKE 'txtQ%'
--and ClassroomId IN (
--SELECT classroomId FROM dbo.CPPIClassroom 
--WHERE GrantApplicantId IN (
--SELECT GrantApplicantId FROM dbo.GrantApplicant 
--WHERE fundcode = 515 AND fiscalYear = 2022))


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE ClassroomId IN (
SELECT classroomId FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022))





-- Educators

SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE ClassroomId IN (
SELECT classroomId FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fundcode = 515 AND fiscalYear = 2022))


SELECT * FROM dbo.CPPISurveyClassroomEducators
WHERE ClassroomId IN (
SELECT classroomId FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fundcode in (515,615) AND fiscalYear = 2021))
AND EducatorName <> ''



INSERT INTO dbo.CPPISURVEYClassroomEducators 
(ClassroomId, EducatorName, Position, HighestEducationLevel, MajorProgramStudy, AnnualSalary, GrantApplicantId, SystemProviderId, PQRNumber)

SELECT ClassId21, EducatorName, Position, HighestEducationLevel, MajorProgramStudy, AnnualSalary, GrantId21, SysId21, PQRNumber 
FROM dbo.CPPISurveyClassroomEducators e
JOIN dbo.TmpMergedClassIds t ON t.ClassId20 = e.ClassroomId
WHERE e.ClassroomId IN (
SELECT classroomId FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fundcode in (515,615) AND fiscalYear = 2021))
ORDER BY t.GrantId21

----------------------------------------------



