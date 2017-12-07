from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))

        
        ######################################################################################################
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        
        cur = conn.cursor()
        
        for inc in range(0,int(self.counts[word])):
           cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,) )
           if cur.rowcount == 0:
              cur.execute("INSERT INTO tweetwordcount (word,count) VALUES (%s, 1)", (word,));
           conn.commit()
        
        conn.commit()
        conn.close()
        ######################################################################################################
