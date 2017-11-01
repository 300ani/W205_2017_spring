CREATE TABLE score_col AS
   SELECT
   Provider_ID,
   cast(Score AS INT)
   FROM effective_care_trans
   WHERE cast(Score AS INT) IS NOT NULL
;

CREATE TABLE survey_col AS
   SELECT
   Provider_Number,
   cast(HCAHPS_Base_Score AS INT),
   cast(HCAHPS_Consistency_Score AS INT)
   FROM surveys_responses
   WHERE cast(HCAHPS_Base_Score AS INT) IS NOT NULL AND
         cast(HCAHPS_Consistency_Score AS INT) IS NOT NULL
;

SELECT 
CORR(score_col.Score, survey_col.HCAHPS_Base_Score) AS corrScore
FROM score_col, survey_col
WHERE score_col.Provider_ID = survey_col.Provider_Number
;

SELECT 
CORR(score_col.Score, survey_col.HCAHPS_Consistency_Score) AS corrScore
FROM score_col, survey_col
WHERE score_col.Provider_ID = survey_col.Provider_Number
;
