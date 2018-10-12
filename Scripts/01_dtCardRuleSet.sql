
/****** Object:  Table [dbo].[dtCardRuleSet]    Script Date: 10/11/2018 1:17:41 PM ******/
IF EXISTS(SELECT object_id FROM sys.tables WHERE name = 'dtCardRuleSet' AND [type] = 'U')
DROP TABLE [dbo].[dtCardRuleSet]
GO

/****** Object:  Table [dbo].[dtCardRuleSet]    Script Date: 10/11/2018 1:17:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
CardNumberStartWith: Start with 
*/
CREATE TABLE [dbo].[dtCardRuleSet](
	[CardType] [nvarchar](20) NOT NULL,
	[CardNumberStartWith] [nvarchar](4) NOT NULL,
	[CardNumberLength] [int] NOT NULL,
	[RuleType] [nvarchar](10) NULL,
UNIQUE NONCLUSTERED 
(
	[CardNumberStartWith] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO