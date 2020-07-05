# I've converted the text file to a csv file using MS Excel.The same is avaliable in the exdata_data_household_power_consumption folder.
data <- read.csv.sql("Data1.csv", sql = "select * from file where Date in ('01-02-2007','02-02-2007')",
                     header = TRUE)
data$date_time <- strptime(paste(data$Date,data$Time),"%d-%m-%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(data$date_time,data$Sub_metering_1, col="black", type = "h", lty =1,ylab = "Energy sub metering",xlab="")
lines(data$date_time,data$Sub_metering_2, col="red", type = "h",lty =6,xlab="")
lines(data$date_time,data$Sub_metering_3, col="blue", type = "l",xlab="")
legend("topright",lty = 1, lwd =2, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
