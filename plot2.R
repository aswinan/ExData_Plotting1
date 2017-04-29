Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(SubData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime,globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()