##  This analysis reads in data from the UC Irvine Machine Learning Repositoy and creates a series of graphs

#  Read in data - file should be in the working directory
data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# Load the dplyr and lubridate library
library("dplyr")
library("lubridate")

# Convert the Date variable to a POSIXlt format
data <- mutate(data,Date = dmy(Date))

# Reduce the data set to only data from the dates 2007-02-01 and 2007-02-02
data <- filter (data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create Plot #1 - histogram of Global Active Power
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency" )
dev.off()
