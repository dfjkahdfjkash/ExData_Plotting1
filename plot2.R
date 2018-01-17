library(lubridate)
# Get data
# subHPC = subset of household power consumption
# date_time = merged Date and Time of subHPC
source("dataProvider.R")
data_and_time <- give_me_the_data_and_time_dude()
subHPC <- data_and_time$subHPC
date_time <- data_and_time$date_time

# Plot the sencond graph
png("./data/plot2.png", bg = "white", width = 480, height = 480)
plot(date_time,
     subHPC$Global_active_power,
     xlab = NA, 
     ylab = "Global active power (kilowatts)",
     type = "l")
dev.off()
