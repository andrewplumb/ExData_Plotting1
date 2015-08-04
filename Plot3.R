library(dplyr)
library(lubridate)

path2epc <- "C:\\Users\\XBBLXKV\\Documents\\household_power_consumption.txt"
epc <- read.table(path2epc, header = TRUE, sep = ";")
epcfiltered <- filter(epc, Date == "1/2/2007" | Date == "2/2/2007")
epcfiltered$Date <- dmy(as.character(epcfiltered$Date))
epcfiltered$Date <- parse_date_time(paste(epcfiltered$Date, epcfiltered$Time), orders = "%Y%m%d %H%M%S")

par(mar = c(4,4,2,2))
plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_1))[epcfiltered$Sub_metering_1], type = "n", xlab = "", ylab = "Energy sub metering")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_1))[epcfiltered$Sub_metering_1])
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Sub_metering_2))[epcfiltered$Sub_metering_2], col = "red")
lines(epcfiltered$Date, as.numeric(epcfiltered$Sub_metering_3), col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()