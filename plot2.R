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

# Create Plot #1 - histogram of Global Active Power
png(filename = "plot2.png")
plot(x,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
