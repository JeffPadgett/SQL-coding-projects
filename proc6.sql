CREATE PROC Users_More_Than_5_Books

AS

BEGIN

SELECT Name, Address, COUNT(Book_loans.BookID)
FROM Borrower
INNER JOIN Book_Loans ON Borrower.Cardno = Book_Loans.CardNo
INNER JOIN Books ON Books.BookID = Book_Loans.BookID
Group BY Name, Address
HAVING COUNT(Book_loans.BookID) > 5


END