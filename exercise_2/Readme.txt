
The following steps outline execution of this streaming application on a fresh environment.
This is a streaming application that intercepts a Twitter livestream and parses the words and their counts, pushing them into a postgres database for later query.

1. To interface and start the Twitter livestream via the Streamparse API:

   sparse run

   This runs a  Twitter stream Spout, and two bolts, one for parsing the words and other for aggregating the counts of each word in the streaming

2. Creating a database 'tcount' with table 'tweetwordcount' to store the words and their counts

   python psycog

3. Running query scripts:
3a1. Retrieving count of a word:
   python finalresults.py <word>
   e.g. python finalresults.py nation
3a2. Retrieving all words in the DB 'tweetwordcount' (output truncated here)
   python finalresults.py

3b. Retrieving words in a certain count range:
   python histogram.py <lower_count> <upper_count>
   e.g. python histogram.py 20 30
