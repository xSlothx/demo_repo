SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_u_AUDIT_Customer]
ON [dbo].[Customer]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [dbo].[Customer]
-- Author:       ApexSQL, LLC
-- Date:		 9/28/2020 8:57:18 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE			varchar(50),
		@AUDIT_LOG_TRANSACTION_ID	Int,
		@PRIM_KEY			nvarchar(4000),
		@Inserted	    		bit,
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[Customer]'
	Select @ROWS_COUNT=count(*) from inserted
	SET @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

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
		1,	--	ACTION ID For UPDATE
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
	

	SET @Inserted = 0
	
	If UPDATE([CustomerId])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'CustomerId',
			CONVERT(nvarchar(4000), OLD.[CustomerId], 0),
			CONVERT(nvarchar(4000), NEW.[CustomerId], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			WHERE (
			
			
				(
					NEW.[CustomerId] <>
					OLD.[CustomerId]
				) Or
			
				(
					NEW.[CustomerId] Is Null And
					OLD.[CustomerId] Is Not Null
				) Or
				(
					NEW.[CustomerId] Is Not Null And
					OLD.[CustomerId] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([FirstName])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'FirstName',
			CONVERT(nvarchar(4000), OLD.[FirstName], 0),
			CONVERT(nvarchar(4000), NEW.[FirstName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[FirstName] <>
					OLD.[FirstName]
				) Or
			
				(
					NEW.[FirstName] Is Null And
					OLD.[FirstName] Is Not Null
				) Or
				(
					NEW.[FirstName] Is Not Null And
					OLD.[FirstName] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([LastName])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'LastName',
			CONVERT(nvarchar(4000), OLD.[LastName], 0),
			CONVERT(nvarchar(4000), NEW.[LastName], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[LastName] <>
					OLD.[LastName]
				) Or
			
				(
					NEW.[LastName] Is Null And
					OLD.[LastName] Is Not Null
				) Or
				(
					NEW.[LastName] Is Not Null And
					OLD.[LastName] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Phone])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'Phone',
			CONVERT(nvarchar(4000), OLD.[Phone], 0),
			CONVERT(nvarchar(4000), NEW.[Phone], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[Phone] <>
					OLD.[Phone]
				) Or
			
				(
					NEW.[Phone] Is Null And
					OLD.[Phone] Is Not Null
				) Or
				(
					NEW.[Phone] Is Not Null And
					OLD.[Phone] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Address])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'Address',
			CONVERT(nvarchar(4000), OLD.[Address], 0),
			CONVERT(nvarchar(4000), NEW.[Address], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[Address] <>
					OLD.[Address]
				) Or
			
				(
					NEW.[Address] Is Null And
					OLD.[Address] Is Not Null
				) Or
				(
					NEW.[Address] Is Not Null And
					OLD.[Address] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([City])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'City',
			CONVERT(nvarchar(4000), OLD.[City], 0),
			CONVERT(nvarchar(4000), NEW.[City], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[City] <>
					OLD.[City]
				) Or
			
				(
					NEW.[City] Is Null And
					OLD.[City] Is Not Null
				) Or
				(
					NEW.[City] Is Not Null And
					OLD.[City] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([State])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'State',
			CONVERT(nvarchar(4000), OLD.[State], 0),
			CONVERT(nvarchar(4000), NEW.[State], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[State] <>
					OLD.[State]
				) Or
			
				(
					NEW.[State] Is Null And
					OLD.[State] Is Not Null
				) Or
				(
					NEW.[State] Is Not Null And
					OLD.[State] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Zip])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'Zip',
			CONVERT(nvarchar(4000), OLD.[Zip], 0),
			CONVERT(nvarchar(4000), NEW.[Zip], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[Zip] <>
					OLD.[Zip]
				) Or
			
				(
					NEW.[Zip] Is Null And
					OLD.[Zip] Is Not Null
				) Or
				(
					NEW.[Zip] Is Not Null And
					OLD.[Zip] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([BirthDate])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'BirthDate',
			CONVERT(nvarchar(4000), OLD.[BirthDate], 0),
			CONVERT(nvarchar(4000), NEW.[BirthDate], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[BirthDate] <>
					OLD.[BirthDate]
				) Or
			
				(
					NEW.[BirthDate] Is Null And
					OLD.[BirthDate] Is Not Null
				) Or
				(
					NEW.[BirthDate] Is Not Null And
					OLD.[BirthDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Gender])
	BEGIN
    
		INSERT
		INTO ApexSQLTriggerRepo.dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[CustomerId]='+CONVERT(nvarchar(4000), IsNull(OLD.[CustomerId], NEW.[CustomerId]), 0), '[CustomerId] Is Null')),
		    'Gender',
			CONVERT(nvarchar(4000), OLD.[Gender], 0),
			CONVERT(nvarchar(4000), NEW.[Gender], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerId], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[CustomerId], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[CustomerId], 0)=CONVERT(nvarchar(4000), OLD.[CustomerId], 0) or (NEW.[CustomerId] Is Null and OLD.[CustomerId] Is Null))
			where (
			
			
				(
					NEW.[Gender] <>
					OLD.[Gender]
				) Or
			
				(
					NEW.[Gender] Is Null And
					OLD.[Gender] Is Not Null
				) Or
				(
					NEW.[Gender] Is Not Null And
					OLD.[Gender] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	-- Watch
	
    --'
	-- Lookup
	
	IF @Inserted = 0
	BEGIN
		DELETE FROM ApexSQLTriggerRepo.dbo.AUDIT_LOG_TRANSACTIONS WHERE AUDIT_LOG_TRANSACTION_ID = @AUDIT_LOG_TRANSACTION_ID
	END

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  
End
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_u_AUDIT_Customer]', @order='Last', @stmttype='UPDATE'
GO
