#source data
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#variables
datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(SubData$Global_active_power)
globalreactivepower <- as.numeric(SubData$Global_reactive_power)
voltage <- as.numeric((SubData$Voltage))
Submeter1 <- as.numeric(SubData$Sub_metering_1)
Submeter2 <- as.numeric(SubData$Sub_metering_2)
Submeter3 <- as.numeric(SubData$Sub_metering_3)

#plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime,globalactivepower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "", ylab = "Voltage")

plot(datetime,Submeter1, type = "l", xlab = "datetime", ylab = "Energy Sub Metering")
lines(datetime, Submeter2, type = "l", col = "red")
lines(datetime, Submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
