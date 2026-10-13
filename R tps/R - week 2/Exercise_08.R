# 1. Set your working directory.

setwd("put your path here")


# 2. Read in the CSV file (with the help of the data.table package).
# Make the data available for further use and name it myData.

# install.packages("data.table")
library(data.table)
myData <- fread("transactions.csv")

