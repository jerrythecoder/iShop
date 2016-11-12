create table CartItem (
	cartItemId bigint auto_increment, 
    cartId bigint not null, 
    productId bigint not null, 
    quantity int not null, 
    totalPrice double not null, 
    primary key (cartItemId), 
    foreign key (cartId) references Cart(cartId), 
    foreign key (productId) references Product(productId));