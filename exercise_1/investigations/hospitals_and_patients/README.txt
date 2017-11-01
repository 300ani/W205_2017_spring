To check if there is a correlation between the hospital healthcare quality scores and the patient survey responses, the column Scores was extracted from "Hospital General Information.csv" and was used for correlation against columns HCAHPS_Base_Score or HCAHPS_Consistency_Score from the "hvbp_hcahps_11_10_2016.csv" usinf the 'corr' function in hive.

The correlation number was quite negligible at less than 0.1 which indicates that the survey responses of the patients are not correlated with the hospital healthcare scores.

The following correlation numbers were obtained from
hospitals_and_patients.sql that extracts there columns via multiple steps.

CORR(Score, HCAHPS_Base_Score)
-0.05553658336834288

CORR(Score, HCAHPS_Consistency_Score)
-0.062235604407228695
