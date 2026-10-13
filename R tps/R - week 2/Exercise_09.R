# 1. Take a closer look at the data (i.e. look at the first and last lines
# of the dataset, view the complete dataset, and check the data type).

# view first and last lines of the data
head(myData) # first lines
tail(myData) # last lines

# View the complete data
myData
View(myData)

# Data type
str(myData)


# 2. Use the lubridate package to format the TransDate column.

install.packages("lubridate")
library(lubridate)

myData[, TransDate:=dmy(TransDate, tz="UTC")] # if you run myData[, TransDate:=dmy(TransDate, tz="UTC")] twice, TransDate would be NA


# 3. Use str() to see if the change was made correctly.

str(myData)


# 4. Use summary

summary(myData)


# 5. Save the data.table object to a csv-file with the name "transactions_backup.csv".

fwrite(myData, "transactions_backup.csv")
