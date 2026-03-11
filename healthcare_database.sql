-- ============================================================
-- Healthcare Database Design and Implementation
-- Module: Database Design and Implementation (DDI)
-- Degree: BSc Computer Science and Digitization
-- ============================================================

-- ── Create Database ─────────────────────────────────────────
CREATE DATABASE IF NOT EXISTS HealthcareDB;
USE HealthcareDB;

-- ── Table Definitions ───────────────────────────────────────

CREATE TABLE Patients (
    PatientID     INT AUTO_INCREMENT PRIMARY KEY,
    FirstName     VARCHAR(50)  NOT NULL,
    LastName      VARCHAR(50)  NOT NULL,
    DateOfBirth   DATE         NOT NULL,
    Gender        ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone         VARCHAR(20),
    Email         VARCHAR(100),
    Address       VARCHAR(200)
);

CREATE TABLE Doctors (
    DoctorID      INT AUTO_INCREMENT PRIMARY KEY,
    FirstName     VARCHAR(50)  NOT NULL,
    LastName      VARCHAR(50)  NOT NULL,
    Specialty     VARCHAR(100) NOT NULL,
    Phone         VARCHAR(20),
    Email         VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID   INT AUTO_INCREMENT PRIMARY KEY,
    PatientID       INT  NOT NULL,
    DoctorID        INT  NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status          ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID)  REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalRecords (
    RecordID    INT AUTO_INCREMENT PRIMARY KEY,
    PatientID   INT          NOT NULL,
    DoctorID    INT          NOT NULL,
    RecordDate  DATE         NOT NULL,
    Diagnosis   VARCHAR(255) NOT NULL,
    Notes       TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID)  REFERENCES Doctors(DoctorID)
);

CREATE TABLE Medications (
    MedicationID   INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100) NOT NULL,
    Description    TEXT,
    Dosage         VARCHAR(50)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID      INT  NOT NULL,
    DoctorID       INT  NOT NULL,
    MedicationID   INT  NOT NULL,
    PrescribedDate DATE NOT NULL,
    Duration       VARCHAR(50),
    FOREIGN KEY (PatientID)    REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID)     REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

-- ── Sample Data Insertion ────────────────────────────────────

INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, Phone, Email, Address) VALUES
('Alice',   'Johnson',  '1990-03-15', 'Female', '555-0101', 'alice@email.com',   '12 Oak Street'),
('Bob',     'Smith',    '1985-07-22', 'Male',   '555-0102', 'bob@email.com',     '34 Pine Avenue'),
('Carol',   'Williams', '1992-11-08', 'Female', '555-0103', 'carol@email.com',   '56 Maple Road'),
('David',   'Brown',    '1978-05-30', 'Male',   '555-0104', 'david@email.com',   '78 Elm Drive'),
('Eve',     'Jones',    '2000-01-17', 'Female', '555-0105', 'eve@email.com',     '90 Cedar Lane'),
('Frank',   'Garcia',   '1965-09-04', 'Male',   '555-0106', 'frank@email.com',   '11 Birch Blvd'),
('Grace',   'Martinez', '1988-12-25', 'Female', '555-0107', 'grace@email.com',   '22 Walnut Way'),
('Henry',   'Davis',    '1995-04-10', 'Male',   '555-0108', 'henry@email.com',   '33 Spruce Court'),
('Isla',    'Wilson',   '1973-06-18', 'Female', '555-0109', 'isla@email.com',    '44 Ash Circle'),
('Jack',    'Moore',    '1982-08-29', 'Male',   '555-0110', 'jack@email.com',    '55 Poplar Path'),
('Karen',   'Taylor',   '1997-02-14', 'Female', '555-0111', 'karen@email.com',   '66 Willow Walk'),
('Leo',     'Anderson', '1969-10-03', 'Male',   '555-0112', 'leo@email.com',     '77 Chestnut Close'),
('Mia',     'Thomas',   '2001-07-07', 'Female', '555-0113', 'mia@email.com',     '88 Hazel Grove'),
('Nathan',  'Jackson',  '1991-03-21', 'Male',   '555-0114', 'nathan@email.com',  '99 Sycamore Street'),
('Olivia',  'White',    '1986-11-11', 'Female', '555-0115', 'olivia@email.com',  '10 Linden Lane');

INSERT INTO Doctors (FirstName, LastName, Specialty, Phone, Email) VALUES
('Dr. Sarah',  'Adams',   'General Practice', '555-0201', 'sadams@clinic.com'),
('Dr. James',  'Baker',   'Cardiology',       '555-0202', 'jbaker@clinic.com'),
('Dr. Emily',  'Clark',   'Neurology',        '555-0203', 'eclark@clinic.com'),
('Dr. Robert', 'Evans',   'Orthopaedics',     '555-0204', 'revans@clinic.com'),
('Dr. Lisa',   'Foster',  'Paediatrics',      '555-0205', 'lfoster@clinic.com');

