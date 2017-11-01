DROP TABLE hospitals_trans;

CREATE TABLE hospitals_trans AS
SELECT Provider_ID, Hospital_Name, Address, City, State, Hospital_overall_rating
FROM hospitals;
