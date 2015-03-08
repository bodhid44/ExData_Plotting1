# Creates the required png file for the plot3 graph
# plotsize enables the plot to created with the same dimensions (504) as the example provided,
# or the size required for the assignment by default
# Using an image editor (gimp) the two plots with width/height of 504 can then be compared to ensure
# that the plot created by this function is exactly the same as the example provided
#
# This function uses a simple caching mechanism to get the filtered dataset
# (see the HouseholdPowerConsumption.Reader.R and README.md files)
plot3 <- function(plotsize = 480){
  
  if (!exists('hpc.reader')){
    message('Loading HouseholdPowerConsumption.Reader.R source')
    source('./HouseholdPowerConsumption.Reader.R')
    hpc.reader <<- HouseholdPowerConsumption.Reader()
  }
  df <- hpc.reader$getFilteredData()
  #my locale is different, so change to ensure all date/time output is correct
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  png(filename = "./plot3.png", width = plotsize, height = plotsize, bg = "white")
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