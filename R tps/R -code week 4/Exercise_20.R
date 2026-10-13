library(data.table)
library(lubridate)

# Read-in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]


# 1. Calculate the sum of purchase amount by customer and transaction date.
myData[, AggDayPurch := sum(PurchAmount), by=list(Customer, TransDate)]

# Check an exemplary customer:
myData[Customer==172951]

# Compare this to:
# myData[,list(AggDayPurch = sum(PurchAmount)), by=list(Customer, TransDate)]


# 2.	Create a new data table that includes the Customer ID (Customer) as well as the new variable PurchFreq, i.e., the number of transactions by customer.
myData[,list(PurchFreq = .N), by=Customer]


# 3.	Count the overall number of transactions. 
myData[, .N]

# Also:
# nrow(myData)

