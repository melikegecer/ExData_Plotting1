# loading data
dataset <- read.table("D:\\Data-Science-Specialization\\04-Exploratory-Data-Analysis\\household_power_consumption.txt", 
                      header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
# convert Date column to date format
dataset$Date <- as.Date.character(dataset$Date, "%d/%m/%Y")
# subset data between 2007-2-1 and 2007-2-2
dataset <- subset(dataset, dataset$Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
# clean dataset
dataset <- dataset[complete.cases(dataset),]
# create date time column
dataset <- dataset
dataset$Date <-paste(dataset$Date, dataset$Time)
dataset$Date <- as.POSIXct(dataset$Date)
# QUESTION 4
par(mfrow = c(2,2))
with(dataset, {
  plot(x = dataset$Date, y=dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x=dataset$Date, y=dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  with(dataset, {
    plot(x =dataset$Date, y=dataset$Sub_metering_1,  type="l", ylab="Energy Sub Metering", xlab="")
    lines(x = dataset$Date, y = dataset$Sub_metering_2, col='Red')
    lines(x=dataset$Date, y=dataset$Sub_metering_3,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x=dataset$Date, y=dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.print(png, "plot4.png", width=480, height=480)
