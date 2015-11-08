rm(list=ls())
dir <- "C:/Users/ilja/Desktop/Coursera/Explanatory/ass1"
setwd(dir)

list_files_1 <- list.files(dir,".txt")
data.table <- read.table(paste(dir,list_files_1,sep="/"),sep=";",header = T)

data.table$ts <- strptime(paste(data.table$Date,data.table$Time), "%d/%m/%Y %H:%M:%S")
data.table$Date <- strptime(data.table$Date, "%d/%m/%Y")



relevant.data <- data.table[data.table$Date == "2007-02-01" | data.table$Date == "2007-02-02",]

class(as.numeric(as.character(relevant.data$Global_active_power)))
relevant.data$Global_active_power <- as.numeric(as.character(relevant.data$Global_active_power))


timestamp <- within(relevant.data, { timestamp = format(as.POSIXct(paste(relevant.data$Date, relevant.data$Time)), 
                                           "%Y-%m-%d %H:%M:%S") })

class(relevant.data$ts)

plot(x = relevant.data$ts,y = relevant.data$Global_active_power, type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

png("plot2.png",width = 480,height = 480)
plot(x = relevant.data$ts,y = relevant.data$Global_active_power, type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
