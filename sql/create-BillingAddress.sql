create table BillingAddress (
	billingAddressId bigint auto_increment, 
    apartmentNumber varchar(64), 
    streetName varchar(64), 
    city varchar(64), 
    state varchar(64), 
    country varchar(64), 
    zipCode varchar(64), 
    primary key (billingAddressId));