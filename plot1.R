
##  Read in the data... only the rows containing the two days of interest.
##  This is done by using the "skip" argument to skip the first 66637 rows
##  and then the "nrows" argument to only read in 2280 rows.
##  The "col.names" argument is used to keep the header row.

DF <- read.csv("~/household_power_consumption.txt", header = FALSE, sep=";",
               skip = 66637, nrows = 2880, na.strings = "?",
               , col.names = colnames(read.table("household_power_consumption.txt",
                 nrow = 1, header = TRUE, sep=";")))


##  Open the "PNG" graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

##  Create the plot
hist(DF$Global_active_power, main = 'Global Active Power', col = 'red',
     xlab = "Global Active Power (kilowatts)")

##  Close the graphics device
dev.off()

