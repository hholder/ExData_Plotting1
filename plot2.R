data <- read.csv("household_power_consumption.txt", sep=';', na.strings='?')
X <- data[as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-01') | 
            as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-02'),]
dt <- as.POSIXct(paste(X$Date, X$Time), format='%d/%m/%Y %H:%M:%S')

#plot2
png(file='plot2.png')
plot(dt, X$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)', main='')
dev.off()