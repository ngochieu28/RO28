USE Testing_System_Assigment_1;

-- Câu 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW View_NVSALE AS
SELECT A.AccountID, A.FullName, D.DepartmentName
FROM `Account` A
JOIN Department D ON A.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sale';

SELECT * FROM View_NVSALE;

-- Câu 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW View_AM AS
SELECT COUNT(GA.AccountID) AS COUNTGA 
FROM GroupAccount GA
GROUP BY GA.AccountID

-- Câu 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
-- Câu 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
-- Câu 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo