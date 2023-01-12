from os.path import abspath

from pyspark.sql import SparkSession

warehouse_location = abspath('spark-warehouse')

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL Hive integration example by igkim") \
    .config("spark.sql.warehouse.dir", warehouse_location) \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql("SELECT COUNT(*) FROM {{ remote_user }}.external_test;").show()