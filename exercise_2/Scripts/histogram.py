
# Script to query the database 'tcount' and return the results 
import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

full_length_wordcount = 100         # maximum number of output words for all word:count outputs in database

# Connect to the database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()

if len( sys.argv ) != 3:
   print "Insufficient inputs. Needed 3."
   exit()

k1 = sys.argv[1]     # minimum number of count a word can have for it to be displayed
k2 = sys.argv[2]     # maximum number of count a word can have for it to be displayed

# return the words with counts satistying the above conditions

cur.execute("SELECT word, count FROM tweetwordcount WHERE count >= %s AND count <= %s", (str(k1), str(k2)))

# print all the words in the database ( LIMIT set for full_length_wordcount )

newline_trigger = 10  # number of words printed in single group
newline_count = 0
word_count = 0

records = cur.fetchall()

for rec in records:
   word_count += 1
   if newline_count % newline_trigger == 0: 
      print("\n     ")
   if word_count > full_length_wordcount:
      break;
   print( "{0:<4} >>> {1:<20} : {2:<5} ".format( word_count, rec[0], rec[1] ) )
   newline_count += 1

print "\n"

# close connection to database
conn.commit()
conn.close()