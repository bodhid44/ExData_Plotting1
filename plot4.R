plot4 <- function(){
  df <- getFilteredData()
  origpar <- par(no.readonly = TRUE)
  wh <- 480  #504 = for reproduction of example exactly, 480 = assignment requirement
  #png must be called BEFORE par
  png(filename = "~/Documents/coursera/ExData/data/plot4.png", width = wh, height = wh,bg = "white")
  par(mfrow = c(2,2))
  with (df, {
    plot(datetime, Global_active_power, type="l", 
         ylab="Global Active Power", 
         xlab="")
    plot(datetime, Voltage, type="l")
    plot(datetime, Sub_metering_1, type="l", 
         ylab="Energy sub metering", 
         xlab="")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           pch = c(NA,NA,NA),
           lwd = 1,
           lty = c(1,1,1),
           bty = "n")
    plot(datetime, Global_reactive_power, type="l")
  })  
  dev.off()
  par(origpar)
}