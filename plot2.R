library(sqldf)
# I've converted the text file to a csv file using MS Excel.The same is avaliable in the exdata_data_household_power_consumption folder.
data <- read.csv.sql("Data1.csv", sql = "select * from file where Date in ('01-02-2007','02-02-2007')",
                     header = TRUE)
data$date_time <- strptime(paste(data$Date,data$Time),"%d-%m-%Y %H:%M:%S")
png(filename = "plot2.png")
with(data, plot(date_time,Global_active_power,type ="l",lty = 1, xlab ='', ylab = "Global Active Power(kilowatts)"))
dev.off()
