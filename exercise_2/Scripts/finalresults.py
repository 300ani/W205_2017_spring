
# Script to query the database 'tcount' and return the results 
import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

full_length_wordcount = 100         # maximum number of output words for all word:count outputs in database

# Connect to the database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()

if len( sys.argv ) == 2:
   inputword=sys.argv[1]
   
   # return the word count of the input word
   cur.execute("SELECT count FROM tweetwordcount WHERE word=%s", (inputword,))
   wcount = cur.fetchone()[0]
   print "\n     (",sys.argv[1],",",wcount,")"

elif len( sys.argv ) == 1:
   # print all the words in the database ( LIMIT set for full_length_wordcount )
   cur.execute("SELECT word, count FROM tweetwordcount")
   records = cur.fetchall()
   newline_count = 0
   word_count = 0
   for rec in records:
      if newline_count % 10 == 0: 
         print("\n     ")
      if word_count > full_length_wordcount:
         break;
      print "(", rec[0], ":", rec[1], ") "
      newline_count += 1
      word_count += 1
else:
   print "ERROR: Only one or none arguments expected."

# close connection to database
conn.commit()
conn.close()