CREATE TRIGGER [dbo].[dbo_Customer_ApexSQLAudit_Update]
	ON [dbo].[Customer]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [ApexSQL.Audit.BeforeAfter.mathew_dev.dbo.Customer.Update].[ApexSQL.Audit.BeforeAfterClr.BeforeAfterTrigger].[Update]
GO
