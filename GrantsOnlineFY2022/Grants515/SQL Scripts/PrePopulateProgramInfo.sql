--EXEC uspGetAllCPPIProgramsNew 8117, 2021

SELECT * FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515



SELECT a.GrantApplicantID, b.GrantApplicantId AS NewGrantApplicantId, a.AgencyName 
INTO dbo.TmpMergedGrantIds
FROM dbo.GrantApplicant a
JOIN dbo.GrantApplicant b ON b.AgencyName = a.AgencyName AND a.FundCode = b.Fundcode
WHERE a.FiscalYear = 2020
AND b.FiscalYear = 2021
AND a.FundCode = 515



--Lead Agency and District Information
SELECT * FROM dbo.CPPIDistrictInformation
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515)

-- Save a backup
SELECT * INTO dbo.CPPIDistrictInformation_FY20
FROM dbo.CPPIDistrictInformation


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
SELECT CASE WHEN a.GrantApplicantID = 7885 THEN 8155 
			WHEN a.GrantApplicantID = 7890 THEN 8156
			WHEN a.GrantApplicantID = 7893 THEN 8157
			WHEN a.GrantApplicantID = 7896 THEN 8158
			when a.GrantApplicantID = 7897 THEN 8159
			WHEN a.GrantApplicantID = 7898 THEN 8160 END GrantApplicantId,
    DistrictName,
    TotalEnrollment,
    HighSchoolGradRate,
    PctMeetExceed3rdGrade,
    PctMeetExceedELA,
    PctMeetExceedMath,
    PctRetentionEarlyK2,
    PctSuspensionK5
FROM dbo.CPPIDistrictInformation a
WHERE a.GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515)


--CPPI Program Information: Insert using a cursor of last year's programs

-- Save a backup
SELECT * INTO dbo.CPPISurveyProgramInformation_FY20
FROM dbo.CPPISurveyProgramInformation


DECLARE @SystemProviderId2020 INT,
		@Sid INT,
		@Gid INT

SELECT @Sid = ISNULL(MAX(systemProviderId), 0) + 1 FROM [GrantOnlineFY2016].[dbo].[CPPISurveyProgramInformation]

DECLARE SysIDCur CURSOR  FOR 
	SELECT DISTINCT SystemProviderId FROM dbo.CPPISurveyProgramInformation
	WHERE GrantApplicantId IN (SELECT GrantApplicantId 
	FROM dbo.GrantApplicant 
	WHERE fiscalyear = 2020 AND fundcode = 515)


OPEN SysIdCur
FETCH FROM sysIdCur INTO @SystemProviderId2020

WHILE @@FETCH_STATUS = 0
BEGIN

	SELECT @Gid = CASE WHEN GrantApplicantID = 7885 THEN 8155 
			WHEN GrantApplicantID = 7890 THEN 8156
			WHEN GrantApplicantID = 7893 THEN 8157
			WHEN GrantApplicantID = 7896 THEN 8158
			when GrantApplicantID = 7897 THEN 8159
			WHEN GrantApplicantID = 7898 THEN 8160 END 			
		FROM dbo.CPPISurveyProgramInformation 
		WHERE SystemProviderId = @SystemProviderId2020


	INSERT INTO dbo.CPPISurveyProgramInformation
	(SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
	SELECT @Sid, QuestionId, QuestionAns, @Gid
	FROM dbo.CPPISurveyProgramInformation 
	WHERE GrantApplicantId IN (SELECT GrantApplicantId FROM dbo.GrantApplicant
			WHERE Fundcode = 515 AND FiscalYear = 2020)
			--AND QuestionId NOT LIKE 'txtQ%'
			AND SystemProviderId = @SystemProviderId2020

	UPDATE dbo.CPPISurveyProgramInformation
		SET QuestionAns = '0' 
		WHERE SystemProviderId =@Sid 
		AND GrantApplicantId = @Gid
		AND QuestionId LIKE 'txtQ%'


	SELECT @Sid = @Sid + 1

	FETCH NEXT FROM SysIdCur INTO @SystemProviderId2020

END

CLOSE SysIDCur
DEALLOCATE SysIDCur

--SELECT 65 * 27

SELECT * FROM dbo.CPPISurveyProgramInformation
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515) 
ORDER BY GrantapplicantID, SystemProviderId

