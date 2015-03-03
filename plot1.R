
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
  df$DateTime <- apply(df[,c('Date', 'Time')], 1, 
                   function(x) 
                    strptime(paste(x['Date'], x['Time']), 
                            format = "%d/%m/%Y %H:%M:%S", 
                            tz="GMT"))
  df$Date <- NULL
  df$Time <- NULL
  df
}

plot1 <- function(){
  #(getDataByRT())
  #(getDataByLine())
  df <- getFilteredData()
  png(filename = "~/Documents/coursera/ExData/data/plot1.png", width = 480, height = 480,bg = "white")
  hist(df$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power")
  dev.off()
  c("Plot completed")
}
