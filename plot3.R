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
png(filename = "plot3.png", width = 480, height = 480)
plot(case$datetime, case$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
lines(case$datetime, case$Sub_metering_1, pch = ".", type = "o")
lines(case$datetime, case$Sub_metering_2, pch = ".", type = "o", col = "red")
lines(case$datetime, case$Sub_metering_3, pch = ".", type = "o", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()