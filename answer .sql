-- Create the database
CREATE DATABASE hospital_management;

-- Select the database
USE hospital_management;






CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100)
);





CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);





CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason VARCHAR(255),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);






CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL
);





CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    medicine_id INT NOT NULL,
    prescription_date DATE NOT NULL,
    dosage VARCHAR(100),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)
);





INSERT INTO patients
(first_name, last_name, gender, date_of_birth, phone, address)
VALUES
('John', 'Otieno', 'Male', '2002-05-15', '0712345678', 'Nairobi'),
('Mary', 'Achieng', 'Female', '1998-08-20', '0723456789', 'Kakuma'),
('David', 'Kamau', 'Male', '1995-03-10', '0734567890', 'Nakuru'),
('Sarah', 'Wanjiku', 'Female', '2000-11-25', '0745678901', 'Mombasa'),
('Ali', 'Hassan', 'Male', '1997-07-12', '0756789012', 'Garissa');




INSERT INTO doctors
(first_name, last_name, specialization, phone)
VALUES
('Peter', 'Mwangi', 'General Medicine', '0767890123'),
('Grace', 'Wanjiku', 'Pediatrics', '0778901234'),
('James', 'Omondi', 'Cardiology', '0789012345'),
('Elizabeth', 'Njeri', 'Dermatology', '0790123456'),
('Ahmed', 'Mohamed', 'Dentistry', '0701234567');



INSERT INTO appointments
(patient_id, doctor_id, appointment_date, appointment_time, reason)
VALUES
(1, 1, '2026-09-20', '09:00:00', 'General checkup'),
(2, 2, '2026-09-21', '10:30:00', 'Child health consultation'),
(3, 3, '2026-09-22', '14:00:00', 'Heart examination'),
(4, 4, '2026-09-23', '11:00:00', 'Skin examination'),
(5, 5, '2026-09-24', '15:00:00', 'Dental checkup');




INSERT INTO medicines
(medicine_name, description, price, quantity)
VALUES
('Paracetamol', 'Pain and fever relief', 50.00, 100),
('Amoxicillin', 'Antibiotic medicine', 150.00, 50),
('Ibuprofen', 'Pain and inflammation relief', 100.00, 75),
('Cetirizine', 'Allergy relief medicine', 80.00, 60),
('Omeprazole', 'Medicine for stomach problems', 120.00, 40);

INSERT INTO prescriptions
(patient_id, doctor_id, medicine_id, prescription_date, dosage)
VALUES
(1, 1, 1, '2026-09-20', '2 tablets daily'),
(2, 2, 2, '2026-09-21', '1 capsule three times daily'),
(3, 3, 3, '2026-09-22', '1 tablet twice daily'),
(4, 4, 4, '2026-09-23', '1 tablet daily'),
(5, 5, 5, '2026-09-24', '1 capsule daily');



-- DISPLAY ALL TABLES

SHOW TABLES;



-- DISPLAY DATA FROM EACH TABLE


SELECT * FROM patients;

SELECT * FROM doctors;

SELECT * FROM appointments;

SELECT * FROM medicines;

SELECT * FROM prescriptions;
