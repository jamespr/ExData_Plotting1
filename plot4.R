
# Read the csv, skipping to the desired date range
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrow=2880)

# Because we skipped, add the headers to the dataframe by hand
names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Concatenate data and time and convert to a datetime object
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")

# Set some parameters
par(mfrow = c(2, 2), cex=0.6)

# Plot the graphs
plot( df$DateTime,df$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(df$DateTime,df$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(df$DateTime,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2, col="red")
lines(df$DateTime,df$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df$DateTime,df$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

#Export the png (Make a little big bigger to fit everything)
dev.copy(png,'plot4.png', width = 512, height = 512, units = "px")
dev.off()
