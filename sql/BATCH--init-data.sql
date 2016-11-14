# Add an admin user as 'admin/admin'
insert into User (
	username, 
    password, 
    enabled
) values (
    'admin', 
    'admin', 
    1
);
    
insert into Authority (
	username, 
    authority
) values (
    'admin', 
    'ROLE_ADMIN'
);

# Init product data
insert into Product (
    productName, 
    productCategory, 
	productDescription, 
    productPrice, 
    productCondition, 
    productStatus, 
    unitInStock, 
    productManufacturer
) values (
	'AirPods', 
    'iPhone Accessories', 
    'AirPods will forever change the way you use headphones. Whenever you pull your AirPods out of the charging case, they instantly turn on and connect to your iPhone, Apple Watch, iPad or Mac.(1) Audio automatically plays as soon as you put them in your ears and pauses when you take them out. To adjust the volume, change the song, make a call or even get directions, just double-tap to activate Siri.', 
    219.00, 
    'New',
    'Available',
    99, 
    'Apple Inc'
), (
    'Apple Watch Series 2 - 38mm Case', 
    'Apple Watch', 
    'Introducing Series 2. Built-in GPS. Water resistance to 50 metres.1 A new lightning-fast dual-core processor. And a display that’s two times brighter than before. Full of features that help you stay active, motivated and connected, Apple Watch Series 2 is designed for all the ways you move.', 
	1649.00, 
    'New', 
    'Available', 
    15, 
    'Apple Inc'
);