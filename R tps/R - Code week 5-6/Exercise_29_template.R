library(RSQLite)

# Create database connection
con <- dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")


# 1. Use dbGetQuery() to execute separate SQL commands to show all the records in the transaction and the demographics table.
dbGetQuery(con,"SELECT * FROM transactions;")
dbGetQuery(con,"SELECT * FROM demographics;") 


# 2. Show the IDs of all customers who purchased on 06.06.2012. How many customers purchased on that date? Please Use DISTINCT Customer in your SQL query to account for duplicates.
dbGetQuery(con,"SELECT DISTINCT Customer FROM transactions WHERE TransDate = '2012-06-06 00:00';")


# 3. Calculate a new variable called NetSales, which should be the difference between purchase amount and cost per transaction. Check your results by looking at the whole table.
dbExecute(con, "ALTER TABLE transactions ADD NetSales;") 
dbExecute(con, "UPDATE transactions SET NetSales = PurchAmount - Cost") 
dbGetQuery(con,"SELECT NetSales FROM transactions")

# Show the first 3 rows:
dbGetQuery(con,"SELECT *
            FROM transactions 
            LIMIT 3;")

# Check table, drop column, and check table again:
dbListFields(con, "transactions")
dbExecute(con, "ALTER TABLE transactions DROP COLUMN NetSales")
dbListFields(con, "transactions")


dbDisconnect(con)

