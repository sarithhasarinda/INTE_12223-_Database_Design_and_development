create database LibrarySystem;
use LibrarySystem;

create table Member
(
	memberNo varchar(10)not null,
    member_Name varchar(100),
    memberAddress varchar(255),
    telephoneNo char(10),
    primary key(memberNo)
);

create table Book
(
	ISBN varchar(10)not null,
    Title varchar(20),
    Author varchar(50),
    primary key(ISBN)
);

create table BookCopy
(
	bookCopyNo varchar(10)not null,
    purchaseDate date,
    price decimal,
	ISBN varchar(10),
    primary key(bookCopyNo),
    foreign key(ISBN) references Book(ISBN)
);

create table Reservation
(
	reservationNo varchar(10)not null,
    reservationDate date,
    memberNo varchar(10),
    ISBN varchar(10),
    primary key(reservationNo),
    foreign key(memberNo) references Member(memberNo),
    foreign key(ISBN) references Book(ISBN)
);

create table Borrow
(
	bookCopyNo varchar(10)not null,
    memberNo varchar(10)not null,
    loanDate date,
    dueDate date,
    returnDate date,
    primary key(bookCopyNo,memberNo),    
    foreign key(bookCopyNo) references BookCopy(bookCopyNo),
    foreign key(memberNo) references Member(memberNo)
);