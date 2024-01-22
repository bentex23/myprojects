SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS CAMPUS;
DROP TABLE IF EXISTS ROOM;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS INSTRUCTOR;
DROP TABLE IF EXISTS APPROVED_INSTRUCTOR;
DROP TABLE IF EXISTS CLASS;
DROP TABLE IF EXISTS STUDENT_GRADE;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE STUDENT(
STUDENT_ID   INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
Last_Name    VARCHAR(30) NOT NULL,
First_Name   VARCHAR(30) NOT NULL,
Address      VARCHAR(40),
ZIP          VARCHAR(10),
MAJOR        VARCHAR(20),
CLASS       int(2),
STATUS       VARCHAR(20));

INSERT INTO STUDENT (Last_Name, First_Name, Address, ZIP, MAJOR, CLASS, STATUS) 
	VALUES('Morote','Italo','P.O. Box 619, 5808 Semper St.','32828','MATHEMATICS',2,'FAILING'); 
INSERT INTO STUDENT (Last_Name, First_Name, Address, ZIP, MAJOR, CLASS, STATUS) 
	VALUES('Martin','Yacky','313-6948 Nunc, Ave','36702','SPANISH',3,'SATISFACTORY');
INSERT INTO STUDENT (Last_Name, First_Name, Address, ZIP, MAJOR, CLASS, STATUS) 	
	VALUES('Yostin','Duglas','Ap #593-8291 Id St.','26151','BUSINESS',1,'SATISFACTORY');
INSERT INTO STUDENT (Last_Name, First_Name, Address, ZIP, MAJOR, CLASS, STATUS) 
	VALUES('Dasti','Cosimel','328-4572 Elit Rd.','95886','SPANISH',2,'FAILING');
INSERT INTO STUDENT (Last_Name, First_Name, Address, ZIP, MAJOR, CLASS, STATUS) 
	VALUES('Dixon','Steve','Ap #547-7314 Feugiat. Street','42756','PHIL',1,'FAILING');


CREATE TABLE CAMPUS
(
Campus_Name  VARCHAR(45) NOT NULL,
Address      VARCHAR(40),
ZIP          VARCHAR(10),
PHONE_NO     VARCHAR(20),
UNIQUE(Campus_Name),
PRIMARY KEY(Campus_Name)
);

INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('New York Campus','405-6298 In Street','62840','1-639-674-3520'); 
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Chicago','820-7808 Risus, Rd.','51852','1-824-430-8362'); 
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('San Francisco Campus','505-182 Luctus, Ave','21345','1-460-439-2331');
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Seattle Campus','P.O. Box 215, 1469 Eu Rd.','52681','1-448-789-7971');
INSERT INTO CAMPUS (CAMPUS_NAME, Address, ZIP, PHONE_NO)
	VALUES('Washington Campus','631-5139 Leo. St.','29402','1-282-625-5720');


CREATE TABLE ROOM
(
Campus_Name  VARCHAR(45),
ROOM_NO      int,
FACILITY     VARCHAR(45),
CAPACITY     int(3),
Id           VARCHAR(45),
PRIMARY KEY (ROOM_NO, Campus_Name),
FOREIGN KEY (Id) REFERENCES CAMPUS(Campus_Name) ON UPDATE CASCADE
);

INSERT INTO ROOM(Campus_Name,ROOM_NO,FACILITY,CAPACITY)	
	VALUES('New York Campus','6','Lloydminster',30);
INSERT INTO ROOM(Campus_Name,ROOM_NO,FACILITY,CAPACITY)	
	VALUES('Chicago','19','Erode',32);
INSERT INTO ROOM(Campus_Name,ROOM_NO,FACILITY,CAPACITY)	
	VALUES('San Francisco Campus','40','Cantalupo in Sabina',38);
INSERT INTO ROOM(Campus_Name,ROOM_NO,FACILITY,CAPACITY)	
	VALUES('Seattle','40','Assiniboia',25);
INSERT INTO ROOM(Campus_Name,ROOM_NO,FACILITY,CAPACITY)	
	VALUES('Washington Campus','23','Kessenich',42);


CREATE TABLE COURSE
(
Course_No    INT  PRIMARY KEY,
Course_Name  Varchar(25) UNIQUE NOT NULL,
CreditHours  int(2) CHECK (CreditHours BETWEEN 1 AND 4)
);

INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('1043','TECH121',1);
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('1006','Psy101',3);
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('1696','Psy102',2);
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('1291','HUM234',2);
INSERT INTO COURSE(Course_No,Course_Name,CreditHours)	
	VALUES('1841','Psy103',3);


CREATE TABLE INSTRUCTOR
(
INSTRUCTOR_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
LAST_NAME     VARCHAR(30) NOT NULL,
FIRST_NAME    VARCHAR(20) NOT NULL,
ADDRESS       VARCHAR(40),
ZIP           VARCHAR(10),
OFFICE_NO     VARCHAR(10)

);

INSERT INTO INSTRUCTOR(Instructor_ID,FIRST_NAME,LAST_NAME,ADDRESS,ZIP,OFFICE_NO)
	VALUES('400','Thane','Puckett','P.O. Box 895, 191 Erat Rd.','53841','30');
