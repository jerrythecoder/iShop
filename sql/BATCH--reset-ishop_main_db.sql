# Drop all tables 
drop table if exists Authority;
drop table if exists User;
drop table if exists Customer;
drop table if exists BillingAddress;
drop table if exists ShippingAddress;
drop table if exists CartItem;
drop table if exists Cart;
drop table if exists Product;

# Create non-credential tables in sequence
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
    primary key (productId)
);
    
create table Cart (
	cartId bigint auto_increment, 
    grandTotal double, 
    primary key (cartId)
);
    
create table CartItem (
	cartItemId bigint auto_increment, 
    cartId bigint not null, 
    productId bigint not null, 
    quantity int not null, 
    totalPrice double not null, 
    primary key (cartItemId), 
    foreign key (cartId) references Cart(cartId), 
    foreign key (productId) references Product(productId)
);
    
create table BillingAddress (
	billingAddressId bigint auto_increment, 
    apartmentNumber varchar(64), 
    streetName varchar(64), 
    city varchar(64), 
    state varchar(64), 
    country varchar(64), 
    zipCode varchar(64), 
    primary key (billingAddressId)
);
    
create table ShippingAddress (
	shippingAddressId bigint auto_increment, 
    apartmentNumber varchar(64), 
    streetName varchar(64), 
    city varchar(64), 
    state varchar(64), 
    country varchar(64), 
    zipCode varchar(64), 
    primary key (shippingAddressId)
);
    
create table Customer (
	customerId bigint auto_increment, 
    customerFirstName varchar(64) not null,
    customerLastName varchar(64) not null,
    customerEmail varchar(64) not null, 
    customerPhone varchar(64), 
    billingAddressId bigint, 
    shippingAddressId bigint, 
    cartId bigint, 
    primary key (customerId), 
    foreign key (billingAddressId) references BillingAddress(billingAddressId), 
    foreign key (shippingAddressId) references ShippingAddress(shippingAddressId), 
    foreign key (cartId) references Cart(cartId)
);
    
# Create credential tables
create table User (
	username varchar(64) not null primary key,
	password varchar(64) not null,
	enabled boolean not null, 
    customerId bigint,
    foreign key (customerId) references Customer(customerId)
);

create table Authority (
	username varchar(64) not null,
	authority varchar(64) not null,
	constraint fk_authorities_users foreign key (username) references User(username)
);
create unique index ix_auth_username on Authority (username, authority);