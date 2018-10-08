CREATE PROC BORROWER_WHO_DUE_TODAY

AS

BEGIN

SELECT title, Name, Borrower.Address
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
INNER JOIN Books ON Book_Loans.BookID = Books.BookID
WHERE BranchID = 1 AND DateDue LIKE '2018-10-06%' /* Just enter in todays date before %*/


END