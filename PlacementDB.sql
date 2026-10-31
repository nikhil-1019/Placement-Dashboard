CREATE DATABASE PlacementDB;
GO

USE PlacementDB;
GO

CREATE TABLE Students
(
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentNo VARCHAR(20),
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    PassingYear INT,
    IsPlaced BIT DEFAULT 0
);
GO

CREATE TABLE Placements
(
    PlacementId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT UNIQUE,
    CompanyName VARCHAR(100),
    JobRole VARCHAR(100),
    PackageLPA DECIMAL(6,2),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
);
GO

INSERT INTO Students
    (EnrollmentNo, StudentName, Department, PassingYear, IsPlaced)
VALUES
    ('CE001', 'Aarav Patel', 'CE', 2026, 1),
    ('CE002', 'Riya Shah', 'CE', 2026, 1),
    ('CE003', 'Rahul Patel', 'CE', 2026, 0);
GO

INSERT INTO Placements
    (StudentId, CompanyName, JobRole, PackageLPA)
VALUES
    (1, 'TCS', 'Software Developer', 4.50),
    (2, 'Infosys', 'System Engineer', 5.00);
GO

SELECT * FROM Students;
SELECT * FROM Placements;