INSERT INTO Medications (MedicationName, Description, Dosage) VALUES
('Medication A', 'Antibiotic for bacterial infections', '500mg twice daily'),
('Medication B', 'Blood pressure medication',           '10mg once daily'),
('Medication C', 'Anti-inflammatory painkiller',        '200mg three times daily'),
('Medication D', 'Cholesterol-lowering statin',         '20mg once daily'),
('Medication E', 'Antidepressant',                      '50mg once daily');

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1,  1, CURDATE() + INTERVAL 1 DAY, '09:00:00', 'Scheduled'),
(2,  2, CURDATE() + INTERVAL 2 DAY, '10:30:00', 'Scheduled'),
(3,  3, CURDATE() + INTERVAL 3 DAY, '11:00:00', 'Scheduled'),
(4,  1, CURDATE() + INTERVAL 4 DAY, '14:00:00', 'Scheduled'),
(5,  4, CURDATE() + INTERVAL 5 DAY, '15:30:00', 'Scheduled'),
(6,  2, CURDATE() - INTERVAL 5 DAY, '09:30:00', 'Completed'),
(7,  5, CURDATE() - INTERVAL 3 DAY, '10:00:00', 'Completed'),
(8,  3, CURDATE() - INTERVAL 1 DAY, '13:00:00', 'Completed'),
(9,  1, CURDATE() - INTERVAL 7 DAY, '16:00:00', 'Completed'),
(10, 4, CURDATE() - INTERVAL 2 DAY, '11:30:00', 'Completed');

INSERT INTO Prescriptions (PatientID, DoctorID, MedicationID, PrescribedDate, Duration) VALUES
(1, 1, 1, '2023-02-10', '7 days'),
(2, 2, 2, '2023-03-15', '30 days'),
(3, 3, 3, '2023-04-20', '14 days'),
(4, 1, 1, '2023-05-05', '7 days'),
(5, 4, 4, '2023-06-12', '90 days'),
(6, 2, 5, '2023-07-18', '60 days'),
(7, 5, 1, '2023-08-22', '7 days'),
(8, 3, 3, '2023-09-30', '14 days');

-- ── Task 2: SQL Queries ──────────────────────────────────────

-- Query 1: List all appointments for the upcoming week
SELECT
    a.AppointmentID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors  d ON a.DoctorID  = d.DoctorID
WHERE a.AppointmentDate BETWEEN CURDATE()
  AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY a.AppointmentDate, a.AppointmentTime;

-- Query 2: Find all patients prescribed a specific medication
SELECT
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    m.MedicationName,
    pr.PrescribedDate,
    pr.Duration
FROM Patients p
JOIN Prescriptions pr ON p.PatientID    = pr.PatientID
JOIN Medications   m  ON pr.MedicationID = m.MedicationID
WHERE m.MedicationName = 'Medication A'
ORDER BY pr.PrescribedDate;

-- Query 3: List all doctors and their specialties
SELECT
    DoctorID,
    CONCAT(FirstName, ' ', LastName) AS DoctorName,
    Specialty,
    Phone,
    Email
FROM Doctors
ORDER BY Specialty, LastName;

-- ── Task 3: Business Analytics Queries ───────────────────────

-- Query 1: Average number of appointments per doctor
SELECT
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    d.Specialty,
    COUNT(a.AppointmentID)               AS TotalAppointments,
    ROUND(COUNT(a.AppointmentID) /
        (SELECT COUNT(DISTINCT DoctorID) FROM Appointments), 2) AS AvgPerDoctor
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID
ORDER BY TotalAppointments DESC;

-- Query 2: Monthly new patient registrations (last 12 months)
SELECT
    YEAR(DateOfBirth)                        AS Year,
    MONTH(DateOfBirth)                       AS Month,
    MONTHNAME(DateOfBirth)                   AS MonthName,
    COUNT(PatientID)                         AS NewPatients
FROM Patients
WHERE DateOfBirth BETWEEN
    DATE_SUB(CURDATE(), INTERVAL 12 MONTH) AND CURDATE()
GROUP BY YEAR(DateOfBirth), MONTH(DateOfBirth)
ORDER BY Year, Month;

-- Query 3: Medication usage frequency
SELECT
    m.MedicationName,
    COUNT(pr.PrescriptionID) AS TimesPrescribed
FROM Medications m
LEFT JOIN Prescriptions pr ON m.MedicationID = pr.MedicationID
GROUP BY m.MedicationID
ORDER BY TimesPrescribed DESC;