SELECT * FROM dbo.CPPISurveyProgramInformation
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515) 
ORDER BY GrantapplicantID, SystemProviderId

--Remove if we need to start over
--DELETE FROM dbo.CPPISurveyProgramInformation 
--WHERE grantapplicantId IN (SELECT GrantApplicantId 
--FROM dbo.GrantApplicant 
--WHERE fiscalyear = 2021 AND fundcode = 515)	

GO






-- dbo.CPPIClassroom - used to keep Classroom data unique no duplicates
SELECT * FROM dbo.CPPIClassroom 
WHERE GRANTApplicantID IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2020
AND fundCode = 515)


SELECT * FROM dbo.CPPIClassroom 
WHERE GRANTApplicantID IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2021 
AND fundCode = 515)

delete FROM dbo.CPPIClassroom 
WHERE GRANTApplicantID IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2021 
AND fundCode = 515)



SELECT * FROM dbo.CPPISurveyProgramINformation 
WHERE GRANTApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalyear = 2020)
AND questionid = 'txtProgramName'
ORDER BY SystemProviderId

SELECT * FROM dbo.CPPISurveyProgramINformation 
WHERE GRANTApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalyear = 2021)
AND questionid = 'txtProgramName'
ORDER BY SystemProviderId

SELECT * FROM dbo.CPPISurveyClassroomINformation 
WHERE GRANTApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalyear = 2020)
AND questionid = 'txtClassroomName'

SELECT * FROM dbo.CPPISurveyClassroomINformation 
WHERE GRANTApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalyear = 2021)
AND questionid = 'txtClassroomName'


SELECT * FROM dbo.tmpMergedGrantIds


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
--DROP TABLE dbo.TmpMergedSysIds

SELECT * FROM dbo.CPPISurveyProgramInformation 
WHERE GrantApplicantId IN (8112,8113,8114,8115,8116,8117)
AND QuestionId = 'txtProgramName'
ORDER BY SystemProviderId


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (8112,8113,8114,8115,8116,8117)
AND QuestionId = 'txtClassroomName'
ORDER BY SystemProviderId



UPDATE dbo.TmpMergedSysIds
SET SysId21 = c.SystemProviderId
--SELECT c.SystemProviderId
FROM dbo.TmpMergedSysIds s 
JOIN dbo.CPPISurveyProgramInformation c ON c.GrantApplicantId = s.GrantId21
AND c.QuestionId = 'txtProgramName'
WHERE s.ProgName = c.QuestionAns


SELECT * FROM dbo.TmpMergedSysIds
--DROP TABLE dbo.TmpMergedSysIds

INSERT INTO dbo.CPPIClassroom 
(ClassroomName, SystemProviderId, GrantApplicantId, CreateDate, ModifyDate)
SELECT DISTINCT p.QuestionAns, s.SysId21, s.GrantId21, GETDATE(), GETDATE() 
FROM dbo.CPPISurveyClassroomInformation p
JOIN dbo.TmpMergedSysIds s ON s.SysId20 = p.SystemProviderId AND s.GrantId20 = p.GrantApplicantId
WHERE p.QuestionId = 'txtClassroomName' 


SELECT * FROM dbo.TmpMergedClassIds


ALTER TABLE dbo.TmpMergedClassIds
ADD SysId21 INT NULL,
	GrantId21 INT NULL

SELECT * FROM dbo.TmpMergedClassIds	t1
SELECT * FROM dbo.TmpMergedSysIds	t2

UPDATE t1
SET t1.SysId21 = t2.SysId21,
	t1.GrantId21 = t2.GrantId21
