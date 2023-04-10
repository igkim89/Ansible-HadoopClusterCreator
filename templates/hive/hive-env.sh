export SPARK_HOME={{ bigdata_home }}/{{ installer.hive_spark.replace('.tgz', '') }}
export HADOOP_OPTS="$HADOOP_OPTS -Xmx{{ hive.heapsize }}"