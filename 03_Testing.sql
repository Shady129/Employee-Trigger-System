-- INSERT
INSERT INTO Employees (FirstName, LastName, Salary, Department)
VALUES ('Final', 'Test', 9000, 'IT');

-- UPDATE
UPDATE Employees
SET Salary = 20000
WHERE FirstName = 'Final';

-- DELETE
DELETE FROM Employees
WHERE FirstName = 'Final';

SELECT * FROM EmployeeAuditLog;