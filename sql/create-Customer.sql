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