data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
data$Date = as.Date(data$Date, "%d/%m/%Y")
mydata <- data
k1 <- as.Date("2007-02-01")
k2 <- as.Date("2007-02-02")
data <- data[which(data[,1] == k1),]
mydata <- mydata[which(mydata[,1] == k2),]
data <- rbind(data, mydata)
case <- data
datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
case <- cbind(case, datetime)
png(filename = "plot2.png", width = 480, height = 480)
plot(case$datetime, case$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = " ")
lines(case$datetime, case$Global_active_power, pch = ".", type = "o")
dev.off()
