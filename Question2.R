# loading data
dataset <- read.table("D:\\Data-Science-Specialization\\04-Exploratory-Data-Analysis\\household_power_consumption.txt", 
                      header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
# convert Date column to date format
dataset$Date <- as.Date.character(dataset$Date, "%d/%m/%Y")
# subset data between 2007-2-1 and 2007-2-2
dataset <- subset(dataset, dataset$Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
# clean dataset
dataset <- dataset[complete.cases(dataset2),]
# create date time column
dataset$Date <-paste(dataset$Date, dataset$Time)
# convert date time column to date time format
dataset$Date <- as.POSIXct(dataset$Date)
# draw graph
plot(x=dataset$Date, y=dataset$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
# save graph
dev.print(png, "plot2.png", width=480, height=480)