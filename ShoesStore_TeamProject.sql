--DROP TABLE
DROP TABLE comm_customers CASCADE CONSTRAINTS;
DROP TABLE comm_products CASCADE CONSTRAINTS;
DROP TABLE comm_shipping_details CASCADE CONSTRAINTS;
DROP TABLE comm_order_details CASCADE CONSTRAINTS;
DROP TABLE comm_shopping_cart CASCADE CONSTRAINTS;
DROP TABLE comm_promotion CASCADE CONSTRAINTS;

--DROP SEQUENCE
DROP SEQUENCE seq_comm_customers;
DROP SEQUENCE seq_comm_shopping_cart;
DROP SEQUENCE seq_comm_shipping_details;
DROP SEQUENCE seq_comm_order_details;
DROP SEQUENCE seq_comm_products;

-- DROP INDEXES
DROP INDEX index_customer_contact;
DROP INDEX index_product_name;
DROP INDEX index_cart_status;

--CREATE TABLE comm_customers
Create table comm_customers( 
    customer_id NUMBER(4) NOT NULL,
    customer_email VARCHAR2(50) NOT NULL, 
    customer_fname VARCHAR2(50) NOT NULL,
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_address VARCHAR2(50) NOT NULL,
    customer_phone_number VARCHAR2(10) NOT NULL, 
    customer_gender VARCHAR2(10) NOT NULL,
    customer_billing_address VARCHAR2(50),
primary key (customer_id));

-- CREATE TABLE comm_products
CREATE TABLE comm_products (
   product_id NUMBER(3) NOT NULL, 
   product_name VARCHAR(50) NOT NULL, 
   product_price NUMBER(6,2) NOT NULL, 
   product_quantity NUMBER(3) NOT NULL, 
   product_size NUMBER(2) NOT NULL, 
   product_descriptions VARCHAR(50) NOT NULL, 
   product_category VARCHAR(50) NOT NULL, 
   product_color VARCHAR(50) NOT NULL, 
   product_release_date date DEFAULT SYSDATE, 
   product_thumbnail varchar2(200) NOT NULL,
   primary key(product_id)
);

-- CREATE TABLE comm_shopping_cart
CREATE TABLE comm_shopping_cart (
    cart_number NUMBER(4) NOT NULL, 
    order_date date DEFAULT SYSDATE,
    customer_id NUMBER(4) NOT NULL,
    status varchar2(40) NOT NULL, 
primary key (cart_number), 
foreign key (customer_id) references comm_customers(customer_id));

-- CREATE TABLE comm_shipping_details
CREATE TABLE comm_shipping_details (
   shipment_number NUMBER(4) NOT NULL, 
   cart_number NUMBER(4) NOT NULL, 
   status varchar2(40) not null,
   delivery_date date NOT NULL, 
primary key(shipment_number), 
FOREIGN KEY (cart_number) REFERENCES comm_shopping_cart(cart_number)
);

-- CREATE TABLE comm_order_details
CREATE TABLE comm_order_details(  
    order_id NUMBER(4) NOT NULL,
    product_id NUMBER(4) NOT NULL,
    order_date date NOT NULL, 
    quantity NUMBER(3) NOT NULL, 
    quantity_price NUMBER(6,2) NOT NULL,
    cart_number NUMBER(4) NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (product_id) REFERENCES comm_products(product_id),
FOREIGN KEY (cart_number) REFERENCES comm_shopping_cart(cart_number));

--CREATE TABLE comm_promotion
CREATE TABLE comm_promotion (
  product_id NUMBER NOT NULL,
  shipment_discount CHAR(1) DEFAULT 'N',
  product_discount_rate NUMBER(5,2) DEFAULT 1,
  PRIMARY KEY (product_id),
  FOREIGN KEY (product_id) REFERENCES comm_products(product_id)
);


