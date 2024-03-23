create database grocery;
use grocery;

create table customers (
    customer_id int primary key,
    name varchar(255) not null,
    email varchar(255) unique not null,
    address varchar(255),
    phone_number numeric(10) not null
);

insert into customers (customer_id, name, email, address, phone_number)
values 
(1, 'Ramesh Kumar', 'ramesh@gmail.com', '123, ABC Street, Delhi', '9738291247'),
(2, 'Priya Sharma', 'priya@gmail.com', '456, XYZ Road, Mumbai', '9637193741'),
(3, 'Amit Singh', 'amit@gmail.com', '789, PQR Colony, Bangalore', '8463829123'),
(4, 'Sneha Gupta', 'sneha@gmail.com', '101, LMN Avenue, Kolkata', '9453185632'),
(5, 'Rajesh Patel', 'rajesh@gmail.com', '246, EFG Street, Chennai', '8622348946'),
(6, 'Suresh Verma', 'suresh@gmail.com', '789, LMN Road, Delhi', '9012345678'),
(7, 'Anita Singh', 'anita@gmail.com', '654, UVW Colony, Mumbai', '8901234567'),
(8, 'Vijay Kumar', 'vijay@gmail.com', '321, GHI Street, Bangalore', '7890123456'),
(9, 'Neetu Sharma', 'neetu@gmail.com', '555, DEF Avenue, Kolkata', '6789012345'),
(10, 'Manish Gupta', 'manish@gmail.com', '888, XYZ Road, Chennai', '5678901234');

select * from customers;

create table categories (
    category_id int primary key,
    name varchar(255) not null,
    description text,
    status varchar(50) default 'Active'
);

insert into categories (category_id, name, description, status)
values
(11, 'Grains', 'Includes rice, lentils, etc.', 'Active'),
(12, 'Spices', 'Various spices and seasonings', 'Active'),
(13, 'Beverages', 'Includes tea, coffee, etc.', 'Active'),
(14, 'Cooking Oil', 'Different types of cooking oils', 'Active'),
(15, 'Snacks', 'Assorted snack items', 'Active'),
(16, 'Dairy', 'Includes milk, cheese, etc.', 'Active'),
(17, 'Fruits', 'Fresh fruits', 'Active'),
(18, 'Vegetables', 'Fresh vegetables', 'Active'),
(19, 'Meat', 'Different types of meat', 'Active'),
(20, 'Frozen Foods', 'Frozen food items', 'Active');

select * from categories;

create table products (
    product_id int primary key,
    category_id int,
    name varchar(255) not null,
    description text,
    price decimal(10, 2) not null,
    stock_quantity int not null,
    foreign key (category_id) references categories(category_id)
);

insert into products (product_id, category_id, name, description, price, stock_quantity)
values
(21, 11, 'Basmati Rice', 'Premium quality basmati rice', 300.00, 100),
(22, 11, 'Masoor Dal', 'High-protein lentils', 80.00, 150),
(23, 15, 'Chips', 'Delicious potato chips', 50.00, 200),
(24, 14, 'Sunflower Oil', 'Refined sunflower cooking oil', 150.00, 75),
(25, 13, 'Green Tea', 'Organic green tea leaves', 200.00, 120),
(26, 11, 'Brown Rice', 'Healthy brown rice', 250.00, 80),
(27, 12, 'Black Pepper', 'Premium quality black pepper', 100.00, 120),
(28, 15, 'Popcorn', 'Classic popcorn', 70.00, 180),
(29, 14, 'Olive Oil', 'Extra virgin olive oil', 200.00, 90),
(30, 13, 'Orange Juice', 'Freshly squeezed orange juice', 120.00, 100);

select * from products;

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10, 2) not null,
    status varchar(50) default 'Pending',
    foreign key (customer_id) references customers(customer_id)
);

insert into orders (order_id, customer_id, order_date, total_amount, status)
values
(31, 1, '2023-03-07', 350.00, 'Confirmed'),
(32, 2, '2022-02-15', 400.00, 'Pending'),
(33, 3, '2021-07-21', 250.00, 'Pending'),
(34, 4, '2024-01-03', 180.00, 'Confirmed'),
(35, 5, '2023-06-19', 500.00, 'Shipped'),
(36, 6, '2023-04-15', 280.00, 'Confirmed'),
(37, 7, '2022-05-20', 450.00, 'Pending'),
(38, 8, '2021-06-25', 320.00, 'Pending'),
(39, 9, '2024-07-30', 200.00, 'Confirmed'),
(40, 10, '2023-08-05', 180.00, 'Shipped');

select * from orders;

create table reviews (
    review_id int primary key,
    product_id int,
    customer_id int,
    rating int check (rating between 1 and 5),
    comment text,
    foreign key (product_id) references products(product_id),
    foreign key (customer_id) references customers(customer_id)
);

