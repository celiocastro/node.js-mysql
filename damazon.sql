DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;
USE bamazon;

CREATE TABLE products(
	item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(100),
    department_name VARCHAR(100),
    price INTEGER(10),
    stock_quantity INTEGER(10),
    PRIMARY KEY (item_id)
    );
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (1, 'Samsung Galaxy 8', 'Electronics', 800, 3000);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (2, 'iphopeX', 'Electronics', 1000, 5000);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (3, 'iPad', 'Electronics', 500, 1500);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (4, 'iWatch', 'Wearables', 300, 2500);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (5, 'fitbit', 'Wearables', 800, 3000);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (6, 'Amazon echo', 'Electronics', 50, 2000);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (7, ' HP Printer', 'Office', 800, 3000);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (8, 'Fan ', 'Home', 150, 800);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (9, 'Air Conditioner GE', 'Home', 300, 700);
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity) values (10, 'Backpack', 'Travel', 150, 400);
