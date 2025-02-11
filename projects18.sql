CREATE DATABASE EmployeeManagement;
GO
USE EmployeeManagement;
GO
CREATE TABLE Departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255)
);
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    position VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    CONSTRAINT FK_Department FOREIGN KEY (department_id) 
    REFERENCES Departments(department_id) ON DELETE SET NULL
);
CREATE TABLE Salaries (
    salary_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10,2) NOT NULL,
    salary_date DATE NOT NULL,
    CONSTRAINT FK_Employee FOREIGN KEY (employee_id) 
    REFERENCES Employees(employee_id) ON DELETE CASCADE
);
-- Insert Departments
INSERT INTO Departments (name, location) VALUES
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago');

-- Insert Employees
INSERT INTO Employees (name, email, position, department_id, salary) VALUES
('John Doe', 'john.doe@example.com', 'Software Engineer', 2, 70000.00),
('Jane Smith', 'jane.smith@example.com', 'HR Manager', 1, 80000.00),
('Emily Johnson', 'emily.johnson@example.com', 'Accountant', 3, 60000.00);

-- Insert Salaries
INSERT INTO Salaries (employee_id, amount, salary_date) VALUES
(1, 70000.00, '2024-01-01'),
(2, 80000.00, '2024-01-01'),
(3, 60000.00, '2024-01-01');
-- View all employees with department details
SELECT e.employee_id, e.name, e.email, e.position, d.name AS department, e.salary
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;

-- View Salary History
SELECT s.salary_id, e.name, s.amount, s.salary_date
FROM Salaries s
JOIN Employees e ON s.employee_id = e.employee_id;
