## This function implements the third plotting assignment

Plot3 <- function() {
  
## load package sqldf, to use function read.csv.sql. It can read selected rows from a file
  library( sqldf )
  
##Read the power consumption from the file household_power_consumption.txt for the dates 1/2/2007 and 2/2/2007
    
  powerCon <- read.csv.sql( "household_power_consumption.txt", 
                            sql = "select * from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                            sep=";", header=TRUE )
  
  
## Set the device to png with pixel height 480 and width 480
png("plot3.png", width=480, height=480 )


## Convert the date field from character to calendar data and time
powerCon$ts <- strptime(paste( powerCon$Date, powerCon$Time, sep = " " ),
                        "%d/%m/%Y %H:%M:%S" )

## Draw the line plot between sub metering 1, 2 & 3 and timestamp
# First plotting with sub metering 1
plot( powerCon$ts, powerCon$Sub_metering_1, 
      type = "l",
      main = "",
      ylab = "Energy sub metering",
      xlab = "" )

# adding sub metering 2
lines( powerCon$ts, powerCon$Sub_metering_2, col="red" )

# adding sub metering 3
lines( powerCon$ts, powerCon$Sub_metering_3, col="blue" )

# adding appropriate legends
legend("topright", "(x,y)", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), 
       col=c("black", "blue","red"))

## Close the device
dev.off()
}