insert into reviews (review_id, product_id, customer_id, rating, comment)
values
(41, 21, 1, 5, 'Excellent quality rice!'),
(42, 22, 2, 4, 'Good taste, reasonable price'),
(43, 23, 3, 3, 'Average quality'),
(44, 24, 4, 5, 'Highly satisfied!'),
(45, 25, 5, 2, 'Expected better quality'),
(46, 26, 6, 4, 'Great taste, worth buying!'),
(47, 27, 7, 5, 'Excellent quality pepper'),
(48, 28, 8, 3, 'Decent popcorn, but could be better'),
(49, 29, 9, 5, 'Love the taste of olive oil'),
(50, 30, 10, 4, 'Fresh and delicious orange juice');

select * from reviews;

create table payments (
    payment_id int primary key,
    order_id int,
    payment_date date,
    payment_method varchar(100),
    amount decimal(10, 2) not null,
    foreign key (order_id) references orders(order_id)
);

insert into payments (payment_id, order_id, payment_date, payment_method, amount)
values
(51, 31, '2023-03-07', 'Credit Card', 350.00),
(52, 32, '2022-02-15', 'Cash On Delivery', 400.00),
(53, 33, '2021-07-21', 'Credit Card', 250.00),
(54, 34, '2024-01-03', 'Net Banking', 180.00),
(55, 35, '2023-06-19', 'UPI', 500.00),
(56, 36, '2023-04-15', 'Debit Card', 280.00),
(57, 37, '2022-05-20', 'Cash On Delivery', 450.00),
(58, 38, '2021-06-25', 'Credit Card', 320.00),
(59, 39, '2024-07-30', 'UPI', 200.00),
(60, 40, '2023-08-05', 'Net Banking', 180.00);

select * from payments;

create table shipping (
    shipping_id int primary key,
    order_id int,
    shipping_date date,
    shipping_address varchar(255),
    status varchar(50) default 'Pending',
    foreign key (order_id) references orders(order_id)
);

insert into shipping (shipping_id, order_id, shipping_date, shipping_address, status)
values
(61, 31, '2023-03-14', '123, ABC Street, Delhi', 'Confirmed'),
(62, 32, '2022-02-22', '456, XYZ Road, Mumbai', 'Pending'),
(63, 33, '2021-07-28', '789, PQR Colony, Bangalore', 'Pending'),
(64, 34, '2024-01-10', '101, LMN Avenue, Kolkata', 'Confirmed'),
(65, 35, '2023-06-19', '246, EFG Street, Chennai', 'Shipped'),
(66, 36, '2023-04-20', '789, LMN Road, Delhi', 'Confirmed'),
(67, 37, '2022-05-25', '654, UVW Colony, Mumbai', 'Pending'),
(68, 38, '2021-07-01', '321, GHI Street, Bangalore', 'Pending'),
(69, 39, '2024-08-05', '555, DEF Avenue, Kolkata', 'Confirmed'),
(70, 40, '2023-08-10', '888, XYZ Road, Chennai', 'Shipped');

select * from shipping;

create table admins (
    admin_id int primary key,
    username varchar(100) unique not null,
    password varchar(255) not null,
    email varchar(255) unique not null,
    role varchar(50) default 'Admin'
);

insert into admins (admin_id, username, password, email, role)
values
(71, 'admin1', 'password1', 'admin1@gmail.com', 'Admin'),
(72, 'admin2', 'password2', 'admin2@gmail.com', 'Admin'),
(73, 'admin3', 'password3', 'admin3@gmail.com', 'Admin'),
(74, 'admin4', 'password4', 'admin4@gmail.com', 'Admin'),
(75, 'admin5', 'password5', 'admin5@gmail.com', 'Admin'),
(76, 'admin6', 'password6', 'admin6@gmail.com', 'Admin'),
(77, 'admin7', 'password7', 'admin7@gmail.com', 'Admin'),
(78, 'admin8', 'password8', 'admin8@gmail.com', 'Admin'),
(79, 'admin9', 'password9', 'admin9@gmail.com', 'Admin'),
(80, 'admin10', 'password10', 'admin10@gmail.com', 'Admin');

select * from admins;

create table inventory (
    product_id int primary key,
    warehouse_id int,
    quantity int not null,
    last_stocked_date date,
    status varchar(50) default 'Active',
    foreign key (product_id) references products(product_id)
);

insert into inventory (product_id, warehouse_id, quantity, last_stocked_date, status)
values
(21, 1, 100, '2021-10-20', 'Active'),
(22, 1, 150, '2021-12-21', 'Active'),
(23, 2, 50, '2021-10-19', 'Active'),
(24, 2, 75, '2021-11-20', 'Active'),
(25, 3, 100, '2021-12-21', 'Active'),
(26, 3, 120, '2021-10-19', 'Active'),
(27, 1, 80, '2021-11-20', 'Active'),
(28, 2, 100, '2021-12-21', 'Active'),
(29, 3, 60, '2021-11-20', 'Active'),
(30, 1, 70, '2021-10-19', 'Active');

select * from inventory;

create table sellers (
    seller_id int primary key,
    name varchar(255) not null,
    email varchar(255) unique not null,
    phone_number varchar(20),
    address varchar(255)
);

