Create database KMS_ORDER

Create table KmsCompany(
[Row ID] INT,
[Order ID] INT,
[Order Date] DATE, 
[Order Priority] VARCHAR(50),
[Order Quantity] INT,
Sales Decimal (10,2),
Discount Decimal (10,2),
[Ship Mode] Varchar,
Profit Decimal(10,2),
[Unit Price] Decimal (10,2),
[Shipping Cost] Decimal(10,2),
[Customer Name] Varchar (max),
Province Varchar (max),
Region Varchar(max),
[Customer Segment] Varchar (max),
[Product Category] Varchar (max),
[Product Sub Category] Varchar (max),
[Product Name] Varchar (max),
[Product Container] varchar (max),
[Product Base Margin] Decimal (10,2),
[Ship Date] Date
Primary Key ([Order ID]) 
)
 

select * from KmsCompany

----Question 1
---Product Category With Highest Sales
 
 select [Product_Category], sum(Sales) as Totalsales
 from KmsCompany
 group by [Product_Category]
 Order by Totalsales desc


 -----2a

 Select top 3 Region, sum(Sales) as TotalSales
 from KmsCompany
 group by Region
 order by TotalSales desc


 Select top 3 Region, sum(Sales) as TotalSales
 from KmsCompany
 group by Region
 order by TotalSales asc

 -----3)
 Total appliance sales in Ontario


 select sum (Sales) as TotalSales
 from KmsCompany
 where [Product_Sub_Category] = 'appliances'
 and Province = 'Ontario'
 

--- 5) Shipping cost


Select top 1 Ship_Mode,
sum (Shipping_Cost) as TotalShipping_cost
from KmsCompany
group by Ship_mode
order by TotalShipping_cost  desc


-----6a) Most Valauable Customers

select top 1 (Customer_Name),
sum (Sales) as TotalSpent
from KmsCompany
group by Customer_Name
Order by TotalSpent desc


Select [Product_Category]
from KmsCompany
where  Customer_Name ='Emily Phan' 

-----7)

select * from KmsCompany
 
 select Customer_Name, sum (sales) as Totalsales 
 from KmsCompany
 where Customer_Segment = 'Small bussiness'
group by Customer_Name
 order by Totalsales desc

 -----8)

 select top 1 Customer_Name
 from KmsCompany
 where Customer_Segment = 'Corporate'
 and (Order_date) between 2009 and 2012
 group by Customer_Name
 

 -----9

 Select top 3 Customer_Name, sum(profit) As Totalprofit
 from KmsCompany
 where Customer_Name = 'Consumer' 
 group by Customer_Name
 order by Totalprofit desc

 ----- 10

 select * from Order_Status


 select KmsCompany.Customer_Name, 
        KmsCompany. Customer_Segment,
		KmsCompany. Order_ID,
		Order_Status.[Status],
		Order_Status.Order_ID
from KmsCompany
join Order_Status
on KmsCompany. Order_ID = Order_Status.Order_ID


---- 11)

select ship_mode, order_priority, sum(shipping_cost) as Cost
from KmsCompany
group by ship_mode, order_priority
order by Cost desc