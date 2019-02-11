#read data into a data frame
df_PowerConsumption <- read.delim("C:\\Users\\Jessica McGraw\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                                  header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

df_PowerConsumption2 <- df_PowerConsumption %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

df_PowerConsumption2$Global_reactive_power <- as.numeric(as.character(df_PowerConsumption2$Global_reactive_power), digits = 6)
df_PowerConsumption2$Voltage <- as.numeric(as.character(df_PowerConsumption2$Voltage), digits = 6)

#change Date type

df_PowerConsumption2$Date <- as.Date(df_PowerConsumption2$Date, "%d/ %m/ %Y")
df_PowerConsumption2$Day = strftime(df_PowerConsumption2$Date,'%A')

#construct Plot 4 - Global Active Power, Voltage, Energy sub metering, 
#and Global reactive power over time

png(file = "plot4.png")

#set plot window to allow 2 rows and 2 columns - 4 plots
par(mfrow = c(2, 2))

#create plots

plot(df_PowerConsumption$Global_active_power,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

axis(side=1, at = 1:2880, labels = df_PowerConsumption2$Day)

plot(df_PowerConsumption$Voltage,
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage",
     xaxt = "n")

axis(side=1, at = 1:2880, labels = df_PowerConsumption2$Day)


plot(df_PowerConsumption2$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

#lines(df_PowerConsumption2$Sub_metering_1, type = "l", col = "black")
lines(df_PowerConsumption2$Sub_metering_2, type = "l", col = "red")
lines(df_PowerConsumption2$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, cex=0.8)

axis(side=1, at = 1:2880, labels = df_PowerConsumption2$Day)

plot(df_PowerConsumption$Global_reactive_power,
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = "n")

axis(side=1, at = 1:2880, labels = df_PowerConsumption2$Day)

dev.off()