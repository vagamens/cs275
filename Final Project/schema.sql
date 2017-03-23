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
	`state` varchar(2),
	`zip` smallint(5),
}

create table if not exists `cs275`.`roles` {
	`id` smallint(5) not null auto_increment,
	`name` varchar(10) not null unique,
	primary key (`id`)

}

insert into `cs275`.`roles` (`name`)
	values ('desktop'),('server'),('admin'),('IT'),('developer'),('laptop')

insert into `cs275`.`computers` (`role`, `hostName`, `ipAddress`, `os`, `osVer`,
								 `model`, `serial`) 
	values ((select `id` from `cs275`.`roles` where `name` == 'laptop'),
			'5cg2141lgl', '192.168.1.150', 'WinNT', '8', '840g2', '5cg2141lgl'),
			((select `id` from `cs275`.`roles` where `name` == 'desktop'),
			 'mxl4040bkv', '10.4.10.20', 'Ubuntu', '16.04', '800sff', 'mxl4040bkv'),
			((select `id` from `cs275`.`roles` where `name` == 'server'),
			 '2ua4161ljl', '10.1.10.5', 'Ubuntu', '15.10', '800', '2ua4161ljl')

insert into `cs275`.`contacts` (`fname`, `lname`, `phone`, `address`, `city`,
								`state`, `zip`)
	values ('Sarah', 'Cherry', 5557609, '4860 15th ST', 'Albany', 'OR', 97331),
		   ('Kevin', 'Clay', 4685709, '2089 Monroe Blvd', 'Corvallis', 'OR', 97333),
		   ('Nabeel', 'Jameel', 4750987, '6057 Deer Run', 'Albany', 'OR', 97544)

insert into `cs275`.`users` (`computer`, `role`, `userName`, `password`, `contact`,
							 `position`, `department`, `permissions`)
	values (1, select `id` from `cs275`.`computers` where `serial` == '5cg2141lgl',
			select `id` from `cs275`.`roles` where `name` == 'admin', 'scherry',
			'adfg5ightopi3850as', select `id` from `cs275`.`contacts` where `fname` == 'Sarah',
			'Personal Assistant', 'Administration', 00001),
		   (1, select `id` from `cs275`.`computers` where `serial` == 'mxl4040bkv',
		   	select `id` from `cs275`.`roles` where `name` == 'developer', 'njameel',
		   	'adfg5ightopi3850as', select `id` from `cs275`.`contacts` where `fname` == 'Nabeel',
 			'Developer', 'Code Development', 00111),
		   (1, select `id` from `cs275`.`computers` where `serial` == '2ua4161ljl',
		   	select `id` from `cs275`.`roles` where `name` == 'IT', 'kclay',
		   	'adfg5ightopi3850as', select `id` from `cs275`.`contacts` where `fname` == 'Kevin',
 			'Unix Administrator', 'Information Technology', 11111)

select * from `cs275`.`users` left join (`computer`) ON (`users`.`computer`=`computers`.`id`)