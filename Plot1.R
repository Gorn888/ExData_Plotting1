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

##create chart1
png(filename='plot1.png',width=480,height=480)
hist(table2$Global_active_power,col='red',
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power (kilowatts)')
dev.off()
