rm(list=ls())

dir <- "C:/Users/ilja/Desktop/Coursera/Explanatory/ass1"
setwd(dir)

list_files_1 <- list.files(dir,".txt")
data.table <- read.table(paste(dir,list_files_1,sep="/"),sep=";",header = T)

data.table$ts <- strptime(paste(data.table$Date,data.table$Time), "%d/%m/%Y %H:%M:%S")
data.table$Date <- strptime(data.table$Date, "%d/%m/%Y")

relevant.data <- data.table[data.table$Date == "2007-02-01" | data.table$Date == "2007-02-02",]

relevant.data$Global_active_power <- as.numeric(as.character(relevant.data$Global_active_power))


timestamp <- within(relevant.data, { timestamp = format(as.POSIXct(paste(relevant.data$Date, relevant.data$Time)), 
                                                        "%Y-%m-%d %H:%M:%S") })

relevant.data$Sub_metering_1 <- as.numeric(as.character(relevant.data$Sub_metering_1))
relevant.data$Sub_metering_2 <- as.numeric(as.character(relevant.data$Sub_metering_2))
relevant.data$Sub_metering_3 <- as.numeric(as.character(relevant.data$Sub_metering_3))


png("plot3.png",width = 480,height = 480)

plot(x = relevant.data$ts,y = relevant.data$Sub_metering_1, type = "l",
      xlab = "",ylab = "Energy sub metering")
lines(x = relevant.data$ts,y = relevant.data$Sub_metering_2, col = "red")
lines(x = relevant.data$ts,y = relevant.data$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col= c("black","red","blue"))

dev.off()
