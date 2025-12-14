# Step 4: Check for stationarity

library(tseries)   # For adf.test

data("EuStockMarkets")
stocks_ts <- EuStockMarkets

# Pick one index to check (DAX)
dax_ts <- stocks_ts[, "DAX"]

# 1. Plot to visually inspect
plot(dax_ts, main = "DAX Index", ylab = "Value", xlab = "Time")

# 2. Augmented Dickey-Fuller Test
adf_result <- adf.test(dax_ts)
adf_result

# 3. Interpretation
if(adf_result$p.value < 0.05) {
  print("The series is stationary (reject H0 of unit root).")
} else {
  print("The series is non-stationary (fail to reject H0 of unit root).")
}

# 4. Differencing to make stationary if needed
dax_diff <- diff(dax_ts)
plot(dax_diff, main = "DAX Index - First Difference", ylab = "Differenced Value", xlab = "Time")
