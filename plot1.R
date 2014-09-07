
##Setting the working Directory
setwd("C:/Users/Charudatta/exdata_data_household_power_consumption")

## Reading the txt File 
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  nrows=2075260, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Preparing for the Date range and coercing the Date column to Date data type
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Converting dates
datetime <- paste(as.Date(power$Date), power$Time)
power$Date <- as.POSIXct(datetime)

## Subsetting the data
power_feb <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power)

##Coercing the Global Active power variable to numeric
power_feb$Global_active_power <- as.numeric(power_feb$Global_active_power)




## Plot 1 Global Active Power (kilowatts)
hist(power_feb$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Plot 1 Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
##Changing the Graphics device manager
dev.off()
