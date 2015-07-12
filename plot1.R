# Reading in DATA & Subsetting Data
setwd("C:/Users/Geo Intelligence/Documents/R/")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

# Opening device for writing to PNG
setwd("C:/Users/Geo Intelligence/Documents/R/ExData_Plotting1")
dev.set(3)

# Writing to PNG
png(filename = "plot1.png",
    width = 480, height = 480)

hist(subdata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Closing PNG device
dev.off()