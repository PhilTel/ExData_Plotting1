## This file contains code to produce 'plot2' for the Exploratory Data week 1 assignment 
plot2 <- function(){
        library(lubridate)
        
        ## download data file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power
                      _consumption.zip", "hpc.zip", method = "curl")
        
        data <- read.table(unz("hpc.zip", "household_power_consumption.txt"), header=T,
                           sep=";", na.strings = "?", stringsAsFactors = FALSE)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        #convert date and time string data to a single 'Date' type
        dt <- dmy_hms(paste(data[,1], data[,2], sep = " "))
        data <- cbind(dt, data)
        
        #plot graph
        plot(data$dt, data$Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power (kilowatts)")
        # write to png file
        dev.copy(png, file = "plot2.png", width=480, height=480)
        dev.off()
}