INSERT INTO INSTRUCTOR(Instructor_ID,FIRST_NAME,LAST_NAME,ADDRESS,ZIP,OFFICE_NO)
	VALUES('737','Jared','Tate','Ap #177-1334 Faucibus St.','88675','21');
INSERT INTO INSTRUCTOR(Instructor_ID,FIRST_NAME,LAST_NAME,ADDRESS,ZIP,OFFICE_NO)
	VALUES('640','Yuli','Hurst','Ap #799-5088 Scelerisque St.','26162','12');
INSERT INTO INSTRUCTOR(Instructor_ID,FIRST_NAME,LAST_NAME,ADDRESS,ZIP,OFFICE_NO)
	VALUES('256','Micah','Pace','P.O. Box 638, 2109 Adipiscing Rd.','40665','12');
INSERT INTO INSTRUCTOR(Instructor_ID,FIRST_NAME,LAST_NAME,ADDRESS,ZIP,OFFICE_NO)
	VALUES('741','Kasper','Duran','565-193 Nunc Avenue','55756','17');


CREATE TABLE APPROVED_INSTRUCTOR
(
Instructor_ID INTEGER NOT NULL, 
Id            Int,
Course_No     Int NOT NULL,
PRIMARY KEY (Instructor_ID, Course_No), 
FOREIGN KEY (Instructor_ID) REFERENCES INSTRUCTOR (Instructor_ID),
FOREIGN KEY (Id) REFERENCES COURSE(Course_No) ON UPDATE CASCADE
);
 
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('400','1044');
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('737','1528');
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('640','1324');
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('256','1842');
INSERT INTO APPROVED_INSTRUCTOR(Instructor_ID, Course_No)
	VALUES('741','1006');


Create TABLE CLASS
(
Class_id      INT AUTO_INCREMENT NOT NULL,
Course_No     VARCHAR(10) NOT NULL,
Section_No    VARCHAR(10),
Semester_Name Varchar(15),
Years          VARCHAR(4),
Instructor_ID VARCHAR(10) NOT NULL,
Campus_Name   Varchar(45),
Room_No       int,
Start_Date    Date,
Start_Time    Time,
UNIQUE (Class_id),
PRIMARY KEY (Class_id, Room_No),
FOREIGN KEY(Room_No) REFERENCES ROOM(Room_No) ON UPDATE CASCADE 
);
INSERT INTO CLASS(Class_ID,Campus_Name,Room_No,Course_No,Semester_Name,Instructor_ID,Start_Date,Start_Time,Section_No,Years)
	VALUES('12408','New York Campus','6','1044','Fall','499','2014-10-08','8:00','10','2014');
INSERT INTO CLASS(Class_ID,Campus_Name,Room_No,Course_No,Semester_Name,Instructor_ID,Start_Date,Start_Time,Section_No,Years)
	VALUES('15716','Chicago Campus','19','1006','Other','639','2014-10-08','8:00','17','2014');
INSERT INTO CLASS(Class_ID,Campus_Name,Room_No,Course_No,Semester_Name,Instructor_ID,Start_Date,Start_Time,Section_No,Years)
	VALUES('12525','San Francisco Campus','40','1291','	Other','767','2014-10-08','8:00','18','2014');
INSERT INTO CLASS(Class_ID,Campus_Name,Room_No,Course_No,Semester_Name,Instructor_ID,Start_Date,Start_Time,Section_No,Years)
	VALUES('16500','Seattle Campus','40','1696','Winter','937','2015-01-03','8:00','19','2014');
INSERT INTO CLASS(Class_ID,Campus_Name,Room_No,Course_No,Semester_Name,Instructor_ID,Start_Date,Start_Time,Section_No,Years)
	VALUES('19047','Washington Campus','23','1291','Winter','280','2015-01-03','8:00','14','2014');




CREATE TABLE STUDENT_GRADE
(
Student_ID  INTEGER NOT NULL AUTO_INCREMENT,
Class_ID      INT,
Student_Grade CHAR (1) CHECK (Student_Grade IN ('A','B','C','D','F','I','W','E')),
PRIMARY KEY (Student_ID, Class_ID),
FOREIGN KEY(Student_ID) REFERENCES STUDENT(Student_ID) ON UPDATE CASCADE,
FOREIGN KEY(Class_ID) REFERENCES CLASS(Class_ID) ON UPDATE CASCADE
);
INSERT INTO STUDENT_GRADE(Student_ID,Class_ID,Student_Grade)
	VALUES('1','12408','A');
INSERT INTO STUDENT_GRADE(Student_ID,Class_ID,Student_Grade)
	VALUES('2','15716','B');
INSERT INTO STUDENT_GRADE(Student_ID,Class_ID,Student_Grade)
    VALUES('3','12525','C');
INSERT INTO STUDENT_GRADE(Student_ID,Class_ID,Student_Grade)
    VALUES('4','16500','D');
INSERT INTO STUDENT_GRADE(Student_ID,Class_ID,Student_Grade)
    VALUES('5','19047','F');
Commit;

SHOW TABLES;
SELECT * FROM STUDENT;
SELECT * FROM CAMPUS;
SELECT * FROM ROOM;
SELECT * FROM COURSE;
SELECT * FROM INSTRUCTOR;
SELECT * FROM APPROVED_INSTRUCTOR;
SELECT * FROM CLASS;
SELECT * FROM STUDENT_GRADE;
