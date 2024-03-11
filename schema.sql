--Creation of database
CREATE DATABASE sample_db;


--Use the DATABASE
USE sample_db;


--Schema creation
CREATE TABLE Product_Category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,
  description TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  modified_at DATETIME DEFAULT NULL,
  deleted_at DATETIME DEFAULT NULL
);

CREATE TABLE Product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  SKU VARCHAR(50) UNIQUE, 
  category_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  discount_id INT DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  modified_at DATETIME DEFAULT NULL,
  deleted_at DATETIME DEFAULT NULL,
  FOREIGN KEY (category_id) REFERENCES Product_Category(id)
);


CREATE TABLE Product_Inventory (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  modified_at DATETIME DEFAULT NULL,
  deleted_at DATETIME DEFAULT NULL,
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Discount (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  percentage INT NOT NULL CHECK (percentage BETWEEN 0 AND 100),
  description TEXT,
  start_date DATE,
  end_date DATE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  modified_at DATETIME DEFAULT NULL,
  deleted_at DATETIME DEFAULT NULL
);

ALTER TABLE Product
ADD CONSTRAINT FK_Product_Discount FOREIGN KEY (discount_id) REFERENCES Discount(id);
