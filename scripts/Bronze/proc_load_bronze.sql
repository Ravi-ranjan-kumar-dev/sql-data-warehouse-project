/*
===============================================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external csv files.
    it performs the following actions:
    - Truncates the bronze tables before loading data.
    - Use the 'Bulk Insert' command to load data from csv files to bronze tables.
Parameters:
    None.
  This stored procedure does not accept any parameters or return any values.
Usage Examples:
   Exec bronze.load_bronze;
=================================================================================================================
*/

create or alter procedure bronze.load_bronze as
Begin
	Declare @start_time Datetime, @End_time Datetime, @batch_start_time Datetime, @batch_end_time datetime;
	Begin try
		set @batch_start_time = Getdate();
		print '============================================';
		print 'Loading Bronze Layer';
		print '============================================';

		print '--------------------------------------------';
		print 'Loading CRM Tables';
		print '--------------------------------------------';

		Set @start_time = GETDATE();
		print 'Truncating table: bronze.crm_cust_info';
		Truncate table bronze.crm_cust_info;

		print '>> Inserting Data Into: bronze.crm_cust_info';
		Bulk insert bronze.crm_cust_info
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';


		Set @start_time = GETDATE();
		print 'Truncating table: bronze.crm_prd_info';
		Truncate table bronze.crm_prd_info;

		print '>> Inserting Data Into: bronze.crm_prd_info';
		Bulk insert bronze.crm_prd_info
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';

		Set @start_time = GETDATE();
		print 'Truncating table: bronze.crm_sales_details';
		Truncate table bronze.crm_sales_details;
		print '>> Inserting Data into: bronze.crm_sales_details';
		Bulk insert bronze.crm_sales_details
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';

		print '--------------------------------------------';
		print 'Loading ERP Tables';
		print '--------------------------------------------';

		Set @start_time = GETDATE();
		print '>> Truncating table: bronze.erp_cust_az12';
		Truncate table bronze.erp_cust_az12;
		print '>> Inserting Data into:bronze.erp_cust_az12';
		Bulk insert bronze.erp_cust_az12
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';

		Set @start_time = GETDATE();
		print '>> Truncating table: bronze.erp_loc_a101';
		Truncate table bronze.erp_loc_a101;
		print '>> Inserting Data into: bronze.erp_loc_a101';
		Bulk insert bronze.erp_loc_a101
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';

		Set @start_time = GETDATE();
		print '>> Truncation table:bronze.erp_px_cat_g1v2';
		Truncate table bronze.erp_px_cat_g1v2;
		print '>> Inserting Data into:bronze.erp_px_cat_g1v2';
		Bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\donra\OneDrive\Desktop\Coding with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		Set @End_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(Second, @Start_time, @End_time) as Nvarchar) + ' Seconds';
		Print '>>----------------------------------------------';

		Set @batch_end_time = Getdate();
		Print '===========================================';
		Print 'Loading Bronze layer is completed'
		Print '   -Total load duration:' + cast(datediff(second, @batch_start_time, @batch_end_time) as Nvarchar)+' seconds';
		Print '===========================================';
	End try
	Begin Catch
		Print '===============================================';
		print 'Error occured during loading Broze layer';
		print 'Error message' + Error_message();
		print 'Error message' + cast(Error_number() as Nvarchar);
		print 'Error message' + cast(Error_state() as Nvarchar);
		Print '===============================================';
	End Catch
End
