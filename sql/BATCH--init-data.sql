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
    'Accessory', 
    'AirPods will forever change the way you use headphones. Whenever you pull your AirPods out of the charging case, they instantly turn on and connect to your iPhone, Apple Watch, iPad or Mac.(1) Audio automatically plays as soon as you put them in your ears and pauses when you take them out. To adjust the volume, change the song, make a call or even get directions, just double-tap to activate Siri.', 
    219.00, 
    'New',
    'In Stock',
    99, 
    'Apple Inc'
), (
    'Apple Watch Series 2 - 38mm Case', 
    'Apple Watch', 
    'Introducing Series 2. Built-in GPS. Water resistance to 50 metres.1 A new lightning-fast dual-core processor. And a display that’s two times brighter than before. Full of features that help you stay active, motivated and connected, Apple Watch Series 2 is designed for all the ways you move.', 
	1649.00, 
    'New', 
    'In Stock', 
    15, 
    'Apple Inc'
), (
    'MacBook Pro - 15-Inch', 
    'Apple Mac', 
    'It’s faster and more powerful than before, yet remarkably thinner and lighter. It has the brightest, most colourful Mac notebook display ever. And it introduces the Touch Bar — a Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. The new MacBook Pro is built on groundbreaking ideas. And it’s ready for yours.', 
	3499.00, 
    'New', 
    'In Stock', 
    8, 
    'Apple Inc'
), (
    'iPad Air 2 - Rose Gold - 128G', 
    'iPad', 
    'With iPad, we’ve always had a somewhat paradoxical goal: to create a device that’s immensely powerful, yet so thin and light you almost forget it’s there. A device that helps you do amazing things, without ever getting in your way. iPad Air 2 is all that. And then some.', 
	629.00, 
    'New', 
    'In Stock', 
    20, 
    'Apple Inc'
);