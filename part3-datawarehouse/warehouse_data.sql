INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false);

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop','Electronics','Computers',65000),
('P002','Smartphone','Electronics','Mobiles',45000),
('P003','Headphones','Electronics','Audio',3000),
('P004','TV','Electronics','Home',55000),
('P005','Monitor','Electronics','Accessories',12000),

('P006','Jeans','Fashion','Clothing',2500),
('P007','T-Shirt','Fashion','Clothing',1200),
('P008','Sneakers','Fashion','Footwear',5000),
('P009','Jacket','Fashion','Outerwear',7000),
('P010','Dress','Fashion','Womenswear',4500),

('P011','Rice','Groceries','Food',120),
('P012','Oil','Groceries','Food',180),
('P013','Milk','Groceries','Dairy',60),
('P014','Snacks','Groceries','Packaged',90),
('P015','Fruits','Groceries','Fresh',200);

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Mumbai','Maharashtra','Retail'),
('C002','Anita Verma','Delhi','Delhi','Retail'),
('C003','John Doe','Mumbai','Maharashtra','Corporate'),
('C004','Sneha Patel','Ahmedabad','Gujarat','Retail'),
('C005','Ravi Kumar','Bangalore','Karnataka','Corporate'),
('C006','Meera Iyer','Chennai','Tamil Nadu','Retail'),
('C007','Amit Singh','Delhi','Delhi','Retail'),
('C008','Neha Joshi','Pune','Maharashtra','Corporate'),
('C009','Arjun Rao','Bangalore','Karnataka','Retail'),
('C010','Pooja Shah','Ahmedabad','Gujarat','Retail'),
('C011','Suresh Nair','Chennai','Tamil Nadu','Corporate'),
('C012','Kavya Mehta','Mumbai','Maharashtra','Retail');

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240106,1,1,1,65000,0,65000),
(20240107,2,2,2,45000,5000,85000),
(20240110,3,3,3,3000,0,9000),
(20240203,4,4,1,55000,5000,50000),
(20240204,5,5,2,12000,0,24000),
(20240203,6,6,3,2500,0,7500),
(20240204,7,7,2,1200,0,2400),
(20240106,8,8,1,5000,0,5000),
(20240107,9,9,1,7000,1000,6000),
(20240203,10,10,2,4500,0,9000);
