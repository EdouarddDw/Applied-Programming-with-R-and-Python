library(data.table)
library(lubridate)

# Read-in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]


# 1. Aggregate the purchase amount (sum) of all transactions per customer on a yearly basis for year 2007 and 2008.
myData[, list(AggPurch=sum(PurchAmount)), by=list(Customer,year(TransDate))][year %in% c(2007, 2008)]

# Also: 
# myData[year(TransDate) %in% c(2007, 2008)][, list(AggPurch=sum(PurchAmount)), by=list(Customer,year(TransDate))]


# 2.	How many customers purchased for more than $50 in total between 2008 and 2009?
myData[year(TransDate) >= 2008 & year(TransDate) <= 2009, 
       list(AggPurch =sum(PurchAmount)), by=Customer][AggPurch > 50][,.N]

