library(dplyr)
library(lubridate)
library(memoise)

# Downloads, extracts, and preprocesses the hpc dataset
# in an idem-potent manner, e.g. avoiding unnecessary downloading.
get_data <- memoise(function () {
  if (!file.exists("data")) {
    dir.create("data")
  }
  data_file_path <- file.path("data", "household_power_consumption.txt")
  if (!file.exists(data_file_path)) {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
    unzip(temp, exdir = "data")
    unlink(temp)
  }
  col_classes <- c("character", "character", "numeric",
    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data <- read.csv(data_file_path, sep = ";",
    colClasses = col_classes, na.strings = "?" )
  data <- as_tibble(data) %>%
    # only take 1-2/2/2007
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    # add a combined DateTime column
    mutate(DateTime = lubridate::dmy_hms(paste(Date, Time))) %>%
    # coerce the date column
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
  return(data)
})
