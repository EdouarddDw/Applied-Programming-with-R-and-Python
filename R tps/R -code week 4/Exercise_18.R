library(data.table)
library(lubridate)

# Read-in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]


# 1.	From this, select the following columns: Customer, TransDate, and Quantity.
myData2 <- myData1[,list(Customer, TransDate, Quantity)]


# 2.	From the subset made in question 1, select the columns Customer, TransDate, 
# and Quantity from all rows with a purchase amount between 100 and 200. 
# Try to solve this exercise by using only one command.
myData3 <- myData1[PurchAmount > 100 & PurchAmount < 200, list(Customer, TransDate, Quantity)]
