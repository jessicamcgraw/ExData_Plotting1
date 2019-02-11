#read data into a data frame
df_PowerConsumption <- read.delim("C:\\Users\\Jessica McGraw\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                                  header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

df_PowerConsumption2 <- df_PowerConsumption %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

#change Date type

df_PowerConsumption2$Date <- as.Date(df_PowerConsumption2$Date, "%d/ %m/ %Y")
df_PowerConsumption2$Day = strftime(df_PowerConsumption2$Date,'%A')

#construct Plot 2 - Global Active Power over Time Line Chart

png(file = "plot2.png")

plot(df_PowerConsumption2$Global_active_power,
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xaxt = 'n')

axis(side=1, at = 1:2880, labels = df_PowerConsumption2$Day)

dev.off()