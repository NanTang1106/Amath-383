options(digits=15)

yr <- 45
K <- 1
p0 <- 0.058
rt <- 3

p_set_9 <- numeric(yr)
p_set_9[1] <- p0

p_set_10 <- numeric(yr)
p_set_10[1] <- p0

# keep decimal to given level
keep_decimal <- function(origin_num, decimal_place) {
  temp_num <- floor(origin_num * 10^(decimal_place))
  return(temp_num / 10^(decimal_place))
}

# calculate balance at t + delta t
interest_cal <- function(curr_p, decimal_place) {
  new_p <- curr_p + rt * curr_p * (1 - curr_p)
  return(keep_decimal(new_p, decimal_place))
}

for (i in 1:yr) {
  new_p_9 <- interest_cal(p_set_9[i], 9)
  p_set_9[i+1] <- new_p_9
  
  new_p_10 <- interest_cal(p_set_10[i], 10)
  p_set_10[i+1] <- new_p_10
}

result <- data.frame(0:45, p_set_9 * 1000000, p_set_10 * 1000000)
names(result) <- c('Year', 'Balance (9 decimals)', 'Balance (10 decimals)')

print(result, row.names = F)
