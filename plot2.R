png(filename = "plot2.png",width = 480, height = 480)
plot(p$Global_active_power ~ p$dateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()