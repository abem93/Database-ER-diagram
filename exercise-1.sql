-- Exercise 1

--     Objective: Insert data into a Customers table.
--     Table: Customers
--     Columns: CustomerID (int), Name (text), Email (text)
--     Task: Insert three new customers into the Customers table.
--     Data:
--         (1, 'Alice Johnson', 'alice.johnson@email.com')
--         (2, 'Bob Smith', 'bob.smith@email.com')
--         (3, 'Charlie Brown', 'charlie.brown@email.com')

CREATE TABLE Customers (
    CustomerID INT,
    [Name] varchar(255),
    Email TEXT
);

INSERT INTO Customers (
    CustomerID,
    [Name],
    Email
) VALUES 
    (1, 'Alice Johnson', 'alice.johnson@email.com'),
    (2, 'Bob Smith', 'bob.smith@email.com'),
    (3, 'Charlie Brown', 'charlie.brown@email.com')
;

-- Exercise 2

-- Continue from the previous exercises.

--     Objective: Update the email address of a specific customer.
--     Table: Customers
--     Task: Change the email address of the customer with CustomerID 2 to bob.smith@newdomain.com.

UPDATE Customers
SET Email = 'bob.smith@newdomain.com'
WHERE CustomerID = 2;


-- Exercise 3

--     Objective: Delete a customer from the Customers table.
--     Table: Customers
--     Task: Remove the customer with CustomerID 3 from the table.
--     Expected Outcome: The table should no longer include the customer with CustomerID 3.

DELETE FROM Customers
WHERE CustomerID = 3;

-- Exercise 4

--     Objective: Retrieve detailed order information.
--     Tables: Customers, Orders, Books
--     Task: Write a query to display the customer name, book title, and quantity for each order.
--     Expected Outcome: A list of all orders with customer names, book titles, and quantities.
SELECT Customer_name, Book_title, Quantity From customers
Join Books ON Customers.Book_ID = Book.Book_ID,

SELECT Customer_name, Book_title, Quantity FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Books ON Orders.book_id = Books.book_id;

-- Exercise 5

--     Objective: Normalize a denormalized table.
--     Table: StudentGrades (denormalized)
--     Columns: StudentID, Name, Subject, Grade
--     Task: Split the StudentGrades table into two tables: Students and Grades, ensuring normalization.
--     Expected Outcome: Two tables, Students with StudentID and Name columns, and Grades with StudentID, Subject, and Grade columns.


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    [Name] VARCHAR(255)
);

CREATE TABLE Grades (
    StudentID INT,
    [Subject] VARCHAR(255),
    Grade FLOAT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
