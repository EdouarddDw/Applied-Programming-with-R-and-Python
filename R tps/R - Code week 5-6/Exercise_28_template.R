library(RSQLite)


# Create database connection
con <- dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")


# 1. List all available tables that are in the database. 
dbListTables(con)

# 2. Lists all variables of the table demographics.  
dbListFields(con, 'demographics')

# 3. Store a copy of the table myData in the database and name this copy myData_copy.  
dbWriteTable(con, "myData-copy", myData) #dind't define my data so this won't work but you get the idea
# dbListTables(con) # Check if table was actually added


# 4. Remove myData from the database  
dbRemoveTable(con, "myData_copy")	
# dbListTables(con) # Check if table was actually removed


# 5. Close database connection 
dbDisconnect(con)
