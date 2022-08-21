Create database Truong_Java5
go
use Truong_Java5
go

create table staff(
	staffId int identity(1,1) primary key,
	fullname nvarchar(30),
	username varchar(20),
	password varchar(20),
	birthday date,
	gender bit,
	phone varchar(12),
	email varchar(50),
	address nvarchar(100),
	admin bit,
	isDeleted bit

);

go 

create table customer(
	customerId int identity(1,1) primary key,
	customerName nvarchar(30),
	username varchar(20),
	password varchar(20),
	birthday date,
	email varchar(50),
	phone varchar(12),
	address nvarchar(100),
	gender bit,
	image nvarchar(100)

);

go

create table brand(
	brandId int identity(1,1) primary key,
	brandName nvarchar(100)
);

go

create table product(
	productId int identity(1,1) primary key,
	productName nvarchar(100),
	description nvarchar(100),
	price int,
	dateSubmited date,
	quantity int,
	previousImg nvarchar(100),
	backSidePhoto nvarchar(100),
	brandId int CONSTRAINT fk_product_brand FOREIGN KEY (brandId) REFERENCES brand(brandId),
	username varchar(30),
	isDeleted bit,
);

go

create table bill(
	billId int identity(1,1) primary key,
	customerId int CONSTRAINT fk_bill_customer FOREIGN KEY (customerId) REFERENCES customer(customerId),
	billDate date,
	staffId int CONSTRAINT fk_bill_staff FOREIGN KEY (staffId) REFERENCES staff (staffId),
	isDeleted bit
);

go

create table billDetails(
	billId int,
	productId int CONSTRAINT fk_billDetails_product FOREIGN KEY (productId) REFERENCES product(productId),
	quantity int
);

go

create table comment(
	commentId int identity(1,1) primary key,
	content nvarchar(100),
	productId int CONSTRAINT fk_comment_product FOREIGN KEY (productId) REFERENCES product(productId),
	customerId int CONSTRAINT fk_comment_customer FOREIGN KEY (customerId) REFERENCES customer(customerId),
	cmtDate date,
	isDeleted bit
);

go

create table promotionalCode(
	promotionalCodeId int identity(1,1) primary key,
	brandId int CONSTRAINT fk_promotonalCode_brand FOREIGN KEY (brandId) REFERENCES brand(brandId),
	promotionalCodeDate date,
	percentageReduction int,
	code varchar(10)
);

insert into brand(brandName) values('SWE')
insert into brand(brandName) values('Degrey')
insert into brand(brandName) values('Hades')

insert into staff values(N'Phan Nguyễn Đăng Trường','truongpnd','123','2002-08-08', 0,'0939195150','pndangtruong@gmail.com',N'1072 Lê Đức Thọ, F13, quận Gò Vấp',1,0)
insert into staff values(N'Nguyễn Lê Duy Tiến','tiennld','123','2002-01-08', 0,'093919123','tiennld@gmail.com',N'123 Tô Ký phường Trung Mỹ Tây, quận 12',0,0)

insert into customer values(N'Nguyễn Thanh Vũ','vunt','123','2003-02-04','vunt@gmail.com','0931234521',N'364/1M Dương Quảng Hàm P5 quận Gò Vấp',1,'vunt.jpg')
insert into customer values(N'Nguyễn Đăng Chường','ndc','123','2002-06-30','pndangtruong@gmail.com','0939195150',N'323 Phan Huy Ích quận Gò Vấp',1,'truong.jpg')


insert into product values('INTL TEE - PINK',N'Áo hồng cá tính',375,'2022-05-23',100,'tee-pink-truoc.jpg','tee-pink-sau.jpg',1,'truongpnd',0)
insert into product values('INTL TEE - BLACK',N'Áo đen năng động',325,'2022-05-23',100,'tee-black-truoc.jpg','tee-black-sau.jpg',1,'truongpnd',0)
insert into product values('CUBE SMOKE TEE - BLACK',N'Áo đen cá tính',355,'2022-05-23',100,'cubesmoketee-black-truoc.jpg','cubesmoketee-black-sau.jpg',1,'tiennld',0)
insert into product values('CUBE COACH JACKET - BLACK',N'Áo khoát cá tính',375,'2022-05-23',200,'CUBECOACHJACKET-BLACK-truoc.jpg','CUBECOACHJACKET-black-sau.jpg',1,'truongpnd',0)
insert into product values('CUBE SMOKE TEE - WHITE',N'Áo trắng',355,'2022-05-23',100,'CUBESMOKETEE-WHITE-truoc.jpg','CUBESMOKETEE-WHITE-sau.jpg',1,'truongpnd',0)
insert into product values('THUNDER TEE - BLACK',N'Áo thun đen',355,'2022-05-23',100,'THUNDERTEE-BLACK-truoc.jpg','THUNDERTEE-BLACK-sau.jpg',1,'truongpnd',0)
insert into product values('90S TEE - BLACK',N'Áo thun đen cá tính',340,'2022-05-23',100,'90STEE-BLACK-truoc.jpg','90STEE-BLACK-sau.jpg',1,'truongpnd',0)
insert into product values('SMOKE JACKET',N'Áo khoát cá tính',560,'2022-05-23',100,'SMOKEJACKET-truoc.jpg','SMOKEJACKET-sau.jpg',1,'truongpnd',0)
insert into product values('CUBE SMOKE TEE - BLACK',N'Áo thun cá tính',355,'2022-05-23',140,'CUBESMOKETEE-BLACK-truoc.jpg','CUBESMOKETEE-BLACK-sau.jpg',1,'truongpnd',0)
insert into product values('CUBE COACH JACKET - BLACK',N'Áo khoát năng động',375,'2022-05-23',100,'CUBECOACHJACKET-BLACK-truoc.jpg','CUBECOACHJACKET-BLACK-sau.jpg',1,'truongpnd',0)


insert into promotionalCode values(1,'2022-05-30',30,'CMSN')
insert into promotionalCode values(1,'2022-05-30',30,'CMSN')
insert into promotionalCode values(2,'2022-05-30',30,'CMSN')
insert into promotionalCode values(2,'2022-05-30',30,'CMSN')
insert into promotionalCode values(3,'2022-05-30',30,'CMSN')