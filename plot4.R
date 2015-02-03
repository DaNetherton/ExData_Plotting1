setwd("c:/ExData_Plotting1")
# Read in the data for the plots.  This assumes that the file 
#	"household_power_consumption.txt" is in the working directory
epc <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, 
                   na.strings = "?", stringsAsFactors=FALSE, sep = ";")
				   
# Read in the names by just loading part of the dataset 
labs <- read.table("household_power_consumption.txt", header = TRUE, nrows=1, sep = ";")

## And then pulling out the header and applying it to the dataset
names(epc)<-names(labs)

# Create a datetime field from the Date and Time fields to serve as the x axis of the plots.
a <- as.character(epc$Date)
b <- as.character(epc$Time)
c <- paste(a, b)
epc$datetime<-strptime(c, "%d/%m/%Y %H:%M:%S")

#Plot 4
## Open the device with these parameters
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, 
	bg = "white", res = NA, family = "")

## Plot the graphs
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(epc, {
    plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(datetime, Voltage, type="l", ylab="Voltage")
	plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
		lines(datetime, Sub_metering_2, col="red")
		lines(datetime, Sub_metering_3, col="blue")
		legend("topright", inset = .02, lty=1, col = c("black", "red", "blue"),  
			legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.col="0")
    plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power")
})

## Close the device   
dev.off()
