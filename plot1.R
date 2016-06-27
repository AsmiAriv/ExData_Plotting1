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
png("plot1.png", width=480, height=480)


##Plotting the required data

with(useData, hist(Global_active_power, ylab="Frequency", xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red",cex=0.2))

##Closing the png device
dev.off()