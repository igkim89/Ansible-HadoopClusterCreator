export SPARK_HOME={{ bigdata_home }}/spark
TEZ_HOME={{ bigdata_home }}/tez
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:${TEZ_HOME}/conf:${TEZ_HOME}/*:${TEZ_HOME}/lib/*