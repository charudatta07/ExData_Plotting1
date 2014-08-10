##Setting the working Directory
setwd("C:/Users/Charudatta/Desktop/Career/Big Data Course/Koursera/Coursera-Exploratory Data Analysis-IV/exdata_data_household_power_consumption")
## Getting full dataset
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting the power_data
power_data <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power)

## Converting dates
datetime <- paste(as.Date(power_data$Date), power_data$Time)
power_data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(power_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()