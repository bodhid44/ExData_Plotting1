# Creates the required png file for the plot1 graph
# plotsize enables the plot to created with the same dimensions (504) as the example provided,
# or the size required for the assignment by default
# Using an image editor (gimp) the two plots with width/height of 504 can then be compared to ensure
# that the plot created by this function is exactly the same as the example provided
#
# This function uses a simple caching mechanism to get the filtered dataset
# (see the HouseholdPowerConsumption.Reader.R file)
plot1 <- function(plotsize = 480){
  
  if (!exists('hpc.reader')){
    message('Loading HouseholdPowerConsumption.Reader.R source')
    source('./HouseholdPowerConsumption.Reader.R')
    hpc.reader <<- HouseholdPowerConsumption.Reader()
  }
  df <- hpc.reader$getFilteredData()
  png(filename = "./plot1.png", width = plotsize, height = plotsize,bg = "white")
  hist(df$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power")
  dev.off()
}