library(data.table)
library(lubridate)

# Read-in data 
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

CustData <- fread("demographics.csv")
# CustData[, JoinDate:=dmy(JoinDate)] # JoinDate will be recognized by data.table as a date variable (This data.table function is still in beta, thus not all variables are recognized properly. Use str() to check.)
CustData[, Birthday:=dmy(Birthday)]


# 1. Merge transaction and demographics by Customer using an outer left join.
merge(myData, CustData, by="Customer", all.x=TRUE) 

# 2. Merge transaction and demographics by Customer using an outer right join.
merge(myData, CustData, by="Customer", all.y=TRUE) 
