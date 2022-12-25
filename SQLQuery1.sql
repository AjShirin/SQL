CREATE DATABASE my_Schooldb;

USE my_Schooldb;

CREATE TABLE School (
school_registeration INT,
school_name VARCHAR (50),
school_ID INT NOT NULL PRIMARY KEY,
location VARCHAR (50),
phone_numebr VARCHAR (13)
);

SELECT * FROM School;

CREATE TABLE Student (
student_ID INT NOT NULL PRIMARY KEY,
name varchar(50),
age TINYINT ,
gender VARCHAR (10),
Phone_Number VARCHAR (13),
email varchar(50),
school_ID INT REFERENCES School(school_ID)
);

SELECT * FROM Student;


CREATE TABLE Subject (
Subject_ID INT NOT NULL PRIMARY KEY,
Subject_name VARCHAR (25),
student_ID INT REFERENCES Student(student_ID)
);

SELECT * FROM Subject;

CREATE TABLE Mark (
mark_ID INT NOT NULL PRIMARY KEY,
mid_term_mark TINYINT,
mark_final TINYINT,
mark_Quiz1 TINYINT,
mark_Quiz2 TINYINT,
subject_ID INT REFERENCES Subject(subject_ID)
);

SELECT * FROM Mark;

CREATE TABLE Customers (
customer_ID INT NOT NULL PRIMARY KEY,
first_Name VARCHAR (50),
last_Name VARCHAR (50),
age TINYINT,
country VARCHAR (20),
);

SELECT * FROM Customers;

INSERT INTO Customers(Customer_ID,first_Name,last_Name,age,country)
VALUES(1,'Jhon','Doe',31,'USE'),(2,'Robert','Luna',22,'USA'),(3,'David','Robinson',22,'UK'),(4,'John','Renihardt',25,'UK'),(5,'Betty','Does',28,'UAE');

CREATE TABLE Oreders (
oreder_ID INT NOT NULL PRIMARY KEY,
item VARCHAR (30),
amount INT ,
customer_ID INT REFERENCES Customers(customer_ID)
);

SELECT * FROM Oreders;

INSERT INTO Oreders(oreder_ID ,item,amount,customer_ID)
VALUES(1,'Keyboard',400,4),(2,'Mouse',300,4),(3,'Monitor',12000,3),(4,'Keyboard',400,1),(5,'Mousepad',250,2);