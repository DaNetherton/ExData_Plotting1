epc <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?",
   sep = ";")

epc <- tbl_df(epc)
epc
glimpse(epc)

a<-as.character(epc$Date)
b<-as.character(epc$Time)
x <- paste(a, b)
y<-strptime(x, "%d/%m/%Y %H:%M:%S")
y
epc$datetime<-y

epc$Date<-as.Date(epc$Date, "%d/%m/%Y")

# Only using 2007-02-01 and 2007-02-02
feb<-subset(epc, datetime>="2007-02-01 00:00:00 PST" & datetime<"2007-02-03 00:00:00 PST")

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, 
	bg = "white", res = NA, family = "")

hist(feb$Global_active_power, col="#FF2500", yaxp=c(0, 1400, 7), main="Global Active Power",
    xlab="Global Active Power (kilowatts)")

 dev.off()