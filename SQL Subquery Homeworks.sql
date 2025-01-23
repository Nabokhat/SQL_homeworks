---1
select * from [Inventory].Orders 
         where salesman_id=
		 (select salesman_id
		  from [Inventory].Salesman
		  where name='Paul ADAM')

---2
select * from [Inventory].Orders
         where salesman_id in
		 (select salesman_id
		 from [Inventory].Salesman
		 where city='London')
---3
select * from [Inventory].Orders
         where salesman_id=
		 (select distinct salesman_id
		 from [Inventory].Orders
		 where customer_id=3007)
---4
select * from [Inventory].Orders
         where purch_amt>
		 (select avg(purch_amt)
		 from [Inventory].Orders
		 where ord_date = '10/10/2012')
---5
select * from [Inventory].Orders
         where salesman_id in
		 (select salesman_id
		 from [Inventory].Salesman
		 where city='New York')
---6
select commission 
        from [Inventory].Salesman
		where salesman_id in
		(select salesman_id
		 from [Inventory].Customer
		 where city='Paris')
---7
select * from [Inventory].Customer
         where customer_id=
		 (select salesman_id-2001
		  from [Inventory].Salesman
		  where name='Mc Lyon')
---8
select grade, count(*)
        from [Inventory].Customer
		group by grade
		having grade>
		(select avg(grade)
		 from [Inventory].Customer
		 where city= 'New York')
---9
select * from [Inventory].Salesman
select ord_no, purch_amt,ord_date,salesman_id 
        from [Inventory].Orders
		where salesman_id in
		(select salesman_id
		 where commission =(select max(commission)
		 from [Inventory].Salesman)) 
---10
select b.*, a.cust_name
         from [Inventory].Orders b, [Inventory].Customer a
		 where a.customer_id=b.customer_id
		 and b.ord_date='2012-08-17'
---11
select salesman_id,name 
        from [Inventory].Salesman a
		where 1<
		(select count(*)
		from [Inventory].Customer
		where salesman_id=a.salesman_id)
---12
select *
       from [Inventory].Orders a
	   where purch_amt>
	   (select avg(purch_amt) from [Inventory].Orders b
	   where b.customer_id=a.customer_id)
---13
select *
       from [Inventory].Orders a
	   where purch_amt>=
	   (select avg(purch_amt) from [Inventory].Orders b
	   where b.customer_id=a.customer_id)
---14
select ord_date,
       sum(purch_amt)
       from [Inventory].Orders a
	   group by ord_date
	   having sum(purch_amt)>
      (select 1000+max(purch_amt) from [Inventory].Orders b
	   where a.ord_date=b.ord_date)
---15
select customer_id,
       cust_name,
	   city
       from [Inventory].Customer a
	   where exists
	   (select * from [Inventory].Customer
	   where city='London')
---16
select * from [Inventory].Salesman
       where salesman_id in 
	   (select distinct salesman_id
	   from [Inventory].Customer a
	   where exists (select*from [Inventory].Customer b
	   where b.salesman_id=a.salesman_id
	   and b.cust_name<>a.cust_name))
---17
select * from [Inventory].Salesman
       where salesman_id in 
	   (select distinct salesman_id
	   from [Inventory].Customer a
	   where not exists (select*from [Inventory].Customer b
	   where b.salesman_id=a.salesman_id
	   and b.cust_name<>a.cust_name))
---18
select * from [Inventory].Salesman a
       where exists
	   (select * 
	   from [Inventory].Customer b
	   where b.salesman_id=a.salesman_id
	   and 1< (select count(*)
	    from [Inventory].Orders
		where Orders.customer_id=b.customer_id))
---19
select * from [Inventory].Salesman 
          where city=any
		  (select city from [Inventory].Customer)
---20
select * from [Inventory].Salesman
        where city in (
		select city from [Inventory].Customer)
---21
select * from [Inventory].Salesman a
        where exists (
		select * from [Inventory].Customer b
		where a.name<b.cust_name)
---22
select * from [Inventory].Customer
        where grade> any 
		(select grade 
		 from [Inventory].Customer
		 where city <'New York')
---23
select * from [Inventory].Orders
        where purch_amt>any
		(select purch_amt
		 from [Inventory].Orders
		 where ord_date='2012/09/10')
---24
select * from [Inventory].Orders
         where purch_amt < any 
		 (select purch_amt
		  from [Inventory].Orders a, [Inventory].Customer b
		   where a.customer_id=b.customer_id
		   and b.city='London')
---25
select * from [Inventory].Orders
         where purch_amt<(
		 select max(purch_amt)
		 from [Inventory].Orders a, [Inventory].Customer b
		 where a.customer_id=b.customer_id
		 and b.city='London')
---26
select * from [Inventory].Customer
         where grade>all 
		 (select grade from [Inventory].Customer
		 where city ='New York')
---27
select salesman.name, salesman.city, subquery1.total_amt
        from [Inventory].Salesman,
		(select salesman_id, sum(orders.purch_amt) as total_amt from [Inventory].Orders
		group by salesman_id)
		subquery1
		where subquery1.salesman_id=Salesman.salesman_id
		and Salesman.city in (
		select distinct city from [Inventory].Customer)
---28
select * from [Inventory].Customer
        where grade <> all
		(select grade from [Inventory].Customer where city='London'
		and grade is not null)
---29
select * from [Inventory].Customer
        where grade is not null
		(select grade
		from [Inventory].Customer
		where city='Paris')
---30
select * from [Inventory].Customer
        where grade is not null
		(select grade
		from [Inventory].Customer
		where city='Dallas')

---31
create table dbo.company_mast 
select avg (pro_price) as "Average price",
         company_mast.com_name as "Company"
		 from item_mast,company_mast
		 where item_mast.pro_com=company_mast.com_id
		 group by company_mast.com_name
--------so'rash kerak
---32









