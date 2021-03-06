# Project 1

# Read the Complete data from the file
setwd("C:/Users/wa82/Documents/Malleswari/Coursera/Exploratory Data Analysis")

FullData <- read.table("household_power_consumption.txt", header = T, sep =';',na.strings="?")

FullData$Date <- as.Date(FullData$Date, format="%d/%m/%Y")

## Get only the Required Data for the date Feb 01 and 02 of 2007
Reqdata <- subset(FullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(Reqdata$Date), Reqdata$Time)
Reqdata$Datetime <- as.POSIXct(datetime)

## Generating the Plot 3

plot(Reqdata$Datetime,Reqdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Reqdata$Datetime,Reqdata$Sub_metering_2,col="red")
lines(Reqdata$Datetime,Reqdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
