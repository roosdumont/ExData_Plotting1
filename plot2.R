Sys.setlocale("LC_TIME", "English")

# READ IN DATA
setwd("C:/Users/Geo Intelligence/Documents/R/")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

subdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, format="%Y-%m-%d %H:%M:%S")

# Open PNG DEVICE
setwd("C:/Users/Geo Intelligence/Documents/R/ExData_Plotting1")
dev.set(3)

# Writing to PNG
png(filename = "plot2.png",
    width = 480, height = 480)

# PLOT DATA
plot(subdata$DateTime,subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )

# Closing PNG device
dev.off()
