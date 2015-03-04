plot3 <- function(){
  df <- getFilteredData()
  #Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  wh <- 480  #504 = for reproduction of example exactly, 480 = assignment requirement
  png(filename = "~/Documents/coursera/ExData/data/plot3.png", width = wh, height = wh,bg = "white")
  plot(df$datetime, df$Sub_metering_1, type="l", 
       ylab="Energy sub metering", 
       xlab="")
  lines(df$datetime, df$Sub_metering_2, col="red")
  lines(df$datetime, df$Sub_metering_3, col="blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         pch = c(NA,NA,NA),
         lwd = 1,
         lty = c(1,1,1))
  dev.off()
}