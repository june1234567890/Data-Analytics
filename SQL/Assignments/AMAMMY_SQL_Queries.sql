1. Create a table called Students with columns as shown above.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    GradeLevel VARCHAR(10),
    School VARCHAR(100),
    City VARCHAR(50),
    AverageScore DECIMAL(5,1)
);


2. Insert the sample records provided into the Students table

INSERT INTO Students (StudentID, Name, Age, Gender, GradeLevel, School, City, AverageScore) VALUES
(1, 'Alice Njeri', 16, 'Female', 'Form 2', 'Green Hill Academy', 'Nairobi', 78.5),
(2, 'Brian Otieno', 17, 'Male', 'Form 3', 'Kisumu Boys High', 'Kisumu', 84.3),
(3, 'Cynthia Wambui', 15, 'Female', 'Form 2', 'Ridgeways Girls', 'Nairobi', 91.0),
(4, 'David Mwangi', 16, 'Male', 'Form 2', 'Alliance High', 'Kikuyu', 74.0),
(5, 'Eva Akinyi', 18, 'Female', 'Form 4', 'Moi Girls Eldoret', 'Eldoret', 88.2),
(6, 'Felix Kiptoo', 17, 'Male', 'Form 3', 'Kapsabet Boys', 'Kapsabet', 82.7),
(7, 'Grace Muthoni', 14, 'Female', 'Form 1', 'Starehe Girls', 'Thika', 77.1),
(8, 'Hassan Abdalla', 15, 'Male', 'Form 2', 'Mombasa Secondary', 'Mombasa', 69.8),
(9, 'Irene Cherono', 16, 'Female', 'Form 3', 'Kabarak High', 'Nakuru', 86.4),
(10, 'John Kamau', 17, 'Male', 'Form 4', 'Lenana School', 'Nairobi', 80.0),
(11, 'Kevin Omondi', 15, 'Male', 'Form 2', 'Maseno School', 'Kisumu', 72.5);



3. Display all records from the Students table.

SELECT * FROM Students;


4. Display only the distinct grade levels from the Students table.

SELECT DISTINCT GradeLevel FROM Students;


5. Show student names and their grade levels using column aliases.

SELECT Name AS StudentName, GradeLevel AS ClassLevel FROM Students;


6. Display names and ages of students older than 15.

SELECT Name, Age FROM Students
WHERE Age > 15;

7. Display all students sorted by Age in ascending order.

SELECT * FROM Students
ORDER BY Age ASC;


8. Display all female students sorted by Name in descending order.

SELECT * FROM Students
WHERE Gender = 'Female'
ORDER BY Name DESC

9. Count the number of students in the table.

SELECT COUNT(*) AS TotalStudents FROM Students;

10. Show the average age of students using an aggregate function.

SELECT AVG(Age) AS AverageAge FROM Students;
