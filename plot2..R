

# setwd("/Users/danielmartin/Documents/DataScience/ExploratoryDataAnalysis")

library(sqldf)
householdPower <- read.csv.sql("household_power_consumption.txt", sep = ";",
                               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
#  Need to account for ? NAs

householdPower$Date <- as.Date(householdPower$Date)
library(lubridate)

householdPower$datetime <- parse_date_time(paste(householdPower$Date, householdPower$Time)
                                           , orders = "dmy HMS")

png("plot2.png", width = 480, height = 480)

par(mfrow = c(1,1))

plot(householdPower$DateTime, householdPower$Global_active_power, type = "l", xlab = ""
     , ylab = "Global Active Power (Kilowatts)")


dev.off()

plot.new()
