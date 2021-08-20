# Renders a grid of plots into a png
data <- get_data()
png("plot4.png")
par(mfrow = c(2, 2))
plot(x = data$DateTime,
  y = data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power")
plot(x = data$DateTime,
  y = data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage")
plot(x = data$DateTime,
  y = data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering")
lines(x = data$DateTime,
  y = data$Sub_metering_2,
  type = "l",
  col = "red")
lines(x = data$DateTime,
  y = data$Sub_metering_3,
  type = "l",
  col = "blue")
legend("topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = c(1, 1, 1),
  bty = "n")
plot(x = data$DateTime,
  y = data$Global_reactive_power,
  type = "l",
  xlab = "datetime")
dev.off()
