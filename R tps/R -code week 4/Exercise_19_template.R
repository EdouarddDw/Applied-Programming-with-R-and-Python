library(data.table)
library(lubridate)

# Read-in data
myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]


# 1. Create a new column calculating the difference between PurchAmount and Cost. Call it Profit.
myData[["Profit"]] <- myData$PurchAmount - myData$Cost
myData


# 2.	Rename Profit to ProfitChange.
library(dplyr)
myData <- myData %>%
  rename(ProfitChange = Profit)

# 3.	Delete ProfitChange again.
myData[- ProfitChange]

myData <- myData %>% select(-ProfitChange)

# base R equivalent
myData$ProfitChange <- NULL


# Excursus: 

# Create a copy of myData (save it as myData1). 
myData <- myData <- fread("transactions.csv")
myData[, TransDate:=dmy(TransDate)]
myData1 <- copy(myData)

# Add a new column “Profit” to myData1. What happens to myData?
myData1[, Profit := PurchAmount - Cost]
myData

# Now type myData2 <- myData, and add a new column “Profit” to myData2. What happens to myData?
myData2 <- myData
myData2[, Profit := PurchAmount - Cost]
myData


