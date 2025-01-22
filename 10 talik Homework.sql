----10 talik HOMEWORK
-----------1
select salesman_id,name,city, '%' as Percentage,commission*100 as qnty
       from  [Inventory].[Salesman]
----------2
select 'For' as A_column, ord_date, 'there are' as B_column, count(ord_no), 'orders' as C_column
       from [Inventory].[Orders]
	   group by ord_date
----------3
select *from [Inventory].[Orders] order by ord_no
----------4
select *from [Inventory].[Orders] order by ord_date desc
----------5
select *from [Inventory].[Orders] 
       order by ord_date, purch_amt desc 
----------6
select cust_name, city, grade
       from [Inventory].[Customer] 
----------7
select 
       salesman_id, ord_date, MAX (purch_amt)
	   from [Inventory].[Orders] 
	   group by salesman_id,ord_date
	   order by salesman_id, ord_date                
	   -------(need to ask)
-----------8
select cust_name,city, grade 
        from [Inventory].[Customer]
		order by 3 desc; 
		------(need to ask)
-----------9
select customer_id, Count(distinct ord_no), Max(purch_amt)
        from [Inventory].[Orders] 
		group by customer_id
		order by 2 desc
-----------10
select ord_date, sum(purch_amt), sum(purch_amt)*0.15
        from [Inventory].[Orders]
		group by ord_date
		order by ord_date
		 


		 
       