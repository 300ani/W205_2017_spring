To arrive at the best hospitals in health care, one of important metrics to
measure is the overall score provided in the dataset. For this the Score
metric can be used, across the 8 categories of procedures mentioned in the
summary. Another thing to consider is that many of the hospitals have high
scores in the 'Emergency Department' category and some of them have not been
populated but classified as very high. These records and others that have scores 'Not available', were not included in the analysis, since they did not have a comparable metric to be gauged against.

Based on these arguments, the top list of hospitals with high quality care is
given below, as reported by 'best_hospitals.sql' script. Aggregate score is a
better metric than average score since, more records of the same hospital in a
different subcategory with a high score, strengthen its place in providing
consistent better care across multiple sub-categories.

Provider_ID    Avg Score         Hospital_Name                          Aggregatre score
050295  160.2941176470588       MERCY HOSPITAL                          2725
050060  192.21428571428572      COMMUNITY REGIONAL MEDICAL CENTER       2691
330128  146.88235294117646      ELMHURST HOSPITAL CENTER                2497
330202  136.38888888888889      KINGS COUNTY HOSPITAL CENTER            2455
050492  170.85714285714286      CLOVIS COMMUNITY MEDICAL CENTER         2392
050327  158.33333333333334      LOMA LINDA UNIVERSITY MEDICAL CENTER    2375
110079  164.42857142857142      GRADY MEMORIAL HOSPITAL                 2302
450289  137.75                  HARRIS HEALTH SYSTEM                    2204
050315  181.41666666666666      KERN MEDICAL CENTER                     2177
330043  143.73333333333332      SOUTHSIDE HOSPITAL                      2156
