CREATE PROC Num_Copies

AS 

BEGIN

	SELECT Number_Of_Copies
	FROM Book_Copies
	INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
	WHERE Book_Copies.BookID = 2 AND Book_Copies.BranchID =1;

END
