# Practice exam - solutions (data: transactions.csv, demographics.csv)
library(data.table)
library(lubridate)

myData <- fread("transactions.csv")
myData[, TransDate := dmy(TransDate)]
CustData <- fread("demographics.csv")          # JoinDate is auto-read as IDate
CustData[, Birthday := dmy(Birthday)]

# Q1: transactions in 2009 with PurchAmount > 100 AND Quantity >= 2   -> 218
myData[year(TransDate) == 2009 & PurchAmount > 100 & Quantity >= 2, .N]

# Q2: mean Profit (PurchAmount - Cost) per transaction in 2008, 2 decimals -> 45.03
myData[, Profit := PurchAmount - Cost]
round(myData[year(TransDate) == 2008, mean(Profit)], 2)

# Q3: number of customers with MORE than 10 transactions   -> 1660
myData[, list(PurchFreq = .N), by = Customer][PurchFreq > 10, .N]

# Q4: after sorting by TransDate, how many transactions cost MORE than
#     the same customer's previous purchase?                -> 47107
setkey(myData, TransDate)
myData[, CostLag := shift(Cost, type = "lag"), by = Customer]
myData[Cost > CostLag, .N]

# Q5: inner join on (Customer, TransYear) = (Customer, JoinYear):
#     number of transactions made in the customer's join year -> 30296
myData[, TransYear := year(TransDate)]
CustData[, JoinYear := year(JoinDate)]
nrow(merge(myData, CustData, by.x = c("Customer", "TransYear"),
           by.y = c("Customer", "JoinYear"), all = FALSE))
