library(sqldf)
householdPower <- read.csv.sql("household_power_consumption.txt", sep = ";",
                               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")

library(lubridate)

householdPower$datetime <- parse_date_time(paste(householdPower$Date, householdPower$Time)
                                           , orders = "dmy HMS")

png("plot1.png", width = 480, height = 480)

hist(householdPower$Global_active_power, col = "red", main = "Global Active Power"
     , xlab = "Global Active Power (Kilowatts)")

dev.off()

