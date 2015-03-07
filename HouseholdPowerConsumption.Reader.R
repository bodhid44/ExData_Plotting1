# Simple function to cache the household power consumption dataset
# If already downloaded returns the existing dataframe
# Or downloads the original zip file from the internet into a temporary file, 
#    unzips the file,  
#    reads into a dataframe,
#    subsets the required data for 1/2/2007 & 2/2/2007,
#    adds a new datetime column using the lubridate library to add the date and time
#
# Assumes curl has been set up to allow retrieval via https (tested on Ubuntu 14.04)
#
#RStudio note: if proxy server set, running from the console RStudio fails to download the file,
#but ruuning from the R console succeeds. Both RStudio and R console give the correct value
#for Sys.getenv("http_proxy"). [Possible RStudio bug?]
#If no proxy set, works with console of both RStudio and R.
HouseholdPowerConsumption.Reader <- function() {
  HouseholdPowerConsumption.filtered <- NULL;
  getFilteredDataframe <- function(){
    if (!is.null(HouseholdPowerConsumption.filtered)){
      #use the cached version
      return(HouseholdPowerConsumption.filtered)
    } else {
      #download into a temporary file
      fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      temp <- tempfile()
      download.file(fileurl, temp, method = "curl")
      #unzip and read into a data frame
      cc <- c(rep("character", 2), rep("numeric", 7))
      dt <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", 
                       colClasses = cc, na.strings = "?")
      unlink(temp)
      #subset the data for the two dates
      dtf <- subset(dt, subset=(Date=='1/2/2007' | Date=='2/2/2007' ))
      #use lubridate to convert the Date and Time, and combine into a new datetime column
      library(lubridate)
      dtf$Date <- dmy(dtf$Date)
      dtf$Time <- hms(dtf$Time)
      dtf$datetime <- (dtf$Date + dtf$Time)
      #cache and return
      HouseholdPowerConsumption.filtered <<- dtf
      return(HouseholdPowerConsumption.filtered)
    }
  }
  #list used to access the getFilteredDataframe function
  return(list(getFilteredData = getFilteredDataframe))
}
