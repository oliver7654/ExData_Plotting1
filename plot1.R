# Renders a histogram of Global Active Power into a png
data <- get_data()
png("plot1.png")
hist(data$Global_active_power,
  xlab = "Global Active Power (kilowatts)",
  col = "red",
  main = "Global Active Power")
dev.off()
