export SPARK_HOME={{ bigdata_home }}/{{ installer.hive_spark.replace('.tgz', '') }}
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:${TEZ_HOME}/conf:${TEZ_HOME}/*:${TEZ_HOME}/lib/*