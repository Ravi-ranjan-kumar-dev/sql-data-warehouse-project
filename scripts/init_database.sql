/*
==============================================================================
Create Database and Schemas
==============================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  if the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
  within the database: 'bronze', 'silver', 'gold'.

Warning:
  Running the script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution and 
  ensure you have proper backups before running this script.
*/

use master;
Go
-- Drop and recreate database 
If Exists (select 1 from sys.database where name = 'DataWarehouse')
Begin
	Alter Database DataWarehouse set SINGLE_USER WITH ROLLBACK IMMEDIATE;
	Drop Database DataWarehouse;
End;

create database DataWarehouse;
Go

use DataWarehouse;
Go
Create Schema bronze;
Go
Create schema silver;
Go
create schema Gold;
Go

