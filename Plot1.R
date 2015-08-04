library(dplyr)

path2epc <- "C:\\Users\\XBBLXKV\\Documents\\household_power_consumption.txt"
epc <- read.table(path2epc, header = TRUE, sep = ";")
epcfiltered <- filter(epc, Date == "1/2/2007" | Date == "2/2/2007")

par(mar = c(4,4,2,2))
hist(as.numeric(levels(epcfiltered$Global_active_power))[epcfiltered$Global_active_power], col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()