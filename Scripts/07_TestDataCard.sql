-- Create test data for rule sets

DECLARE @testCardRule TABLE ([CardType] [nvarchar](20) NOT NULL,
	[CardNumberStartWith] [nvarchar](4) NOT NULL,
	[CardNumberLength] [int] NOT NULL,
	[RuleType] [nvarchar](10) NULL)

INSERT INTO @testCardRule VALUES
 ('Visa', '4', 16, 'Leap')
,('MasterCard', '5', 16, 'Prime')
,('Amex', '34', 15, NULL)
,('Amex', '37', 15, NULL)


DECLARE @jcbStart int = 3528
DECLARE @jcbEnd int = 3589
WHILE(@jcbStart <= @jcbEnd)
BEGIN
INSERT INTO @testCardRule VALUES
('JCB', CONVERT(NCHAR(5), @jcbStart), 16, NULL)

SET @jcbStart =  @jcbStart + 1
END

--SELECT * FROM @testCardRule


MERGE dtCardRuleSet t 
USING(SELECT * FROM @testCardRule) q
ON (t.CardType = q.CardType AND t.CardNumberStartWith = q.CardNumberStartWith)
WHEN MATCHED AND t.CardNumberLength <> q.CardNumberLength THEN UPDATE SET t.CardNumberLength = q.CardNumberLength
WHEN NOT MATCHED THEN INSERT VALUES (q.CardType, q.CardNumberStartWith, q.CardNumberLength, q.RuleType);

--SELECT * FROM dtCardRuleSet

--TRUNCATE TABLE dtCardRuleSet


GO

-- Create test data of Cards

DECLARE @Cards TABLE ([CardHolder] [nvarchar](25) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[CVV] [nvarchar](3) NOT NULL,
	[ExpiryYear] [int] NOT NULL)


INSERT INTO @Cards VALUES
 ('Card holder name 1', '4674532890672451', '123', 2020)
,('Card holder name 1', '5674532890672452', '123', 2021)
,('Card holder name 3', '5674532890672451', '123', 2022)


MERGE dtCards t 
USING(SELECT * FROM @Cards) q
ON (t.Number = q.Number)
WHEN MATCHED AND t.CardHolder <> q.CardHolder THEN UPDATE SET t.CardHolder = q.CardHolder
WHEN NOT MATCHED THEN INSERT VALUES (q.CardHolder, q.Number, q.CVV, q.ExpiryYear);

--SELECT * FROM dtCards
--TRUNCATE TABLE dtCards