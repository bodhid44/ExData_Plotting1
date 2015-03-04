
getDataByRT <- function(){
  #removes the "in method for 'coerce' with signature  ... " warning message on setAs
  #setClass('dmyDate')
  #setClass('hmsTime')
  #enable import of DD/MM/YYYY column as Date
  #setAs("character","dmyDate", function(from) as.Date(from, format="%d/%m/%Y") )
  #setAs("character","hmsTime", function(from) strptime(from, format="%H:%M:%S") )
  #set the column classes to speed up import 
  #cc <- c("dmyDate", "hmsTime", rep("numeric", 7))
  #cc <- c("dmyDate", "character", rep("numeric", 7))
  cc <- c(rep("character", 2), rep("numeric", 7))
  #household_power_consumption.txt   tdata.txt
  dt <- read.table('data/household_power_consumption.txt', header = TRUE, sep = ";", 
                   colClasses = cc, na.strings = "?")
  #dt$fulldate <- apply(dt[,c('Date', 'Time')], 1, function(x) strptime(paste(x['Date'], x['Time']), format = "%d/%m/%Y %H:%M:%S"))
  df <- subset(dt, subset=(Date=='1/2/2007' | Date=='2/2/2007' ))
  #df$DateTime <- apply(df[,c('Date', 'Time')], 1, function(x) strptime(paste(x['Date'], x['Time']), format = "%d/%m/%Y %H:%M:%S"))
  #df$Date <- NULL
  #df$Time <- NULL
  write.table(df, file = "data/filtdata.txt", sep = ";", row.names = FALSE)
  summary(df)
}

getDataByLine <- function(){
  con  <- file('data/tdata.txt', open = "r")
  dataList <- list()
  colnames <- strsplit(readLines(con, n = 1, warn = FALSE), ";")
  #while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
    #myVector <- strsplit(oneLine, ";")
    #dataList <- c(dataList,data.frame(c(myVector[1], myVector[4])))
    #dataList <- c(dataList, myVector)
  #}
  dataList <- strsplit(readLines(con, n = 1, warn = FALSE), ";")[[1]]
  close(con)
  dt <- paste(dataList[1], dataList[2])
  (list(dt, as.numeric(dataList[3:9])))
}

getFilteredData <- function(){
  cc <- c(rep("character", 2), rep("numeric", 7))
  df <- read.table('data/filtdata.txt', header = TRUE, sep = ";", 
                   colClasses = cc)
  #df$DateTime <- apply(df[,c('Date', 'Time')], 1, 
  #                 function(x) 
  #                  strptime(paste(x['Date'], x['Time']), 
  #                          format = "%d/%m/%Y %H:%M:%S", 
  #                          tz="GMT"))
  
  #fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #temp <- tempfile()
  #download.file(fileurl, temp)
  
  library(lubridate)
  df$Date <- dmy(df$Date)
  df$Time <- hms(df$Time)
  df$datetime <- (df$Date + df$Time)
  #df$Date <- NULL
  #df$Time <- NULL
  df
}

testuz <- function(){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  temp <- tempfile()
  #download.file fails in RStudio, but succeeds when run in E console
  #problem probably related to proxy server setting 
  #(but Sys.getenv("http_proxy") retusn the correct values in both RStudio and R console! )
  #Windows users may want to remove the method = "curl" argument
  download.file(fileurl, temp, method = "curl")
  cc <- c(rep("character", 2), rep("numeric", 7))
  dt <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", 
                   colClasses = cc, na.strings = "?")
  unlink(temp)
  dtf <- subset(dt, subset=(Date=='1/2/2007' | Date=='2/2/2007' ))
  library(lubridate)
  dtf$Date <- dmy(dtf$Date)
  dtf$Time <- hms(dtf$Time)
  dtf$datetime <- (dtf$Date + dtf$Time)
  str(dtf)
}

plot1 <- function(){
  #(getDataByRT())
  #(getDataByLine())
  df <- getFilteredData()
  wh <- 480  #504 = for reproduction of example exactly, 480 = assignment requirement
  png(filename = "~/Documents/coursera/ExData/data/plot1.png", width = wh, height = wh,bg = "white")
  hist(df$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power")
  dev.off()
  
}
