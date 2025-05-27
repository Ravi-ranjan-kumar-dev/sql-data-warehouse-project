# Data Dictionary for Gold layer
## Overview
The Gold layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of dimesnsion tables and fact tables for specific business metrics.
1. gold.dim_customers
  • Purpose: Stores customer details enriched with demographic and geographic data.
  • Columns:
   
   Column Name	Data type	Description
customer_key	INT	Surrogate key uniquely identifying cach customer record in the dimension table.
customer_id	INT	Unique numerical identifier assigned to each customer.
customer_number	NVARCHAR(50)	Alphanumeric identifier representing the customer, used for tracking and referencing.
first_name	NVARCHAR(50)	The customer first name as recorded in the system.
last_name	NVARCHAR(50)	The customer’s last name or family name
country	NVARCHAR(50)	The country of residence for the customer (eg ‘India’)
marital_status	NVARCHAR(50)	The marital status of the customer (eg. ‘Married’, ‘Single’)
gender	NVARCHAR(50)	The gender of the customer (eg. ‘Male’, ‘Female’, ‘n/a’)
birthdate	DATE	The date of birth of the customer, formatted as YYYY-MM-DD (eg. 1971-10-06)
create_date	DATE	The date and time when the customer record was created in the system.


2. gold.dim_products
•	Purpose: Provides information about the products and their attributes
•	Columns:
Column Name	Data type	Description
product_key	INT	Surrogate key uniquely identifying cach product record in the product dimension table.
product_id	INT	A Unique identifier assigned to the product for internal tracking and referencing.
product_number	NVARCHAR(50)	A structured alphanumeric code representing the product, often used for categorization or inventory.
product_name	NVARCHAR(50)	Descriptive name of the product, including key details such as type, color and size.
category_id	NVARCHAR(50)	A unique identifier for the product’s category, linking to his high-level classification.
subcategory	NVARCHAR(50)	A more detailed classification of the product within the category, such as product type.
maintenance_required	NVARCHAR(50)	Indicates whether the product requires maintenance (eg. ‘Yes’, ‘No’).
cost	INT	The cost or base price of the product, measured in monetary units.
product_line	NVARCHAR(50)	The specific product line or series to which the product belongs (eg. Road, Mountain
start_date	DATE	The date when the product became available for sale or use, stored in.


3. gold.fact_sales
•	Purpose: Stores transactional sales data for analytical purposes.
•	columns:
Column Name	Data type	Description
order_number	NVARCHAR(50)	A unique alphanumeric identifier for each sales order (eg. ‘SO54496’).
product_key	INT	Surrogate key linking the order to the product dimension table.
customer_key	INT	Surrogate key linking the order to the customer dimension table.
order_date	DATE	The date when the order was placed.
shipping_date	DATE	The date when the order was shipped to the customer.
due_date	DATE	The date when the order payment was due.
sales_amount	INT	The total monetary value of the sale for the line item, in whole currency units(eg. 25).
quantity	INT	The number of the units of the prouduct ordered for the line item( eg. 1).
price	INT	The price per unit of the product for the line item, in whole currency units(eg. 25).
		
