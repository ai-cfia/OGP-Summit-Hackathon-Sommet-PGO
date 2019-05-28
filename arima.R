library(forecast)
library(tseries)
library(tidyverse)

developed_developing_ldc_export_share_t <- data.frame(m49_developed_export_share_t$V1, m49_developing_export_share_t$V1, ldc_export_share_t$V1, ldc_export_share_t$Years)
colnames(developed_developing_ldc_export_share_t) <- c("Developed", "Developing", "LDC", "Years")

adf.test(diff(ts(developed_developing_ldc_export_share_t$LDC)))
Acf(ts(developed_developing_ldc_export_share_t$LDC))
Pacf(ts(developed_developing_ldc_export_share_t$LDC))

fit2 <- auto.arima(developed_developing_ldc_export_share_t$LDC)
tsdisplay(residuals(fit2), lag.max = 45, main = "(1,1,1) Model Residuals")
fcast2 <- forecast(fit2,h = 2)
plot(fcast2,xlab = "Year (since 1948)",ylab = "LDCs Merchandise Export Share (in %)")

png(file = "./diagrams/arima_residuals.png", width = 10, height = 8, units = "in", res = 500)
tsdisplay(residuals(fit2), lag.max = 45, main = "(1,1,1) Model Residuals")
dev.off()

png(file = "./diagrams/arima_forecast.png", width = 10, height = 8, units = "in", res = 500)
plot(fcast2,xlab = "Year (since 1948)",ylab = "LDCs Merchandise Export Share (in %)")
dev.off()