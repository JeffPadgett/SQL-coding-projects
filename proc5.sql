CREATE PROC Total_Books_loaned_PerBranch

AS

BEGIN

SELECT BranchName, COUNT(Book_Loans.BookID)
FROM Library_Branch
INNER JOIN Book_Loans ON Book_loans.BranchID = Library_Branch.BranchID
GROUP BY BranchName


END