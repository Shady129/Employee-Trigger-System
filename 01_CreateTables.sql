CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Department NVARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE EmployeeAuditLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ActionType NVARCHAR(20) NOT NULL,
    OldSalary DECIMAL(10,2) NULL,
    NewSalary DECIMAL(10,2) NULL,
    ActionDate DATETIME NOT NULL DEFAULT GETDATE(),
    ModifiedBy NVARCHAR(100) NOT NULL,

);

INSERT INTO Employees (FirstName, LastName, Salary, Department)
VALUES 
('Ahmed', 'Ali', 8000, 'IT'),
('Sara', 'Hassan', 9500, 'HR'),
('Omar', 'Khaled', 7000, 'Finance');