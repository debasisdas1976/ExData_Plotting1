## This function implements the first plotting assignment

Plot1 <- function() {

## load package sqldf, to use function read.csv.sql. It can read selected rows from a file
library( sqldf ) 

##Read the power consumption from the file household_power_consumption.txt for the dates 1/2/2007 and 2/2/2007

powerCon <- read.csv.sql( "household_power_consumption.txt", 
                          sql = "select * from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                          sep=";", header=TRUE )


## Set the device to png with pixel height 480 and width 480
png("plot1.png", width=480, height=480 )

## Create the histogram
hist(powerCon$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency" )

## Close the device
dev.off()
}