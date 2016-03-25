setwd("C:/Users/Jennifer/Desktop/datasciencecoursera/") 

HousePower <- read.table(unz("C:/Users/Jennifer/Desktop/datasciencecoursera/exdata-data-household_power_consumption.zip", filename = "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?")


HousePower$Date <- as.Date(HousePower$Date, format = "%d/%m/%Y")


FebDates <- subset(HousePower, HousePower$Date >= as.Date("2007/02/01") & HousePower$Date <= as.Date("2007/02/02"))


FebDates$Sub_metering_1 <- as.numeric(as.character(FebDates$Sub_metering_1))
FebDates$Sub_metering_2 <- as.numeric(as.character(FebDates$Sub_metering_2))
FebDates$Sub_metering_3 <- as.numeric(as.character(FebDates$Sub_metering_3))

 

FebDates$Day <- weekdays(as.Date(FebDates$Date))


DateTime <- paste(as.Date(FebDates$Date), FebDates$Time)
FebDates$DateTime <- as.POSIXct(DateTime)


plot(FebDates$DateTime,FebDates$Sub_metering_1, type= "l" , ylab= "Energy Sub metering" , xlab = "", lwd=2 )
lines(FebDates$DateTime,FebDates$Sub_metering_2,col = "red")
lines(FebDates$DateTime,FebDates$Sub_metering_3,col = "blue")

legend("topright", cex = 0.75, lty = 1, lwd= 2, col= c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()