## Project_1 for Explantory Data Analysis_Plot1
# Plot2
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

# Start Plot 2
plot(Feb.power.data$Global_active_power~Feb.power.data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save to file device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()