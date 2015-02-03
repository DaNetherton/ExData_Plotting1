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

#Plot 2
## Open the device with these parameters
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, 
	bg = "white", res = NA, family = "")
	
## Plot the line graph
with(epc, plot(datetime, Global_active_power, type="l", 
		ylab="Global Active Power (kilowatts)", xlab=""))

## Close the device
dev.off()
