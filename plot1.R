setwd("C:/Users/Jennifer/Desktop/datasciencecoursera/") 

HousePower <- read.table(unz("C:/Users/Jennifer/Desktop/datasciencecoursera/exdata-data-household_power_consumption.zip", filename = "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?")


HousePower$Date <- as.Date(HousePower$Date, format = "%d/%m/%Y")


FebDates <- subset(HousePower, HousePower$Date >= as.Date("2007/02/01") & HousePower$Date <= as.Date("2007/02/02"))


FebDates$Global_active_power1 <- as.numeric(as.character(FebDates$Global_active_power))


png('plot1.png', height = 480, width = 480)

hist(FebDates$Global_active_power1, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

