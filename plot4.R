## This function implements the third plotting assignment

Plot4 <- function() {
  
  ## load package sqldf, to use function read.csv.sql. It can read selected rows from a file
  library( sqldf )
  
  ##Read the power consumption from the file household_power_consumption.txt for the dates 1/2/2007 and 2/2/2007
  
  powerCon <- read.csv.sql( "household_power_consumption.txt", 
                            sql = "select * from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                            sep=";", header=TRUE )
  
  
  ## Set the device to png with pixel height 480 and width 480
  png("plot4.png", width=480, height=480 )

## Convert the date field from character to calendar data and time
powerCon$ts <- strptime(paste( powerCon$Date, powerCon$Time, sep = " " ),
                        "%d/%m/%Y %H:%M:%S" )

## Create 2x2 panel to draw 4 plots
par(mfrow = c(2, 2))

## Draw all 4 plots
with( powerCon, {
  
  ## Draw the line plot between global active power and timestamp        
  plot( powerCon$ts, powerCon$Global_active_power, 
        type = "l",
        main = "",
        ylab = "Global Active Power",
        xlab = "" )
  
  ## Draw the line plot between Voltage and timestamp        
  plot( powerCon$ts, powerCon$Voltage, 
        type = "l",
        main = "",
        ylab = "Voltage",
        xlab = "datetime" )
  
  ## Draw the line plot between sub metering 1, 2 & 3 and timestamp
  plot( powerCon$ts, powerCon$Sub_metering_1, 
        type = "l",
        main = "",
        ylab = "Energy sub metering",
        xlab = "" )
  
  lines( powerCon$ts, powerCon$Sub_metering_2, col="red" )
  
  lines( powerCon$ts, powerCon$Sub_metering_3, col="blue" )
  
  legend("topright", "(x,y)", 
         c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1), 
         bty = "n",
         col=c("black", "blue","red"))
  
  ## Draw the line plot between global reactive power and timestamp        
  plot( powerCon$ts, powerCon$Global_reactive_power, 
        type = "l",
        main = "",
        ylab = "Global_reactive_power",
        xlab = "datetime" )
  
})

## Close the device
dev.off()
}