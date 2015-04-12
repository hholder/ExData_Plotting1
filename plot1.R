data <- read.csv("household_power_consumption.txt", sep=';', na.strings='?')
X <- data[as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-01') | 
            as.Date(data$Date, '%d/%m/%Y') == as.Date('2007-02-02'),]

#plot1
png(file='plot1.png')
hist(X$Global_active_power, col='red', xlab='Global Active Power (kilowatts)',
     ylab='Frequency', main='Global Active Power')
dev.off()