 CREATE TABLE  hospital (
		hospital_name VARCHAR (100),
		location VARCHAR (100),
		department VARCHAR (100),
		doctors_count INTEGER,
		patients_count INTEGER,
		admission_date DATE,
		discharge_date DATE,
		medical_expenses NUMERIC (10,2)

 );
 COPY hospital (hospital_name, location, department, doctors_count, patients_count, admission_date, discharge_date, medical_expenses
)
FROM 'D:\New folder (2)\Hospital_Data (1).csv'
DELIMITER ','
 CSV HEADER ;
 SELECT * FROM hospital;

-- 1. Total Number of Patients 
-- Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM (patients_count) AS Total_Patients
FROM hospital;

-- 2. Average Number of Doctors per Hospital 
-- Retrieve the average count of doctors available in each hospital. 

SELECT hospital_name, AVG(doctors_count) AS AVG_doctors 
FROM hospital
GROUP BY hospital_name;


-- 3. Top 3 Departments with the Highest Number of Patients 
-- Find the top 3 hospital departments that have the highest number of patients. 

	SELECT department,patients_count
	FROM hospital
	ORDER BY patients_count DESC
	LIMIT 3;

-- -4. Hospital with the Maximum Medical Expenses 
-- Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name,medical_expenses FROM hospital
ORDER BY medical_expenses DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses 
-- Calculate the average medical expenses per day for each hospital. 

SELECT 
hospital_name,
SUM(medical_expenses) / SUM(discharge_date - admission_date) AS daily_avg_expenses
FROM hospital
GROUP BY hospital_name;

 -- 6. Longest Hospital Stay
 -- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. 
	SELECT discharge_date,admission_date,
	(discharge_date-admission_date) AS stay_days
	FROM hospital
	ORDER BY stay_days DESC
	LIMIT 1;
	 

	
-- 7. Total Patients Treated Per City 
-- Count the total number of patients treated in each city. 

		SELECT location AS city, SUM(patients_count) AS Total_patients
		FROM hospital
		GROUP BY location;

	--  8. Average Length of Stay Per Department 
	-- Calculate the average number of days patients spend in each department.

	SELECT department,AVG(discharge_date-admission_date) AS Avg_Stay_Days
	FROM hospital
	GROUP BY department;
			

 -- 9. Identify the Department with the Lowest Number of Patients 
 -- Find the department with the least number of patients.

	SELECT department, patients_count FROM hospital
	ORDER BY patients_count ASC
	LIMIT 1;

-- 	10. Monthly Medical Expenses Report 
-- Group the data by month and calculate the total medical expenses for each month. 
SELECT 
EXTRACT(MONTH FROM admission_date) AS month_admission,
SUM(medical_expenses) AS total_expenses
FROM hospital
GROUP BY month_admission
ORDER BY month_admission;


	




