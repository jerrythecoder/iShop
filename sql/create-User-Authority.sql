create table User (
	username varchar(64) not null primary key,
	password varchar(64) not null,
	enabled boolean not null, 
    customerId bigint,
    foreign key (customerId) references Customer(customerId));

create table Authority (
	username varchar(64) not null,
	authority varchar(64) not null,
	constraint fk_authorities_users foreign key (username) references User(username));
	create unique index ix_auth_username on Authority (username, authority);