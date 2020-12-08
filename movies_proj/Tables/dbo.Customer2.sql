SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer2] (
		[CustomerId]     [int] NOT NULL,
		[FirstName]      [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LastName]       [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Phone]          [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Address]        [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[City]           [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[State]          [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Zip]            [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BirthDate]      [date] NULL,
		[Gender]         [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [UQ__Customer__BA0BD0C5ECB0B82F]
		UNIQUE
		NONCLUSTERED
		([FirstName], [LastName], [Phone])
		ON [PRIMARY],
		CONSTRAINT [PK__Customer__A4AE64D85E3D12C3]
		PRIMARY KEY
		CLUSTERED
		([CustomerId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Customer2]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK__Customer2__Custo__03BB8E22]
	CHECK
	([CustomerId]>(0))
GO
ALTER TABLE [dbo].[Customer2]
CHECK CONSTRAINT [CK__Customer2__Custo__03BB8E22]
GO
ALTER TABLE [dbo].[Customer2] SET (LOCK_ESCALATION = TABLE)
GO
