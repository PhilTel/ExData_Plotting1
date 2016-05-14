## This file contains code to produce 'plot1' for the Exploratory Data week 1 assignment 
plot1 <- function(){
        ## download data file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power
                      _consumption.zip", "hpc.zip", method = "curl")
        
        ## read in data
        data <- read.table(unz("hpc.zip", "household_power_consumption.txt"), header=T,
                           sep=";", na.strings = "?", stringsAsFactors = FALSE)
        data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
        
        #plot histogram
        hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power")
        # write to png file
        dev.copy(png, file = "plot1.png", width=480, height=480)
        dev.off()
}