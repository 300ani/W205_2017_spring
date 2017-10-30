
# Script to download > unzip > rename > standardize csv files (removing header) > loading date to hdfs

# download

flatfiles_url="https://data.medicare.gov/views/bg9k-emty/files/e514828f-8ed2-445f-b49f-5ac11a58869d?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

cd /home/w205/exercise_1/data_prep/download/
wget "$flatfiles_url" -O flatfiles.zip

# unzip

cd /home/w205/exercise_1/data_prep/
pwd
unzip -o download/flatfiles.zip -d extracted/

# move

cd /home/w205/exercise_1/data_prep/extracted/
pwd
mv "Hospital General Information.csv" ../../hospital_compare/hospitals.csv.pre
mv "Timely and Effective Care - Hospital.csv" ../../hospital_compare/effective_care.csv.pre
mv "READMISSION REDUCTION.csv" ../../hospital_compare/readmissions.csv.pre
mv "Measure Dates.csv" ../../hospital_compare/Measures.csv.pre
mv "hvbp_hcahps_11_10_2016.csv" ../../hospital_compare/surveys_responses.csv.pre

# remove header

cd /home/w205/exercise_1/hospital_compare/
tail -n +2 hospitals.csv.pre > hospitals.csv
tail -n +2 effective_care.csv.pre > effective_care.csv
tail -n +2 readmissions.csv.pre > readmissions.csv
tail -n +2 Measures.csv.pre > Measures.csv
tail -n +2 surveys_responses.csv.pre > surveys_responses.csv

rm -f *.pre

# load to hdfs

hdfs dfs -put -f *.csv /user/w205/hospital_compare

