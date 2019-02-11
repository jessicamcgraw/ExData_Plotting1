#read data into a data frame
df_PowerConsumption <- read.delim("C:\\Users\\Jessica McGraw\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                                  header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

df_PowerConsumption2 <- df_PowerConsumption %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

sapply(df_PowerConsumption2, class)

df_PowerConsumption2$Global_active_power <- as.numeric(as.character(df_PowerConsumption2$Global_active_power), digits = 6) 

#construct Plot 1 - Global Active Power Histogram

png(file = "plot1.png")

hist(df_PowerConsumption2$Global_active_power,
     breaks = 12,
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     main = "Global Active Power", 
     col = "red")

dev.off()