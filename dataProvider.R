give_me_the_data_dude <- function(){
  # Download data
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if(!file.exists("./data/household_power_consumption.txt")){
    if(!file.exists("./data/EPC.zip")){
      download.file(fileUrl, destfile = "./data/EPC.zip")
    }
    unzip("./data/EPC.zip", exdir = "./data")
  }
  # Load and extract data
  HPC <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  subHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),][c(colnames(HPC)[2:ncol(HPC)]) != "?",]# Extract data set between "1/2/2007" and "2/2/2007", and filter the part containing "?".
  return(subHPC)
}

give_me_the_data_and_time_dude <- function(){
  # Download data
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if(!file.exists("./data/household_power_consumption.txt")){
    if(!file.exists("./data/EPC.zip")){
      download.file(fileUrl, destfile = "./data/EPC.zip")
    }
    unzip("./data/EPC.zip", exdir = "./data")
  }
  # Load and extract data
  HPC <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  subHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),][c(colnames(HPC)[2:ncol(HPC)]) != "?",]# Extract data set between "1/2/2007" and "2/2/2007", and filter the part containing "?".
  date_time <- dmy_hms(paste(subHPC$Date, subHPC$Time))# Merge the Date and Time
  data_and_time <- list(subHPC = subHPC, date_time = date_time)
  return(data_and_time)
}
