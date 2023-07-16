
-- tables for users, products, orders 
CREATE TABLE Users
    (
        usersId INT PRIMARY KEY,
        username VARCHAR(50),
        email VARCHAR(50),
        password VARCHAR(15)
    );

    
CREATE TABLE Products  
    (
        productId INT PRIMARY KEY,
        productName VARCHAR(20),
        price DECIMAL(10,2)
    );

CREATE TABLE Orders 
   (
    orderId INT PRIMARY KEY,
    userId INT,
    orderDate DATE,
    FOREIGN KEY  (userId)  REFERENCES Users(userId)
  );

CREATE TABLE OrderItems(
    orderId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10,2)    ,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (productId)  REFERENCES Products(productId)
)




--Insrting  sample data into the tables

--1) sample users DATA
 INSERT INTO Users (userId,username,email, password)
 VALUES(1, 'johnd','john@gmail.com','john123'),
       (2 'kevin','kevin@gmail.com','kevin123');

--2) inserting sample products data
INSERT INTO Products (productId,productName,price)
VALUES (1,'laptop','10.20'),
       (2, 'mobile','10.55');
      
--3) inerting sample data into orders table
INSERT INTO Orders(orderId,userId,orderDate)
VALUES (1,1,'2023-7-15'),
       (2,2,'2023-7-12');

---(4) sample order items
 INSERT INTO OrderItems(orderId,productId,quantity,price)
 VALUES (1,1,5,10.20),
        (1, 2, 1, 10.55),
        (2, 1, 3, 10.99);

--retriving all orders made by a user
SELECT o.orderId, o.orderDate, o.productName, oi.quantity, oi.price
FROM Orders o
JOIN OrderItems oi ON o.orderId= oi.orderId
JOIN Products ON oi.productId =p.productId
WHERE o.user_id=1;