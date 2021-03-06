USE [CardDatabase]
GO
/****** Object:  StoredProcedure [dbo].[ppValidateCard]    Script Date: 10/11/2018 1:47:56 PM ******/
IF EXISTS(SELECT object_id FROM sys.objects WHERE name = 'ppValidateCard' AND [type] = 'P')
DROP PROCEDURE [dbo].[ppValidateCard]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Irfan Ali
-- Create date: 11-Oct-2018
-- Description:	Credit card validation
-- =============================================
CREATE PROCEDURE [dbo].[ppValidateCard]
	@cardNumber NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @cardType NVARCHAR(20)
	DECLARE @ruleType NVARCHAR(20)
	DECLARE @Year INT

	SELECT @cardType = CardType, @ruleType = RuleType FROM dvCreditRuleSet WHERE LEN(@cardNumber) = CardNumberLength AND CHARINDEX(CardNumberStartWith, @cardNumber) = 1
	IF @cardType IS NOT NULL
	BEGIN
		SELECT @Year = ExpiryYear FROM dvCards WHERE Number = @cardNumber
		IF @Year IS NOT NULL
		BEGIN
			IF @ruleType IS NULL
				SELECT @cardType CardType,  'Valid' [Status]
			ELSE IF @ruleType = 'Leap'
			BEGIN
				IF @Year % 4 = 0
				SELECT @cardType CardType,  'Valid' [Status]
				ELSE
				SELECT @cardType CardType,  'InValid' [Status]
			END
			ELSE IF @ruleType = 'Prime'
			BEGIN
				IF dbo.isPrime(@Year) = 1
				SELECT @cardType CardType,  'Valid' [Status]
				ELSE
				SELECT @cardType CardType,  'InValid' [Status]
			END
			ELSE
				SELECT @cardType CardType,  'InValid' [Status]
		END
		ELSE
			SELECT @cardType CardType,  'Does not exist' [Status]
	END
	ELSE
		SELECT @cardType CardType,  'Unknown' [Status]
END