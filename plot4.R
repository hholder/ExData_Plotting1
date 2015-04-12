data <- read.csv("household_power_consumption.txt", sep=';', na.strings='?')
X <- data[as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-01') | 
            as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-02'),]
dt <- as.POSIXct(paste(X$Date, X$Time), format='%d/%m/%Y %H:%M:%S')

#plot4
png(file='plot4.png')
par(mfrow=c(2,2))

plot(dt, X$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)', main='')

plot(dt, X$Voltage, type='l', xlab='datetime', ylab='Voltage', main='')

plot(dt, X$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering', main='')
lines(dt, X$Sub_metering_1, col='black')
lines(dt, X$Sub_metering_2, col='red')
lines(dt, X$Sub_metering_3, col='blue')
legend('topright', 
       col=c("black", 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_2'), 
       lty=c(1, 1, 1))

plot(dt, X$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power', main='')

dev.off()