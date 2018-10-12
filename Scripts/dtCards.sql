USE [CardDatabase]
GO

/****** Object:  Table [dbo].[dtCards]    Script Date: 10/11/2018 3:02:31 PM ******/
IF EXISTS(SELECT object_id FROM sys.tables WHERE name = 'dtCards' AND [type] = 'U')
DROP TABLE [dbo].[dtCards]
GO

/****** Object:  Table [dbo].[dtCards]    Script Date: 10/11/2018 3:02:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dtCards](
	[CardHolder] [nvarchar](25) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[CVV] [nvarchar](3) NOT NULL,
	[ExpiryYear] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


