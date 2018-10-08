CREATE PROC LostTribeOwnedByEachLibrary

AS 

BEGIN

SELECT Library_Branch.BranchName, book_copies.Number_Of_Copies
FROM Book_copies
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
INNER JOIN Books ON Book_Copies.BookID = Books.BookID
WHERE Book_copies.BookID = 2
GROUP BY Library_Branch.BranchID, Library_Branch.BranchName, Number_Of_Copies;


END
