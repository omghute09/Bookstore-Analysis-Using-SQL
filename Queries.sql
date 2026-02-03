create database prj;
use prj;
select * from books;
select * from orders;
select * from customers;


-- waq to display all books of genre fiction
select * from books where Genre="fiction"; 

-- waq to display all books published after 1950
select * from books where Published_Year>1950; 

-- waq to display all customer from canada country
select * from customers where country="Canada";

-- waq to display orders placed in november 2023
select * from orders where order_date between '2023-11-01' and '2023-11-30';

-- retrive total stock of books available
select sum(stock) as total_stocks from books;

-- most expencive book
select * from books order by price desc limit 1;

-- waq to display all customer who oder book quantity more thann 1
select * from orders where quantity>1;

-- waq to display orders where total amount is $20
select * from orders where total_amount>20;

-- list all the genre from book  tables uniques
select distinct genre from books;

-- lowest stock available
select * from books order by stock limit 1;

-- find total revenue from all orders
select sum(total_amount) as revenue from orders;


-- number of books solds per genre
select genre,sum(quantity) from orders join books on books.book_id=orders.book_id group by genre;

-- avg price of book in genre=fantasy
select avg(price) from books where genre="Fantasy";

select customer_id, count(order_id) from orders group by customer_id having count(order_id) >=2;

-- most frequent ordered book
select books.book_id ,books.title,count(order_id) as total from orders join books on orders.book_id=books.book_id group by books.book_id,books.title order by total desc limit 1;


-- total quantity sold by each author
select author,sum(quantity)as qt from books join orders on books.book_id=orders.book_id group by author order by qt desc ;
select * from orders;
select * from customers;
select * from books;

-- list distinct cities where customers who spent over 30 
select distinct city,total_amount from customers join orders on customers.Customer_ID=orders.Customer_ID where Total_Amount>30 order by total_amount asc;

-- find customer who spent most on orders
select name, sum(total_amount) as spent from customers join orders on customers.Customer_ID=orders.Customer_ID group by name order by spent desc limit 1; 