--SELECT * 
FROM dbo.TmpMergedClassIds t1
JOIN dbo.TmpMergedSysIds t2 ON t2.SysId20 = t1.SystemProviderId
WHERE t1.SysId21 IS NULL

SELECT * FROM dbo.CPPICLASSROOM 
WHERE GrantApplicantID IN (8112,8113,8114,8115,8116,8117)

SELECT * FROM dbo.TmpMergedClassIds

--INSERT INTO dbo.CPPIClassroom 
--(ClassroomName, SystemProviderId, GrantApplicantId, CreateDate, ModifyDate)
--select QuestionAns, SysId21, GrantId21, GETDATE(), GETDATE()
--FROM dbo.TmpMergedClassIds


SELECT * FROM dbo.CPPIClassroom 
WHERE GRANTApplicantID IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2020
AND fundCode = 515)
ORDER BY ClassroomID


SELECT * FROM dbo.CPPIClassroom 
WHERE GRANTApplicantID IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant 
WHERE FiscalYear = 2021
AND fundCode = 515)
ORDER BY ClassroomID



-- Classroom Data
SELECT * INTO dbo.CPPISurveyClassroomInformation_FY20
FROM dbo.CPPISurveyClassroomInformation

--SELECT COUNT(*) FROM dbo.CPPISurveyClassroomInformation_FY20

SELECT * FROM dbo.CPPISurveyClassroomInformation
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515)
--45 classrooms
--765 records 

SELECT DISTINCT classroomid FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515)

SELECT DISTINCT classroomid FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)

DELETE FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)

SELECT * FROM dbo.CPPIClassroom 
WHERE grantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)


SELECT distinct c.ClassroomId, t.SysId21, t.GrantId21, c.QuestionAns, c.QuestionId
--INTO dbo.TmpMergedSurvey
FROM dbo.CPPISurveyClassroomInformation c
JOIN dbo.TmpMergedClassIds t ON t.SystemProviderId = c.SystemProviderId AND t.GrantApplicantId = c.GrantApplicantId
JOIN dbo.CPPIClassroom c2 ON c2.SystemProviderId = t.SysId21 AND c2.GrantApplicantId = t.GrantId21
WHERE c2.GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)
--ORDER BY GrantApplicantId, SystemProviderId, ClassroomId

SELECT * FROM dbo.TmpMergedSurvey
SELECT * FROM dbo.TmpMergedClassIds

ALTER TABLE dbo.TmpMergedSurvey
ADD ClassId21 INT NULL

UPDATE s
SET s.ClassId21 = t.ClassroomId 
--SELECT DISTINCT t.ClassroomId, SystemProviderID, GrantApplicantID
FROM dbo.TmpMergedSurvey s
JOIN dbo.CPPIClassroom t ON t.SystemProviderId = s.SysId21
WHERE t.GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)
--AND t.GrantApplicantID = 8160

SELECT * FROM dbo.CPPIClassroom 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant
WHERE fiscalyear = 2021 AND fundcode = 515)
AND SystemProviderID = 186

SELECT * FROM dbo.TmpMergedSurvey 
WHERE QuestionAns = 'Marr - K1'


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE QuestionAns = 'Marr - K1'

SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId = 8117
--AND systemProviderId = 152

INSERT INTO dbo.CPPISurveyClassroomInformation
(
    ClassroomId,
    SystemProviderId,
    QuestionId,
    QuestionAns,
    GrantApplicantId
)
SELECT DISTINCT ClassId21, SysId21, QuestionId, QuestionAns, GrantId21
FROM dbo.TmpMergedSurvey
--WHERE GrantId21 <> 8160


DELETE FROM dbo.CPPISurveyClassroomEducators WHERE ClassroomId IN (
SELECT ClassId21 FROM dbo.TmpMergedSurvey
WHERE GrantId21 = 8160)


