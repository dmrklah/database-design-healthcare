# Database Design for Healthcare System

**Module:** Database Design and Implementation (DDI)  
**Degree:** BSc Computer Science and Digitization

---

## Overview

This project involves the design and implementation of a relational database for a healthcare management system using MySQL. The database supports patient registration tracking, doctor scheduling, appointment management, and prescription monitoring.

---

## Database Structure

The system consists of 6 interrelated tables:

| Table | Description |
|-------|-------------|
| `Patients` | Patient registration details |
| `Doctors` | Doctor profiles and specialties |
| `Appointments` | Scheduled patient-doctor appointments |
| `MedicalRecords` | Patient medical history |
| `Medications` | Available medications |
| `Prescriptions` | Patient prescription records |

---

## Tasks

### Task 1 – Database Design & Data Insertion
- Designed relational schema with primary and foreign keys
- Inserted 15 sample records per table covering 15 months (Jan 2023 – Mar 2024)

### Task 2 – SQL Queries
- Query 1: List all appointments for the upcoming week
- Query 2: Find all patients prescribed a specific medication
- Query 3: List all doctors and their specialties

### Task 3 – Business Analytics Queries
- Average number of appointments per doctor
- Monthly new patient registration report
- Doctor workload and resource allocation analysis

---

## Key Findings

- Monthly patient registration trends can guide resource allocation and staffing decisions
- Indexing `AppointmentDate` and `DateOfBirth` columns significantly improves query performance at scale
- A dedicated `RegistrationDate` field would improve reporting accuracy over using `DateOfBirth` as a proxy

---

## Files

| File | Description |
|------|-------------|
| `report.pdf` | Full assignment report with schema design, SQL queries, outputs, and analysis |

---

## Technologies

- MySQL · SQL · Relational Database Design
