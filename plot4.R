Sys.setlocale("LC_TIME", "English")

# READ IN DATA
setwd("C:/Users/Geo Intelligence/Documents/R/")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

subdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, format="%Y-%m-%d %H:%M:%S")

# Open PNG DEVICE
setwd("C:/Users/Geo Intelligence/Documents/R/ExData_Plotting1")
dev.set(3)

# Writing to PNG
png(filename = "plot4.png",
    width = 480, height = 480)

# PLOT 
par(mfrow=c(2,2))

plot(subdata$DateTime,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power" )
plot(subdata$DateTime,subdata$Voltage, type="l", xlab="datetime", ylab="Voltage" )

plot(subdata$DateTime,subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(subdata$DateTime,subdata$Sub_metering_2, col="red")
lines(subdata$DateTime,subdata$Sub_metering_3, col="blue")
legend("topright", lwd=1, col = c("black","red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subdata$DateTime,subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Closing PNG device
dev.off()