insert into sellers (seller_id, name, email, phone_number, address)
values
(101, 'Sri Krishna Stores', 'srikrishna@gmail.com', '9738294651', '246, EFG Street, Chennai'),
(102, 'Gupta Brothers Supermart', 'guptabrothers@gmail.com', '9749928329', '789, GHI Road, Hyderabad'),
(103, 'Rajeshwari Enterprises', 'rajeshwari@gmail.com', '8928401923', '321, JKL Colony, Pune'),
(104, 'Ganesh Provision Store', 'ganeshprovision@gmail.com', '9862493175', '555, MNO Street, Jaipur'),
(105, 'Chennai Grocers', 'chennaigrocers@gmail.com', '8479652318', '777, RST Road, Ahmedabad'),
(106, 'Harish Enterprises', 'harishenterprises@gmail.com', '9456783210', '333, UVW Road, Delhi'),
(107, 'Sharma Provision Store', 'sharmaprovisions@gmail.com', '8345678901', '888, XYZ Street, Mumbai'),
(108, 'Singh Supermarket', 'singhsupermarket@gmail.com', '7234567890', '222, PQR Colony, Bangalore'),
(109, 'Verma General Store', 'vermageneral@gmail.com', '6123456789', '999, ABC Avenue, Kolkata'),
(110, 'Patel Mart', 'patelmart@gmail.com', '5012345678', '777, GHI Road, Chennai');

select * from sellers;

-- Select Queries (Along with Views and Transactions)

-- Query 1: Selecting customers with the customer id as 1,3,5,7 
select * from customers where customer_id in (1,3,5,7);

-- Query 2: Selecting orders with a total amount greater than 300
select * from orders where total_amount > 300;

-- Query 3: Selecting products with names starting with 'B'
select * from products where name like 'B%';

-- Query 4: Selecting payments made via Credit Card or Net Banking
select * from payments where payment_method = 'Credit Card' or payment_method = 'Net Banking';

-- Query 5: Selecting reviews with ratings between 2 and 4
select * from reviews where rating between 2 and 4;

-- Query 6: Selecting customers with total order amounts greater than 300 
-- and ordering by the total amount spent (descending)
select customer_id, sum(total_amount) as total_spent 
from orders 
group by customer_id 
having sum(total_amount) > 300
order by total_spent desc;

-- Query 7: Selecting products with average ratings greater than or equal to 4
select product_id, avg(rating) as 'Average Rating' 
from reviews 
group by product_id 
having avg(rating) >= 4;

-- Query 8: Selecting categories and their respective counts of products
select category_id, count(product_id) as 'Number of Products' 
from products 
group by category_id;

-- Query 9: Retrieving the products along with their categories
select p.name as product_name, c.name as category_name
from products p
inner join categories c on p.category_id = c.category_id;

-- Query 10: Calculating the Average, Maximum, and Minimum prices of products
select avg(price) as 'Average Price', max(price) as 'Maximum Price', 
min(price) as 'Minimum Price' from products;

-- Query 11: Left join between customers and orders to display all customers along with their order count
select c.*, count(o.order_id) as 'Number of Orders' 
from customers c 
left join orders o on c.customer_id = o.customer_id 
group by c.customer_id;

-- Query 12: Right join between customers and orders to display customers along with their order details 
-- with status as Confirmed or Pending and ordering by customer name (ascending)
select c.*, o.order_id, o.order_date, o.total_amount, o.status
from customers c
right join orders o on c.customer_id = o.customer_id
where o.status = 'Confirmed' or o.status = 'Shipped'
order by c.name asc;

-- Query 13: Full join between orders and shipping to display all orders along with their shipping details
select o.*, s.shipping_id, s.shipping_date, s.shipping_address
from orders o
join shipping s on o.order_id = s.order_id;

-- Query 14: Retrieving all unique email addresses from customers and admins tables
select email from customers
union
select email from admins;

-- Query 15: Selecting customers who have placed orders with total amounts 
-- greater than the average total amount of all orders
select * from customers 
where customer_id in (
    select customer_id 
    from orders 
    where total_amount > (
		select avg(total_amount) 
        from orders
    )
);

-- Query 16: Selecting orders made by customers whose names contain 'Singh'
select * from orders 
where customer_id in (
    select customer_id 
    from customers 
    where name like '%Singh%'
);

-- Query 17: Selecting products with quantities less than the average quantity in the inventory
select * from products 
where stock_quantity < (
	select avg(quantity) 
    from inventory
);

-- Query 18: View - Total revenue generated from orders
create view total_revenue as
select sum(total_amount) as revenue from orders;

select * from total_revenue;

-- Query 19: View - List of products with stock quantities less than 110
create view low_stock_products as
select * from products where stock_quantity < 110;

select * from low_stock_products;

-- Query 20: Using Transaction to insert into customers and orders
start transaction;

insert into customers (customer_id, name, email, address, phone_number)
values (11, 'Sanjay Kumar', 'sanjay@gmail.com', '456 PQR Avenue, Mumbai', '9643012891');

insert into orders (order_id, customer_id, order_date, total_amount, status)
values (41, 6, '2023-08-25', 150.00, 'Pending');

commit;

select * from customers;
select * from orders;
