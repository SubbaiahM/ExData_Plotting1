# Project 1

# Read the Complete data from the file
setwd("C:/Users/wa82/Documents/Malleswari/Coursera/Exploratory Data Analysis")

FullData <- read.table("household_power_consumption.txt", header = T, sep =';',na.strings="?")

FullData$Date <- as.Date(FullData$Date, format="%d/%m/%Y")

## Get only the Required Data for the date Feb 01 and 02 of 2007
Reqdata <- subset(FullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(Reqdata$Date), Reqdata$Time)
Reqdata$Datetime <- as.POSIXct(datetime)

## Generating the Plot 4

par(mfrow=c(2,2))

## SubPlot 1
plot(Reqdata$Datetime,Reqdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##SubPlot 2
plot(Reqdata$Datetime,Reqdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

##SubPlot 3
plot(Reqdata$Datetime,Reqdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Reqdata$Datetime,Reqdata$Sub_metering_2,col="red")
lines(Reqdata$Datetime,Reqdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#SubPlot 4
plot(Reqdata$Datetime,Reqdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()