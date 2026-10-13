library(data.table)
library(lubridate)

# Read-in data 
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]

CustData <- fread("demographics.csv")
# CustData[, JoinDate:=dmy(JoinDate)] # JoinDate will be recognized by data.table as a date variable (This data.table function is still in beta, thus not all variables are recognized properly. Use str() to check.)
CustData[, Birthday:=dmy(Birthday)]


# 1. Merge the tables transactions and demographics by the column Customer 
# using an outer left join.
*******ADD YOUR CODE HERE*******(myData, demographics, by="*******ADD YOUR CODE HERE*******")
                                

# 2. Merge transactions and demographics by Customer using an inner join for 
# customers born after 1980. Make sure that the date is formatted correctly.
*******ADD YOUR CODE HERE*******(myData, demographics[*******ADD YOUR CODE HERE*******(Birthdate)>1980],
                                 by="*******ADD YOUR CODE HERE*******")

# Or: 
merge(myData, CustData[year(Birthday) > 1980,], by="Customer", all=FALSE)


