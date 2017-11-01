SELECT Provider_ID, 
AVG(cast (Score AS INT)) AS avgScore, 
Hospital_Name, 
SUM(CAST(Score AS INT)) AS totScore 
FROM effective_care_trans 
WHERE cast(Score AS INT) IS NOT NULL 
GROUP by Provider_ID, Hospital_Name 
ORDER by totScore DESC 
LIMIT 10;
