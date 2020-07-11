library(lubridate)

if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata_data_household_power_consumption.zip")
}

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                    colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data1$Time <- dmy_hms(paste(data1$Date,data1$Time)); data1$Date <- dmy(data1$Date)

data1 <- data1[data1$Date==as.Date("2007-02-01") | data1$Date==as.Date("2007-02-02"),]

png(filename="plot3.png")

plot(data1$Time, data1$Sub_metering_1, type = "l", col="gray51", xlab="", ylab="Energy sub metering")
points(data1$Time, y=data1$Sub_metering_2, type="l", col="red")
points(data1$Time, y=data1$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("gray51","red","blue"), lty=1)

dev.off()