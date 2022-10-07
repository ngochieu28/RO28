-- sử dụng database
USE Testing_System_Assigment_1;

-- Câu 1 Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT Department.DepartmentName, Account.AccountID, Account.Email, Account. Usename, Account.FullName ,Account.PositionID, Account.CreateDate
FROM Department
INNER JOIN Account on Department.DepartmentID = Account.DepartmentID;

-- Câu 2 Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * FROM `Account`
WHERE CreateDate > '2010-12-20';

-- Câu 3 Viết lệnh để lấy ra tất cả các developer
SELECT Account.AccountID, Account.FullName, Position.PositionName
FROM `Account`
JOIN `Position` ON Position.PositionID = Account.PositionID 
WHERE Position.PositionID = '1';

-- Câu 4 Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT Department.DepartmentName, COUNT(Department.DepartmentID) AS SL
FROM `Account`
JOIN Department ON Department.DepartmentID = Account.DepartmentID
GROUP BY Department.DepartmentID
HAVING COUNT(Department.DepartmentID) > 3;

-- CÂU 5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
WITH `CTE_COUNT_Q` as(
	SELECT Q.QuestionID, Q.Content, COUNT(Q.QuestionID) AS SL
    FROM `Question` Q
    JOIN `ExamQuestion` EQ ON Q.QuestionID = EQ.QuestionID
    GROUP BY EQ.QuestionID
)
    SELECT * FROM cte_t;


-- CÂU 6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT CQ.CategoryName, CQ.CategoryID, COUNT(Q.CategoryID) AS SL
FROM `CategoryQuestion` CQ
JOIN `Question` Q ON Q.CategoryID = CQ.CategoryID
GROUP BY Q.CategoryID;

-- Câu 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.QuestionID, Q.Content , COUNT(EQ.QuestionID) AS SL
FROM Examquestion EQ
RIGHT JOIN Question Q ON Q.QuestionID = EQ.QuestionID
GROUP BY Q.QuestionID;

-- Câu 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.QuestionID, Q.Content, COUNT(A.QuestionID) FROM Answer A
JOIN Question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING COUNT(A.QuestionID) = (SELECT MAX(CountQuestion) 
	FROM(
		 SELECT COUNT(B.QuestionID) AS CountQuestion 
		 FROM Answer B
		 GROUP BY B.QuestionID) AS CountAnswer);

-- Câu 9: Thống kê số lượng account trong mỗi group
SELECT G.GroupID, COUNT(GA.AccountID) AS 'SO LUONG'
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID;

-- Câu 10: Tìm chức vụ có ít người nhất
SELECT P.PositionID, P.PositionName, COUNT(A.PositionID) AS SL 
FROM `Account` A
INNER JOIN Position P ON A.PositionID = P.PositionID
GROUP BY A.PositionID
HAVING COUNT(A.PositionID)=(SELECT MIN(MINP) 
	FROM(
	SELECT COUNT(B.PositionID) AS MINP FROM `Account` B
	GROUP BY B.PositionID) AS MINAP);

-- Câu 11:Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT D.DepartmentID,D.DepartmentName, P.PositionName, COUNT(P.PositionName) AS SL
FROM `Account` A
JOIN Department D ON A.DepartmentID = D.DepartmentID
JOIN Position P ON A.PositionID = P.PositionID
GROUP BY d.DepartmentID, p.PositionID;

-- Câu 12:Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS Author, ANS.Content 
FROM Question Q
JOIN Categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
JOIN Typequestion TQ ON Q.TypeID = TQ.TypeID
JOIN `Account` A ON A.AccountID = Q.CreatorID
JOIN Answer AS ANS ON Q.QuestionID = ANS.QuestionID;

-- Câu 13:Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS SL 
FROM Question Q
JOIN Typequestion TQ ON Q.TypeID = TQ.TypeID
GROUP BY Q.TypeID;

-- Câu 14: Lấy ra group không có account nào
SELECT * FROM `Group` G
LEFT JOIN Groupaccount GA ON g.GroupID = GA.GroupID
WHERE GA.AccountID IS NULL;

-- Câu 15: Lấy ra question không có answer nào
SELECT * FROM Question Q
LEFT JOIN Answer A ON q.QuestionID = A.QuestionID
WHERE A.AnswerID IS NULL;
-- Câu 16:
	-- a) Lấy các account thuộc nhóm thứ 1
SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GroupID = 1;

    -- b) Lấy các account thuộc nhóm thứ 2
SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GroupID = 2;

    -- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GroupID = 1

UNION

SELECT A.AccountID, A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GroupID = 2;

-- Câu 17:
	-- a) Lấy các group có lớn hơn 5 thành viên
SELECT G.GroupName, COUNT(GA.GroupID) AS SL 
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
HAVING SL >= 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT G.GroupName, COUNT(GA.GroupID) AS SL 
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
HAVING SL <= 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT G.GroupName, COUNT(GA.GroupID) AS SL 
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
HAVING SL >= 5

UNION

SELECT G.GroupName, COUNT(GA.GroupID) AS SL 
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
HAVING SL <= 7;





