CREATE TRIGGER [dbo].[dbo_Customer_ApexSQLAudit_Insert]
	ON [dbo].[Customer]
	AFTER
		INSERT
AS
	EXTERNAL NAME [ApexSQL.Audit.BeforeAfter.mathew_dev.dbo.Customer.Insert].[ApexSQL.Audit.BeforeAfterClr.BeforeAfterTrigger].[Insert]
GO
