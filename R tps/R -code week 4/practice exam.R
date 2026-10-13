library(data.table)
library(lubridate)
library(dplyr)
demo <- fread('demographics.csv')
transactions <- fread('transactions.csv')

head(transactions)
transactions[, TransDate := as.Date(TransDate, format = "%d.%m.%Y")]
demo[, JoinDate := as.Date(JoinDate, format = "%Y-%m-%d")]

head(demo)

sel <- transactions[year(TransDate) == 2009 & PurchAmount > 100 & Quantity >= 2, .N]
sel

mean_profit <- transactions |>
  mutate(Profit = PurchAmount - Cost) |>
  filter(year(TransDate) == 2008) |>
  pull(Profit) |>
  mean()
round(mean_profit, 2)


num_costu <- transactions |>
  count(Customer, name = "purchFreq") |>
  filter(purchFreq > 10) |>
  nrow()
num_costu


count <- transactions |>
  arrange(TransDate) |>
  group_by(Customer) |>
  mutate(CostLag = lag(Cost)) |>
  summarise(count = sum(Cost > CostLag, na.rm = TRUE), .groups = "drop") |>
  summarise(count = sum(count)) |>
  pull(count)
count



join <- transactions |>
  mutate(TransYear = year(TransDate)) |>
  inner_join(
    demo |> mutate(JoinYear = year(JoinDate)),
    by = join_by(Customer, TransYear == JoinYear)
  )

count <- nrow(join)
count

