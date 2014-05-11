
##  Read in the data... only the rows containing the two days of interest.
##  This is done by using the "skip" argument to skip the first 66637 rows
##  and then the "nrows" argument to only read in 2280 rows.
##  The "col.names" argument is used to keep the header row.

DF <- read.csv("~/household_power_consumption.txt", header = FALSE, sep=";",
               skip = 66637, nrows = 2880, na.strings = "?",
               , col.names = colnames(read.table("household_power_consumption.txt",
                 nrow = 1, header = TRUE, sep=";")))


##  Open the "PNG" graphics device
png(filename = "plot2.png", width = 480, height = 480, units = "px")


##  Create the plot:

##  First paste the date and time into a vector and change the Date/Time 
##  class using strptime()
wDays <- strptime(paste(DF$Date, DF$Time), format='%d/%m/%Y %H:%M:%S')

##  Next, plot "wDays" vector just crreated against "Global_active_power"
##  and specify plot type "l" for lines... label the y-axis
plot(wDays, DF$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")


##  Close the graphics device
dev.off()

