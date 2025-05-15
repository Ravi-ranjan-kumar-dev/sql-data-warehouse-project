/*
===========================================================================
DDL Script: Create Bronze Tables
===========================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL Structure of 'bronze' Tables
===========================================================================
*/

if OBJECT_ID ('bronze.crm_cust_info', 'U') is not null
	drop table bronze.crm_cust_info;

create table bronze.crm_cust_info(
	cst_id int,
	cst_key Nvarchar(50),
	cst_firstname Nvarchar(50),
	cst_lastname Nvarchar(50),
	cst_marital_status Nvarchar(20),
	cst_gndr Nvarchar(20),
	cst_create_date date
);
if OBJECT_ID ('bronze.crm_prd_info', 'U') is not null
	drop table bronze.crm_prd_info;

create table bronze.crm_prd_info (
	prd_id int,
	prd_key Nvarchar(50),
	prd_nm Nvarchar(50),
	prd_cost int,
	prd_line Nvarchar(50),
	prd_start_dt datetime,
	prd_end_dt datetime
);
if OBJECT_ID ('bronze.crm_sales_details','U') is not null
	drop table bronze.crm_sales_details;

create table bronze.crm_sales_details(
	sls_ord_num Nvarchar(50),
	sls_prd_key Nvarchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
);
if OBJECT_ID ('bronze.erp_loc_a101', 'U') is not null 
	drop table bronze.erp_loc_a101;

create table bronze.erp_loc_a101 (
	cid Nvarchar(50),
	cntry Nvarchar(50)
);
if OBJECT_ID ('bronze.erp_cust_az12','U') is not null
	drop table bronze.erp_cust_az12;

create table bronze.erp_cust_az12 (
	cid Nvarchar(50),
	bdate date,
	gen Nvarchar(50)
);

if OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') is not null
	drop table bronze.erp_px_cat_g1v2;

create table bronze.erp_px_cat_g1v2 (
	id Nvarchar(50),
	cat Nvarchar(50),
	subcat Nvarchar(50),
	maintenance Nvarchar(50)
);


