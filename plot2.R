setwd("C:/Users/Jennifer/Desktop/datasciencecoursera/") 

HousePower <- read.table(unz("C:/Users/Jennifer/Desktop/datasciencecoursera/exdata-data-household_power_consumption.zip", filename = "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?")



HousePower$Date <- as.Date(HousePower$Date, format = "%d/%m/%Y")


FebDates <- subset(HousePower, HousePower$Date >= as.Date("2007/02/01") & HousePower$Date <= as.Date("2007/02/02"))



FebDates$Global_active_power1 <- as.numeric(as.character(FebDates$Global_active_power))


FebDates$Day <- weekdays(as.Date(FebDates$Date))


DateTime <- paste(as.Date(FebDates$Date), FebDates$Time)
FebDates$DateTime <- as.POSIXct(DateTime)


plot(FebDates$DateTime,FebDates$Global_active_power1, type= "l" , ylab= "Global Active Power (kilowatts)", xlab = "" , lwd=2 )

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
