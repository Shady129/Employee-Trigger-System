CREATE TRIGGER TR_Employees_Insert
ON Employees 

AFTER INSERT 


AS
BEGIN 

INSERT INTO EmployeeAuditLog(EmployeeID, ActionType, NewSalary,  ModifiedBy)
SELECT EmployeeID, 'Insert', Salary, 'SYSTEM'
FROM inserted

END;


INSERT INTO Employees (FirstName, LastName, Salary, Department)
VALUES ('Test2', 'User2', 6000, 'IT');


CREATE TRIGGER TR_Employees_Delete
ON Employees
AFTER DELETE

AS
BEGIN 

INSERT INTO EmployeeAuditLog(EmployeeID, ActionType, NewSalary,  ModifiedBy)
SELECT EmployeeID, 'Delete', Salary, 'SYSTEM'
FROM deleted

END


DELETE FROM Employees
WHERE EmployeeID = 1;




SELECT * FROM EmployeeAuditLog;




CREATE TRIGGER TR_Employees_Update
ON Employees

AFTER UPDATE 

AS
BEGIN 

INSERT INTO EmployeeAuditLog(EmployeeID, ActionType, OldSalary, NewSalary, ModifiedBy)
SELECT d.EmployeeID,'Update', d.Salary, i.Salary, 'System'
FROM inserted i
INNER JOIN deleted d
ON i.EmployeeID  = d.EmployeeID;

END




UPDATE Employees
SET Salary = 15000
WHERE EmployeeID = 3;

SELECT * FROM EmployeeAuditLog;







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