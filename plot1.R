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
png(filename = "plot1.png",width = 480, height = 480)

## Create plot
hist(p$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## close PNG device
dev.off()