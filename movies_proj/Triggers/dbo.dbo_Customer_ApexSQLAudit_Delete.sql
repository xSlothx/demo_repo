CREATE TRIGGER [dbo].[dbo_Customer_ApexSQLAudit_Delete]
	ON [dbo].[Customer]
	AFTER
		DELETE
AS
	EXTERNAL NAME [ApexSQL.Audit.BeforeAfter.mathew_dev.dbo.Customer.Delete].[ApexSQL.Audit.BeforeAfterClr.BeforeAfterTrigger].[Delete]
GO
