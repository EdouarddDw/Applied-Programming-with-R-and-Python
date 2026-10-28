# Load libraries
# install.packages("DBI")
library(DBI)


# 1.	Install Java 8 and the R package «sparklyr»

# Install Java 8 from http://java.com/en/download


# 2a. Install the R packages sparklyr and install Spark. 

# install.packages("sparklyr")
library(sparklyr) 

# Install Spark
spark_install()
# If it's not working, download and install manually:
# https://stackoverflow.com/questions/66218303/sparklyr-fails-to-download-spark-from-apache-in-dockerfile


# 2b.	Start a Spark Session and import the file “transactions.csv“.

# Build up connection to local Spark installation
sc <- spark_connect(master = "local")

# Create a new table in the Spark cluster

# (a) From R data.frame/data.table (need to read the transactions file first)
# t_on_spark_table <- copy_to(sc, df=transactions, name = "t_on_spark") 

# (b) From a CSV file
spark_read_csv <- spark_read_csv(sc, path = "transactions.csv", name = "t_on_spark")

# Check if data is correctly loaded into Spark:
dbGetQuery(sc, "SHOW TABLES in default")
dbGetQuery(sc, "SHOW COLUMNS in t_on_spark")


# 2c.	Select all transactions with a cost lower than 30.

# SQL queries in Spark
query_result <- dbGetQuery(sc, "SELECT * FROM t_on_spark WHERE PurchAmount < 30")
query_result

# Close connection ####
spark_disconnect(sc)
