library(data.table)
library(lubridate)

# Read-in data 
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

CustData <- fread("demographics.csv")
# CustData[, JoinDate:=dmy(JoinDate)] # JoinDate will be recognized by data.table as a date variable (This data.table function is still in beta, thus not all variables are recognized properly. Use str() to check.)
CustData[, Birthday:=dmy(Birthday)]


# 1. Extract the “year” information from the columns from TransDate and JoinDate 
# and save them as TransYear and JoinYear. Then, merge the datasets transaction 
# and demographics by (Customer and TransYear) and (Customer and JoinYear) 
# using an inner join.

# Create new variables
myData[,TransYear := year(TransDate)]
CustData[,JoinYear := year(JoinDate)]

# Inner join
merge(myData, CustData, by.x =c("Customer", "TransYear"), 
      by.y=c("Customer", "JoinYear"), all=FALSE)
