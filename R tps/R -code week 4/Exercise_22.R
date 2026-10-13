library(data.table)
library(lubridate)

# Read-in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]


# 1. Create a new column in your data table and store, for each customer 
# and transaction, the cost of the previous purchase as an additional variable: 
# You can do this by creating an aggregated lag-shifted variable based on the 
# Cost column. Use an offset of 1 and aggregate the data by customer. 
# You can name the resulting column CostLag.
setkey(myData, TransDate)
myData[, CostLag := shift(Cost, type="lag"), by=Customer]

#check:
myData[Customer == 102824]

# Get help:
?shift
