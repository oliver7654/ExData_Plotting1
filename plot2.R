# Renders a line-plot Global Active Power ~ DateTime into a png
data <- get_data()
png("plot2.png")
plot(x = data$DateTime,
  y = data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)")
dev.off()
