# Get data
# subHPC = subset of household power consumption
source("dataProvider.R")
subHPC <- give_me_the_data_dude()

# Plot the first graph
png("./data/plot1.png", bg = "white", width = 480, height = 480)
hist(as.numeric(subHPC$Global_active_power),
     col = "red", 
     main = "Global active power", 
     xlab = "Global active power (kilowatts)")
dev.off()

