# Time Series Analysis Dashboard in R

## Project Overview
This project demonstrates a full workflow for **time series analysis** using R, including:

1. Loading and visualizing time series data.
2. Decomposing time series into **trend, seasonality, and residuals**.
3. Handling **missing values** in time series.
4. Checking for **stationarity** and applying differencing.
5. Understanding the **moving average process**.
6. Forecasting future values using the **EuStockMarkets dataset**.

The project uses **built-in R datasets** (`EuStockMarkets`, `attitude`) and R packages such as `zoo`, `tseries`, and `stats`.

---

## Project Structure

- `step1_timeseries.R` – Load dataset and plot.
- `step2_decompose.R` – Decompose series into components.
- `step3_missing_values.R` – Detect and handle missing values.
- `step4_stationarity.R` – Check stationarity and apply differencing.
- `step5_moving_average.R` – Apply moving average smoothing.
- `step6_forecasting.R` – Forecast 10 steps ahead and interpret results.

### Folders

- `dashboard/` – Reserved for any interactive dashboards created using the datasets and different values. Currently empty
- `outputs/` – Could be used for results obtained after running the programmes on any dataset. Currently empty
- `scripts/` – Could hold any reports, images, or documentation. Currently empty.

> Folders are placeholders for future expansion, ensuring scalability and organization.

---

## How to Use

1. Clone the repository:
```bash
git clone https://github.com/Malombe-Caleb/time-series-analysis-dashboard-r.git
