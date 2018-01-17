library(lubridate)
# Get data
# subHPC = subset of household power consumption
# date_time = merged Date and Time of subHPC
source("dataProvider.R")
data_and_time <- give_me_the_data_and_time_dude()
subHPC <- data_and_time$subHPC
date_time <- data_and_time$date_time

#Plot the forth graph
png("./data/plot4.png", bg = "white", width = 480, height = 480)
par(mfrow=c(2,2))

# Graph 1
plot(date_time,
     subHPC$Global_active_power,
     xlab = NA, 
     ylab = "Global active power (kilowatts)",
     type = "l")

# Graph 2
plot(date_time,
     subHPC$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Graph 3
plot(date_time,
     subHPC$Sub_metering_1,
     xlab = NA,
     ylab = "Energy sub metering",
     type = "l")
lines(date_time, subHPC$Sub_metering_2, col = "red")
lines(date_time, subHPC$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

# Graph 4
plot(date_time, 
     subHPC$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

dev.off()