--INSERT data comm_customers starting from 1000 and increment by 1
CREATE SEQUENCE seq_comm_customers START WITH 1000 INCREMENT BY 1;
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'john@email.com', 'John', 'Doe', '123 ABC St','4572431923', 'Male', '321 HJK Rd'); --1000
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'AA@gmail.com', 'Aaron', 'Paul', '33 Empress Ave','6475952536', 'Male',null );
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'cc212@gmail.com', 'Karen', 'Pierce', '1323 Yonge St','4165855487', 'Female','777 Bill St' ); 
INSERT INTO comm_customers values (seq_comm_customers.nextval, '12fe2r@yahoo.com', 'Milko', 'Wohranski', '112 Nipigon Ave' ,'4375885214', 'Male',null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'ggg3d3@gmail.com', 'Milva', 'Kierenscovic', '403 Church St','6479011188', 'Female', '404 Happy Rd');
INSERT INTO comm_customers values (seq_comm_customers.nextval, '44erdr3@gmail.com', 'Bryan', 'Cranston', '144 Pleasent Cr','4164607786', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'j9lasq@gmail.com', 'Alice', 'Wood', '144 Pleasent Cr','4163912166', 'Female', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'dsa091@yahoo.com', 'Bob', 'Lee', '90 Apple Rd','4323456789', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'cnsd913@gmail.com', 'Marco', 'Grey', '1697 Maple Cr','6474607786', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'susan921@gmail.com', 'Susan', 'Alpha', '999 Orange St','9053207733', 'Female', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'joker1940@gmail.com', 'Jack', 'Oswald White', '14 Joker Cr','1233211234', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, '39sa3s@hotmail.com', 'Tom', 'Beta', '321 Crown Cr','4564329983', 'Male', null ); 
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'asdw331@email.com', 'Zoey', 'Aoe', '321 Kong St','3334431923', 'Female', null);
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'ddee@gmail.com', 'Amanda', 'Oma', '8 Express Rd','6235952536', 'Female', '9 Test St' );
INSERT INTO comm_customers VALUES (seq_comm_customers.nextval, 'aabb@gmail.com', 'Billy', 'Fan', '33 Macao Cr','9035859988', 'Male','1 Bill Crt' ); 
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'ccdd@yahoo.com', 'Cat', 'Kitten', '1 Pikachu Ave' ,'4375815214', 'Female',null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'hhii@gmail.com', 'Door', 'Man', '77 Casino St','6473031188', 'Male', '505 Omg Rd');
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'jjkk@gmail.com', 'Emily', 'Cranston', '144 Pleasent Cr','4164607786', 'Female', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'llmm@gmail.com', 'Flower', 'Seed', '321 Rest Cr','4963712166', 'Female', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'oopp@yahoo.com', 'Gordon', 'Empire', '56 Orange Rd','6323436789', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'qqrr@gmail.com', 'Horace', 'Kim', '345 True St','9484507786', 'Male', null );
INSERT INTO comm_customers values (seq_comm_customers.nextval, 'sstt@gmail.com', 'Issac', 'Panada', '8 Rose St','9093297883', 'Male', '9 Test St' ); --1021


