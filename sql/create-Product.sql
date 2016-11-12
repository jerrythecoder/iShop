create table Product (
	productId bigint auto_increment, 
    productName varchar(256), 
    productCategory varchar(128), 
	productDescription text, 
    productPrice double, 
    productCondition varchar(128), 
    productStatus varchar(128), 
    unitInStock int, 
    productManufacturer varchar(256), 
    primary key (productId));