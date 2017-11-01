SELECT
Condition,
VARIANCE(cast (Score AS INT)) AS varScore
FROM effective_care_trans
WHERE cast(Score AS INT) IS NOT NULL
GROUP BY Condition
ORDER BY varScore DESC
LIMIT 10;
