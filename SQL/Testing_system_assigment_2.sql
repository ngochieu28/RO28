-- xóa database nếu tồn tại
Drop DATABASE Testing_system_assigment_2;

-- tạo database
CREATE DATABASE Testing_System_Assigment_2;

-- sử dụng database vừa tạo
USE Testing_System_Assigment_2;

-- xóa bảng `Department` nếu có
DROP TABLE IF EXISTS `Department`;
-- tạo bảng Department
CREATE TABLE `Department`(
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY
);
  
-- xóa bảng `Position` nếu có
DROP TABLE IF EXISTS `Position`;
-- tạo bảng `Position`
CREATE TABLE `Position`(
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum','Mater','PM') NOT NULL UNIQUE KEY
);

-- xóa bảng `Account` nếu có
DROP TABLE IF EXISTS `Account`;
-- tạo bảng `Account`
CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email Varchar(30),
    Usename VARCHAR(30),
    FullName VARCHAR(30) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES `Department`(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- xóa bảng `Group` nếu có
DROP TABLE IF EXISTS `Group`;
-- tạo bảng `Group`
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(30) NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE
);
    
-- xóa bảng `GroupAccount` nếu có
DROP TABLE IF EXISTS `GroupAccount`;
-- tạo bảng `GroupAccount`
CREATE TABLE `GroupAccount`(
	GroupID TINYINT UNSIGNED,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATE,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

-- xóa bảng `TypeQuestion` nếu có
DROP TABLE IF EXISTS `TypeQuestion`;
-- tạo bảng `TypeQuestion`   
CREATE TABLE `TypeQuestion`(
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(30) NOT NULL
);

-- xóa bảng `CategoryQuestion` nếu có
DROP TABLE IF EXISTS `CategoryQuestion`;
-- tạo bảng `CategoryQuestion`      
CREATE TABLE `CategoryQuestion`(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL
);

-- xóa bảng `Question` nếu có
DROP TABLE IF EXISTS `Question`;
-- tạo bảng `Question`   
CREATE TABLE `Question`(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100),
    CategoryID TINYINT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreatorDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion`(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES `TypeQuestion`(TypeID)
);

-- xóa bảng `Answer` nếu có
DROP TABLE IF EXISTS `Answer`;
-- tạo bảng `Answer`  
CREATE TABLE `Answer`(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100),
    QuestionID TINYINT UNSIGNED NOT NULL,
    isCorrect BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);

-- xóa bảng `Exam` nếu có 
DROP TABLE IF EXISTS `Exam`;
-- tạo bảng `Exam` 
CREATE TABLE `Exam`(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code1 VARCHAR(30) NOT NULL,
    Title VARCHAR(100) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TIME,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion`(CategoryID)
);

-- xóa bảng `ExamQuestion` nếu có
DROP TABLE IF EXISTS `ExamQuestion`;
-- tạo bảng `ExamQuestion`
CREATE TABLE `ExamQuestion`(
	ExamID VARCHAR(10) PRIMARY KEY,
    QuestionID TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);

-- thêm dữ liệu cho bảng `Department`   
INSERT INTO `Department` (DepartmentName)
VALUES  ('Marketing'),
		('Sale'),
        ('IT'),
        ('HR'),
        ('Accounting');

-- thêm dữ liệu cho bảng `Position`          
INSERT INTO `Position` ( PositionName)
VALUES  ('Dev'),
		('Test'),
        ('Mater'),
        ('PM');

