## This function implements the second plotting assignment

Plot2 <- function() {
  
## load package sqldf, to use function read.csv.sql. It can read selected rows from a file
library( sqldf )

##Read the power consumption from the file household_power_consumption.txt for the dates 1/2/2007 and 2/2/2007

powerCon <- read.csv.sql( "household_power_consumption.txt", 
                          sql = "select * from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                          sep=";", header=TRUE )

## Set the device to png with pixel height 480 and width 480
png("plot2.png", width=480, height=480 )


## Convert the date field from character to calendar data and time
powerCon$ts <- strptime(paste( powerCon$Date, powerCon$Time, sep = " " ),
                        "%d/%m/%Y %H:%M:%S" )

## Draw the line plot between global active power and timestamp
plot( powerCon$ts, powerCon$Global_active_power, 
      type = "l",
      main = "",
      ylab = "Global Active Power (kilowatts)",
      xlab = "" )

## Close the device
dev.off()
}