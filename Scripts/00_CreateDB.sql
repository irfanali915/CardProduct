
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'CardDatabase')
CREATE DATABASE [CardDatabase]