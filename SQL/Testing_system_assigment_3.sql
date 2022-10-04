-- sử dụng database
USE Testing_System_Assigment_1;

-- Câu 1: Thêm dữ liệu 
-- đã thêm trong Testing_System_Assigment_2;

-- Câu 2: Lấy ra tất cả các phòng ban
SELECT * FROM `Department`;

-- Câu 3: Lấy ra id của phòng ban "Sale"
SELECT  DepartmentID FROM	`Department`
WHERE DepartmentName = 'Sale';

-- Câu 4: lấy ra thông tin account có full name dài nhất
SELECT * FROM `Account` 
WHERE FullName = (SELECT MAX(FullName) FROM `Account`);

-- Câu 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * FROM `Account` 
WHERE FullName = (SELECT MAX(FullName) FROM `Account`) AND DepartmentID = '3';

-- Câu 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Câu 7: Lấy ra ID của question có >= 4 câu trả lời
-- SELECT QuestionID FROM `Question`


-- Câu 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT ExamID FROM `Exam`
WHERE Duration >= '60' AND CreateDate < '2019-12-20';

-- Câu 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * FROM `Group`
ORDER BY CreateDate DESC LIMIT 5;

-- Câu 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(DepartmentID) FROM `Account`
WHERE DepartmentID = '2';

-- Câu 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT * FROM `Account`
WHERE FullName LIKE 'D%' AND FullName LIKE '%o' ;

-- Câu 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM `Exam`
WHERE CreateDate < '2019-12-20';

-- Câu 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `Question`
WHERE Content LIKE 'câu hỏi%';

-- Câu 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account` 
SET FullName = 'Nguyễn Bá Lộc' AND Email ='loc.nguyenba@vti.com.vn'
WHERE AccountID = '5';

-- Câu 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `GroupAccount` 
SET AccountID = '5'
WHERE GroupID = '4';

