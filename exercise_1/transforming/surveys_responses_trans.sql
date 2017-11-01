DROP TABLE surveys_responses_trans;

CREATE TABLE surveys_responses_trans AS
SELECT Hospital_Name, Address, City, State, HCAHPS_Base_Score, HCAHPS_Consistency_Score
FROM surveys_responses;
