-- Xóa database nếu tồn tại
Drop DATABASE IF EXISTS Testing_System_Assigment_1;

-- Tạo database
CREATE DATABASE Testing_System_Assigment_1;

-- Sử dụng database vừa tạo
USE Testing_System_Assigment_1;

-- Xóa bảng `Department` nếu có
DROP TABLE IF EXISTS `Department`;
-- Tạo bảng Department
CREATE TABLE `Department`(
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE KEY
);
  
-- Xóa bảng `Position` nếu có
DROP TABLE IF EXISTS `Position`;
-- Tạo bảng `Position`
CREATE TABLE `Position`(
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- Xóa bảng `Account` nếu có
DROP TABLE IF EXISTS `Account`;
-- Tạo bảng `Account`
CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email Varchar(255) NOT NULL UNIQUE KEY,
    Usename VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName VARCHAR(50) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES `Department`(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- Xóa bảng `Group` nếu có
DROP TABLE IF EXISTS `Group`;
-- Tạo bảng `Group`
CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(30) NOT NULL UNIQUE KEY,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW()
);
    
-- Xóa bảng `GroupAccount` nếu có
DROP TABLE IF EXISTS `GroupAccount`;
-- Tạo bảng `GroupAccount`
CREATE TABLE `GroupAccount`(
	GroupID TINYINT UNSIGNED,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

-- Xóa bảng `TypeQuestion` nếu có
DROP TABLE IF EXISTS `TypeQuestion`;
-- Tạo bảng `TypeQuestion`   
CREATE TABLE `TypeQuestion`(
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Xóa bảng `CategoryQuestion` nếu có
DROP TABLE IF EXISTS `CategoryQuestion`;
-- Tạo bảng `CategoryQuestion`      
CREATE TABLE `CategoryQuestion`(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL UNIQUE KEY
);

-- Xóa bảng `Question` nếu có
DROP TABLE IF EXISTS `Question`;
-- Tạo bảng `Question`   
CREATE TABLE `Question`(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL UNIQUE KEY,
    CategoryID TINYINT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion`(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES `TypeQuestion`(TypeID)
);

-- Xóa bảng `Answer` nếu có
DROP TABLE IF EXISTS `Answer`;
-- Tạo bảng `Answer`  
CREATE TABLE `Answer`(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255) NOT NULL UNIQUE KEY,
    QuestionID TINYINT UNSIGNED NOT NULL,
    isCorrect BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);

-- Xóa bảng `Exam` nếu có 
DROP TABLE IF EXISTS `Exam`;
-- Tạo bảng `Exam` 
CREATE TABLE `Exam`(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code VARCHAR(255) NOT NULL UNIQUE KEY,
    Title VARCHAR(255) NOT NULL UNIQUE KEY,
	CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion`(CategoryID)
);

-- Xóa bảng `ExamQuestion` nếu có
DROP TABLE IF EXISTS `ExamQuestion`;
-- Tạo bảng `ExamQuestion`
CREATE TABLE `ExamQuestion`(
	ExamID VARCHAR(10) PRIMARY KEY,
    QuestionID TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);
