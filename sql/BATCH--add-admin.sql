# Add an admin user as 'admin/admin'
insert into User (
	username, 
    password, 
    enabled) 
    values (
    'admin', 
    'admin', 
    1);
    
insert into Authority (
	username, 
    authority) 
    values (
    'admin', 
    'ROLE_ADMIN');