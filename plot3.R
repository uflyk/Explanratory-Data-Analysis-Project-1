## Project_1 for Explantory Data Analysis_Plot1
# Plot3
# Read data in
power.data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", 
                         dec=".",na.string = "?")
# Define date format
power.data$Date <- as.Date(power.data$Date, format="%d/%m/%Y")

# Subseting the wantted date
Feb.power.data<- subset(power.data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# release power.data to save memory space
rm(power.data)

# Converting dates
datetime <- paste(as.Date(Feb.power.data$Date), Feb.power.data$Time)
Feb.power.data$Datetime <- as.POSIXct(datetime)

# Start Plot3
with(Feb.power.data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()