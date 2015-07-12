
# Read the csv, skipping to the desired date range
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrow=2880)

# Because we skipped, add the headers to the dataframe by hand
names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Concatenate data and time and convert to a datetime object
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")

# Draw the plot
plot(df$DateTime,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2, col="red")
lines(df$DateTime,df$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Export the png
dev.copy(png,'plot3.png')
dev.off()
