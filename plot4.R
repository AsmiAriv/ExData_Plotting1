#Reading the original dataset with date and time as character
#Others as numeric

household_power_consumption <- read.table("household_power_consumption.txt", 
na.strings = "?", header = T, sep=";",stringsAsFactors = F, 
colClasses = c("character", "character", rep("numeric",7)))

##Subsetting the data for two days

useData <-  household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

##Creating the timeDate variable using Time and Date columns
timeDate <- strptime(paste(useData$Date, useData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Opening the png device with required dimension
png("plot4.png", width=480, height=480)

##Dividing the plot area into fourparts 
par(mfrow = c(2, 2),oma = c(0, 0, 2, 0)) 

##Plotting the required data

with(useData, plot(timeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))

with(useData,plot(timeDate, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(useData,plot(timeDate, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(useData,lines(timeDate, Sub_metering_2, type="l", col="red"))
with(useData,lines(timeDate, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="o")

with(useData,plot(timeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))


##Closing the png device
dev.off()