/* 
===================================================================================================
DDL Script: Create gold views
===================================================================================================
Script Purpose:
  This script creates views for the gold layer in the data warehouse.
  The gold layer represents the final dimension and fact tables (star schema)

  Each view performs transformations and combines data from the silver layer to provide a clean, enriched and business-ready dataset.

Usage:
  - These views can be queried directly for analytics and reporting.
===================================================================================================
*/
-- ===================================================================================================
-- Create Dimension: gold.dim_customers
-- ===================================================================================================

IF object_ID ('gold.dim_customers', 'V') is not null
  DROP VIEW gold.dim_customers;
Go
