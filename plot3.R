# Renders a stacked line-plot with 3 Energy sub metering variables ~ DateTime into a png
data <- get_data()
png("plot3.png")
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
  lty = c(1, 1, 1))
dev.off()
