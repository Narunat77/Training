CREATE PROCEDURE SCBS.Usp_GetData_Activity_Log
AS
BEGIN
-- เก็บข้อมูลจาก sp1 ใน temporary table =====Added=====
	IF OBJECT_ID('tempdb..#LoginLogout')IS NOT NULL
	DROP TABLE #LoginLogout

	IF OBJECT_ID('tempdb..#Acitivity')IS NOT NULL
	DROP TABLE #Acitivity

	IF OBJECT_ID('tempdb..#Result')IS NOT NULL
	DROP TABLE #Acitivity

 
    CREATE TABLE #LoginLogout (
        [Date_Time] datetime2(0),
        [Log_Type] NVARCHAR(100),
        [Application_Name] NVARCHAR(100),
        [Event_Type] NVARCHAR(100),
        [Source_Address] NVARCHAR(15),
		[Source_User_IdName] NVARCHAR(64),
		[Source_Object] NVARCHAR(MAX),
		[Des_Address] NVARCHAR(15),
		[Des_User_IdName] NVARCHAR(64),
		[Des_Object] NVARCHAR(MAX),
		[Result_Status] NVARCHAR(MAX),
		[Message] NVARCHAR(MAX)
    )

    INSERT INTO #LoginLogout
    EXEC [GlobalBO].[setup].[Usp_FetchUserLoginAuditReport]'2020-09-01','2020-09-01',1, 'COMPVW_USERLOGAUDITRPT_1' , 'ALL', 'ALL', null


    CREATE TABLE #Acitivity (
        [Date_Time] datetime2(0),
        [Log_Type] NVARCHAR(100),
        [Application_Name] NVARCHAR(100),
        [Event_Type] NVARCHAR(100),
        [Source_Address] NVARCHAR(15),
		[Source_User_IdName] NVARCHAR(64),
		[Source_Object] NVARCHAR(MAX),
		[Des_Address] NVARCHAR(15),
		[Des_User_IdName] NVARCHAR(64),
		[Des_Object] NVARCHAR(MAX),
		[Result_Status] NVARCHAR(MAX),
		[Message] NVARCHAR(MAX)
    )

    INSERT INTO #LoginLogout
    EXEC [GlobalBO].[setup].[Usp_FetchAuditReport] '2020-09-01','2020-09-01',1, 'COMPVW_AUDITRPT_1'


	SELECT 
	B.*
	INTO #Result
	FROM
	(
    SELECT *
    FROM #LoginLogout
    UNION ALL
    SELECT *
    FROM #Acitivity
	) B
END
