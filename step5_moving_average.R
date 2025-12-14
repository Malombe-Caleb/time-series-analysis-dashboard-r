library(zoo)  # For rollmean

data("EuStockMarkets")
stocks_ts <- EuStockMarkets

# Pick one index to illustrate (DAX)
dax_ts <- stocks_ts[, "DAX"]

# Apply moving averages
ma_5  <- rollmean(dax_ts, 5, fill = NA)    # 5-day MA
ma_20 <- rollmean(dax_ts, 20, fill = NA)   # 20-day MA

# Adjust margins to fit plot and legend
par(mar = c(5, 5, 4, 4))  # Bottom, left, top, right

# Plot the DAX series
plot(dax_ts, type = "l", col = "blue", main = "DAX Index with Moving Averages",
     xlab = "Time", ylab = "Value", lwd = 1.5)

# Add moving averages
lines(ma_5, col = "red", lwd = 2)
lines(ma_20, col = "green", lwd = 2)

# Add legend **inside the plot** in the top left corner
legend("topleft", legend = c("Original", "5-day MA", "20-day MA"),
       col = c("blue", "red", "green"), lty = 1, lwd = 2, bty = "n", cex = 0.6)  # bty="n" removes legend box
