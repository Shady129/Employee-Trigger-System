CREATE TRIGGER TR_Employees_Insert
ON Employees 

AFTER INSERT 

AS
BEGIN 

INSERT INTO EmployeeAuditLog(EmployeeID, ActionType, NewSalary,  ModifiedBy)
SELECT EmployeeID, 'Insert', Salary, 'SYSTEM'
FROM inserted

END;




CREATE TRIGGER TR_Employees_Delete
ON Employees
  
AFTER DELETE

AS
BEGIN 

INSERT INTO EmployeeAuditLog(EmployeeID, ActionType, NewSalary,  ModifiedBy)
SELECT EmployeeID, 'Delete', Salary, 'SYSTEM'
FROM deleted

END;






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

END;







