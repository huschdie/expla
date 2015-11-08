rm(list=ls())

dir <- "C:/Users/ilja/Desktop/Coursera/Explanatory/ass1"
setwd(dir)

list_files_1 <- list.files(dir,".txt")
data.table <- read.table(paste(dir,list_files_1,sep="/"),sep=";",header = T)

data.table$Date <- strptime(data.table$Date, "%d/%m/%Y")

relevant.data <- data.table[data.table$Date == "2007-02-01" | data.table$Date == "2007-02-02",]

relevant.data$Global_active_power <- as.numeric(as.character(relevant.data$Global_active_power))

hist(relevant.data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

png("plot1.png",width = 480,height = 480)
hist(relevant.data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()