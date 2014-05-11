
##  Read in the data... only the rows containing the two days of interest.
##  This is done by using the "skip" argument to skip the first 66637 rows
##  and then the "nrows" argument to only read in 2280 rows.
##  The "col.names" argument is used to keep the header row.

DF <- read.csv("~/household_power_consumption.txt", header = FALSE, sep=";",
               skip = 66637, nrows = 2880, na.strings = "?",
               , col.names = colnames(read.table("household_power_consumption.txt",
                                                 nrow = 1, header = TRUE, sep=";")))


##  Open the "PNG" graphics device
png(filename = "plot3.png", width = 480, height = 480, units = "px")


##  Create the plot:

##  First paste the date and time into a vector and change the Date/Time 
##  class using strptime()...  then bind the vector to the data frame
wDays <- strptime(paste(DF$Date, DF$Time), format='%d/%m/%Y %H:%M:%S')

DF <- cbind(wDays,DF)


##  Next, plot "wDays" column just created against "Sub_metering_x" columns
##  and specify plot type "l" for lines... label the y-axis
with(DF, plot(wDays, DF$Sub_metering_1, type='l', xlab="",
              ylab="Energy sub metering"))
with(DF, lines(wDays, DF$Sub_metering_2, col = 'red'))
with(DF, lines(wDays, DF$Sub_metering_3, col = 'blue'))


##  Next, add a legend
legend("topright", lwd=1, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


##  Close the graphics device
dev.off()
