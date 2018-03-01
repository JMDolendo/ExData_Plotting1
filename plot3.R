library(dplyr)
library (lubridate)


hps_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hps_data$Sub_metering_1= as.numeric(as.character(hps_data$Sub_metering_1))
hps_data$Sub_metering_2= as.numeric(as.character(hps_data$Sub_metering_2))
hps_data$Sub_metering_3= as.numeric(as.character(hps_data$Sub_metering_3))
hps_data_filt <- hps_data %>%
  filter(Date == "1/2/2007" | Date =="2/2/2007")
submet_data <- hps_data_filt %>%
  mutate(Datetime = paste(Date, Time, sep= " "))

submet_data$Datetime = dmy_hms(submet_data$Datetime)

png(file = "plot3.png", width = 480, height = 480, units =  "px")
plot(submet_data$Datetime, submet_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(submet_data$Datetime, submet_data$Sub_metering_2, col="red")
lines(submet_data$Datetime, submet_data$Sub_metering_3, col="blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red" , "blue"))
dev.off()