/*
DECLARE @GrantApplicantId2020 INT,
		@SystemProviderId2020 INT,
		@ClassroomId2020 INT,
		@Cid INT,
		@Sid INT,
		@Gid INT,
		@RecCount INT = 0,
		@RecCount2 INT = 0

SELECT @Cid = ISNULL(MAX(ClassroomId), 0) + 1 FROM [GrantOnlineFY2016].[dbo].[CPPISurveyClassroomInformation]


DECLARE mapCur CURSOR READ_ONLY for
SELECT DISTINCT a.SystemProviderId AS SysID20, a.GrantApplicantId AS GrantID20, --a.QuestionAns, 
	b.GrantApplicantId AS GrantID21, b.SystemProviderId AS Sysid21
	FROM dbo.CPPISurveyProgramInformation a
	JOIN dbo.CPPISurveyProgramInformation b ON b.QuestionAns = a.QuestionAns
	WHERE a.GrantApplicantId IN (SELECT GrantApplicantId 
		FROM dbo.GrantApplicant 
		WHERE fiscalyear = 2020 AND fundcode = 515)
		AND b.GrantApplicantId IN (SELECT GrantApplicantId 
		FROM dbo.GrantApplicant 
		WHERE fiscalyear = 2021 AND fundcode = 515)
		AND a.Questionid = 'txtProgramName' 
	ORDER BY a.SystemProviderId, b.GrantApplicantId  


OPEN mapCur 
FETCH FROM mapCur INTO @SystemProviderId2020, @GrantApplicantId2020, @Gid, @Sid

WHILE @@fetch_status = 0
BEGIN

	DECLARE ClassCur CURSOR READ_ONLY FOR 
		SELECT DISTINCT ClassRoomId FROM dbo.CPPISurveyClassroomInformation 
		WHERE SystemProviderId = @SystemProviderId2020
		AND GrantApplicantId = @GrantApplicantId2020

	OPEN ClassCur
	FETCH FROM ClassCur INTO @ClassroomId2020

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SELECT @RecCount2 = @RecCount2 + 1

		INSERT INTO dbo.CPPISurveyClassroomInformation
		(ClassroomId, SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
		SELECT @Cid, @Sid, QuestionId, QuestionAns, @Gid
		FROM dbo.CPPISurveyClassroomInformation 
		WHERE ClassroomId = @ClassroomId2020
			AND SystemProviderId = @SystemProviderId2020
			AND GrantApplicantId = @GrantApplicantId2020	

		UPDATE dbo.CPPISurveyClassroomInformation
			SET QuestionAns = '0' 
			WHERE ClassroomId = @Cid
			AND SystemProviderId = @Sid 
			AND GrantApplicantId = @Gid
			AND QuestionId LIKE 'txtQ%'

		SELECT @Cid = @Cid + 1
		SELECT @RecCount = @RecCount + 1

		FETCH NEXT FROM ClassCur INTO @ClassroomId2020
	END
    CLOSE ClassCur
	DEALLOCATE ClassCur

	FETCH NEXT FROM mapCur INTO @SystemProviderId2020, @GrantApplicantId2020, @Gid, @Sid
END

CLOSE mapCur
DEALLOCATE mapCur

SELECT RecordCount = @RecCount, RecordCount2 = @RecCount2
*/

DELETE FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)


SELECT * FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515)
--765 in 2021
--765 in 2020


GO


-- Educators 

SELECT * INTO dbo.CPPISurveyClassroomEducators_FY20 
FROM dbo.CPPISurveyClassRoomEducators 
--WHERE GrantApplicantId IN (
--SELECT GrantApplicantId FROM dbo.GrantApplicant 
--WHERE fiscalyear = 2020 AND fundcode = 515)


SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515))
--101

SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515))
 
delete FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515))


SELECT * INTO dbo.TmpMergedEducators 
FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515))

SELECT MAX(educatorId) FROM dbo.CPPISurveyClassroomEducators 


