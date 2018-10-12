/****** Object:  UserDefinedFunction [dbo].[isPrime]    Script Date: 10/11/2018 10:51:44 PM ******/
IF EXISTS(SELECT * FROM sys.objects WHERE name = 'isPrime' AND [type] = 'FN')
DROP FUNCTION [dbo].[isPrime]
GO

/****** Object:  UserDefinedFunction [dbo].[isPrime]    Script Date: 10/11/2018 10:51:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Irfan Ali
-- Create date: 11-Oct-2018
-- Description:	function for getting prime number
-- =============================================
CREATE FUNCTION [dbo].[isPrime]
(
    @number INT
)
RETURNS VARCHAR(10)
BEGIN
    DECLARE @prime_or_notPrime INT
    DECLARE @counter INT
    DECLARE @retVal BIT
    SET @retVal = 0

    SET @prime_or_notPrime = 1
    SET @counter = 2

    WHILE (@counter <= @number/2 )
    BEGIN

        IF (( @number % @counter) = 0 )
        BEGIN
            set @prime_or_notPrime = 0
            BREAK
        END

        IF (@prime_or_notPrime = 1 )
        BEGIN
            SET @retVal = 1
        END

        SET @counter = @counter + 1
    END
    return @retVal
END
GO


