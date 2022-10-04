-- xóa database nếu tồn tại
Drop DATABASE IF EXISTS Testing_System_Assigment_1;

-- tạo database
CREATE DATABASE Testing_System_Assigment_1;

-- sử dụng database vừa tạo
USE Testing_System_Assigment_1;

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
    AccountID VARCHAR(30) NOT NULL UNIQUE KEY,
    JoinDate DATE
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
    Creator DATE,
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
	ExamID TINYINT UNSIGNED PRIMARY KEY,
    QuestionID TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);
    
    

    
    