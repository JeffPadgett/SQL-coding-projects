CREATE PROC Users_More_Than_5_Books

AS

BEGIN

SELECT Title, Number_Of_Copies
FROM Books
INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID
INNER JOIN Library_branch ON Book_Copies.BranchID = Library_Branch.BranchID
INNER JOIN Book_Authors ON Books_Authors.BookID = Books.BookID
WHERE AuthorName IS 'Stephan King' AND BranchName IS 'Central'


END