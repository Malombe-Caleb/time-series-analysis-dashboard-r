# Step 6: Forecasting
library(forecast)
library(zoo)

data("EuStockMarkets")
dax_ts <- EuStockMarkets[, "DAX"]

# Convert to time series (approximate weekly frequency = 5 trading days)
dax_ts_weekly <- ts(dax_ts, frequency = 5)

# Fit an ARIMA model automatically
fit_arima <- auto.arima(dax_ts_weekly)

# Forecast 10 steps ahead
forecast_10 <- forecast(fit_arima, h = 10)

# Plot forecast
plot(forecast_10, main = "10-Step Ahead Forecast of DAX Index")

# Print forecast values
print(forecast_10)
