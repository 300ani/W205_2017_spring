DROP TABLE effective_care_trans;

CREATE TABLE effective_care_trans AS
SELECT Provider_ID, Hospital_Name, Address, City, State, Condition, Score, Sample
FROM effective_care;
