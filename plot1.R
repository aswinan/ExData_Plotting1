Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)
hist(as.numeric(SubData$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")
dev.off()