## This file contains code to produce 'plot3' for the Exploratory Data week 1 assignment 
plot3 <- function(){
        library(lubridate)
        
        ## download data file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power
                      _consumption.zip", "hpc.zip", method = "curl")
        
        ## read in data
        data <- read.table(unz("hpc.zip", "household_power_consumption.txt"), header=T,
                           sep=";", na.strings = "?", stringsAsFactors = FALSE)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        #convert date and time string data to single 'Date' type
        dt <- dmy_hms(paste(data[,1], data[,2], sep = " "))
        data <- cbind(dt, data)
        
        #plot graph to png file
        png("plot3.png", width=480, height=480, type="quartz")
        
        plot(data$dt, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
        lines(data$dt, data$Sub_metering_1, col = "black")
        lines(data$dt, data$Sub_metering_2, col = "red")
        lines(data$dt, data$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = (c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
        
        dev.off()
}