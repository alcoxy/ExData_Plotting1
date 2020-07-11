library(lubridate)

if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data1$Time <- dmy_hms(paste(data1$Date,data1$Time)); data1$Date <- dmy(data1$Date)

data1 <- data1[data1$Date==as.Date("2007-02-01") | data1$Date==as.Date("2007-02-02"),]

png(filename="plot2.png")

plot(data1$Time, data1$Global_active_power, type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()