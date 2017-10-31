DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
   Provider_ID int,
   Hospital_Name string,
   Address string,
   City string,
   State string,
   ZIP_Code int,
   County_Name string,
   Phone_Number string,
   Hospital_Type string,
   Hospital_Ownership string,
   Emergency_Services string,
   Meets_criteria_for_meaningful_use_of_EHRs string,
   Hospital_overall_rating int,
   Hospital_overall_rating_footnote string,
   Mortality_national_comparison string,
   Mortality_national_comparison_footnote string,
   Safety_of_care_national_comparison string,
   Safety_of_care_national_comparison_footnote string,
   Readmission_national_comparison string,
   Readmission_national_comparison_footnote string,
   Patient_experience_national_comparison string,
   Patient_experience_national_comparison_footnote string,
   Effectiveness_of_care_national_comparison string,
   Effectiveness_of_care_national_comparison_footnote string,
   Timeliness_of_care_national_comparison string,
   Timeliness_of_care_national_comparison_footnote string,
   Efficient_use_of_medical_imaging_national_comparison string,
   Efficient_use_of_medical_imaging_national_comparison_footnote string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar" = '"',
   "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
   Provider_ID int,
   Hospital_Name string,
   Address string,
   City string,
   State string,
   ZIP_Code int,
   County_Name string,
   Phone_Number string,
   Condition string,
   Measure_ID string,
   Measure_Name string,
   Score int,
   Sample int,
   Footnote string,
   Measure_Start_Date date,
   Measure_End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar" = '"',
   "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
   Measure_Name string,
   Measure_ID string,
   Measure_Start_Quarter string,
   Measure_Start_Date date,
   Measure_End_Quarter string,
   Measure_End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar" = '"',
   "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
   Hospital_Name string,
   Provider_Number int,
   State string,
   Measure_Name string,
   Number_of_Discharges int,
   Footnote string,
   Excess_Readmission_Ratio float,
   Predicted_Readmission_Rate float,
   Expected_Readmission_Rate float,
   Number_of_Readmissions int,
   Start_Date date,
   End_Date date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar" = '"',
   "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses
(
   Provider_Number int,
   Hospital_Name string,
   Address string,
   City string,
   State string,
   ZIP_Code int,
   County_Name string,
   Communication_with_Nurses_Floor string,
   Communication_with_Nurses_Achievement_Threshold string,
   Communication_with_Nurses_Benchmark string,
   Communication_with_Nurses_Baseline_Rate float,
   Communication_with_Nurses_Performance_Rate string,
   Communication_with_Nurses_Achievement_Points string,
   Communication_with_Nurses_Improvement_Points string,
   Communication_with_Nurses_Dimension_Score string,
   Communication_with_Doctors_Floor string,
   Communication_with_Doctors_Achievement_Threshold string,
   Communication_with_Doctors_Benchmark string,
   Communication_with_Doctors_Baseline_Rate float,
   Communication_with_Doctors_Performance_Rate float,
   Communication_with_Doctors_Achievement_Points string,
   Communication_with_Doctors_Improvement_Points string,
   Communication_with_Doctors_Dimension_Score string,
   Responsiveness_of_Hospital_Staff_Floor string,
   Responsiveness_of_Hospital_Staff_Achievement_Threshold string,
   Responsiveness_of_Hospital_Staff_Benchmark string,
   Responsiveness_of_Hospital_Staff_Baseline_Rate float,
   Responsiveness_of_Hospital_Staff_Performance_Rate float,
   Responsiveness_of_Hospital_Staff_Achievement_Points string,
   Responsiveness_of_Hospital_Staff_Improvement_Points string,
   Responsiveness_of_Hospital_Staff_Dimension_Score string,
   Pain_Management_Floor string,
   Pain_Management_Achievement_Threshold string,
   Pain_Management_Benchmark string,
   Pain_Management_Baseline_Rate float,
   Pain_Management_Performance_Rate float,
   Pain_Management_Achievement_Points string,
   Pain_Management_Improvement_Points string,
   Pain_Management_Dimension_Score string,
   Communication_about_Medicines_Floor string,
   Communication_about_Medicines_Achievement_Threshold string,
   Communication_about_Medicines_Benchmark string,
   Communication_about_Medicines_Baseline_Rate float,
   Communication_about_Medicines_Performance_Rate float,
   Communication_about_Medicines_Achievement_Points string,
   Communication_about_Medicines_Improvement_Points string,
   Communication_about_Medicines_Dimension_Score string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Floor string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Threshold string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Benchmark string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Baseline_Rate float,
   Cleanliness_and_Quietness_of_Hospital_Environment_Performance_Rate float,
   Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points string,
   Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score string,
   Discharge_Information_Floor string,
   Discharge_Information_Achievement_Threshold string,
   Discharge_Information_Benchmark string,
   Discharge_Information_Baseline_Rate float,
   Discharge_Information_Performance_Rate float,
   Discharge_Information_Achievement_Points string,
   Discharge_Information_Improvement_Points string,
   Discharge_Information_Dimension_Score string,
   Overall_Rating_of_Hospital_Floor string,
   Overall_Rating_of_Hospital_Achievement_Threshold string,
   Overall_Rating_of_Hospital_Benchmark string,
   Overall_Rating_of_Hospital_Baseline_Rate float,
   Overall_Rating_of_Hospital_Performance_Rate float,
   Overall_Rating_of_Hospital_Achievement_Points string,
   Overall_Rating_of_Hospital_Improvement_Points string,
   Overall_Rating_of_Hospital_Dimension_Score string,
   HCAHPS_Base_Score int,
   HCAHPS_Consistency_Score int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar" = '"',
   "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';
