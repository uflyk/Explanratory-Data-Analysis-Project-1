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

# Starting plot4
par(mfrow = c(2,2),mar=c(4,4,2,1),oma=c(0,0,1,0))
with(Feb.power.data,{
    plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power",
         xlab="")
    plot(Voltage~Datetime, type="l",ytab="Voltage",xlab="datetime")
    plot(Sub_metering_1~Datetime,type="l",ylab="Energy sub metering",xlab="")
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime,col="blue")
    legend("topright",col=c("black","red","blue"),lty=1,lwd=2,bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime,type="l",ylab="Global_reactive_power",
         xlab="datetime")
    })


# saving to file device
dev.copy(png, file="plot4.png",height=480,width=480)
dev.off()
