library(sqldf)
householdPower <- read.csv.sql("household_power_consumption.txt", sep = ";",
                               sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")

library(lubridate)

householdPower$datetime <- parse_date_time(paste(householdPower$Date, householdPower$Time)
                                           , orders = "dmy HMS")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

plot(householdPower$datetime, householdPower$Global_active_power, type = "l", xlab = ""
     , ylab = "Global Active Power (Kilowatts)")

with(householdPower, plot(datetime, Voltage, type = "l"))

plot(householdPower$datetime, householdPower$Sub_metering_1, type = "l", xlab = ""
     , ylab = "Energy Sub Metering")
lines(householdPower$datetime, householdPower$Sub_metering_2, col = "red")
lines(householdPower$datetime, householdPower$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(householdPower, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
