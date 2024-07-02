CREATE PROCEDURE SCBS.Usp_GetData_Activity_Log
AS
BEGIN

--tetststttsetseseessersrs   ปปปป
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
