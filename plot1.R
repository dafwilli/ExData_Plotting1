##  This analysis reads in data from XXX and creates a series of graphs

#  Read in data - file should be in the working directory
data <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c(rep("character",2),rep("numeric",7)))

# Convert the Date variable to a POSIXlt format
# data$Date <- strptime(data$Date,"%d/%m/%y")
data <- mutate(data,Date = dmy(Date))

#Convert the Time variable to POSIXlt format
# data$Time <- strptime(data$Time,"%H:%M:%S")
#data <- mutate(data,Time = hms(Time))

# Load the dplyr and lubridate library
library("dplyr")
library("lubridate")

# Reduce the data set to only data from the dates 2007-02-01 and 2007-02-02
data <- filter (data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

