library(RSQLite)

# Create database connection
con <- dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")


# 1. Show for each customer the latest transaction date (LatestPurch) as well 
# as the maximum purchase amount per transaction (MaxPurch).
dbGetQuery(con, "SELECT Customer,
           MAX(TransDate) AS LatestPurch,
           MAX(PurchAmount) AS MaxPurch
           FROM transactions
           GROUP BY Customer;") 


# 2. Calculate the average purchase amount (AvgPurch) and average cost (AvgCost) 
# per year across all customers.
dbGetQuery(con, "SELECT DATE(TransDate, 'start of year') AS Year,
           AVG(PurchAmount) as AvgPurch,
           AVG(Cost) as AvgCost
           FROM transactions
           GROUP BY Year;")


# 3. Write a query for a table that shows the number of transactions (Transactions), 
# and the average purchase amount (AvgPurch) per customer per month. Please use 
# count(*) to calculate the number of transactions.
dbGetQuery(con, "SELECT Customer,
          DATE(TransDate, 'start of month') AS Month,
           COUNT(TransID) AS Num_trans,
           AVG(PurchAmount) AS AvgPurch
           FROM transactions
           GROUP BY Customer, Month
           ORDER BY Customer, Month;")


dbDisconnect(con)

