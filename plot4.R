## This file contains code to produce 'plot4' for the Exploratory Data week 1 assignment 
plot4 <- function(){
        library(lubridate)
        
        ## download data file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power
                      _consumption.zip", "hpc.zip", method = "curl")
        
        ## read data into R
        data <- read.table(unz("hpc.zip", "household_power_consumption.txt"), header=T,
                           sep=";", na.strings = "?", stringsAsFactors = FALSE)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        ## convert date and time string data to single 'Date' type
        datetime <- dmy_hms(paste(data[,1], data[,2], sep = " "))
        data <- cbind(datetime, data)
        
        #plot graph to png file
        png("plot4.png", width=480, height=480, type="quartz")
        par(mfrow = c(2,2))
        with(data,
             {
                     #plot1
                     plot(datetime, Global_active_power, type = "l", xlab = "",
                          ylab = "Global Active Power")
                     #plot2
                     plot(datetime, Voltage, type = "l")
                     #plot3
                     plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
                     lines(datetime, Sub_metering_1, col = "black")
                     lines(datetime, Sub_metering_2, col = "red")
                     lines(datetime, Sub_metering_3, col = "blue")
                     legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
                            legend = (c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
                     plot#4
                     plot(datetime, Global_reactive_power, type = "l")
             })
        
        dev.off()
}