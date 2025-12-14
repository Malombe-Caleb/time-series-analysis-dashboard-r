# Step 3: Handling missing values in time series

library(zoo)

data("EuStockMarkets")
stocks_ts <- EuStockMarkets

# 1. Check for missing values
any(is.na(stocks_ts))      # Returns TRUE if there are any NAs
colSums(is.na(stocks_ts))  # Count of missing values per index

# 2. Create a missing value artificially
stocks_ts_na <- stocks_ts
stocks_ts_na[10, 1] <- NA  # Introduce NA in first column

# 3. Handling missing values

stocks_clean_locf <- na.locf(stocks_ts_na)
stocks_clean_approx <- na.approx(stocks_ts_na)

# View results
head(stocks_clean_locf)
head(stocks_clean_approx)
 