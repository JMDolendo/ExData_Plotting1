library(dplyr)
library (lubridate)


hps_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hps_data_filt <- hps_data %>%
  filter(Date == "1/2/2007" | Date =="2/2/2007")

gap_data <- hps_data_filt %>%
  mutate(Datetime = paste(Date, Time, sep= " "))

gap_data$Datetime = dmy_hms(gap_data$Datetime)

png(file = "plot2.png", width = 480, height = 480, units =  "px")
plot(gap_data$Datetime, gap_data$Global_active_power, type= "l", ylab= "Global Active Power (kilowatts)", xlab = "")
dev.off()