--INSERT data comm_products starting from 600 
CREATE SEQUENCE seq_comm_products START WITH 600 INCREMENT BY 1;
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Reebok Classic 09', 20, 9, 10,'Reebok Classic made in 2009', 'Sneakers','Black',TO_DATE('09-09-2009', 'DD-MM-YYYY'), 'RC-09.jpg'); --600
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Adidas Gazelle Blue', 30, 15, 10,'Adidas Gazelle Model with Blue color', 'Sneakers','Blue',TO_DATE('11-12-2022', 'DD-MM-YYYY'), 'AGB-11.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Gucci Dress Shoes', 100, 2, 9,'Gucci Dress shoes with Gucci logo', 'Dress shoes','Black',TO_DATE('22-08-2019', 'DD-MM-YYYY'), 'GDS-dd.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Fendi Woman High Heels', 35, 3, 8,'Fendi Woman High Heels with Fendis signitures', 'Dress shoes','Red',TO_DATE('13-03-2020', 'DD-MM-YYYY'), 'FWHH-e1.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Chloe Woman Mule Slippers', 35, 5, 7,'Chloe Woman Mule style Slippers', 'Slippers','White',TO_DATE('11-05-2023', 'DD-MM-YYYY'), 'CWMS02.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Reebok Classic 007', 40, 9, 10,'Reebok Classic crossover 007', 'Sneakers','Black and White',TO_DATE('07-07-2022', 'DD-MM-YYYY'), '007-RE.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Adidas Gazelle Red', 50, 11, 11,'Adidas Gazelle Model with Red color', 'Sneakers','Red',TO_DATE('17-12-2022', 'DD-MM-YYYY'), 'AGR-11.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Gucci Slippers', 40, 4, 9,'Slippers with Guci LOGO', 'Dress shoes','Black',TO_DATE('22-08-2017', 'DD-MM-YYYY'), 'GS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Fendi Man Sport Shoes', 25, 5, 8,'Fendi Man Sport Shoes with Fendis signitures', 'Dress shoes','Red',TO_DATE('13-03-2020', 'DD-MM-YYYY'), 'FMSS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Chloe Classic', 30, 5, 7,'Chloe Classic made in 2018', 'Slippers','White',TO_DATE('11-05-2018', 'DD-MM-YYYY'), 'CC18.jpg'); 
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'LV Man Smart Shoes', 70, 10, 5,'Man Shoes with LV signitures', 'Dress shoes','Brown',TO_DATE('24-04-2021', 'DD-MM-YYYY'), 'LVS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Nike Sport Shoes', 45, 5, 8,'Nike Sport Shoes with color White', 'Dress shoes','White',TO_DATE('13-03-2020', 'DD-MM-YYYY'), 'NKS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Adidas Classic 09', 20, 9, 10,'Adidas Classic made in 2009', 'Sneakers','Black',TO_DATE('09-09-2009', 'DD-MM-YYYY'), 'AC-09.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Nike Gazelle Silver', 30, 15, 10,'Nike Gazelle Model with Silver color', 'Sneakers','Silver',TO_DATE('10-12-2022', 'DD-MM-YYYY'), 'NGB-11.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Gucci Classic Shoes', 100, 2, 9,'Gucci Classic shoes with Gucci logo', 'Dress shoes','Black',TO_DATE('22-08-2019', 'DD-MM-YYYY'), 'GCS-dd.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Fendi Grand High Heels', 70, 3, 8,'Fendi Grand High Heels with Fendis signitures', 'Dress shoes','Silver',TO_DATE('13-03-2020', 'DD-MM-YYYY'), 'FGHH-e1.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Levis Woman Mule Slippers', 35, 5, 7,'Levis Woman Mule style Slippers', 'Slippers','White',TO_DATE('11-01-2023', 'DD-MM-YYYY'), 'LEV02.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'LV Classic 007', 110, 4, 10,'LV Classic crossover 007', 'Sneakers','Black and White',TO_DATE('07-07-2017', 'DD-MM-YYYY'), '007-LV.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Adidas Gazelle Red', 50, 11, 11,'Adidas Gazelle Model with Red color', 'Sneakers','Red',TO_DATE('17-12-2022', 'DD-MM-YYYY'), 'AGR-11.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Levis Slippers', 40, 4, 9,'Slippers with Levis LOGO', 'Dress shoes','Black',TO_DATE('22-08-2017', 'DD-MM-YYYY'), 'LS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Fendi Woman Sport Shoes', 25, 5, 8,'Fendi Woman Sport Shoes with Fendis signitures', 'Dress shoes','Red',TO_DATE('13-03-2020', 'DD-MM-YYYY'), 'FMSS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Dior Classic', 70, 5, 7,'Dior Classic made in 2022', 'Dress shoes','Purple',TO_DATE('11-01-2022', 'DD-MM-YYYY'), 'D22.jpg'); 
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'LV Woman Smart Shoes', 70, 10, 5,'Woman Shoes with LV signitures', 'Dress shoes','Brown',TO_DATE('24-04-2021', 'DD-MM-YYYY'), 'LVWS.jpg');
INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Dior Sport Shoes', 95, 5, 8,'Dior Sport Shoes with color White', 'Dress shoes','White',TO_DATE('25-07-2023', 'DD-MM-YYYY'), 'DSS.jpg'); --623




CREATE SEQUENCE seq_comm_shopping_cart START WITH 2000 INCREMENT BY 1;
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('09-09-2021', 'DD-MM-YYYY'), 1000, 'Completed'); --2000
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('11-10-2021', 'DD-MM-YYYY'), 1010, 'Completed'); --2001
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('15-10-2021', 'DD-MM-YYYY'), 1001, 'Pending'); --2002
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('16-10-2021', 'DD-MM-YYYY'), 1001, 'Completed'); --2003
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('01-05-2022', 'DD-MM-YYYY'), 1003, 'Completed'); --2004
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('22-06-2022', 'DD-MM-YYYY'), 1004, 'Failed'); --2005
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('23-06-2022', 'DD-MM-YYYY'), 1004, 'Completed'); --2006
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('25-12-2022', 'DD-MM-YYYY'), 1006, 'Completed'); --2007
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('01-02-2023', 'DD-MM-YYYY'), 1008, 'Completed'); --2008
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('11-03-2023', 'DD-MM-YYYY'), 1008, 'Completed'); --2009
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('13-04-2023', 'DD-MM-YYYY'), 1009, 'Pending'); --2010
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('14-04-2023', 'DD-MM-YYYY'), 1010, 'Completed'); --2011
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('17-05-2023', 'DD-MM-YYYY'), 1010, 'Completed'); --2012
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('20-06-2023', 'DD-MM-YYYY'), 1011, 'Completed'); --2013
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('01-07-2023', 'DD-MM-YYYY'), 1012, 'Completed'); --2014
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('02-07-2023', 'DD-MM-YYYY'), 1013, 'Pending'); --2015
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('05-07-2023', 'DD-MM-YYYY'), 1014, 'Pending'); --2016
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('10-07-2023', 'DD-MM-YYYY'), 1015, 'Completed'); --2017
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('12-07-2023', 'DD-MM-YYYY'), 1016, 'Completed'); --2018
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('14-07-2023', 'DD-MM-YYYY'), 1017, 'Completed'); --2019
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('15-07-2023', 'DD-MM-YYYY'), 1018, 'Completed'); --2020
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('16-07-2023', 'DD-MM-YYYY'), 1019, 'Completed'); --2021
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('19-07-2023', 'DD-MM-YYYY'), 1019, 'Completed'); --2022
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('21-07-2023', 'DD-MM-YYYY'), 1020, 'Pending'); --2023
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('22-07-2023', 'DD-MM-YYYY'), 1021, 'Completed'); --2024
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('23-07-2023', 'DD-MM-YYYY'), 1021, 'Completed'); --2025
INSERT INTO comm_shopping_cart VALUES (seq_comm_shopping_cart.nextval, TO_DATE('24-07-2023', 'DD-MM-YYYY'), 1021, 'Completed'); --2026