ALTER TABLE dbo.TmpMergedEducators 
ADD SysId21 INT,
	GrantId21 INT,
	ClassId21 INT

SELECT * FROM dbo.TmpMergedEducators
SELECT * FROM dbo.TmpMergedClassids

ALTER TABLE dbo.TmpMergedClassIds
ADD ClassId21 INT NULL

UPDATE t
SET t.ClassId21 = c.ClassroomId
--SELECT t.ClassId21, c.ClassroomId
FROM dbo.TmpMergedClassIds t
JOIN dbo.CPPIClassroom c ON c.classroomName = t.QuestionAns
WHERE c.GrantApplicantId IN (SELECT GrantApplicantID 
FROM dbo.GrantApplicant WHERE fundcode = 515 AND fiscalYear = 2021)



UPDATE e
SET e.sysId21 = c.SysId21,
	e.GrantId21 = c.GrantId21,
	e.ClassId21 = c.ClassId21
FROM dbo.TmpMergedEducators e
JOIN dbo.TmpMergedClassids c ON c.ClassroomId = e.ClassroomId AND c.SystemProviderId = e.SystemProviderID


SELECT * FROM dbo.TmpMergedEducators
 e


INSERT INTO dbo.CPPISurveyClassroomEducators
	(EducatorName, Position, HighestEducationLevel, MajorProgramStudy, AnnualSalary, GrantApplicantID, SystemProviderID, PQRNumber, ClassroomId)

