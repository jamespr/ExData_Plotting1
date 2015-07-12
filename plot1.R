
# Read the csv, skipping to the desired date range
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrow=2880)

# Because we skipped, add the headers to the dataframe by hand
names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Draw the histogram
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Export the png
dev.copy(png,'plot1.png')
dev.off()