--INSERT data comm_shipping_details starting from 3000 
CREATE SEQUENCE seq_comm_shipping_details START WITH 3000 INCREMENT BY 1;
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2000, 'Arrived', TO_DATE('10-09-2021', 'DD-MM-YYYY')); --3000
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2001, 'Arrived', TO_DATE('13-10-2021', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2003, 'Arrived', TO_DATE('18-10-2021', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2004, 'Arrived', TO_DATE('04-05-2022', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2006, 'Arrived', TO_DATE('25-06-2022', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2007, 'Arrived', TO_DATE('27-12-2022', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2008, 'Arrived', TO_DATE('03-02-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2009, 'In Transit', TO_DATE('12-03-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2011, 'Arrived', TO_DATE('16-04-2023', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2012, 'In Transit', TO_DATE('19-05-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2013, 'In Transit', TO_DATE('23-06-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2014, 'In Transit', TO_DATE('02-07-2023', 'DD-MM-YYYY'));
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2017, 'In Transit', TO_DATE('03-07-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2018, 'In Transit', TO_DATE('14-07-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2019, 'Arrived', TO_DATE('15-07-2023', 'DD-MM-YYYY'));
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2020, 'Arrived', TO_DATE('17-07-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2021, 'Arrived', TO_DATE('18-07-2023', 'DD-MM-YYYY'));  
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2022, 'Arrived', TO_DATE('22-07-2023', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2024, 'In Transit', TO_DATE('25-07-2023', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2025, 'In Transit', TO_DATE('26-07-2023', 'DD-MM-YYYY')); 
INSERT INTO comm_shipping_details VALUES (seq_comm_shipping_details.nextval, 2026, 'In Transit', TO_DATE('27-07-2023', 'DD-MM-YYYY'));  --3020
 
--INSERT data comm_order_details starting from 4000 
CREATE SEQUENCE seq_comm_order_details START WITH 4000 INCREMENT BY 1;
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 605, TO_DATE('09-09-2021', 'DD-MM-YYYY'), 1, 40, 2000); --4000
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 611, TO_DATE('11-10-2021', 'DD-MM-YYYY'), 2, 90, 2001); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 607, TO_DATE('15-10-2021', 'DD-MM-YYYY'), 2, 80, 2003);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 600, TO_DATE('16-10-2021', 'DD-MM-YYYY'), 1, 20, 2004);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 609, TO_DATE('16-10-2021', 'DD-MM-YYYY'), 1, 30, 2004);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 602, TO_DATE('01-05-2022', 'DD-MM-YYYY'), 2, 200, 2004);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 601, TO_DATE('22-06-2022', 'DD-MM-YYYY'), 1, 30, 2005);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 603, TO_DATE('23-06-2022', 'DD-MM-YYYY'), 2, 70, 2006);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 604, TO_DATE('25-12-2022', 'DD-MM-YYYY'), 2, 70, 2007);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 600, TO_DATE('01-02-2023', 'DD-MM-YYYY'), 1, 20, 2008);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 601, TO_DATE('11-03-2023', 'DD-MM-YYYY'), 3, 90, 2009);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 608, TO_DATE('13-04-2023', 'DD-MM-YYYY'), 4, 100, 2010); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 611, TO_DATE('13-04-2023', 'DD-MM-YYYY'), 1, 45, 2010); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 611, TO_DATE('14-04-2023', 'DD-MM-YYYY'), 1, 45, 2011); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 610, TO_DATE('17-05-2023', 'DD-MM-YYYY'), 3, 210, 2012);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 609, TO_DATE('17-05-2023', 'DD-MM-YYYY'), 1, 30, 2012); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 614, TO_DATE('17-05-2023', 'DD-MM-YYYY'), 1, 100, 2012); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 615, TO_DATE('17-05-2023', 'DD-MM-YYYY'), 1, 70, 2012);  
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 609, TO_DATE('20-06-2023', 'DD-MM-YYYY'), 4, 120, 2013); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 606, TO_DATE('01-07-2023', 'DD-MM-YYYY'), 5, 250, 2014); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 608, TO_DATE('01-07-2023', 'DD-MM-YYYY'), 1, 25, 2014); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 611, TO_DATE('02-07-2023', 'DD-MM-YYYY'), 1, 45, 2015); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 612, TO_DATE('05-07-2023', 'DD-MM-YYYY'), 5, 100, 2016);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 612, TO_DATE('10-07-2023', 'DD-MM-YYYY'), 1, 20, 2017); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 614, TO_DATE('12-07-2023', 'DD-MM-YYYY'), 1, 100, 2018);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 615, TO_DATE('14-07-2023', 'DD-MM-YYYY'), 1, 70, 2019);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 616, TO_DATE('15-07-2023', 'DD-MM-YYYY'), 5, 175, 2020); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 617, TO_DATE('16-07-2023', 'DD-MM-YYYY'), 3, 330, 2021);
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 618, TO_DATE('19-07-2023', 'DD-MM-YYYY'), 6, 300, 2022); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 619, TO_DATE('21-07-2023', 'DD-MM-YYYY'), 3, 120, 2023); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 620, TO_DATE('22-07-2023', 'DD-MM-YYYY'), 3, 75, 2024); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 620, TO_DATE('23-07-2023', 'DD-MM-YYYY'), 1, 75, 2025); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 621, TO_DATE('23-07-2023', 'DD-MM-YYYY'), 1, 70, 2025); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 622, TO_DATE('23-07-2023', 'DD-MM-YYYY'), 1, 70, 2025); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 622, TO_DATE('24-07-2023', 'DD-MM-YYYY'), 2, 140, 2026); 
INSERT INTO comm_order_details VALUES (seq_comm_order_details.nextval, 623, TO_DATE('24-07-2023', 'DD-MM-YYYY'), 2, 190, 2026);

