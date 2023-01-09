import datetime
from pyspark import SparkContext

sc = SparkContext()
today_ts = str((datetime.datetime.now()).timestamp())
text_file = sc.textFile("hdfs:///user/{{ remote_user }}/wordcount/input/sample01.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
    .map(lambda word: (word, 1)) \
    .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile(f"hdfs:///user/{{ remote_user }}/wordcount/output/pyspark-wordcount-" + today_ts)

# from pyspark.sql.functions import *
#
# textFile = spark.read.text("hdfs:///user/{{ remote_user }}/wordcount/input/sample01.txt")
#
# wordCounts = textFile.select(explode(split(textFile.value, "\s+")).alias("word")).groupBy("word").count()
# wordCounts.collect()