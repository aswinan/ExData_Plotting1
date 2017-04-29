Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(SubData$Global_active_power)
Submeter1 <- as.numeric(SubData$Sub_metering_1)
Submeter2 <- as.numeric(SubData$Sub_metering_2)
Submeter3 <- as.numeric(SubData$Sub_metering_3)

png("plot3.png", height = 480, width = 480)
plot(datetime,Submeter1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(datetime, Submeter2, type = "l", col = "red")
lines(datetime, Submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()