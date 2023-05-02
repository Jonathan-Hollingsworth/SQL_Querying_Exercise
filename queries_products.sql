-- Adding the chair, stool, and table --
 INSERT INTO products (name, price, can_be_returned)
 VALUES ('chair', 44.00, false),
 ('stool', 25.99, true),
 ('table', 124.00, false);

 -- Displaying all rows and columns --
 SELECT * FROM products;

 -- Displaying the names of all products --
 SELECT name FROM products;

 -- Displaying the names and prices of all products --
 SELECT name, price FROM products;

 -- Adding a fourth product --
 INSERT INTO products (name, price, can_be_returned)
 VALUES ('lava lamp', 29.99, true);

 -- Displaying all products that can be returned --
 SELECT * FROM products
 WHERE can_be_returned;

 -- Displaying all products that cost less than $44.00 --
 SELECT * FROM products
 WHERE price < 44.00;

 -- Displaying all products with a price between $22.50 and $99.99 --
 SELECT * FROM products
 WHERE price BETWEEN 22.50 AND 99.99;

 -- Reducing the price of everything by $20 --
 UPDATE products SET price = price - 20;

 -- Removing all products with a price less than $25 (using updated prices) --
 DELETE FROM products WHERE price < 25;

 -- Increasing the price of all remaining products by $20 --
 UPDATE products SET price = price + 20;

 -- Allowing all products to be returnable --
 UPDATE products SET can_be_returned = true;