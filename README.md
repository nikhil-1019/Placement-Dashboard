# Experiment 9 – Placement Dashboard using Data Controls

**Aim:** Create Placement Dashboard using Data Controls.

This project recreates the ASP.NET Web Forms source shown in the supplied practical PDF:
- `Default.aspx` and `Default.aspx.cs` – placement dashboard and summary
- `Company.aspx` and `Company.aspx.cs` – company placement records and summary
- `PlacementDB.sql` – SQL Server database and sample data

## Important platform note
The practical uses **ASP.NET Web Forms (`.aspx`)** and **SQL Server LocalDB**. These are designed for Windows with the .NET Framework / Visual Studio Web Forms tooling. They do not run natively in Visual Studio for Mac or on macOS. Use a Windows machine/VM with IIS Express and SQL Server LocalDB (or SQL Server configured with an appropriate connection string).

## Setup on Windows
1. Open SQL Server Management Studio (or Visual Studio SQL Server Object Explorer).
2. Run `PlacementDB.sql` to create the database, tables, and sample records.
3. Create an **ASP.NET Web Forms (.NET Framework)** project named `Pr9PlacementDashboard`.
4. Add the four `.aspx` / `.aspx.cs` files from this folder to the project.
5. Ensure the namespace and page class names match `Pr9PlacementDashboard`.
6. If your SQL Server instance differs from LocalDB, update the `connectionString` in both code-behind files.
7. Set `Default.aspx` as the start page and run.

## Database tables
- `Students`: student details and placement status.
- `Placements`: company, role, package, and linked student.

The SQL script inserts three students and two placement records, matching the sample data in the PDF.
