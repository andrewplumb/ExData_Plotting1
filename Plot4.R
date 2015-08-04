library(dplyr)
library(lubridate)

path2epc <- "C:\\Users\\XBBLXKV\\Documents\\household_power_consumption.txt"
epc <- read.table(path2epc, header = TRUE, sep = ";")
epcfiltered <- filter(epc, Date == "1/2/2007" | Date == "2/2/2007")
epcfiltered$Date <- dmy(as.character(epcfiltered$Date))
epcfiltered$Date <- parse_date_time(paste(epcfiltered$Date, epcfiltered$Time), orders = "%Y%m%d %H%M%S")

par(mar = c(4,4,2,2))
par(mfrow = c(2,2))

plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_active_power))[epcfiltered$Global_active_power], 
     type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_active_power))[epcfiltered$Global_active_power])
plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Voltage))[epcfiltered$Voltage], 
     type = "n", xlab = "dataframe", ylab = "Voltage")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Voltage))[epcfiltered$Voltage])
plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_1))[epcfiltered$Sub_metering_1], 
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_1))[epcfiltered$Sub_metering_1])
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_2))[epcfiltered$Sub_metering_2], col = "red")
lines(epcfiltered$Date, as.numeric(epcfiltered$Sub_metering_3), col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_reactive_power))[epcfiltered$Global_reactive_power]
     , type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_reactive_power))[epcfiltered$Global_reactive_power])

dev.copy(png, file = "plot4.png")
dev.off()