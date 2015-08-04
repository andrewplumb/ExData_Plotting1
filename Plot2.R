library(dplyr)
library(lubridate)

path2epc <- "C:\\Users\\XBBLXKV\\Documents\\household_power_consumption.txt"
epc <- read.table(path2epc, header = TRUE, sep = ";")
epcfiltered <- filter(epc, Date == "1/2/2007" | Date == "2/2/2007")
epcfiltered$Date <- dmy(as.character(epcfiltered$Date))
epcfiltered$Date <- parse_date_time(paste(epcfiltered$Date, epcfiltered$Time), orders = "%Y%m%d %H%M%S")

par(mfrow = c(1,1))
par(mar = c(4,4,2,2))
plot(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_active_power))[epcfiltered$Global_active_power], type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(epcfiltered$Date, as.numeric(levels(epcfiltered$Global_active_power))[epcfiltered$Global_active_power])

dev.copy(png, file = "plot2.png")
dev.off()