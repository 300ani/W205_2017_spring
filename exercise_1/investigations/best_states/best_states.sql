CREATE TABLE hosp_score AS
   SELECT Provider_ID, 
   AVG(cast (Score AS INT)) AS avgScore, 
   State,
   SUM(CAST(Score AS INT)) AS totScore 
   FROM effective_care_trans 
   WHERE cast(Score AS INT) IS NOT NULL 
   GROUP by State, Provider_ID
   ORDER by totScore DESC 
;

SELECT
AVG(totScore) as avgStScore,
State
FROM hosp_score
GROUP BY State
ORDER BY avgStScore DESC
LIMIT 10;
