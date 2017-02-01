create table if not exists `cs275`.`users` {
	`id` smallint(5) not null auto_increment,
	`computer` smallint(5),
	`role` smallint(5),
	`userName` varchar(6) not null unique,
	`password` varchar(100) not null,
	`contact` smallint(5) not null,
	`position` varchar(5) not null,
	`department` smallint(5) not null,
	`permissions` smallint(5) not null,
	primary key (`id`)
}

create table if not exists `cs275`.`computers`{
	`id` smallint(5) not null auto_increment,
	`role` smallint(5),
	`hostName` varchar(6) not null unique,
	`ipAddress` varchar(15) null unique,
	`os` varchar(5) not null,
	`osVer` varchar(5) not null,
	`model` varchar(5) not null,
	`serial` varchar(5) not null unique,
	primary key (`id`)
}

create table if not exists `cs275`.`contacts` {
	`id` smallint(5) not null auto_increment,
	`fname` varchar(5) not null,
	`lname` varchar(5) not null,
	`phone` smallint(15) not null,
	`address` varchar(5),
	`city` varchar(5),
	`state` varchar(5),
	`zip` smallint(5),
}

create table if not exists `cs275`.`roles` {
	`id` smallint(5) not null auto_increment,
	`name` varchar(10) not null unique,
	primary key (`id`)

}