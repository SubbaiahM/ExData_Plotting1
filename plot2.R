# Project 1

# Read the Complete data from the file
setwd("C:/Users/wa82/Documents/Malleswari/Coursera/Exploratory Data Analysis")

FullData <- read.table("household_power_consumption.txt", header = T, sep =';',na.strings="?")

FullData$Date <- as.Date(FullData$Date, format="%d/%m/%Y")

## Get only the Required Data for the date Feb 01 and 02 of 2007
Reqdata <- subset(FullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(Reqdata$Date), Reqdata$Time)
Reqdata$Datetime <- as.POSIXct(datetime)

## Generating the Plot 2

plot(Reqdata$Global_active_power~Reqdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


