CREATE PROC Borrowers_NoBooks

AS 

BEGIN

SELECT Name
FROM Borrower
LEFT JOIN Book_loans ON Book_loans.CardNo = Borrower.CardNo
WHERE Book_Loans.CardNo IS NULL;

END