-- thêm dữ liệu cho bảng `Account`         
INSERT INTO `Account` (Email,Usename,FullName,DepartmentID,PositionID,CreateDate)
VALUES  ('Nv1@gmail.com','Nv1','NhanVien1','1','2','2011-1-1'),
		('Nv2@gmail.com','Nv2','NhanVien2','3','4','2012-2-2'),
        ('Nv3@gmail.com','Nv3','NhanVien3','1','3','2013-3-3'),
        ('Nv4@gmail.com','Nv4','NhanVien4','2','4','2014-4-4'),
        ('Nv5@gmail.com','Nv5','NhanVien5','1','4','2015-5-5'),
        ('Nv6@gmail.com','Nv6','NhanVien6','2','3','2016-6-6'),
        ('Nv7@gmail.com','Nv7','NhanVien7','5','1','2017-7-7'),
        ('Nv8@gmail.com','Nv8','NhanVien8','5','2','2018-8-8'),
        ('Nv9@gmail.com','Nv9','NhanVien9','5','3','2019-9-9'),
        ('Nv10@gmail.com','Nv10','NhanVien10','5','4','2020-10-10');

-- thêm dữ liệu cho bảng `Group` 
INSERT INTO `Group` (GroupName,CreatorID,CreateDate)
VALUES  ('Group1','01','2011-1-1'),
		('Group2','02','2012-2-2'),
        ('Group3','03','2013-3-3'),
        ('Group4','04','2014-4-4'),
        ('Group5','05','2015-5-5');

-- thêm dữ liệu cho bảng `GroupAccount`          
INSERT INTO `GroupAccount` (AccountID,JoinDate)
VALUE   ('1','2011-1-1'),
		('3','2013-3-3'),
        ('2','2012-2-2'),
        ('5','2015-5-5'),
        ('7','2017-7-7'),
        ('9','2019-9-9'),
        ('2','2012-2-2'),
        ('4','2014-4-4'),
        ('6','2016-6-6'),
        ('8','2018-8-8'),
		('10','2020-10-10'),
        ('4','2014-4-4');
-- thêm dữ liệu cho bảng `TypeQuestion`  
INSERT INTO `TypeQuestion` (TypeName)
VALUE   ('Type1'),
		('Type2'),
        ('Type3'),
        ('Type4'),
        ('Type5'),
        ('Type6'),
        ('Type7'),
        ('Type8'),
        ('Type9');

-- thêm dữ liệu cho bảng `CategoryQuestion`          
INSERT INTO `CategoryQuestion` (CategoryName)
VALUE   ('Category1'),
		('Category2'),
        ('Category3');

-- thêm dữ liệu cho bảng `Question`        
INSERT INTO `Question` (Content,CreatorID,CategoryID,TypeID,CreatorDate)
VALUES  ('Content1','01','1','2','2011-1-1'),
		('Content2','02','2','5','2012-2-2'),
        ('Content3','03','3','9','2013-3-3'),
        ('Content4','04','2','8','2014-4-4'),
        ('Content5','05','1','4','2015-5-5');

-- thêm dữ liệu cho bảng Answer`		
INSERT INTO `Answer` (Content,QuestionID,isCorrect)
VALUES  ('Answer1','1',1),
		('Answer2','2',1),
        ('Answer3','3',0),
        ('Answer4','4',1),
        ('Answer5','1',0),
        ('Answer6','2',1),
        ('Answer7','3',1),
        ('Answer8','5',0),
        ('Answer9','2',1),
        ('Answer10','1',1),
        ('Answer11','4',0);

-- thêm dữ liệu cho bảng `Exam`        
INSERT INTO `Exam` (Code1,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES  ('M01','Title1','1','19:30:00','01','2011-1-1'),
		('M02','Title1','2','19:30:00','04','2011-1-1'),
        ('M03','Title1','3','19:30:00','03','2011-1-1'),
        ('M04','Title1','3','19:30:00','05','2011-1-1'),
        ('M05','Title1','1','19:30:00','02','2011-1-1'),
        ('M06','Title1','2','19:30:00','03','2011-1-1'),
        ('M07','Title1','2','19:30:00','05','2011-1-1'),
        ('M08','Title1','1','19:30:00','02','2011-1-1');

-- thêm dữ liệu cho bảng `ExamQuestion`
INSERT INTO `ExamQuestion` (ExamID,QuestionID)
VALUES  ('E1','1'),
		('E2','4'),
        ('E3','2'),
        ('E4','4'),
        ('A1','5'),
        ('A2','2'),
        ('A3','3'),
        ('A4','1');
		
		

    
    