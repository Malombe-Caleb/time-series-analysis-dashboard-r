# Step 2: Decompose EuStockMarkets

data("EuStockMarkets")
stocks_ts <- EuStockMarkets

par(mfrow = c(2, 2))  # 2x2 layout

for (i in 1:4) {
  decomposed <- decompose(stocks_ts[, i], type = "additive")
  plot(decomposed)  # do not pass main
  title(main = paste("Decomposition of", colnames(stocks_ts)[i]))  # Add title separately
}
