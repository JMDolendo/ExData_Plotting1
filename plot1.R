library(dplyr)

hps_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hps_data$Global_active_power= as.numeric(as.character(hps_data$Global_active_power))
hps_data_filt <- hps_data %>%
      filter(Date == "1/2/2007" | Date =="2/2/2007")
png(file = "plot1.png", width = 480, height = 480, units =  "px")
hist(hps_data_filt$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



