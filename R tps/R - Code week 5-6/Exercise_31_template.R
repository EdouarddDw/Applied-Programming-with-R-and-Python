library(RSQLite)

# Create database connection
con <- dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")
dbReadTable(con, 'transactions')
dbReadTable(con, 'demographics')

# 1. Merge all transactions with the demographic details of the corresponding customers. 
# What share of the overall purchase amount comes from female customers?
sum_purchase_amount_females <- dbGetQuery(con, "SELECT SUM(PurchAmount)
                                          FROM transactions AS t
                                          INNER JOIN demographics AS d
                                          ON t.Customer = d.Customer
                                          WHERE d.Gender = 'f';")

sum_purchase_amount_all <- dbGetQuery(con, "SELECT SUM(PurchAmount) FROM transactions")

sum_purchase_amount_females/sum_purchase_amount_all


# 2. Merge the transaction and the demographic data in a way, that the resulting 
# table only shows the transactions on the day the customer joined the company.
dbGetQuery(con, )


dbDisconnect(con)



