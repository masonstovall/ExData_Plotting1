png(filename = "plot4.png",width = 480, height = 480)
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
dev.off()