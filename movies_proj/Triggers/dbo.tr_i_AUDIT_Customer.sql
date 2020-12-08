SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_i_AUDIT_Customer]
ON [dbo].[Customer]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [dbo].[Customer]
-- Author:       ApexSQL, LLC
-- Date:		 9/28/2020 8:57:18 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[Customer]'
	Select @ROWS_COUNT=count(*) from inserted
	Set @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_TRANSACTIONS
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'Customer',
		'dbo',
		2,	--	ACTION ID For INSERT
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'mathew_dev'
	)

	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	

	
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'CustomerId',
		CONVERT(nvarchar(4000), NEW.[CustomerId], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[CustomerId] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'FirstName',
		CONVERT(nvarchar(4000), NEW.[FirstName], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[FirstName] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'LastName',
		CONVERT(nvarchar(4000), NEW.[LastName], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[LastName] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'Phone',
		CONVERT(nvarchar(4000), NEW.[Phone], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[Phone] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'Address',
		CONVERT(nvarchar(4000), NEW.[Address], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[Address] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'City',
		CONVERT(nvarchar(4000), NEW.[City], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[City] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'State',
		CONVERT(nvarchar(4000), NEW.[State], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[State] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'Zip',
		CONVERT(nvarchar(4000), NEW.[Zip], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[Zip] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'BirthDate',
		CONVERT(nvarchar(4000), NEW.[BirthDate], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[BirthDate] Is Not Null
    
	INSERT INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), NEW.[CustomerId], 0), '[CustomerId] Is Null')),
		'Gender',
		CONVERT(nvarchar(4000), NEW.[Gender], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0))
	FROM inserted NEW
	WHERE NEW.[Gender] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_i_AUDIT_Customer]', @order='Last', @stmttype='INSERT'
GO
