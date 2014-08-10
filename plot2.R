##Setting the working Directory
setwd("C:/Users/Charudatta/Desktop/Career/Big Data Course/Koursera/Coursera-Exploratory Data Analysis-IV/exdata_data_household_power_consumption")
## Getting full dataset
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075260, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the data
power_feb <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power)

## Converting dates
datetime <- paste(as.Date(power_feb$Date), power_feb$Time)
power_feb$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(power_feb$Global_active_power~power_feb$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()