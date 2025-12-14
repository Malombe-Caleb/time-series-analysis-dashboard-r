# Step 1: Load dataset, create time series, and plot it

# 1. Load the dataset
data("EuStockMarkets")   # This is a built-in dataset of daily stock indices
head(EuStockMarkets)     # View first few rows

# 2. Create a time series object
# EuStockMarkets is already a time series object, but let's assign it to a variable
stocks_ts <- EuStockMarkets
class(stocks_ts)         # Check that it's a 'ts' object

# 3. Plot the time series
par(mar = c(5, 5, 4, 2) + 0.1)
plot(stocks_ts, main = "EuStockMarkets Daily Closing Prices", 
     col = c("blue", "red", "green", "purple"),
     xlab = "Time", ylab = "Index Value")
legend("topright", legend = colnames(stocks_ts), 
       col = c("blue", "red", "green", "purple"), lty = 1)
