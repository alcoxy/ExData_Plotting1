library(lubridate)

if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data1$Date <- dmy(data1$Date); data1$Time <- hms(data1$Time)

data1 <- data1[data1$Date==as.Date("2007-02-01") | data1$Date==as.Date("2007-02-02"),]

png(filename = "plot1.png")

hist(data1$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")

dev.off()