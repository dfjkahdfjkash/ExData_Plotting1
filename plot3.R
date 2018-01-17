library(lubridate)
# Get data
# subHPC = subset of household power consumption
# date_time = merged Date and Time of subHPC
source("dataProvider.R")
data_and_time <- give_me_the_data_and_time_dude()
subHPC <- data_and_time$subHPC
date_time <- data_and_time$date_time

# Plot the third graph
png("./data/plot3.png", bg = "white", width = 480, height = 480)
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
dev.off()
