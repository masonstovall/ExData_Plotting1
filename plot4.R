## Load data into Data Frame
p <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format Date column
p$Date <- as.Date(p$Date , format = "%d/%m/%Y")

## Only get the data from Feb. 1-2, 2007
p <- subset(p, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Get rid of incomplete cases
p <- p[complete.cases(p),]

## Combine Date and Time columns
dateTime <- paste(p$Date, p$Time)
dateTime <- setNames(dateTime, "DateTime")

## Drop the Date, Time columns
p <- p[ ,!(names(p) %in% c("Date","Time"))]

## Add the combined Date and Time column to the data frame
p <- cbind(dateTime, p)

## Format Data and Time column
p$dateTime <- as.POSIXct(dateTime)


## Open PNG device
png(filename = "plot4.png",width = 480, height = 480)

## Create plots
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0))
with(p, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~dateTime,col="red")
    lines(Sub_metering_3~dateTime,col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

## Close PNG device
dev.off()