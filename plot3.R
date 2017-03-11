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
dataset$Date <-paste(dataset$Date, dataset$Time)
# convert date time column
dataset$Date <- as.POSIXct(dataset$Date)
# draw graph
with(dataset, {
  plot(x =dataset$Date, y=dataset$Sub_metering_1,  type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(x = dataset$Date, y = dataset$Sub_metering_2, col='Red')
  lines(x=dataset$Date, y=dataset$Sub_metering_3,col='Blue')
})
# add the legend part
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# save graph
dev.print(png, "plot3.png", width=480, height=480)
