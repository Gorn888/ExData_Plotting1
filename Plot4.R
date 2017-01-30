library(data.table)
## Import data
test1b <- read.table("./household_power_consumption.txt",
                     sep=";",header=TRUE,stringsAsFactors = FALSE,
                     colClasses = rep("character",9))

## Prepare data
test1c <- subset(test1b,Date=='1/2/2007'|Date=='2/2/2007',)
table1 <- data.frame(DateTime=strptime(paste(test1c$Date, test1c$Time, sep=" ")
                                       ,'%d/%m/%Y %H:%M:%S'))
table2 <- cbind(table1,lapply(test1c[,3:9],as.numeric))

##create chart4
png(filename='plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(table2,plot(DateTime,Global_active_power,type="l",pch=""
                 ,ylab='Global Active Power (kilowatts)'
                 ,xlab=''))
with(table2,plot(DateTime,Voltage,type="l",pch=""))
with(table2,plot(DateTime,Sub_metering_1,type="l",pch="",col='red',
                 ylab='Energy sub metering',
                 xlab=''))
with(table2,lines(DateTime,Sub_metering_2,type="l",pch="",col='green'))
with(table2,lines(DateTime,Sub_metering_3,type="l",pch="",col='blue'))
legend("topright",lty=c(1,1),lwd=c(2.5,2.5),col=c('red','green','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),)
with(table2,plot(DateTime,Global_reactive_power,type="l",pch=""))
dev.off()
