/****** Object:  View [dbo].[dvCreditRuleSet]    Script Date: 10/11/2018 1:32:01 PM ******/
IF EXISTS(SELECT object_id FROM sys.views WHERE name = 'dvCreditRuleSet')
DROP VIEW [dbo].[dvCreditRuleSet]
GO

/****** Object:  View [dbo].[dvCreditRuleSet]    Script Date: 10/11/2018 1:32:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Object:  View [dbo].[dvCreditRuleSet]    Script Date: 10/11/2018 12:32:20 PM ******/

CREATE VIEW [dbo].[dvCreditRuleSet]
AS
SELECT * FROM dbo.dtCardRuleSet

GO