SELECT e.EducatorName, e.Position, e.HighestEducationLevel, e.MajorProgramStudy, e.AnnualSalary, e.GrantId21, e.SysId21, e.PQRNumber, e.ClassId21
FROM dbo.TmpMergedEducators e
WHERE Grantid21 IS NOT NULL
AND Sysid21 IS NOT NULL
AND classid21 IS NOT NULL



			
/* cursor - don't use

DECLARE @GrantApplicantId2020 INT,
		@SystemProviderId2020 INT,
		@ClassroomId2020 INT,
		@EducatorId2020 INT,
		@Cid INT,
		@Sid INT,
		@Gid INT,
		@Eid INT = 0,
		@EducName VARCHAR(500),
		@ClassName VARCHAR(500),
		@RecCount INT = 0,
		@RecCount2 INT = 0

-- map

--SELECT DISTINCT a.ClassroomId AS ClassId20, a.SystemProviderId AS SysID20, a.GrantApplicantId AS GrantID20, --a.QuestionAns, 
--	a.QuestionAns AS ClassroomName,
--	b.GrantApplicantId AS GrantID21, b.SystemProviderId AS Sysid21, b.ClassroomId AS ClassId21,
--	c.EducatorId AS EdId20, c.EducatorName 
--	INTO dbo.TmpMergedEduc
--	FROM dbo.CPPISurveyClassroomInformation a
--	JOIN dbo.CPPISurveyClassroomInformation b ON b.QuestionAns = a.QuestionAns
--	LEFT JOIN dbo.CPPISurveyClassroomEducators c ON c.ClassroomId = a.ClassroomId AND c.SystemProviderId = a.SystemProviderId AND c.GrantApplicantId = a.GrantApplicantId 
--	WHERE a.GrantApplicantId IN (SELECT GrantApplicantId 
--		FROM dbo.GrantApplicant 
--		WHERE fiscalyear = 2020 AND fundcode = 515)
--		AND b.GrantApplicantId IN (SELECT GrantApplicantId 
--		FROM dbo.GrantApplicant 
--		WHERE fiscalyear = 2021 AND fundcode = 515)
--		AND a.Questionid = 'txtClassroomName' 
--	ORDER BY a.GrantApplicantId,  a.ClassroomId, a.SystemProviderId 

--	SELECT * FROM dbo.TmpMergedEduc

DECLARE mapEducatorCur CURSOR READ_ONLY FOR
SELECT EdId20, ClassId20, SysId20, GrantId20, ClassroomName, EducatorName, GrantId21, SysId21, ClassId21 
FROM dbo.TmpMergedEduc

OPEN mapEducatorCur
FETCH FROM mapEducatorCur INTO @EducatorId2020, @ClassroomId2020, @SystemProviderId2020, @GrantApplicantId2020, @ClassName, @EducName, @Gid, @Sid, @Cid

WHILE @@FETCH_STATUS = 0
BEGIN

	SELECT @RecCount2 = @RecCount2 + 1

	--DECLARE EduCur CURSOR FOR 
	--	SELECT DISTINCT EducatorId FROM dbo.CPPISurveyClassroomEducators 
	--	WHERE ClassroomId = @ClassroomId2020
		 
	--OPEN EduCur
	--FETCH FROM EduCur INTO @EducatorId2020

	--WHILE @@FETCH_STATUS = 0
	--BEGIN

		IF NOT EXISTS (SELECT * FROM dbo.CPPISurveyClassroomEducators WHERE ClassroomId = @Cid AND EducatorName = @EducName)
		begin
			INSERT INTO dbo.CPPISurveyClassroomEducators
			(ClassroomId, EducatorName, Position, HighestEducationLevel, MajorProgramStudy, AnnualSalary, GrantApplicantID, SystemProviderID, PQRNumber)
			SELECT @Cid, e.EducatorName, e.Position, e.HighestEducationLevel, e.MajorProgramStudy, e.AnnualSalary, @Gid, @Sid, e.PQRNumber
			FROM dbo.CPPISurveyClassroomEducators e
			--JOIN dbo.TmpMergedEduc t ON t.ClassId20 = e.ClassroomId AND t.SysId20 = e.SystemProviderId
			WHERE e.EducatorId = @EducatorId2020
				AND e.ClassroomId = @ClassroomId2020
				AND e.GrantApplicantId = @GrantApplicantId2020
				AND e.SystemProviderId = @SystemProviderId2020

			SELECT @Eid = @@IDENTITY

			SELECT @RecCount = @RecCount + 1
		end
	--	FETCH NEXT FROM EduCur INTO @EducatorId2020
	--END
	--CLOSE EduCur
	--DEALLOCATE EduCur

	FETCH FROM mapEducatorCur INTO @EducatorId2020, @ClassroomId2020, @SystemProviderId2020, @GrantApplicantId2020,  @ClassName, @EducName, @Gid, @Sid, @Cid
END

CLOSE mapEducatorCur
DEALLOCATE mapEducatorCur

SELECT recCnt = @RecCount, recCnt2 = @RecCount2
SELECT EID = @Eid
*/



SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515))

SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515))


SELECT * FROM dbo.CPPISurveyClassroomEducators 
WHERE classroomId IN (SELECT ClassroomId FROM dbo.CPPISurveyClassroomInformation 
WHERE GrantApplicantId IN (SELECT GrantApplicantId 
FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021 AND fundcode = 515))





--DON'T DO SUBCONTRACTORS UNLESS THEY TELL YOU TO
-- Subcontractor Contact Data
--SELECT DISTINCT (systemProviderId), GrantApplicantId 
SELECT * FROM dbo.CPPISubcontractorContactData
WHERE GrantApplicantId IN (
SELECT GrantApplicantId FROM dbo.GrantApplicant 
WHERE fiscalyear = 2020 AND fundcode = 515)
AND systemproviderid > 0

SELECT * INTO dbo.CPPISubcontractorContactData_FY20
FROM dbo.CPPISubcontractorContactData


INSERT INTO dbo.CPPISubcontractorContactData
(
    GrantApplicantID,
    SystemProviderID,
    BudgetNarrativeID,
    IsFiscalContact,
    SubcontractorName,
    SubcontractorContactName,
    SubcontractorAddress1,
    SubcontractorAddress2,
    SubcontractorCity,
    SubcontractorState,
    SubcontractorZipcode,
    SubcontractorPhone,
    SubcontractorFAX,
    SubcontractorEmail
)
SELECT CASE WHEN a.GrantApplicantID = 7885 THEN 8155 
			WHEN a.GrantApplicantID = 7890 THEN 8156
			WHEN a.GrantApplicantID = 7893 THEN 8157
			WHEN a.GrantApplicantID = 7896 THEN 8158
			when a.GrantApplicantID = 7897 THEN 8159
			WHEN a.GrantApplicantID = 7898 THEN 8160 END GrantApplicantId,
    SystemProviderID,
    0 AS BudgetNarrativeID,
    IsFiscalContact,
    SubcontractorName,
    SubcontractorContactName,
    SubcontractorAddress1,
    SubcontractorAddress2,
    SubcontractorCity,
    SubcontractorState,
    SubcontractorZipcode,
    SubcontractorPhone,
    SubcontractorFAX,
    SubcontractorEmail

FROM dbo.CPPISubcontractorContactData s
JOIN dbo.GrantApplicant a ON a.GrantApplicantId = s.GrantApplicantId 
--JOIN dbo.GrantApplicant b ON b.Fundcode = a.Fundcode 
WHERE a.FiscalYear = 2020
--AND b.Fiscalyear = 2021
AND a.fundcode = 515
AND s.systemproviderid > 0


SELECT * FROM dbo.CPPISubcontractorContactData
WHERE GrantApplicantID IN (
select GrantApplicantID FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021)
--AND subcontractorname LIKE 'B&G%'

DELETE FROM dbo.CPPISubcontractorContactData
WHERE GrantApplicantID IN (
select GrantApplicantID FROM dbo.GrantApplicant 
WHERE fiscalyear = 2021)

SELECT MAX(systemproviderID) FROM dbo.CPPISubcontractorContactData 



--EXEC uspGetCPPIProgramSurveyData 184

--INSERT INTO dbo.CPPISurveyProgramInformation(SystemProviderId, QuestionId, QuestionAns, GrantApplicantId)
--	SELECT 184, QuestionId, 0, 8117
--	FROM dbo.CPPISurveyProgramInformation 
--	WHERE GrantApplicantId IN (SELECT GrantApplicantId FROM dbo.GrantApplicant
--			WHERE Fundcode = 515 AND FiscalYear = 2020)
--			AND QuestionId LIKE 'txtQ%'
--			AND SystemProviderId IN (152, 162, 163)
--			ORDER BY SystemProviderId


--SELECT DISTINCT systemproviderid 
--FROM dbo.CPPISurveyProgramInformation
--WHERE GrantApplicantId = 7898 
--ORDER BY SystemProviderId



--SELECT DISTINCT systemproviderid 
--FROM dbo.CPPISurveyProgramInformation
--WHERE GrantApplicantId = 8117 
--ORDER BY SystemProviderId


SELECT * FROM dbo.CPPIClassroom 
WHERE --GrantApplicantId = 8117
classroomname = 'Test New Class'



SELECT * FROM dbo.CPPISurveyClassroomInformation
WHERE --GrantApplicantId = 8117
questionans = 'Test New Class'

SELECT * FROM dbo.CPPISurveyProgramInformation 
WHERE questionans = 'Test Program'
AND GrantApplicantId = 8117


SELECT * FROM dbo.CPPISurveyClassroomEducators
WHERE --GrantApplicantId = 8117
ClassroomId = 1181


SELECT * INTO dbo.CPPISurveyClassroomEducators_BAK07May2020
FROM dbo.CPPISurveyClassroomEducators


SELECT * FROM dbo.CPPISurveyClassroomEducators_BAK07May2020
WHERE GrantApplicantID BETWEEN 8112 AND 8117

SELECT * FROM dbo.CPPISurveyClassroomEducators
WHERE GrantApplicantID BETWEEN 8112 AND 8117

DELETE FROM dbo.CPPISurveyClassroomEducators
WHERE GrantApplicantID BETWEEN 8112 AND 8117