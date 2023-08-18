from os.path import abspath

from pyspark.sql import SparkSession

#warehouse_location = abspath('spark-warehouse')
#    .config("spark.sql.warehouse.dir", warehouse_location) \

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL Hive integration example by igkim") \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql("SELECT COUNT(*) FROM ansible_test.external_test;").show()