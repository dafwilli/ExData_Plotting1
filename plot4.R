##  This analysis reads in data from XXX and creates a series of graphs

#  Read in data - file should be in the working directory
data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# Convert the Date variable to a POSIXlt format
# data$Date <- strptime(data$Date,"%d/%m/%y")
data <- mutate(data,Date = dmy(Date))

# Load the dplyr and lubridate library
library("dplyr")
library("lubridate")

# Reduce the data set to only data from the dates 2007-02-01 and 2007-02-02
data <- filter (data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create the x data by adding the time to the date
x <- data$Date + hms(data$Time)

# set up for 4 graphs
par(mfrow = c(2,2))

# Create Plot #1 - histogram of Global Active Power
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency" )

# Create Plot #2
plot(x,data$Voltage, type = "l", xlab = "dateTime", ylab = "Voltage")

# Create Plot #3
plot(x,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x,data$Sub_metering_2, col = "red", type = "l")
lines(x,data$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# Create Plot #4
png(filename = "plot4.png")
plot(x,data$Global_reactive_power, type = "l", xlab = "dateTime", ylab = "Global_reactive_power")