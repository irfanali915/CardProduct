
/****** Object:  View [dbo].[dvCards] Script Date: 10/11/2018 1:32:01 PM ******/
IF EXISTS(SELECT object_id FROM sys.views WHERE name = 'dvCards')
DROP VIEW [dbo].[dvCards]
GO
/****** Object:  View [dbo].[dvCards]    Script Date: 10/11/2018 3:09:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[dvCards]
AS
SELECT        *
FROM            dbo.dtCards
GO