-- Insert records into the comm_promotion table
INSERT INTO comm_promotion VALUES (600, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (601, 'N', 1);
INSERT INTO comm_promotion VALUES (602, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (603, 'N', 1);
INSERT INTO comm_promotion VALUES (604, 'N', 1);
INSERT INTO comm_promotion VALUES (605, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (606, 'N', 1);
INSERT INTO comm_promotion VALUES (607, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (608, 'N', 1);
INSERT INTO comm_promotion VALUES (609, 'N', 1); 
INSERT INTO comm_promotion VALUES (610, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (611, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (612, 'N', 1);
INSERT INTO comm_promotion VALUES (613, 'N', 1); 
INSERT INTO comm_promotion VALUES (614, 'N', 1);
INSERT INTO comm_promotion VALUES (615, 'N', 1); 
INSERT INTO comm_promotion VALUES (616, 'N', 1);
INSERT INTO comm_promotion VALUES (617, 'N', 1); 
INSERT INTO comm_promotion VALUES (618, 'N', 1);
INSERT INTO comm_promotion VALUES (619, 'Y', 0.9); 
INSERT INTO comm_promotion VALUES (620, 'N', 1);
INSERT INTO comm_promotion VALUES (621, 'N', 1); 
INSERT INTO comm_promotion VALUES (622, 'Y', 0.9);
INSERT INTO comm_promotion VALUES (623, 'N', 1); 


--************************************************
-- Indexes 

CREATE INDEX index_product_name ON comm_products (product_name);
CREATE INDEX index_cart_status ON comm_shopping_cart (status);
CREATE INDEX index_order_details ON comm_order_details (order_date);


--************************************************
-- Update the table by sequence indirectly (index 0 to 4)

ALTER TABLE comm_customers ADD (origin VARCHAR2(2));

UPDATE comm_customers 
SET origin = CASE MOD(customer_id, 5)
    WHEN 0 THEN 'BC'
    WHEN 1 THEN 'ON'
    WHEN 2 THEN 'QC'
    WHEN 3 THEN 'NS'
    ELSE 'NL'
END;


ALTER TABLE comm_promotion ADD promotion_reference_number NUMBER(3);
DROP SEQUENCE seq_promotion_reference_number;
CREATE SEQUENCE seq_promotion_reference_number START WITH 500 INCREMENT BY 1;

DECLARE
CURSOR c_promotion IS
        SELECT product_id
        FROM comm_promotion
        FOR UPDATE of promotion_reference_number NOWAIT;
BEGIN
    FOR r_promotion in c_promotion LOOP
        UPDATE comm_promotion
        SET promotion_reference_number = seq_promotion_reference_number.nextval
        WHERE CURRENT OF c_promotion;
    END LOOP;
    COMMIT;
END;

COMMIT;

-- Function 1 
CREATE OR REPLACE FUNCTION get_latest_order_date(c_id NUMBER)
RETURN DATE IS
    latest_order_date DATE;
BEGIN
    SELECT MAX(order_date)
    INTO latest_order_date
    FROM comm_order_details
    WHERE cart_number IN (SELECT cart_number
                          FROM comm_shopping_cart
                          WHERE customer_id = c_id);

    IF latest_order_date IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No order found for Customer ' || c_id);
    ELSE
     DBMS_OUTPUT.PUT_LINE('Latest Order Date for Customer ' || c_id || ': ' || latest_order_date);
    END IF;
    
    RETURN latest_order_date;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

--code test
DECLARE
    customer_id_param NUMBER := 1021; -- Replace this with the desired customer_id
    latest_order_date DATE;
BEGIN
    latest_order_date := get_latest_order_date(customer_id_param);
END;


--************************************************

-- Function 2 
SELECT * FROM comm_customers;

CREATE OR REPLACE FUNCTION ship_free
    (p_qty IN NUMBER)
    RETURN CHAR 
   IS lv_free_ship CHAR(1);

BEGIN
    IF p_qty >= 3 THEN
        lv_free_ship := 'Y';
    ELSE
        lv_free_ship := 'N';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Free shipping applied: ' ||lv_free_ship);
RETURN lv_free_ship;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error');
        RETURN NULL;
END;

--code test
SELECT order_id, quantity,
    ship_free(quantity) "free-shipping"
FROM comm_order_details;

DECLARE
    v_qty NUMBER;
    v_result CHAR(1);
BEGIN
    -- Test with different quantities
    v_qty := 2;
    v_result := ship_free(v_qty);
    
    v_qty := 3;
    v_result := ship_free(v_qty);
    
    v_qty := 5;
    v_result := ship_free(v_qty);
END;

--************************************************

-- Prodcedure 1 

CREATE OR REPLACE PROCEDURE get_customer_info(customer_id_param NUMBER) AS
    latest_order_date DATE;
    CURSOR customer_cursor IS
        SELECT *
        FROM comm_customers
        WHERE customer_id = customer_id_param;
    rec_customer comm_customers%ROWTYPE;
BEGIN
    OPEN customer_cursor;
    FETCH customer_cursor INTO rec_customer;

    IF customer_cursor%FOUND THEN
        -- Retrieve the latest order date using the function
        latest_order_date := get_latest_order_date(customer_id_param);
        -- Display customer information along with the latest order date
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || rec_customer.customer_id);
        DBMS_OUTPUT.PUT_LINE('Customer Email: ' || rec_customer.customer_email);
        DBMS_OUTPUT.PUT_LINE('Customer First Name: ' || rec_customer.customer_fname);
        DBMS_OUTPUT.PUT_LINE('Customer Last Name: ' || rec_customer.customer_lname);
        DBMS_OUTPUT.PUT_LINE('Customer Address: ' || rec_customer.customer_address);
        DBMS_OUTPUT.PUT_LINE('Customer Phone Number: ' || rec_customer.customer_phone_number);
        DBMS_OUTPUT.PUT_LINE('Customer Gender: ' || rec_customer.customer_gender);
        DBMS_OUTPUT.PUT_LINE('Customer Billing Address: ' || rec_customer.customer_billing_address);
        DBMS_OUTPUT.PUT_LINE('Latest Order Date: ' || latest_order_date);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Customer with ID ' || customer_id_param || ' not found.');
    END IF;
    CLOSE customer_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        CLOSE customer_cursor;
END;


--code test

BEGIN
    get_customer_info(1000); 
END;

--************************************************

--  Procedure 2 

CREATE OR REPLACE PROCEDURE update_product_discount_rate AS
  CURSOR product_cursor IS
    SELECT product_id, product_release_date FROM comm_products;

  promo_rec product_cursor%ROWTYPE;
  v_updated_discount_rate comm_promotion.product_discount_rate%TYPE;
BEGIN
  OPEN product_cursor;
  LOOP
    FETCH product_cursor INTO promo_rec;
    EXIT WHEN product_cursor%NOTFOUND;
    
    UPDATE comm_promotion pr
    SET pr.product_discount_rate =
      CASE
        WHEN MONTHS_BETWEEN(sysdate, promo_rec.product_release_date) <= 12 THEN 1
        WHEN MONTHS_BETWEEN(sysdate, promo_rec.product_release_date) <= 24 THEN 0.9
        WHEN MONTHS_BETWEEN(sysdate, promo_rec.product_release_date) <= 36 THEN 0.8
        ELSE 0.7
      END
    WHERE pr.product_id = promo_rec.product_id;

    BEGIN
      -- retrieve and print the updated discount rate
      SELECT pr.product_discount_rate
      INTO v_updated_discount_rate
      FROM comm_promotion pr
      WHERE pr.product_id = promo_rec.product_id;

      DBMS_OUTPUT.PUT_LINE('Updated product_discount_rate for product_id ' || promo_rec.product_id || ': ' || v_updated_discount_rate);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No promotion record found for product_id: ' || promo_rec.product_id);
    END;
  END LOOP;

  CLOSE product_cursor;
  
  DBMS_OUTPUT.PUT_LINE('Promotion table is updated successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;

-- Code test
BEGIN
  update_product_discount_rate;
END;


--************************************************

--  Trigger 1 

CREATE OR REPLACE TRIGGER shoes_inventory_trg
AFTER INSERT ON comm_order_details
FOR EACH ROW
BEGIN
  IF :NEW.quantity IS NOT NULL THEN
    IF :NEW.quantity > 0 THEN
      -- Check if there's sufficient stock for the new order
      DECLARE
        available_stock INT;
      BEGIN
        SELECT p.product_quantity INTO available_stock
        FROM comm_products p
        WHERE p.product_id = :NEW.product_id;

        IF available_stock >= :NEW.quantity THEN
          UPDATE comm_products
          SET product_quantity = product_quantity - :NEW.quantity
          WHERE product_id = :NEW.product_id;
          DBMS_OUTPUT.PUT_LINE('INVENTORY UPDATED ' || :NEW.product_id);
        ELSE
          DBMS_OUTPUT.PUT_LINE('INSUFFICIENT STOCK FOR ' || :NEW.product_id);
        END IF;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          -- The product_id in the order_details table doesn't exist in comm_products
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT FOUND: ' || :NEW.product_id);
      END;
    ELSE
      -- Invalid quantity (less than or equal to zero)
      DBMS_OUTPUT.PUT_LINE('INVALID QUANTITY FOR ' || :NEW.product_id);
    END IF;
  END IF;
END;

--Code Test

SELECT * FROM comm_products;


INSERT INTO comm_order_details values(seq_comm_order_details.nextval, 605, TO_DATE('09-09-2021', 'DD-MM-YYYY'), 1, 40, 2000); 

SELECT product_id, p.product_name, p.product_quantity "Inventory qty", od.order_id, od.quantity "Order qty", p.product_quantity - od.quantity AS "Diff"
FROM comm_products p JOIN comm_order_details od USING(product_id) WHERE product_id = 605;

ROLLBACK;

--************************************************

--  Trigger 2 

CREATE OR REPLACE TRIGGER price_update_trg
BEFORE INSERT ON comm_products
FOR EACH ROW 
BEGIN 
    IF SYSDATE - :NEW.product_release_date < 10 THEN
        :NEW.product_price := :NEW.product_price * 1.15;
        DBMS_OUTPUT.PUT_LINE('PRICE UPDATED OF:' || :NEW.product_id);
    END IF;
END;


--Code Test

SELECT product_id, SYSDATE - product_release_date AS "DATE_DIFF", product_price
    FROM comm_products;

SELECT * from comm_products;

INSERT INTO comm_products VALUES(seq_comm_products.nextval, 'Louis Vuitton Classic', 120, 5, 9,'Louis Vuitton Classic with Gucci logo', 'Sneakers', 'Brown',TO_DATE('04-08-2023', 'DD-MM-YYYY'), 'LV.jpg');

ROLLBACK;


--************************************************

--  Package

CREATE OR REPLACE PACKAGE order_total_pkg AS
  -- global variable
  g_total_orders_processed NUMBER;

  PROCEDURE calculate_order_total(p_order_id IN comm_order_details.order_id%TYPE DEFAULT NULL);
  PROCEDURE calculate_all_orders_total;
  
  FUNCTION get_order_count RETURN NUMBER;
  FUNCTION get_discounted_price(p_product_id IN comm_products.product_id%TYPE) RETURN NUMBER;
END order_total_pkg;
/

CREATE OR REPLACE PACKAGE BODY order_total_pkg AS
  v_total_price NUMBER(8, 2);

  PROCEDURE calculate_order_total(p_order_id IN comm_order_details.order_id%TYPE DEFAULT NULL) IS
    v_total_price NUMBER(8, 2);
    v_discount_amount NUMBER(8, 2);
    v_shipment_discount comm_promotion.shipment_discount%TYPE; 
    v_product_discount_rate comm_promotion.product_discount_rate%TYPE; 

    CURSOR specific_order_cur IS
      SELECT od.order_id, p.product_price, od.quantity, pr.product_discount_rate, pr.shipment_discount
      FROM comm_order_details od
      LEFT JOIN comm_products p ON od.product_id = p.product_id
      LEFT JOIN comm_promotion pr ON od.product_id = pr.product_id
      WHERE od.order_id = p_order_id;

  BEGIN
    -- initialize total price to 0 for each order
    v_total_price := 0;

    FOR order_detail_rec IN specific_order_cur
    LOOP
      v_discount_amount := order_detail_rec.quantity * order_detail_rec.product_price * order_detail_rec.product_discount_rate;
      v_shipment_discount := order_detail_rec.shipment_discount;
      v_product_discount_rate := order_detail_rec.product_discount_rate;

      -- calculate the total price for the order (add the product price for each product)
      v_total_price := v_total_price + v_discount_amount;

      -- check if shipment_discount is 'N', if so, add $5 to the total price
      IF v_shipment_discount = 'N' THEN
        v_total_price := v_total_price + 5;
      END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Price after Discount and Shipment for Order ID ' || p_order_id || ': ' || v_total_price);
    
    -- increment the total orders processed
    g_total_orders_processed := g_total_orders_processed + 1;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calculating order total for Order ID ' || p_order_id || '.');
  END calculate_order_total;

  PROCEDURE calculate_all_orders_total IS
    CURSOR c IS
      SELECT od.order_id
      FROM comm_order_details od
      JOIN comm_products p ON od.product_id = p.product_id;

    order_detail_rec c%ROWTYPE;
  BEGIN
    OPEN c;
    LOOP
      FETCH c INTO order_detail_rec;
      EXIT WHEN c%NOTFOUND;
      calculate_order_total(order_detail_rec.order_id);
    END LOOP;
    CLOSE c;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calculating all orders total.');
  END calculate_all_orders_total;

  FUNCTION get_order_count RETURN NUMBER IS
    v_count NUMBER;
  BEGIN
    SELECT count(*) INTO v_count FROM comm_order_details;
    RETURN v_count;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while fetching the order count.');
      RETURN NULL; 
  END get_order_count;

  -- no shipment_discount applied
  FUNCTION get_discounted_price(p_product_id IN comm_products.product_id%TYPE) RETURN NUMBER IS
    v_discounted_price NUMBER(8, 2);
    v_product_price comm_products.product_price%TYPE;
    v_discount_rate comm_promotion.product_discount_rate%TYPE;
  BEGIN
    SELECT product_price INTO v_product_price FROM comm_products WHERE product_id = p_product_id;
    SELECT product_discount_rate INTO v_discount_rate FROM comm_promotion WHERE product_id = p_product_id;
    v_discounted_price := v_product_price * v_discount_rate;
    RETURN v_discounted_price;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while calculating the discounted price for Product ID ' || p_product_id || '.');
      RETURN NULL; 
  END get_discounted_price;

BEGIN
  g_total_orders_processed := 0;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred in the package initialization.');
END order_total_pkg;
/

-- Test Code
DECLARE
  v_order_count NUMBER;
  v_discounted_price NUMBER;
BEGIN

  -- test calculate_order_total procedure
  DBMS_OUTPUT.PUT_LINE('-----Show Specific Order Total-----');
  order_total_pkg.calculate_order_total(4000);
  order_total_pkg.calculate_order_total(4001);
  order_total_pkg.calculate_order_total(4002);

  -- test calculate_all_orders_total procedure
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('-----Show All Orders Total-----');
  order_total_pkg.calculate_all_orders_total;

  -- print the value of the global variable
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Total Orders Processed: ' || order_total_pkg.g_total_orders_processed);

  -- test get_order_count function
  v_order_count := order_total_pkg.get_order_count;
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Total Orders: ' || v_order_count);

  -- test get_discounted_price function
  v_discounted_price := order_total_pkg.get_discounted_price(601);
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Discounted Price for Product ID 601: ' || v_discounted_price);
END;

COMMIT;

