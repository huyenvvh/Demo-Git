CREATE DATABASE Test
USE Test
GO
--Tạo bảng Thương hiệu (Brand) có ID tự tăng
CREATE TABLE Brand ( Brand_Id INT PRIMARY KEY IDENTITY(1,1), Brand_Name VARCHAR(100));

--Tạo bảng Thương hiệu sản phẩm (Product_Brand) có Brand_Id của bảng Brand là Khóa Ngoại (FOREIGN KEY)
CREATE TABLE Product_Brand (Product_Brand_Id INT PRIMARY KEY IDENTITY(1,1),
							Product_Id INT, Brand_Id INT,
							FOREIGN KEY (Brand_Id) REFERENCES Brand(Brand_Id),
							FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
							);

--Tạo bảng Loại (Category) tương tự bảng Thương hiệu (Brand) 
CREATE TABLE Category (Category_Id INT PRIMARY KEY IDENTITY(1,1), Category_Code VARCHAR(20), Category_Name VARCHAR(50));

--Tạo bảng Trạng thái (Status) tương tự bảng Thương hiệu và bảng Loại 
CREATE TABLE Statuss (Status_Id INT PRIMARY KEY IDENTITY(1,1), Status_Name VARCHAR(100));

--Tạo hết bảng con (Bảng đơn lẻ) xong đến bảng to bảng có mối quan hệ với các bảng con.
--Tạo bảng Loại chi tiết (Sub_category) có quan hệ với bảng Loại (Category)
CREATE TABLE Sub_Category (Sub_Category_Id INT PRIMARY KEY IDENTITY(1,1),
							Sub_Category_Code VARCHAR(20),Sub_Category_Name VARCHAR(50),
							Category_Id INT FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id));
--Tạo bảng Sản Phẩm (Product) 
CREATE TABLE Product ( Product_Id INT PRIMARY KEY IDENTITY(1,1), 
						Sub_Category_Id INT, Product_Name VARCHAR(100),Color VARCHAR(50),
						Quantity INT, Sell_Price FLOAT, Origin_Price FLOAT, Descriptions VARCHAR(100),
						Status_Id INT,
						FOREIGN KEY(Sub_Category_Id) REFERENCES Sub_Category(Sub_Category_Id),
						FOREIGN KEY(Status_Id) REFERENCES Statuss(Status_Id));

SELECT * FROM Product
