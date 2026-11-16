

# quick test to see if I know how to make funcitons

divide <- function(x, y) {
  result <- x/y
  return(result)
}

print(divide(1, 2))




pick_name <- function(a, n=1)
  return(sample(a, n))


names <- c('Edouard', 'Cedric', 'Julie', 'Guus', 'Marie', 'Joseph', 'Victor')


print(pick_name(names, 3))