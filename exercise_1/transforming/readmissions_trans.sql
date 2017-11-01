DROP TABLE readmissions_trans;

CREATE TABLE readmissions_trans AS
SELECT Hospital_Name, Provider_Number, State, Excess_Readmission_Ratio
FROM readmissions;
